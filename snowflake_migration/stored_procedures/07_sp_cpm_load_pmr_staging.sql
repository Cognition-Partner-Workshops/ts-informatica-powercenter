-- =============================================================================
-- SP_CPM_LOAD_PMR_STAGING
-- Reimplements: m_CPM_Load_CPM_PMR_Staging_Tables
--
-- Flow: STG_PAYMASTER_FILE + STG_PAYMASTER_THREE -> Normalizer -> exp_Initial
--       -> lkp_Pay_Period_Record_Date -> exp_Determine_Record_Type
--       -> rtr_Paymaster_Records (Router: HEADER / PM1 / PM2 / PM3)
--       Lookups: PAY_PERIOD by CURR_PP_FLAG and by date range
--       Targets: CPM_PMH_STG_TBL, CPM_PM1_STG_TBL, CPM_PM2_STG_TBL,
--                CPM_PM3_STG_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_PMR_STAGING(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    -- Load PAYMASTER Header records into CPM_PMH_STG_TBL
    -- exp_Determine_Record_Type routes by PMR record type field
    INSERT INTO CPM_PMH_STG_TBL (
        PP_END_YEAR, PP_NUM, LOAD_DATE
    )
    SELECT
        COALESCE(pp.PP_END_YEAR, :P_PP_END_YEAR),
        COALESCE(pp.PP_NUM, :P_PP_NUM),
        CURRENT_DATE()
    FROM STG_PAYMASTER_FILE p
    LEFT JOIN PAY_PERIOD pp
        ON pp.PP_START_DTE <= p.HEADER_DATE
        AND pp.PP_END_DTE >= p.HEADER_DATE
    WHERE p.RECORD_TYPE = 'H';

    -- Load PAYMASTER Type 1 records into CPM_PM1_STG_TBL
    -- exp_Final_Paymaster_1 adds PP_END_YEAR, PP_NUM from lookup
    INSERT INTO CPM_PM1_STG_TBL (
        PP_END_YEAR, PP_NUM,
        PYF_EYE_ID_1, PYF_EYE_NME, PYF_PAY_DET_CD,
        PYF_ADJ_RSN_IDC, PYF_ACTUAL_AMT, PYF_ITW_ADD, PYF_ITW_MS,
        PYF_DDU_PYE, PYF_HRS_SCD_AMT,
        PYF_EYE_ID_PDT3, PFY_ID_BREAK_SSN, PYF_PAY_TAC_TYP,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        :P_PP_END_YEAR,
        :P_PP_NUM,
        p.PYF_EYE_ID_1, p.PYF_EYE_NME, p.PYF_PAY_DET_CD,
        p.PYF_ADJ_RSN_IDC, p.PYF_ACTUAL_AMT, p.PYF_ITW_ADD, p.PYF_ITW_MS,
        p.PYF_DDU_PYE, p.PYF_HRS_SCD_AMT,
        p.PYF_EYE_ID_PDT3, p.PFY_ID_BREAK_SSN, p.PYF_PAY_TAC_TYP,
        CURRENT_DATE(),
        'CPM_PMR_LOAD'
    FROM STG_PAYMASTER_FILE p
    WHERE p.RECORD_TYPE = '1';

    -- Load PAYMASTER Type 2 records into CPM_PM2_STG_TBL
    INSERT INTO CPM_PM2_STG_TBL (
        PP_END_YEAR, PP_NUM,
        PYF_EYE_ID_1, PYF_PAY_PLAN, PYF_GRADE, PYF_STEP,
        PYF_OCC_SERIES, PYF_DUTY_STATION, PYF_PAY_BASIS,
        PYF_FLSA_CAT, PYF_WORK_SCHEDULE, PYF_APPT_TYPE,
        PYF_RETIRE_PLAN, PYF_FEGLI, PYF_SCD_LEAVE,
        PYF_ADJ_BASIC_PAY, PYF_LOCALITY_ADJ, PYF_TOTAL_PAY,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        :P_PP_END_YEAR,
        :P_PP_NUM,
        p.PYF_EYE_ID_1, p.PYF_PAY_PLAN, p.PYF_GRADE, p.PYF_STEP,
        p.PYF_OCC_SERIES, p.PYF_DUTY_STATION, p.PYF_PAY_BASIS,
        p.PYF_FLSA_CAT, p.PYF_WORK_SCHEDULE, p.PYF_APPT_TYPE,
        p.PYF_RETIRE_PLAN, p.PYF_FEGLI, p.PYF_SCD_LEAVE,
        p.PYF_ADJ_BASIC_PAY, p.PYF_LOCALITY_ADJ, p.PYF_TOTAL_PAY,
        CURRENT_DATE(),
        'CPM_PMR_LOAD'
    FROM STG_PAYMASTER_FILE p
    WHERE p.RECORD_TYPE = '2';

    -- Load PAYMASTER Type 3 records into CPM_PM3_STG_TBL
    -- Uses both PAYMASTER_FILE and PAYMASTER_THREE sources
    INSERT INTO CPM_PM3_STG_TBL (
        PP_END_YEAR, PP_NUM,
        PYF_EYE_ID_PDT3, PYF_PAY_DET_CD, PYF_ACTUAL_AMT,
        PYF_HRS_SCD_AMT, PYF_ADJ_RSN_IDC,
        PYF_DDU_PYE, PYF_ITW_MS, PYF_ITW_ADD,
        PFY_ID_BREAK_SSN, PYF_PAY_TAC_TYP,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        :P_PP_END_YEAR,
        :P_PP_NUM,
        p.PYF_EYE_ID_PDT3, p.PYF_PAY_DET_CD, p.PYF_ACTUAL_AMT,
        p.PYF_HRS_SCD_AMT, p.PYF_ADJ_RSN_IDC,
        p.PYF_DDU_PYE, p.PYF_ITW_MS, p.PYF_ITW_ADD,
        p.PFY_ID_BREAK_SSN, p.PYF_PAY_TAC_TYP,
        CURRENT_DATE(),
        'CPM_PMR_LOAD'
    FROM STG_PAYMASTER_FILE p
    WHERE p.RECORD_TYPE = '3';

    RETURN 'PMR Staging load complete';
END;
$$;
