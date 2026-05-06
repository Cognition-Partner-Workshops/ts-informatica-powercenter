-- =============================================================================
-- Stored Procedure: SP_CPM_LOAD_CPM_PAD_STAGING_TABLES
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Load_CPM_PAD_Staging_Tables
-- Source tables: PAD_FILE
-- Target tables: CPM_PAD_DETAIL_STG_TBL, CPM_PAD_HEADER_STG_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_CPM_PAD_STAGING_TABLES(
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
    -- exp_Final_PAD_Detail (Expression)
    -- lkp_Current_Pay_Period (Lookup Procedure)
    -- lkp_Pay_Period_Record_Date (Lookup Procedure)
    -- exp_Final_PAD_Header (Expression)
    -- exp_Convert (Expression)
    -- exp_Verify_Header_Date (Expression)
    -- Norm_PAD_FILE (Normalizer)
    -- exp_Determine_Record_Type (Expression)
    -- rtr_PAD_Records (Router)

    -- ========================================
    -- Load target: CPM_PAD_DETAIL_STG_TBL
    -- ========================================
    INSERT INTO CPM_PAD_DETAIL_STG_TBL (
        PP_END_YEAR, PP_NUM, PAD_SERVING_AGENCY, PAD_CCPO_ID, PAD_SOC_SEC_NO, PAD_RESP_CTR_COST_CTR, PAD_REGULAR_EARNINGS, PAD_OVERTIME_EARNINGS, PAD_HOLIDAY_PREMIUM_PAY, PAD_STNDBY_UNCO_AVAIL_PAY
        -- ... and 140 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        PAD_SERVING_AGENCY,
        PAD_CCPO_ID,
        PAD_SOC_SEC_NO,
        PAD_RESP_CTR_COST_CTR,
        PAD_REGULAR_EARNINGS,
        PAD_OVERTIME_EARNINGS,
        PAD_HOLIDAY_PREMIUM_PAY,
        PAD_STNDBY_UNCO_AVAIL_PAY,
        PAD_SUNDAY_PREMIUM_PAY,
        PAD_NIGHT_DIFFERENTIAL_PAY,
        PAD_LUMP_SUM_LEAVE_PAY,
        PAD_HAZARDOUS_DUTY_PAY,
        PAD_ENVIRONMENTAL_PAY,
        -- ... and 135 more expressions
    FROM PAD_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    WHERE /* Router group: PAD_DETAIL */ RECORD_TYPE = 'D'
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_PAD_HEADER_STG_TBL
    -- ========================================
    INSERT INTO CPM_PAD_HEADER_STG_TBL (
        PP_END_YEAR, PP_NUM, PAD_RECORD_TYPE, PAD_PAYROLL_OFFICE_ID_CODE, PAD_FILE_ID, PAD_PP_END_DTE, PAD_DISBURSING_DTE, PAD_QTR_END_DTE
    )
    SELECT
        PP_END_YEAR,
        PP_NUM,
        PAD_RECORD_TYPE,
        PAD_PAYROLL_OFFICE_ID_CODE,
        PAD_FILE_ID,
        PAD_PP_END_DTE,
        PAD_DISBURSING_DTE,
        PAD_QTR_END_DTE
    FROM PAD_FILE
        LEFT JOIN PAY_PERIOD /* lookup: lkp_Pay_Period_Record_Date */
            ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE
    WHERE /* Router group: PAD_HEADER */ RECORD_TYPE = 'H'
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_LOAD_CPM_PAD_STAGING_TABLES completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
