-- =============================================================================
-- Stored Procedure: SP_CPM_ETL_ORCHESTRATOR
-- Master orchestrator that runs the full CPM ETL pipeline in correct order.
-- Replaces the Informatica PowerCenter workflow and KornShell orchestration.
--
-- Execution order mirrors the original Informatica workflow:
--   1. Pre-load (truncate staging)
--   2. Load flat files into staging via Snowflake stages
--   3. Load PMR (Paymaster) staging tables
--   4. Load YTD staging tables
--   5. Load MER staging tables
--   6. Load PAD staging tables
--   7. Determine current pay period
--   8. Build NEWPAY staging (Type 1/2, Type 3, ALT, YTD State, Detail)
--   9. Promote to CPM_NEWPAY_TBL
--  10. Build message counters
--  11. Post-load (promote to production ALL tables, WIP check)
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_ETL_ORCHESTRATOR(
    P_PP_END_YEAR NUMBER DEFAULT NULL,
    P_PP_NUM NUMBER DEFAULT NULL
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_result VARCHAR;
    v_start_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP();
    v_step VARCHAR DEFAULT 'INIT';
BEGIN

    -- ========================================
    -- Phase 1: Pre-Load (Truncate staging)
    -- ========================================
    v_step := 'PRELOAD';
    CALL SP_EHRP2BIIS_PRELOAD();

    -- ========================================
    -- Phase 2: Load flat-file sources into staging
    -- Execute COPY INTO from Snowflake stages
    -- (Run 02_cpm_stages.sql COPY INTO statements externally
    --  or embed them here as needed)
    -- ========================================
    v_step := 'STAGE_FLAT_FILES';

    COPY INTO YTD_FILE_RAW FROM @STG_YTD_FILE FORCE = TRUE ON_ERROR = CONTINUE;
    COPY INTO MER_FILE_RAW FROM @STG_MER_FILE FORCE = TRUE ON_ERROR = CONTINUE;
    COPY INTO PAYMASTER_THREE_RAW FROM @STG_PAYMASTER_THREE FORCE = TRUE ON_ERROR = CONTINUE;
    COPY INTO PAYMASTER_FILE_RAW FROM @STG_PAYMASTER_FILE FORCE = TRUE ON_ERROR = CONTINUE;
    COPY INTO PAD_FILE_RAW FROM @STG_PAD_FILE FORCE = TRUE ON_ERROR = CONTINUE;

    -- ========================================
    -- Phase 3: Determine Current Pay Period
    -- ========================================
    v_step := 'CURRENT_PAY_PERIOD';
    CALL SP_CPM_CURRENT_PAY_PERIOD(:P_PP_END_YEAR, :P_PP_NUM);

    -- ========================================
    -- Phase 4: Load PMR (Paymaster) staging tables
    -- Splits PAYMASTER_FILE into PM1, PM2, PM3, PMH staging
    -- ========================================
    v_step := 'LOAD_PMR_STAGING';
    CALL SP_CPM_LOAD_CPM_PMR_STAGING_TABLES(:P_PP_END_YEAR, :P_PP_NUM);

    -- ========================================
    -- Phase 5: Load YTD staging tables
    -- Splits YTD_FILE into Header, Detail, State staging
    -- ========================================
    v_step := 'LOAD_YTD_STAGING';
    CALL SP_CPM_LOAD_CPM_YTD_STAGING_TABLES(:P_PP_END_YEAR, :P_PP_NUM);

    -- ========================================
    -- Phase 6: Load MER staging tables
    -- Splits MER_FILE into Header, Detail staging
    -- ========================================
    v_step := 'LOAD_MER_STAGING';
    CALL SP_CPM_LOAD_CPM_MER_STAGING_TABLES(:P_PP_END_YEAR, :P_PP_NUM);

    -- ========================================
    -- Phase 7: Load PAD staging tables
    -- Splits PAD_FILE into Header, Detail staging
    -- ========================================
    v_step := 'LOAD_PAD_STAGING';
    CALL SP_CPM_LOAD_CPM_PAD_STAGING_TABLES(:P_PP_END_YEAR, :P_PP_NUM);

    -- ========================================
    -- Phase 8: Build NEWPAY staging tables
    -- ========================================
    v_step := 'LOAD_NEWPAY_STG_YTD_STATE';
    CALL SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL(:P_PP_END_YEAR, :P_PP_NUM);

    v_step := 'LOAD_NEWPAY_STG_ALT';
    CALL SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL(:P_PP_END_YEAR, :P_PP_NUM);

    v_step := 'LOAD_NEWPAY_STG_TYPE_1_2';
    CALL SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL(:P_PP_END_YEAR, :P_PP_NUM);

    v_step := 'LOAD_NEWPAY_STG_DETAIL';
    CALL SP_CPM_LOAD_CPM_NEWPAY_STG_DETAIL_TBL(:P_PP_END_YEAR, :P_PP_NUM);

    v_step := 'LOAD_NEWPAY_STG_TYPE_3_FDR';
    CALL SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL(:P_PP_END_YEAR, :P_PP_NUM);

    v_step := 'LOAD_NEWPAY_STG_TYPE_3';
    CALL SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_TBL(:P_PP_END_YEAR, :P_PP_NUM);

    -- ========================================
    -- Phase 9: Promote staging to CPM_NEWPAY_TBL
    -- ========================================
    v_step := 'LOAD_PMR_TO_NEWPAY';
    CALL SP_CPM_LOAD_PMR_TO_CPM_NEWPAY_TBL(:P_PP_END_YEAR, :P_PP_NUM);

    v_step := 'LOAD_FDR_TO_NEWPAY';
    CALL SP_CPM_LOAD_FDR_CPM_NEWPAY_TBL(:P_PP_END_YEAR, :P_PP_NUM);

    -- ========================================
    -- Phase 10: Build message counters
    -- ========================================
    v_step := 'BUILD_MESSAGE_COUNTERS';
    CALL SP_CPM_BUILD_MESSAGE_COUNTERS(:P_PP_END_YEAR, :P_PP_NUM);

    -- ========================================
    -- Phase 11: Post-load processing
    -- ========================================
    v_step := 'AFTERLOAD';
    CALL SP_EHRP2BIIS_AFTERLOAD();

    v_step := 'COMPLETED';

    RETURN 'SP_CPM_ETL_ORCHESTRATOR completed successfully.'
        || ' Started: ' || v_start_ts::VARCHAR
        || ' Finished: ' || CURRENT_TIMESTAMP()::VARCHAR;

EXCEPTION
    WHEN OTHER THEN
        INSERT INTO ERROR_TBL (PROCESS_NAME, ERROR_MESSAGE, ERROR_DATE)
            VALUES ('SP_CPM_ETL_ORCHESTRATOR', 'Failed at step ' || v_step || ': ' || SQLERRM, CURRENT_TIMESTAMP());
        RAISE;
END;
$$;
