-- =============================================================================
-- Stored Procedure: SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL
-- Source tables: CPM_PM3_STG_TBL
-- Target tables: CPM_NEWPAY_STG_TYPE_3_FDR_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL(
    P_PP_END_YEAR NUMBER DEFAULT NULL,
    P_PP_NUM NUMBER DEFAULT NULL
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_row_count INTEGER DEFAULT 0;
    v_error_count INTEGER DEFAULT 0;
    v_start_ts TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP();
    v_MAP_PP_END_YEAR NUMBER DEFAULT P_PP_END_YEAR;
    v_MAP_PP_NUM NUMBER DEFAULT P_PP_NUM;
BEGIN

    -- ========================================
    -- Transformation Chain Overview
    -- ========================================
    -- exp_Initial (Expression)
    -- agg_PYF_EYE_ID_PP_NUM (Aggregator)
    -- exp_Final (Expression)
    -- lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL (Lookup Procedure)
    -- SQ_CPM_PM3_STG_TBL (Source Qualifier)
    -- exp_Format_Fields (Expression)
    -- lkp_CPM_NEWPAY_STG_ALT_TBL (Lookup Procedure)
    -- exp_GEN_SEQ_NUMBER (Expression)
    -- exp_Double_T38_SUN_DIF_HRS_CPP (Expression)
    -- exp_Set_REEMP_ANN_CDE (Expression)

    -- ========================================
    -- Load target: CPM_NEWPAY_STG_TYPE_3_FDR_TBL
    -- ========================================
    INSERT INTO CPM_NEWPAY_STG_TYPE_3_FDR_TBL (
        ADJ_OTHER_PAY, CPP_PD_PAY, ADJ_PD_PAY, CPP_COLA_PAY, ADJ_COLA_PAY, CPP_UNIF_ALLOW, ADJ_UNIF_ALLOW, CPP_SEV_PAY, ADJ_SEV_PAY, CPP_PAY_NS_FWIT
        -- ... and 236 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        ADJ_OTHER_PAY,
        CPP_PD_PAY,
        ADJ_PD_PAY,
        CPP_COLA_PAY,
        ADJ_COLA_PAY,
        CPP_UNIF_ALLOW,
        ADJ_UNIF_ALLOW,
        CPP_SEV_PAY,
        ADJ_SEV_PAY,
        CPP_PAY_NS_FWIT,
        ADJ_PAY_NS_FWIT,
        CPP_PAY_S_FEDTX,
        CPP_CSR_DED,
        ADJ_CSR_DED,
        CPP_CSR_EMPLR,
        -- ... and 231 more expressions
    FROM CPM_PM3_STG_TBL
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
