-- =============================================================================
-- SP_CPM_LOAD_NEWPAY_STG_DETAIL
-- Reimplements: m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL
--
-- Flow: CPM_NEWPAY_TBL -> SQ -> exp_Initial -> exp_Format_Fields
--       -> agg_PYF_EYE_ID_PP_NUM -> exp_Final -> CPM_NEWPAY_STG_DETAIL_TBL
--
-- Key logic:
-- - exp_Format_Fields: Truncates values exceeding field limits (e.g.,
--   ST_TAX_OPT_DED > 999 → truncate to 3+2 decimal digits).
--   Uses ABS/SIGN/SUBSTR/INSTR pattern for numeric overflow handling.
-- - agg_PYF_EYE_ID_PP_NUM: Aggregates by SSN + pay period, using
--   DECODE(TRUE, NOT ISNULL(FIRST(...)), FIRST(...), ...) for conditional
--   aggregation of pay detail codes (WD, WE, UO, etc.)
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_NEWPAY_STG_DETAIL(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
    INSERT INTO CPM_NEWPAY_STG_DETAIL_TBL (
        PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN,
        CPP_REF_DED_CDE, ADJ_REFUND_CDE,
        FED_OPT_TAX_DED, ST_TAX_OPT_DED,
        ST_TAX_MAR_STAT, FED_TAX_MAR_STAT,
        FED_TAX_EXEMP, ST_TAX_EXEMP,
        PAY_CYCLE_IND, LAST_UPDATED,
        LOAD_DATE, LOAD_ID
    )
    SELECT
        n.PP_END_YEAR,
        n.PP_NUM,
        n.DFAS_PSEUDO_SSN,

        -- CPP_REF_DED_CDE: 'R' if any UO pay detail exists, else NULL
        -- Mirrors: DECODE(TRUE, NOT ISNULL(FIRST(PYF_PAY_DET_CD, PYF_PAY_DET_CD='UO')), 'R', ...)
        MAX(CASE WHEN n.PYF_PAY_DET_CD = 'UO' THEN 'R' END) AS CPP_REF_DED_CDE,

        -- ADJ_REFUND_CDE: 'R' if UO with ADJ_RSN_IDC = 'N'
        MAX(CASE WHEN n.PYF_PAY_DET_CD = 'UO' AND n.PYF_ADJ_RSN_IDC = 'N' THEN 'R' END),

        -- FED_OPT_TAX_DED: from WD pay detail code (with overflow truncation)
        -- Mirrors: exp_Format_Fields overflow clamping + LAST(PYF_ITW_ADD, PYF_PAY_DET_CD='WD')
        LEAST(ABS(COALESCE(
            MAX(CASE WHEN n.PYF_PAY_DET_CD = 'WD' THEN n.PYF_ITW_ADD END), 0
        )), 999) *
        SIGN(COALESCE(MAX(CASE WHEN n.PYF_PAY_DET_CD = 'WD' THEN n.PYF_ITW_ADD END), 0)),

        -- ST_TAX_OPT_DED: from WE pay detail code (with overflow truncation)
        LEAST(ABS(COALESCE(
            MAX(CASE WHEN n.PYF_PAY_DET_CD = 'WE' THEN n.PYF_ITW_ADD END), 0
        )), 999) *
        SIGN(COALESCE(MAX(CASE WHEN n.PYF_PAY_DET_CD = 'WE' THEN n.PYF_ITW_ADD END), 0)),

        -- ST_TAX_MAR_STAT: from WE pay detail
        MAX(CASE WHEN n.PYF_PAY_DET_CD = 'WE' THEN n.PYF_ITW_MS END),

        -- FED_TAX_MAR_STAT: from WD pay detail
        MAX(CASE WHEN n.PYF_PAY_DET_CD = 'WD' THEN n.PYF_ITW_MS END),

        -- FED_TAX_EXEMP: exemption count from WD
        MAX(CASE WHEN n.PYF_PAY_DET_CD = 'WD' THEN n.PYF_DDU_PYE END),

        -- ST_TAX_EXEMP: exemption count from WE
        MAX(CASE WHEN n.PYF_PAY_DET_CD = 'WE' THEN n.PYF_DDU_PYE END),

        -- PAY_CYCLE_IND
        MAX(n.PAY_CYCLE_IND),

        CURRENT_TIMESTAMP(),
        CURRENT_DATE(),
        'CPM_DETAIL_LOAD'
    FROM CPM_NEWPAY_TBL n
    WHERE n.PP_END_YEAR = :P_PP_END_YEAR
      AND n.PP_NUM = :P_PP_NUM
    GROUP BY n.PP_END_YEAR, n.PP_NUM, n.DFAS_PSEUDO_SSN;

    RETURN 'NEWPAY STG DETAIL load complete';
END;
$$;
