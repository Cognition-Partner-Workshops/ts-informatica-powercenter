-- =============================================================================
-- SP_CPM_LOAD_PAD_STAGING
-- Reimplements: m_CPM_Load_CPM_PAD_Staging_Tables
--
-- Flow: STG_PAD_FILE -> Normalizer -> exp_Determine_Record_Type
--       -> rtr_PAD_Records (Router: HEADER / DETAIL)
--       Lookups: PAY_PERIOD by CURR_PP_FLAG and by date range
--       Targets: CPM_PAD_HEADER_STG_TBL, CPM_PAD_DETAIL_STG_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_PAD_STAGING(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    -- Router group 1: HEADER records
    INSERT INTO CPM_PAD_HEADER_STG_TBL (
        PP_END_YEAR, PP_NUM, RECORD_TYPE, HEADER_DATE,
        RECORD_COUNT, LOAD_DATE, LOAD_ID, FILE_TYPE, AGENCY_CODE
    )
    SELECT
        COALESCE(pp.PP_END_YEAR, :P_PP_END_YEAR),
        COALESCE(pp.PP_NUM, :P_PP_NUM),
        p.RECORD_TYPE,
        p.HEADER_DATE,
        p.RECORD_COUNT,
        CURRENT_DATE(),
        'CPM_PAD_LOAD',
        p.FILE_TYPE,
        p.AGENCY_CODE
    FROM STG_PAD_FILE p
    LEFT JOIN PAY_PERIOD pp
        ON pp.PP_START_DTE <= p.HEADER_DATE
        AND pp.PP_END_DTE >= p.HEADER_DATE
    WHERE p.RECORD_TYPE = 'H';

    -- Router group 2: DETAIL records
    -- exp_Final_PAD_Detail and exp_Convert handle field transformations
    INSERT INTO CPM_PAD_DETAIL_STG_TBL (
        PP_END_YEAR, PP_NUM,
        PAD_SOC_SEC_NO, PAD_NAME, PAD_AGENCY, PAD_SUB_AGENCY,
        PAD_PAY_PLAN, PAD_GRADE, PAD_STEP, PAD_OCC_SERIES,
        PAD_DUTY_STATION, PAD_PAY_BASIS, PAD_FLSA_CAT,
        PAD_APPT_TYPE, PAD_WORK_SCHEDULE, PAD_RETIRE_PLAN,
        PAD_FEGLI, PAD_SCD_LEAVE, PAD_ADJ_BASIC_PAY,
        PAD_LOCALITY_ADJ, PAD_TOTAL_PAY, PAD_PAY_RATE,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        :P_PP_END_YEAR,
        :P_PP_NUM,
        p.PAD_SOC_SEC_NO, p.PAD_NAME, p.PAD_AGENCY, p.PAD_SUB_AGENCY,
        p.PAD_PAY_PLAN, p.PAD_GRADE, p.PAD_STEP, p.PAD_OCC_SERIES,
        p.PAD_DUTY_STATION, p.PAD_PAY_BASIS, p.PAD_FLSA_CAT,
        p.PAD_APPT_TYPE, p.PAD_WORK_SCHEDULE, p.PAD_RETIRE_PLAN,
        p.PAD_FEGLI, p.PAD_SCD_LEAVE, p.PAD_ADJ_BASIC_PAY,
        p.PAD_LOCALITY_ADJ, p.PAD_TOTAL_PAY, p.PAD_PAY_RATE,
        CURRENT_DATE(),
        'CPM_PAD_LOAD'
    FROM STG_PAD_FILE p
    WHERE p.RECORD_TYPE = 'D';

    RETURN 'PAD Staging load complete';
END;
$$;
