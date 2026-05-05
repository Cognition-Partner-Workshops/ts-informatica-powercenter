-- =============================================================================
-- Stored Procedure: SP_CPM_LOAD_CPM_YTD_STAGING_TABLES
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Load_CPM_YTD_Staging_Tables
-- Source tables: YTD_FILE
-- Target tables: CPM_YTD_DETAIL_STG_TBL, CPM_YTD_HEADER_STG_TBL, CPM_YTD_STATE_STG_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_CPM_YTD_STAGING_TABLES(
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
    -- exp_Final_YTD_Detail (Expression)
    -- lkp_Current_Pay_Period (Lookup Procedure)
    -- lkp_Pay_Period_Record_Date (Lookup Procedure)
    -- exp_Convert (Expression)
    -- exp_Final_YTD_Header (Expression)
    -- exp_Verify_Header_Date (Expression)
    -- Norm_YTD_FILE (Normalizer)
    -- rtr_YTD_Records (Router)
    -- exp_Initial (Expression)
    -- exp_Final_YTD_State (Expression)

    -- ========================================
    -- Load target: CPM_YTD_DETAIL_STG_TBL
    -- ========================================
    INSERT INTO CPM_YTD_DETAIL_STG_TBL (
        PP_END_YEAR, PP_NUM, RECORD_TYPE, DYD_SSN_1, DYD_NAME, DYD_ORGANIZATION, DYD_ACTIVITY, DYD_BASE_PAY, DYD_ADD_BASE_PAY, DYD_OVERTIME_PAY
        -- ... and 96 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        RECORD_TYPE,
        DYD_SSN_1,
        DYD_NAME,
        DYD_ORGANIZATION,
        DYD_ACTIVITY,
        DYD_BASE_PAY,
        DYD_ADD_BASE_PAY,
        DYD_OVERTIME_PAY,
        DYD_NIGHT_DIFF_PAY,
        DYD_SUN_PREM_PAY,
        DYD_HOL_PREM_PAY,
        DYD_POST_DIFF_PAY,
        DYD_FOREIGN_ALLOW,
        -- ... and 91 more expressions
    FROM YTD_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    WHERE /* Router group: YTD_DETAIL */ DFAS_YTD_RECORD_TYPE1 = '1'
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_YTD_HEADER_STG_TBL
    -- ========================================
    INSERT INTO CPM_YTD_HEADER_STG_TBL (
        PP_END_YEAR, PP_NUM, RECORD_TYPE, DFAS_YTD_FILE_NAME, DFAS_YTD_DB_NAME, DFAS_YTD_PPEND_DATE, DFAS_YTD_DATE_OF_FILE
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        RECORD_TYPE,
        DFAS_YTD_FILE_NAME,
        DFAS_YTD_DB_NAME,
        DFAS_YTD_PPEND_DATE,
        DFAS_YTD_DATE_OF_FILE
    FROM YTD_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    WHERE /* Router group: YTD_HEADER */ DFAS_YTD_RECORD_TYPE1 = '0'
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_YTD_STATE_STG_TBL
    -- ========================================
    INSERT INTO CPM_YTD_STATE_STG_TBL (
        PP_END_YEAR, PP_NUM, RECORD_TYPE, GEN_SEQ_ID, DYD_SSN_2, DYD_STATE_TAX_CODE, DYD_STATE_TAX_DEDUC, DYD_PAY_SUB_STATE_TAX
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        RECORD_TYPE,
        v_SEQ_ID AS GEN_SEQ_ID,
        DYD_SSN_2,
        DYD_STATE_TAX_CODE,
        DYD_STATE_TAX_DEDUC,
        DYD_PAY_SUB_STATE_TAX
    FROM YTD_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    WHERE /* Router group: YTD_STATE */ DFAS_YTD_RECORD_TYPE1 = '2'
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_LOAD_CPM_YTD_STAGING_TABLES completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
