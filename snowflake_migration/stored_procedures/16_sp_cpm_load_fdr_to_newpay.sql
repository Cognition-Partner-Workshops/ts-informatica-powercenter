-- =============================================================================
-- SP_CPM_LOAD_FDR_TO_NEWPAY
-- Reimplements: m_CPM_Load_FDR_CPM_NEWPAY_TBL
--
-- Flow: CPM_NEWPAY_STG_TYPE_3_FDR -> SQ -> exp_Initial -> exp_Convert
--       -> lkp_REG_REEMPLED -> exp_Final -> CPM_NEWPAY_TBL
--
-- Key logic:
-- - exp_Initial: Sets default MP_POOL_DES='REG', REEMP_ANN_CDE='1'
-- - exp_Convert: HRLY_RATE based on REEMPLED flag and MP_POOL_DES
--   DECODE: REEMPLED='Y' -> HRLY_RATE_UA,
--           MP_POOL_DES != 'REG' AND lkp_HRLY_RATE exists -> lkp_HRLY_RATE,
--           else HRLY_RATE
-- - lkp_REG_REEMPLED: Looks up CPM_NEWPAY_STG_TYPE_3_FDR_TBL for the
--   REG record of same SSN to get REEMPLED and HRLY_RATE values
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_FDR_TO_NEWPAY(
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
        DFAS_PSEUDO_SSN, MP_POOL_DES, REEMP_ANN_CDE,
        CPP_GROSS_PAY, CPP_GROSS_PAY_MINUS,
        CPP_HLTH_EMPLR, CPP_RET_BASIC, CPP_TSP_DED,
        CPP_OASDI, CPP_FICA_HI,
        CPP_FED_TAX, CPP_STATE_TAX, CPP_LOCAL_TAX,
        HRS_REG, HRS_OT_1,
        HRLY_RATE, OC_1217_TOT,
        LINE_TYPE,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        fdr.PP_END_YEAR,
        fdr.PP_NUM,
        fdr.DFAS_PSEUDO_SSN,
        fdr.MP_POOL_DES,
        fdr.REEMP_ANN_CDE,
        fdr.CPP_GROSS_PAY,
        fdr.CPP_GROSS_PAY_MINUS,
        fdr.CPP_HLTH_EMPLR,
        fdr.CPP_RET_BASIC,
        fdr.CPP_TSP_DED,
        fdr.CPP_OASDI,
        fdr.CPP_FICA_HI,
        fdr.CPP_FED_TAX,
        fdr.CPP_STATE_TAX,
        fdr.CPP_LOCAL_TAX,
        fdr.HRS_REG,
        fdr.HRS_OT_1,
        -- exp_Convert: HRLY_RATE resolution
        CASE
            WHEN reg.REEMPLED = 'Y' THEN reg.HRLY_RATE_UA
            WHEN fdr.MP_POOL_DES != 'REG' AND reg.HRLY_RATE IS NOT NULL THEN reg.HRLY_RATE
            ELSE fdr.HRLY_RATE
        END AS HRLY_RATE,
        -- OC_1217_TOT: prefer TYPE_3 value if non-zero
        CASE
            WHEN COALESCE(fdr.OC_1217_TOT, 0) != 0 THEN fdr.OC_1217_TOT
            ELSE COALESCE(reg.OC_1217_TOT, 0)
        END AS OC_1217_TOT,
        fdr.LINE_TYPE,
        CURRENT_DATE(),
        'CPM_FDR_NEWPAY'
    FROM CPM_NEWPAY_STG_TYPE_3_FDR_TBL fdr
    -- lkp_REG_REEMPLED: lookup REG record for same SSN
    LEFT JOIN CPM_NEWPAY_STG_TYPE_3_FDR_TBL reg
        ON reg.PP_END_YEAR = fdr.PP_END_YEAR
        AND reg.PP_NUM = fdr.PP_NUM
        AND reg.DFAS_PSEUDO_SSN = fdr.DFAS_PSEUDO_SSN
        AND reg.MP_POOL_DES = 'REG'
        AND reg.REEMP_ANN_CDE = '1'
    WHERE fdr.PP_END_YEAR = :P_PP_END_YEAR
      AND fdr.PP_NUM = :P_PP_NUM;

    RETURN 'FDR to NEWPAY load complete';
END;
$$;
