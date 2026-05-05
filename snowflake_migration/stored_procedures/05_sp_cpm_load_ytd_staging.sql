-- =============================================================================
-- SP_CPM_LOAD_YTD_STAGING
-- Reimplements: m_CPM_Load_CPM_YTD_Staging_Tables
--
-- Flow: STG_YTD_FILE -> Normalizer (parse fixed-width) -> exp_Initial
--       -> rtr_YTD_Records (Router: HEADER / DETAIL / STATE)
--       Lookups: PAY_PERIOD by CURR_PP_FLAG and by date range
--       Targets: CPM_YTD_HEADER_STG_TBL, CPM_YTD_DETAIL_STG_TBL,
--                CPM_YTD_STATE_STG_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_YTD_STAGING(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_curr_pp_num       NUMBER;
    v_curr_pp_end_year  NUMBER;
    v_row_count         NUMBER;
BEGIN
    -- Lookup current pay period
    SELECT PP_NUM, PP_END_YEAR
    INTO v_curr_pp_num, v_curr_pp_end_year
    FROM PAY_PERIOD
    WHERE CURR_PP_FLAG = 'Y'
    LIMIT 1;

    -- Router group 1: HEADER records (record type = 'H' equivalent)
    -- In the original mapping, rtr_YTD_Records routes based on record type
    -- derived from the normalizer output of the VSAM flat file.
    INSERT INTO CPM_YTD_HEADER_STG_TBL (
        PP_END_YEAR, PP_NUM, RECORD_TYPE, HEADER_DATE,
        RECORD_COUNT, LOAD_DATE, LOAD_ID
    )
    SELECT
        COALESCE(pp.PP_END_YEAR, :P_PP_END_YEAR),
        COALESCE(pp.PP_NUM, :P_PP_NUM),
        y.RECORD_TYPE,
        y.HEADER_DATE,
        y.RECORD_COUNT,
        CURRENT_DATE(),
        'CPM_YTD_LOAD'
    FROM STG_YTD_FILE y
    LEFT JOIN PAY_PERIOD pp
        ON pp.PP_START_DTE <= y.HEADER_DATE
        AND pp.PP_END_DTE >= y.HEADER_DATE
    WHERE y.RECORD_TYPE = 'H';

    -- Router group 2: DETAIL records
    INSERT INTO CPM_YTD_DETAIL_STG_TBL (
        PP_END_YEAR, PP_NUM,
        DYD_SSN_1, DYD_BASE_PAY, DYD_OVERTIME_PAY, DYD_NIGHT_DIFF_PAY,
        DYD_SUN_PREM_PAY, DYD_HOLIDAY_PAY, DYD_HAZ_DUTY_PAY,
        DYD_ENV_DIF_PAY, DYD_POST_DIF_PAY, DYD_FICA_HI, DYD_OASDI,
        DYD_FED_TAX, DYD_ST_TAX, DYD_LOCAL_TAX,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        :P_PP_END_YEAR,
        :P_PP_NUM,
        y.DYD_SSN_1, y.DYD_BASE_PAY, y.DYD_OVERTIME_PAY, y.DYD_NIGHT_DIFF_PAY,
        y.DYD_SUN_PREM_PAY, y.DYD_HOLIDAY_PAY, y.DYD_HAZ_DUTY_PAY,
        y.DYD_ENV_DIF_PAY, y.DYD_POST_DIF_PAY, y.DYD_FICA_HI, y.DYD_OASDI,
        y.DYD_FED_TAX, y.DYD_ST_TAX, y.DYD_LOCAL_TAX,
        CURRENT_DATE(),
        'CPM_YTD_LOAD'
    FROM STG_YTD_FILE y
    WHERE y.RECORD_TYPE = 'D';

    -- Router group 3: STATE records
    INSERT INTO CPM_YTD_STATE_STG_TBL (
        PP_END_YEAR, PP_NUM,
        DYS_SSN, DYS_ST_CODE, DYS_ST_WAGES, DYS_ST_TAX,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        :P_PP_END_YEAR,
        :P_PP_NUM,
        y.DYS_SSN, y.DYS_ST_CODE, y.DYS_ST_WAGES, y.DYS_ST_TAX,
        CURRENT_DATE(),
        'CPM_YTD_LOAD'
    FROM STG_YTD_FILE y
    WHERE y.RECORD_TYPE = 'S';

    RETURN 'YTD Staging load complete';
END;
$$;
