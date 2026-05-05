-- =============================================================================
-- SP_CPM_LOAD_NEWPAY_STG_TYPE_3
-- Reimplements: m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL
--
-- Flow: CPM_NEWPAY_TBL -> SQ -> exp_Initial
--       -> agg_PYF_EYE_ID_PP_NUM (massive aggregation: 211 expressions)
--       -> Lookups: CPM_NEWPAY_STG_TYPE_1_2_TBL, CPM_NEWPAY_STG_ALT_TBL,
--                   CPM_NEWPAY_STG_DETAIL_TBL
--       -> exp_Format_Fields (overflow truncation: 105 expressions)
--       -> exp_Final -> CPM_NEWPAY_STG_TYPE_3_TBL
--
-- Key logic: Aggregates all pay detail records (AA, AB, RA, UA, UH, etc.)
--   per employee per pay period using SUM with conditional filters.
--   Computes gross pay, deductions, leave hours, and benefit amounts.
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_NEWPAY_STG_TYPE_3(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    -- Step 1: Aggregate pay details per employee per pay period
    -- Replaces: agg_PYF_EYE_ID_PP_NUM (211 aggregate expressions)
    -- Each SUM uses conditional filters on PYF_PAY_DET_CD to separate
    -- different pay components (gross, deductions, leave, benefits)
    CREATE OR REPLACE TEMPORARY TABLE TMP_TYPE_3_AGG AS
    SELECT
        n.PP_END_YEAR,
        n.PP_NUM,
        n.DFAS_PSEUDO_SSN,

        -- CPP_GROSS_PAY: SUM of AA, AB, RA, etc. pay detail codes
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD IN ('AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN')
                          THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_GROSS_PAY,

        -- CPP_GROSS_PAY_MINUS: deductions (YC, YD, etc.)
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD IN ('YC','YD','YE','YF','YG')
                          THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_GROSS_PAY_MINUS,

        -- ADJ_GROSS_PAY: adjusted gross with ADJ_RSN_IDC = 'N'
        COALESCE(SUM(CASE WHEN n.PYF_ADJ_RSN_IDC = 'N'
                          AND n.PYF_PAY_DET_CD IN ('AA','AB','AC','AD','AE','AF','AG','AH')
                          THEN n.PYF_ACTUAL_AMT END), 0) AS ADJ_GROSS_PAY,

        -- CPP_REF_DED_CDE / CPP_REF_DED_AMT: refund deductions (UO)
        MAX(CASE WHEN n.PYF_PAY_DET_CD = 'UO' THEN 'R' END) AS CPP_REF_DED_CDE,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UO' THEN n.PYF_ACTUAL_AMT END) * -1, 0) AS CPP_REF_DED_AMT,

        -- Health insurance components
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UH' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_HLTH_EMPLR,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UO' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_HLTH_EMPLR_AFPS_PREPD_PREM,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'JO' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_HLTH_EMPLR_AFPS_PREPD_PREM_COLL,

        -- Adjusted health insurance
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UH' AND n.PYF_ADJ_RSN_IDC = 'N'
                          THEN n.PYF_ACTUAL_AMT END), 0) AS ADJ_HLTH_EMPLR,

        -- Retirement components
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UB' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_RET_BASIC,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UC' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_TSP_DED,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UD' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_TSP_GOV_CONT,

        -- OASDI / Medicare
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UA' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_OASDI,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UE' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_FICA_HI,

        -- Federal / State / Local taxes
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UF' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_FED_TAX,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UG' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_STATE_TAX,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UI' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_LOCAL_TAX,

        -- FEGLI
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'UJ' THEN n.PYF_ACTUAL_AMT END), 0) AS CPP_FEGLI,

        -- Leave hours: regular, OT, night diff, etc.
        -- Using PYF_HRS_SCD_AMT for hour amounts
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'RA' THEN n.PYF_HRS_SCD_AMT END), 0) AS HRS_REG,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD IN ('AB','AE') THEN n.PYF_HRS_SCD_AMT END), 0) AS HRS_OT_1,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'AF' THEN n.PYF_HRS_SCD_AMT END), 0) AS HRS_OT_PL,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'AC' THEN n.PYF_HRS_SCD_AMT END), 0) AS HRS_ND,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'AD' THEN n.PYF_HRS_SCD_AMT END), 0) AS HRS_SD,
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'AG' THEN n.PYF_HRS_SCD_AMT END), 0) AS HRS_HOL,

        -- Base pay hours
        COALESCE(SUM(CASE WHEN n.PYF_PAY_DET_CD = 'AA' THEN n.PYF_HRS_SCD_AMT END), 0) AS BASE_HRS,

        -- Line type
        'T0001' AS LINE_TYPE,

        CURRENT_DATE() AS LOAD_DATE,
        'CPM_TYPE3_LOAD' AS LOAD_ID

    FROM CPM_NEWPAY_TBL n
    WHERE n.PP_END_YEAR = :P_PP_END_YEAR
      AND n.PP_NUM = :P_PP_NUM
    GROUP BY n.PP_END_YEAR, n.PP_NUM, n.DFAS_PSEUDO_SSN;

    -- Step 2: Join with lookup tables and insert into target
    -- Lookups: TYPE_1_2 (personnel data), ALT (allotments), DETAIL (tax details)
    INSERT INTO CPM_NEWPAY_STG_TYPE_3_TBL (
        PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN,
        CPP_GROSS_PAY, CPP_GROSS_PAY_MINUS, ADJ_GROSS_PAY,
        CPP_REF_DED_CDE, CPP_REF_DED_AMT,
        CPP_HLTH_EMPLR, CPP_RET_BASIC, CPP_TSP_DED, CPP_TSP_GOV_CONT,
        CPP_OASDI, CPP_FICA_HI,
        CPP_FED_TAX, CPP_STATE_TAX, CPP_LOCAL_TAX, CPP_FEGLI,
        HRS_REG, HRS_OT_1, HRS_OT_PL, HRS_ND, HRS_SD, HRS_HOL,
        BASE_HRS, LINE_TYPE,
        -- From TYPE_1_2 lookup
        LAST_NAME, FIRST_NAME, MID_INIT,
        PAY_PLAN, GRADE, STEP_OR_RATE,
        OCC_SERIES, DUTY_STATION, PAY_BASIS,
        ADJ_BASIC_PAY, LOCALITY_ADJ, TOTAL_PAY,
        -- From ALT lookup
        CPP_ALT_TOT,
        -- From DETAIL lookup
        FED_OPT_TAX_DED, ST_TAX_OPT_DED,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        a.PP_END_YEAR, a.PP_NUM, a.DFAS_PSEUDO_SSN,
        -- Apply overflow truncation (exp_Format_Fields)
        -- HRS fields: clamp to 999.99
        a.CPP_GROSS_PAY, a.CPP_GROSS_PAY_MINUS, a.ADJ_GROSS_PAY,
        a.CPP_REF_DED_CDE, a.CPP_REF_DED_AMT,
        a.CPP_HLTH_EMPLR, a.CPP_RET_BASIC, a.CPP_TSP_DED, a.CPP_TSP_GOV_CONT,
        a.CPP_OASDI, a.CPP_FICA_HI,
        a.CPP_FED_TAX, a.CPP_STATE_TAX, a.CPP_LOCAL_TAX, a.CPP_FEGLI,
        LEAST(ABS(a.HRS_REG), 999.99) * SIGN(a.HRS_REG),
        LEAST(ABS(a.HRS_OT_1), 999.99) * SIGN(a.HRS_OT_1),
        LEAST(ABS(a.HRS_OT_PL), 999.99) * SIGN(a.HRS_OT_PL),
        LEAST(ABS(a.HRS_ND), 999.99) * SIGN(a.HRS_ND),
        LEAST(ABS(a.HRS_SD), 999.99) * SIGN(a.HRS_SD),
        LEAST(ABS(a.HRS_HOL), 999.99) * SIGN(a.HRS_HOL),
        a.BASE_HRS, a.LINE_TYPE,
        -- TYPE_1_2 personnel data
        t12.LAST_NAME, t12.FIRST_NAME, t12.MID_INIT,
        t12.PAY_PLAN, t12.GRADE, t12.STEP_OR_RATE,
        t12.OCC_SERIES, t12.DUTY_STATION, t12.PAY_BASIS,
        t12.ADJ_BASIC_PAY, t12.LOCALITY_ADJ, t12.TOTAL_PAY,
        -- ALT allotment total
        COALESCE(alt.CPP_ALT_TOT, 0),
        -- DETAIL tax overrides
        COALESCE(det.FED_OPT_TAX_DED, 0),
        COALESCE(det.ST_TAX_OPT_DED, 0),
        a.LOAD_DATE, a.LOAD_ID
    FROM TMP_TYPE_3_AGG a
    LEFT JOIN CPM_NEWPAY_STG_TYPE_1_2_TBL t12
        ON t12.PP_END_YEAR = a.PP_END_YEAR
        AND t12.PP_NUM = a.PP_NUM
        AND t12.DFAS_PSEUDO_SSN = a.DFAS_PSEUDO_SSN
    LEFT JOIN CPM_NEWPAY_STG_ALT_TBL alt
        ON alt.PP_END_YEAR = a.PP_END_YEAR
        AND alt.PP_NUM = a.PP_NUM
        AND alt.DFAS_PSEUDO_SSN = a.DFAS_PSEUDO_SSN
    LEFT JOIN CPM_NEWPAY_STG_DETAIL_TBL det
        ON det.PP_END_YEAR = a.PP_END_YEAR
        AND det.PP_NUM = a.PP_NUM
        AND det.DFAS_PSEUDO_SSN = a.DFAS_PSEUDO_SSN;

    DROP TABLE IF EXISTS TMP_TYPE_3_AGG;

    RETURN 'NEWPAY STG TYPE 3 load complete';
END;
$$;
