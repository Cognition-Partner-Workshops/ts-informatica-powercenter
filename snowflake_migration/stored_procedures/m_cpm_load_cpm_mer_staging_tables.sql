-- =============================================================================
-- Stored Procedure: SP_CPM_LOAD_CPM_MER_STAGING_TABLES
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Load_CPM_MER_Staging_Tables
-- Source tables: MER_FILE
-- Target tables: CPM_MER_DETAIL_STG_TBL, CPM_MER_HEADER_STG_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_CPM_MER_STAGING_TABLES(
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
    -- exp_Final_MER_Detail (Expression)
    -- lkp_Current_Pay_Period (Lookup Procedure)
    -- lkp_Pay_Period_Record_Date (Lookup Procedure)
    -- exp_Final_MER_Header (Expression)
    -- exp_Convert (Expression)
    -- exp_Verify_Header_Date (Expression)
    -- exp_Initial (Expression)
    -- rtr_MER_Records (Router)
    -- Norm_MER_FILE (Normalizer)

    -- ========================================
    -- Load target: CPM_MER_DETAIL_STG_TBL
    -- ========================================
    INSERT INTO CPM_MER_DETAIL_STG_TBL (
        PP_END_YEAR, PP_NUM, MER_RECTYP, MER_SSN, MER_EMP_ACTVTY, MER_ORG, MER_EMPTYPCD, MER_ACTION_NATURE_CD, MER_TEMP_PROM_NTE_DT, MER_TEMP_DTL_NTE_DT
        -- ... and 85 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        MER_RECTYP,
        MER_SSN,
        MER_EMP_ACTVTY,
        MER_ORG,
        MER_EMPTYPCD,
        MER_ACTION_NATURE_CD,
        MER_TEMP_PROM_NTE_DT,
        MER_TEMP_DTL_NTE_DT,
        MER_PAY_BASIS_CD,
        MER_PREM_PAY_IND,
        MER_PREM_HRLY_RT,
        MER_ANUITNT_IND,
        MER_ANUITNT_DIFF_HRLY_RT,
        -- ... and 80 more expressions
    FROM MER_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    WHERE /* Router group: MER_DETAIL */ MER_RECTYP1 = '3'
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_MER_HEADER_STG_TBL
    -- ========================================
    INSERT INTO CPM_MER_HEADER_STG_TBL (
        PP_END_YEAR, PP_NUM, RECORD_TYPE, RECORD_DATE, FILE_ID, PAYROLL_OFFICE_ID_CODE, REPORT_RECIPIENT
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        RECORD_TYPE,
        RECORD_DATE,
        FILE_ID,
        PAYROLL_OFFICE_ID_CODE,
        REPORT_RECIPIENT
    FROM MER_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    WHERE /* Router group: MER_HEADER */ MER_RECTYP1 = '1'
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_LOAD_CPM_MER_STAGING_TABLES completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
