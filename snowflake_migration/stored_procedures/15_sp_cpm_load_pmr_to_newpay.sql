-- =============================================================================
-- SP_CPM_LOAD_PMR_TO_NEWPAY
-- Reimplements: m_CPM_Load_PMR_To_CPM_NEWPAY_TBL
--
-- Flow: CPM_PM3_STG (pay details) + PM1 (employee name) + PSEUDOSSN
--       + CPM_NEWPAY_STG_TYPE_3 (HRLY_RATE/OC_1217_TOT overrides)
--       -> exp_Initial -> exp_Convert -> exp_Final -> CPM_NEWPAY_TBL
--
-- Key logic:
-- - Source: PM3 provides raw pay detail records (PYF_ACTUAL_AMT, etc.)
-- - PM1 join provides PYF_EYE_NME for the employee name
-- - exp_Convert: HRLY_RATE = IIF(REEMPLED='Y', HRLY_RATE_UA, HRLY_RATE)
-- - exp_Convert: OC_1217_TOT from TYPE_3 overrides if non-zero
-- - LINE_TYPE set to 'T0001'
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_PMR_TO_NEWPAY(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    INSERT INTO CPM_NEWPAY_TBL (
        PP_END_YEAR, PP_NUM,
        DFAS_PSEUDO_SSN, PYF_EYE_NME,
        PYF_PAY_DET_CD, PYF_ADJ_RSN_IDC,
        PYF_ACTUAL_AMT, PYF_HRS_SCD_AMT,
        PYF_ITW_ADD, PYF_ITW_MS,
        PYF_DDU_PYE, PYF_PAY_TAC_TYP,
        PYF_EYE_ID_PDT3, PFY_ID_BREAK_SSN,
        HRLY_RATE, OC_1217_TOT,
        LINE_TYPE
    )
    SELECT
        pm3.PP_END_YEAR,
        pm3.PP_NUM,
        pm3.PYF_EYE_ID_PDT3,
        pm1.PYF_EYE_NME,
        pm3.PYF_PAY_DET_CD,
        pm3.PYF_ADJ_RSN_IDC,
        pm3.PYF_ACTUAL_AMT,
        pm3.PYF_HRS_SCD_AMT,
        pm3.PYF_ITW_ADD,
        pm3.PYF_ITW_MS,
        pm3.PYF_DDU_PYE,
        pm3.PYF_PAY_TAC_TYP,
        pm3.PYF_EYE_ID_PDT3,
        pm3.PFY_ID_BREAK_SSN,
        -- exp_Convert: HRLY_RATE logic
        CASE
            WHEN t3.REEMPLED = 'Y' THEN t3.HRLY_RATE_UA
            ELSE t3.HRLY_RATE
        END,
        -- OC_1217_TOT: prefer TYPE_3 value if non-zero
        CASE
            WHEN COALESCE(t3.OC_1217_TOT, 0) != 0 THEN t3.OC_1217_TOT
            ELSE 0
        END,
        'T0001'
    FROM CPM_PM3_STG_TBL pm3
    LEFT JOIN CPM_PM1_STG_TBL pm1
        ON pm1.PYF_EYE_ID_1 = pm3.PYF_EYE_ID_PDT3
        AND pm1.PP_END_YEAR = pm3.PP_END_YEAR
        AND pm1.PP_NUM = pm3.PP_NUM
    LEFT JOIN CPM_NEWPAY_STG_TYPE_3_TBL t3
        ON t3.PP_END_YEAR = pm3.PP_END_YEAR
        AND t3.PP_NUM = pm3.PP_NUM
        AND t3.DFAS_PSEUDO_SSN = pm3.PYF_EYE_ID_PDT3
    WHERE pm3.PP_END_YEAR = :P_PP_END_YEAR
      AND pm3.PP_NUM = :P_PP_NUM;

    RETURN 'PMR to NEWPAY load complete';
END;
$$;
