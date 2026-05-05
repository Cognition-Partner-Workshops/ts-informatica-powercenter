-- =============================================================================
-- SP_CPM_LOAD_MER_STAGING
-- Reimplements: m_CPM_Load_CPM_MER_Staging_Tables
--
-- Flow: STG_MER_FILE -> Normalizer -> exp_Initial
--       -> rtr_MER_Records (Router: HEADER / DETAIL)
--       Lookups: PAY_PERIOD by CURR_PP_FLAG and by date range
--       Targets: CPM_MER_HEADER_STG_TBL, CPM_MER_DETAIL_STG_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_MER_STAGING(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_row_count NUMBER;
BEGIN
    -- Router group 1: HEADER records
    INSERT INTO CPM_MER_HEADER_STG_TBL (
        PP_END_YEAR, PP_NUM, RECORD_TYPE, HEADER_DATE,
        RECORD_COUNT, LOAD_DATE, LOAD_ID
    )
    SELECT
        COALESCE(pp.PP_END_YEAR, :P_PP_END_YEAR),
        COALESCE(pp.PP_NUM, :P_PP_NUM),
        m.RECORD_TYPE,
        m.HEADER_DATE,
        m.RECORD_COUNT,
        CURRENT_DATE(),
        'CPM_MER_LOAD'
    FROM STG_MER_FILE m
    LEFT JOIN PAY_PERIOD pp
        ON pp.PP_START_DTE <= m.HEADER_DATE
        AND pp.PP_END_DTE >= m.HEADER_DATE
    WHERE m.RECORD_TYPE = 'H';

    -- Router group 2: DETAIL records
    -- exp_Final_MER_Detail passes through all 95 detail columns
    INSERT INTO CPM_MER_DETAIL_STG_TBL (
        PP_END_YEAR, PP_NUM,
        MER_SSN, MER_NAME, MER_AGENCY, MER_POD, MER_SUB_AGENCY,
        MER_PAY_PLAN, MER_GRADE, MER_STEP, MER_OCC_SERIES,
        MER_DUTY_STA, MER_PAY_BASIS, MER_FLSA_CAT,
        MER_APPT_TYPE, MER_WORK_SCHEDULE, MER_PAY_RATE,
        MER_ADJ_BASIC_PAY, MER_LOCALITY_ADJ, MER_TOTAL_PAY,
        MER_FEGLI_CODE, MER_ANNUAL_LEAVE_BAL, MER_RETIREMENT_PLAN,
        MER_SCD_LEAVE, MER_POSITION_TITLE,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        :P_PP_END_YEAR,
        :P_PP_NUM,
        m.MER_SSN, m.MER_NAME, m.MER_AGENCY, m.MER_POD, m.MER_SUB_AGENCY,
        m.MER_PAY_PLAN, m.MER_GRADE, m.MER_STEP, m.MER_OCC_SERIES,
        m.MER_DUTY_STA, m.MER_PAY_BASIS, m.MER_FLSA_CAT,
        m.MER_APPT_TYPE, m.MER_WORK_SCHEDULE, m.MER_PAY_RATE,
        m.MER_ADJ_BASIC_PAY, m.MER_LOCALITY_ADJ, m.MER_TOTAL_PAY,
        m.MER_FEGLI_CODE, m.MER_ANNUAL_LEAVE_BAL, m.MER_RETIREMENT_PLAN,
        m.MER_SCD_LEAVE, m.MER_POSITION_TITLE,
        CURRENT_DATE(),
        'CPM_MER_LOAD'
    FROM STG_MER_FILE m
    WHERE m.RECORD_TYPE = 'D';

    RETURN 'MER Staging load complete';
END;
$$;
