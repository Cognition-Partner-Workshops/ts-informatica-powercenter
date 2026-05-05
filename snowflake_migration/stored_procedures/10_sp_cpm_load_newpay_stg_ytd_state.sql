-- =============================================================================
-- SP_CPM_LOAD_NEWPAY_STG_YTD_STATE
-- Reimplements: m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL
--
-- Flow: CPM_YTD_STATE_STG_TBL -> exp_Initial -> exp_Determine_YTD_States
--       -> agg_YTD_State (GROUP BY SSN, aggregate state taxes)
--       -> exp_Final -> CPM_NEWPAY_STG_YTD_STATE_TBL
--
-- Key logic: Aggregates up to 4 state tax records per SSN (per DDL schema).
--   The original Informatica mapping uses stateful variables (v_CURR_KEY,
--   v_STATE_COUNTER) to track position within each employee's state records,
--   then FIRST() aggregation to pivot states 1-4 into separate columns.
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_NEWPAY_STG_YTD_STATE(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    -- Assign state sequence numbers per SSN (replaces stateful counter)
    -- Source columns: DYD_SSN_2, DYD_STATE_TAX_CODE, DYD_STATE_TAX_DEDUC, DYD_PAY_SUB_STATE_TAX
    CREATE OR REPLACE TEMPORARY TABLE TMP_YTD_STATE_NUMBERED AS
    SELECT
        DYD_SSN_2,
        DYD_STATE_TAX_CODE,
        DYD_STATE_TAX_DEDUC,
        DYD_PAY_SUB_STATE_TAX,
        PP_END_YEAR,
        PP_NUM,
        ROW_NUMBER() OVER (
            PARTITION BY DYD_SSN_2
            ORDER BY DYD_STATE_TAX_CODE
        ) AS STATE_NUM
    FROM CPM_YTD_STATE_STG_TBL
    WHERE PP_END_YEAR = :P_PP_END_YEAR
      AND PP_NUM = :P_PP_NUM;

    -- Pivot up to 4 state records per SSN into the target structure
    -- DDL columns per state: YTD_STATE_N, YTD_ST_TX_N_CDE, YTD_ST_TX_N_DED, YTD_ST_TX_N_GRS
    INSERT INTO CPM_NEWPAY_STG_YTD_STATE_TBL (
        PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN,
        YTD_STATE_1, YTD_ST_TX_1_CDE, YTD_ST_TX_1_DED, YTD_ST_TX_1_GRS,
        YTD_STATE_2, YTD_ST_TX_2_CDE, YTD_ST_TX_2_DED, YTD_ST_TX_2_GRS,
        YTD_STATE_3, YTD_ST_TX_3_CDE, YTD_ST_TX_3_DED, YTD_ST_TX_3_GRS,
        YTD_STATE_4, YTD_ST_TX_4_CDE, YTD_ST_TX_4_DED, YTD_ST_TX_4_GRS
    )
    SELECT
        PP_END_YEAR, PP_NUM, DYD_SSN_2,
        -- State 1
        MAX(CASE WHEN STATE_NUM = 1 THEN DYD_STATE_TAX_CODE END),
        MAX(CASE WHEN STATE_NUM = 1 THEN TRY_TO_NUMBER(DYD_STATE_TAX_CODE) END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 1 THEN DYD_STATE_TAX_DEDUC END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 1 THEN DYD_PAY_SUB_STATE_TAX END), 0),
        -- State 2
        MAX(CASE WHEN STATE_NUM = 2 THEN DYD_STATE_TAX_CODE END),
        MAX(CASE WHEN STATE_NUM = 2 THEN TRY_TO_NUMBER(DYD_STATE_TAX_CODE) END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 2 THEN DYD_STATE_TAX_DEDUC END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 2 THEN DYD_PAY_SUB_STATE_TAX END), 0),
        -- State 3
        MAX(CASE WHEN STATE_NUM = 3 THEN DYD_STATE_TAX_CODE END),
        MAX(CASE WHEN STATE_NUM = 3 THEN TRY_TO_NUMBER(DYD_STATE_TAX_CODE) END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 3 THEN DYD_STATE_TAX_DEDUC END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 3 THEN DYD_PAY_SUB_STATE_TAX END), 0),
        -- State 4
        MAX(CASE WHEN STATE_NUM = 4 THEN DYD_STATE_TAX_CODE END),
        MAX(CASE WHEN STATE_NUM = 4 THEN TRY_TO_NUMBER(DYD_STATE_TAX_CODE) END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 4 THEN DYD_STATE_TAX_DEDUC END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 4 THEN DYD_PAY_SUB_STATE_TAX END), 0)
    FROM TMP_YTD_STATE_NUMBERED
    GROUP BY PP_END_YEAR, PP_NUM, DYD_SSN_2;

    DROP TABLE IF EXISTS TMP_YTD_STATE_NUMBERED;

    RETURN 'NEWPAY STG YTD_STATE load complete';
END;
$$;
