-- =============================================================================
-- Snowflake Stored Procedure: SP_CPM_ETL_MAIN
-- Re-implements the Informatica PowerCenter CPM folder ETL logic
--
-- Original: 15 Informatica mappings with Expression, Lookup, Aggregator,
--           Filter, Router, Joiner, and Normalizer transformations.
-- Target:   Single orchestration procedure calling sub-procedures per mapping.
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_ETL_MAIN(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_step        VARCHAR;
    v_row_count   NUMBER;
    v_start_ts    TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP();
    v_msg         VARCHAR DEFAULT '';
BEGIN
    -- =========================================================================
    -- Step 1: Get Current Pay Period (m_CPM_Current_Pay_Period)
    -- Original: PAY_PERIOD -> SQ_PAY_PERIOD -> exp_Build_Pay_Period -> exp_Final
    --           -> CPM_PAY_PERIOD_DATE_FILE
    -- =========================================================================
    v_step := 'Step 1: Current Pay Period';

    INSERT INTO CPM_PAY_PERIOD_DATE_FILE (PAY_PERIOD_STRING)
    SELECT
        CASE
            WHEN PP_NUM < 10 THEN TO_CHAR(PP_END_YEAR) || LPAD(TO_CHAR(PP_NUM), 2, '0')
            ELSE TO_CHAR(PP_END_YEAR) || TO_CHAR(PP_NUM)
        END AS PAY_PERIOD_STRING
    FROM PAY_PERIOD
    WHERE CURR_PP_FLAG = 'Y';

    v_row_count := SQLROWCOUNT;
    v_msg := v_msg || v_step || ': ' || v_row_count || ' rows. ';

    -- =========================================================================
    -- Step 2: Load YTD Staging Tables (m_CPM_Load_CPM_YTD_Staging_Tables)
    -- Flow: YTD_FILE -> Normalizer -> exp_Initial -> rtr_YTD_Records
    --       Router splits to: YTD_Header, YTD_Detail, YTD_State targets
    --       Lookups: PAY_PERIOD (current + date-range)
    -- =========================================================================
    v_step := 'Step 2: YTD Staging';
    CALL SP_CPM_LOAD_YTD_STAGING(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 3: Load MER Staging Tables (m_CPM_Load_CPM_MER_Staging_Tables)
    -- Flow: MER_FILE -> Normalizer -> exp_Initial -> rtr_MER_Records
    --       Router splits to: MER_Header, MER_Detail targets
    --       Lookups: PAY_PERIOD (current + date-range)
    -- =========================================================================
    v_step := 'Step 3: MER Staging';
    CALL SP_CPM_LOAD_MER_STAGING(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 4: Load PMR Staging Tables (m_CPM_Load_CPM_PMR_Staging_Tables)
    -- Flow: PAYMASTER_FILE -> Normalizer -> exp_Initial
    --       -> rtr_Paymaster_Records (Header, PM1, PM2, PM3)
    --       Lookups: PAY_PERIOD (current + date-range)
    -- =========================================================================
    v_step := 'Step 4: PMR Staging';
    CALL SP_CPM_LOAD_PMR_STAGING(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 5: Load PAD Staging Tables (m_CPM_Load_CPM_PAD_Staging_Tables)
    -- Flow: PAD_FILE -> Normalizer -> exp_Determine_Record_Type
    --       -> rtr_PAD_Records (Header, Detail)
    --       Lookups: PAY_PERIOD (current + date-range)
    -- =========================================================================
    v_step := 'Step 5: PAD Staging';
    CALL SP_CPM_LOAD_PAD_STAGING(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 6: Load NEWPAY STG ALT (m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL)
    -- Flow: CPM_PM3_STG_TBL -> exp_Initial -> exp_Determine_Allotments
    --       -> agg_Allotments -> exp_Convert -> exp_Final -> CPM_NEWPAY_STG_ALT_TBL
    --       Error path: fil_Bad_Records -> nrm_Errors -> fil_Error_Message -> ERROR_TBL
    --       Lookup: PSEUDOSSN_TBL
    -- =========================================================================
    v_step := 'Step 6: NEWPAY STG ALT';
    CALL SP_CPM_LOAD_NEWPAY_STG_ALT(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 7: Load NEWPAY STG YTD_STATE (m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL)
    -- Flow: CPM_YTD_STATE_STG_TBL -> exp_Initial -> exp_Determine_YTD_States
    --       -> agg_YTD_State -> exp_Final -> CPM_NEWPAY_STG_YTD_STATE_TBL
    -- =========================================================================
    v_step := 'Step 7: NEWPAY STG YTD_STATE';
    CALL SP_CPM_LOAD_NEWPAY_STG_YTD_STATE(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 8: Load NEWPAY STG DETAIL (m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL)
    -- Flow: CPM_NEWPAY_TBL -> SQ -> exp_Initial -> exp_Format_Fields
    --       -> agg_PYF_EYE_ID_PP_NUM -> exp_Final -> CPM_NEWPAY_STG_DETAIL_TBL
    -- =========================================================================
    v_step := 'Step 8: NEWPAY STG DETAIL';
    CALL SP_CPM_LOAD_NEWPAY_STG_DETAIL(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 9: Load NEWPAY STG TYPE 1/2 (m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL)
    -- Most complex mapping: 18 transforms, 1436 connectors
    -- Flow: CPM_PM1/PM2/PSEUDOSSN -> SQ -> exp_Initial
    --       JOIN CPM_YTD_DETAIL -> Lookups (MER, PAD, YTD_STATE)
    --       -> exp_Convert_TYPE_1_PAD_MER / exp_Convert_YTD
    --       -> exp_Final -> CPM_NEWPAY_STG_TYPE_1_2_TBL
    --       Error path: exp_Determine_Errors -> fil_Bad_Records -> ERROR_TBL
    -- =========================================================================
    v_step := 'Step 9: NEWPAY STG TYPE 1/2';
    CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 10: Load NEWPAY STG TYPE 3 (m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL)
    -- Flow: CPM_NEWPAY_TBL -> SQ -> exp_Initial -> agg_PYF_EYE_ID_PP_NUM
    --       -> Lookups (TYPE_1_2, ALT, DETAIL) -> exp_Format_Fields
    --       -> exp_Final -> CPM_NEWPAY_STG_TYPE_3_TBL
    -- =========================================================================
    v_step := 'Step 10: NEWPAY STG TYPE 3';
    CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_3(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 11: Load NEWPAY STG TYPE 3 FDR (m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL)
    -- Flow: CPM_NEWPAY_TBL -> SQ -> exp_Initial -> exp_Set_REEMP_ANN_CDE
    --       -> agg_PYF_EYE_ID_PP_NUM -> Lookups (TYPE_1_2, ALT)
    --       -> exp_Format_Fields -> exp_GEN_SEQ_NUMBER
    --       -> exp_Final -> CPM_NEWPAY_STG_TYPE_3_FDR_TBL
    -- =========================================================================
    v_step := 'Step 11: NEWPAY STG TYPE 3 FDR';
    CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_3_FDR(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 12: Load PMR to NEWPAY (m_CPM_Load_PMR_To_CPM_NEWPAY_TBL)
    -- Flow: CPM_PM1/PM2/PM3_STG + PSEUDOSSN + CPM_NEWPAY_STG_TYPE_3
    --       -> SQ -> exp_Initial -> exp_Convert -> exp_Final -> CPM_NEWPAY_TBL
    -- =========================================================================
    v_step := 'Step 12: PMR to NEWPAY';
    CALL SP_CPM_LOAD_PMR_TO_NEWPAY(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 13: Load FDR to NEWPAY (m_CPM_Load_FDR_CPM_NEWPAY_TBL)
    -- Flow: CPM_NEWPAY_STG_TYPE_3_FDR -> SQ -> exp_Initial -> exp_Convert
    --       -> lkp_REG_REEMPLED -> exp_Final -> CPM_NEWPAY_TBL
    -- =========================================================================
    v_step := 'Step 13: FDR to NEWPAY';
    CALL SP_CPM_LOAD_FDR_TO_NEWPAY(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    -- =========================================================================
    -- Step 14: Build Message Counters (m_CPM_Build_Message_Counters)
    -- Flow: Multiple sources -> Joiners -> Aggregators -> Message file
    --       Counts: Inputs, CPM records, Errors, Multiple Pay Lines
    -- =========================================================================
    v_step := 'Step 14: Message Counters';
    CALL SP_CPM_BUILD_MESSAGE_COUNTERS(:P_PP_END_YEAR, :P_PP_NUM);
    v_msg := v_msg || v_step || ': done. ';

    RETURN 'CPM ETL completed successfully at ' || TO_CHAR(CURRENT_TIMESTAMP()) ||
           '. Duration: ' || DATEDIFF('second', v_start_ts, CURRENT_TIMESTAMP()) || 's. ' || v_msg;
EXCEPTION
    WHEN OTHER THEN
        RETURN 'CPM ETL FAILED at ' || v_step || ': ' || SQLERRM;
END;
$$;
