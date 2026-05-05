-- =============================================================================
-- Stored Procedure: SP_CPM_LOAD_CPM_PMR_STAGING_TABLES
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Load_CPM_PMR_Staging_Tables
-- Source tables: PAYMASTER_FILE
-- Target tables: CPM_PM1_STG_TBL, CPM_PMH_STG_TBL, CPM_PM2_STG_TBL, CPM_PM3_STG_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_CPM_PMR_STAGING_TABLES(
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
    -- exp_Final_Paymaster_3 (Expression)
    -- exp_Final_Paymaster_2 (Expression)
    -- exp_Final_Paymaster_1 (Expression)
    -- lkp_Pay_Period_Record_Date (Lookup Procedure)
    -- exp_Initial (Expression)
    -- exp_Stage (Expression)
    -- exp_Final_Paymaster_Header (Expression)
    -- lkp_Current_Pay_Period (Lookup Procedure)
    -- Norm_PAYMASTER_FILE (Normalizer)
    -- exp_Determine_Record_Type (Expression)
    -- rtr_Paymaster_Records (Router)

    -- ========================================
    -- Load target: CPM_PM1_STG_TBL
    -- ========================================
    INSERT INTO CPM_PM1_STG_TBL (
        PYF_GR_CIV, PYF_PAY_RAT_STP, PYF_SRY_BSE_ANL, PYF_SRY_HR, PYF_ADR_STR_1, PYF_ADR_STR_2, PYF_ADR_CITY, PYF_ADR_ST, PYF_ADR_ZIP, PYF_WALK_SEQ
        -- ... and 27 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        PYF_GR_CIV,
        PYF_PAY_RAT_STP,
        PYF_SRY_BSE_ANL,
        PYF_SRY_HR,
        PYF_ADR_STR_1,
        PYF_ADR_STR_2,
        PYF_ADR_CITY,
        PYF_ADR_ST,
        PYF_ADR_ZIP,
        PYF_WALK_SEQ,
        PYF_CHK_CODE,
        PYF_FILLER_RT1,
        PYF_SEC_DISB_OFC_RT1,
        0 AS PYF_HIS_PGRANGE_RT1,
        PYF_DISB_OFC_RT1,
        -- ... and 22 more expressions
    FROM PAYMASTER_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_PMH_STG_TBL
    -- ========================================
    INSERT INTO CPM_PMH_STG_TBL (
        PP_END_YEAR, PP_NUM, PYF_REC_PPE_DATE
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        PYF_REC_PPE_DATE
    FROM PAYMASTER_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_PM2_STG_TBL
    -- ========================================
    INSERT INTO CPM_PM2_STG_TBL (
        PP_END_YEAR, PP_NUM, PYF_REC_NO_2, PYF_EYE_ID_2, PYF_PAY_BLK_2, PYF_AGY_CD, PYF_SON, PYF_ACTG_ACT, PYF_MAJOR_CLAIMANT, PYF_FIN_ORG_ACCT_NO
        -- ... and 33 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        PYF_REC_NO_2,
        PYF_EYE_ID_2,
        PYF_PAY_BLK_2,
        PYF_AGY_CD,
        PYF_SON,
        PYF_ACTG_ACT,
        PYF_MAJOR_CLAIMANT,
        PYF_FIN_ORG_ACCT_NO,
        PYF_FIN_ORG_ACCT_TYP,
        PYF_TSP_SVC_CMP_DATE,
        PYF_TSP_VEST_CD,
        PYF_TSP_STA_DATE,
        PYF_TSP_STA_CD,
        -- ... and 28 more expressions
    FROM PAYMASTER_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_PM3_STG_TBL
    -- ========================================
    INSERT INTO CPM_PM3_STG_TBL (
        PYF_MPH_PGRANGE_RT3, PYF_GEN_SEQ_ID, PP_END_YEAR, PP_NUM, PYF_REC_NO_PDT3, PYF_EYE_ID_PDT3, PYF_PAY_BLK_PDT3, PYF_PAY_TAC_TYP, PYF_DATE_EFF, PYF_PAY_DET_CD
        -- ... and 30 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        PYF_MPH_PGRANGE_RT3,
        v_SEQ_ID AS PYF_GEN_SEQ_ID,
        PP_END_YEAR,
        PP_NUM,
        PYF_REC_NO_PDT3,
        PYF_EYE_ID_PDT3,
        PYF_PAY_BLK_PDT3,
        PYF_PAY_TAC_TYP,
        PYF_DATE_EFF,
        PYF_PAY_DET_CD,
        PYF_OT_ENV_IDC,
        PYF_HRS_SCD_AMT,
        PYF_ACTUAL_AMT,
        PYF_PAY_RAT,
        PYF_CASH_PMT_AMT,
        -- ... and 25 more expressions
    FROM PAYMASTER_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_LOAD_CPM_PMR_STAGING_TABLES completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
