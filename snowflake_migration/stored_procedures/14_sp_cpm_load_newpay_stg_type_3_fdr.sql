-- =============================================================================
-- SP_CPM_LOAD_NEWPAY_STG_TYPE_3_FDR
-- Reimplements: m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL
--
-- Flow: CPM_NEWPAY_TBL -> exp_Initial -> exp_Set_REEMP_ANN_CDE
--       -> agg_PYF_EYE_ID_PP_NUM (221 aggregate expressions!)
--       -> Lookups: CPM_NEWPAY_STG_TYPE_1_2_TBL, CPM_NEWPAY_STG_ALT_TBL
--       -> exp_Format_Fields (241 expressions for overflow truncation)
--       -> exp_GEN_SEQ_NUMBER (sequence numbering per SSN + pool)
--       -> exp_Double_T38_SUN_DIF_HRS_CPP
--       -> exp_Final -> CPM_NEWPAY_STG_TYPE_3_FDR_TBL
--
-- Key differences from TYPE_3:
-- - Handles FDR (Federal Disbursement Record) specific fields
-- - Groups by SSN + MP_POOL_DES (money pool designation: REG, CASH, etc.)
-- - Generates sequence numbers per SSN+pool combination
-- - Has REEMP_ANN_CDE (re-employment annuity code) logic
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_NEWPAY_STG_TYPE_3_FDR(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    -- Step 1: Prepare source data with MP_POOL_DES determination
    -- exp_Initial: determines money pool designation from pay detail/TAC codes
    CREATE OR REPLACE TEMPORARY TABLE TMP_FDR_INITIAL AS
    SELECT
        n.*,
        -- MP_POOL_DES determination from exp_Initial
        -- DECODE logic: blank TAC_TYP -> 'REG', else derive from PYF_PAY_TAC_TYP
        CASE
            WHEN TRIM(COALESCE(n.PYF_PAY_TAC_TYP, '')) = '' THEN 'REG'
            WHEN n.PYF_PAY_DET_CD IN ('QA') AND SUBSTR(COALESCE(n.PFY_ID_BREAK_SSN,''), 4, 1) = 'B'
                THEN SUBSTR(COALESCE(n.PFY_ID_BREAK_SSN,''), 1, 3)
            ELSE COALESCE(NULLIF(TRIM(n.PYF_PAY_TAC_TYP), ''), 'REG')
        END AS MP_POOL_DES,
        -- REEMP_ANN_CDE: default '1' for REG pool
        '1' AS REEMP_ANN_CDE,
        -- ADJ_NO: PP_NUM if ADJ_RSN_IDC = 'N', else 0
        CASE WHEN n.PYF_ADJ_RSN_IDC = 'N' THEN n.PP_NUM ELSE 0 END AS ADJ_NO,
        -- BASE_HRS from RA records
        CASE WHEN n.PYF_PAY_DET_CD = 'RA' THEN TRUNC(n.PYF_HRS_SCD_AMT) ELSE 0 END AS BASE_HRS_INPUT,
        -- LINE_TYPE
        CASE
            WHEN TRIM(COALESCE(n.PYF_PAY_TAC_TYP, '')) = '' THEN 'OTHER'
            ELSE COALESCE(NULLIF(TRIM(n.PYF_PAY_TAC_TYP), ''), 'OTHER')
        END AS LINE_TYPE
    FROM CPM_NEWPAY_TBL n
    WHERE n.PP_END_YEAR = :P_PP_END_YEAR
      AND n.PP_NUM = :P_PP_NUM;

    -- Step 2: Aggregate by SSN + MP_POOL_DES (replaces 221-expression aggregator)
    CREATE OR REPLACE TEMPORARY TABLE TMP_FDR_AGG AS
    SELECT
        f.PP_END_YEAR,
        f.PP_NUM,
        f.DFAS_PSEUDO_SSN,
        f.MP_POOL_DES,
        f.REEMP_ANN_CDE,
        MAX(CASE WHEN f.ADJ_NO != 0 THEN f.ADJ_NO END) AS ADJ_NO,

        -- Gross pay components (same pattern as TYPE_3)
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD IN ('AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN')
                          THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_GROSS_PAY,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD IN ('YC','YD','YE','YF','YG')
                          THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_GROSS_PAY_MINUS,

        -- All deduction/benefit SUMs (mirroring agg_PYF_EYE_ID_PP_NUM)
        MAX(CASE WHEN f.PYF_PAY_DET_CD = 'UO' THEN 'R' END) AS CPP_REF_DED_CDE,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UO' THEN f.PYF_ACTUAL_AMT END) * -1, 0) AS CPP_REF_DED_AMT,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UH' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_HLTH_EMPLR,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UB' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_RET_BASIC,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UC' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_TSP_DED,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UD' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_TSP_GOV_CONT,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UA' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_OASDI,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UE' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_FICA_HI,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UF' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_FED_TAX,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UG' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_STATE_TAX,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UI' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_LOCAL_TAX,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'UJ' THEN f.PYF_ACTUAL_AMT END), 0) AS CPP_FEGLI,

        -- Hour components
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'RA' THEN f.PYF_HRS_SCD_AMT END), 0) AS HRS_REG,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD IN ('AB','AE') THEN f.PYF_HRS_SCD_AMT END), 0) AS HRS_OT_1,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'AF' THEN f.PYF_HRS_SCD_AMT END), 0) AS HRS_OT_PL,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'AC' THEN f.PYF_HRS_SCD_AMT END), 0) AS HRS_ND,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'AD' THEN f.PYF_HRS_SCD_AMT END), 0) AS HRS_SD,
        COALESCE(SUM(CASE WHEN f.PYF_PAY_DET_CD = 'AG' THEN f.PYF_HRS_SCD_AMT END), 0) AS HRS_HOL,

        MAX(f.BASE_HRS_INPUT) AS BASE_HRS,
        MAX(f.LINE_TYPE) AS LINE_TYPE

    FROM TMP_FDR_INITIAL f
    GROUP BY f.PP_END_YEAR, f.PP_NUM, f.DFAS_PSEUDO_SSN, f.MP_POOL_DES, f.REEMP_ANN_CDE;

    -- Step 3: Generate sequence numbers per SSN + pool
    -- exp_GEN_SEQ_NUMBER: v_CURR_KEY = PYF_EYE_ID_PDT3 || MP_POOL_DES
    -- SEQ_ID resets to 1 on new key, increments within same key
    INSERT INTO CPM_NEWPAY_STG_TYPE_3_FDR_TBL (
        PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN, MP_POOL_DES,
        REEMP_ANN_CDE, ADJ_NO, SEQ_ID,
        CPP_GROSS_PAY, CPP_GROSS_PAY_MINUS,
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
        CPP_ALT_TOT
    )
    SELECT
        a.PP_END_YEAR, a.PP_NUM, a.DFAS_PSEUDO_SSN, a.MP_POOL_DES,
        a.REEMP_ANN_CDE, COALESCE(a.ADJ_NO, 0),
        ROW_NUMBER() OVER (
            PARTITION BY a.DFAS_PSEUDO_SSN, a.MP_POOL_DES
            ORDER BY a.REEMP_ANN_CDE
        ) AS SEQ_ID,
        -- Overflow truncation for gross pay and hour fields
        a.CPP_GROSS_PAY, a.CPP_GROSS_PAY_MINUS,
        a.CPP_REF_DED_CDE, a.CPP_REF_DED_AMT,
        a.CPP_HLTH_EMPLR, a.CPP_RET_BASIC, a.CPP_TSP_DED, a.CPP_TSP_GOV_CONT,
        a.CPP_OASDI, a.CPP_FICA_HI,
        a.CPP_FED_TAX, a.CPP_STATE_TAX, a.CPP_LOCAL_TAX, a.CPP_FEGLI,
        -- Hour overflow clamping (exp_Format_Fields)
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
        COALESCE(alt.CPP_ALT_TOT, 0)
    FROM TMP_FDR_AGG a
    LEFT JOIN CPM_NEWPAY_STG_TYPE_1_2_TBL t12
        ON t12.PP_END_YEAR = a.PP_END_YEAR
        AND t12.PP_NUM = a.PP_NUM
        AND t12.DFAS_PSEUDO_SSN = a.DFAS_PSEUDO_SSN
    LEFT JOIN CPM_NEWPAY_STG_ALT_TBL alt
        ON alt.PP_END_YEAR = a.PP_END_YEAR
        AND alt.PP_NUM = a.PP_NUM
        AND alt.DFAS_PSEUDO_SSN = a.DFAS_PSEUDO_SSN;

    DROP TABLE IF EXISTS TMP_FDR_INITIAL;
    DROP TABLE IF EXISTS TMP_FDR_AGG;

    RETURN 'NEWPAY STG TYPE 3 FDR load complete';
END;
$$;
