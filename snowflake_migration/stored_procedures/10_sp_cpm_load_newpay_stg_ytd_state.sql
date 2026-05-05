-- =============================================================================
-- SP_CPM_LOAD_NEWPAY_STG_YTD_STATE
-- Reimplements: m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL
--
-- Flow: CPM_YTD_STATE_STG_TBL -> exp_Initial -> exp_Determine_YTD_States
--       -> agg_YTD_State (GROUP BY SSN, aggregate state taxes)
--       -> exp_Final -> CPM_NEWPAY_STG_YTD_STATE_TBL
--
-- Key logic: Aggregates up to 6 state tax records per SSN. The original
--   Informatica mapping uses stateful variables (v_CURR_KEY, v_STATE_COUNTER)
--   to track position within each employee's state records, then FIRST()
--   aggregation to pivot states 1-6 into separate columns.
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
    CREATE OR REPLACE TEMPORARY TABLE TMP_YTD_STATE_NUMBERED AS
    SELECT
        DYS_SSN,
        DYS_ST_CODE,
        DYS_ST_WAGES,
        DYS_ST_TAX,
        PP_END_YEAR,
        PP_NUM,
        ROW_NUMBER() OVER (
            PARTITION BY DYS_SSN
            ORDER BY DYS_ST_CODE
        ) AS STATE_NUM
    FROM CPM_YTD_STATE_STG_TBL
    WHERE PP_END_YEAR = :P_PP_END_YEAR
      AND PP_NUM = :P_PP_NUM;

    -- Pivot up to 6 state records per SSN into the target structure
    -- Mirrors: agg_YTD_State with FIRST(field, STATE_COUNTER = N) logic
    INSERT INTO CPM_NEWPAY_STG_YTD_STATE_TBL (
        PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN,
        YTD_ST_1_CODE, YTD_ST_1_WAGES, YTD_ST_1_TAX,
        YTD_ST_2_CODE, YTD_ST_2_WAGES, YTD_ST_2_TAX,
        YTD_ST_3_CODE, YTD_ST_3_WAGES, YTD_ST_3_TAX,
        YTD_ST_4_CODE, YTD_ST_4_WAGES, YTD_ST_4_TAX,
        YTD_ST_5_CODE, YTD_ST_5_WAGES, YTD_ST_5_TAX,
        LOAD_DATE
    )
    SELECT
        PP_END_YEAR, PP_NUM, DYS_SSN,
        MAX(CASE WHEN STATE_NUM = 1 THEN DYS_ST_CODE END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 1 THEN DYS_ST_WAGES END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 1 THEN DYS_ST_TAX END), 0),
        MAX(CASE WHEN STATE_NUM = 2 THEN DYS_ST_CODE END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 2 THEN DYS_ST_WAGES END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 2 THEN DYS_ST_TAX END), 0),
        MAX(CASE WHEN STATE_NUM = 3 THEN DYS_ST_CODE END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 3 THEN DYS_ST_WAGES END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 3 THEN DYS_ST_TAX END), 0),
        MAX(CASE WHEN STATE_NUM = 4 THEN DYS_ST_CODE END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 4 THEN DYS_ST_WAGES END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 4 THEN DYS_ST_TAX END), 0),
        MAX(CASE WHEN STATE_NUM = 5 THEN DYS_ST_CODE END),
        COALESCE(MAX(CASE WHEN STATE_NUM = 5 THEN DYS_ST_WAGES END), 0),
        COALESCE(MAX(CASE WHEN STATE_NUM = 5 THEN DYS_ST_TAX END), 0),
        CURRENT_DATE()
    FROM TMP_YTD_STATE_NUMBERED
    GROUP BY PP_END_YEAR, PP_NUM, DYS_SSN;

    DROP TABLE IF EXISTS TMP_YTD_STATE_NUMBERED;

    RETURN 'NEWPAY STG YTD_STATE load complete';
END;
$$;
