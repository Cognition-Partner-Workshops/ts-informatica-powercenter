-- =============================================================================
-- Stored Procedure: SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL
-- Source tables: CPM_PM3_STG_TBL
-- Target tables: ERROR_TBL, CPM_NEWPAY_STG_ALT_TBL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL(
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
    -- fil_Error_Message (Filter)
    -- fil_Bad_Records (Filter)
    -- nrm_Errors (Normalizer)
    -- exp_Final_Errors (Expression)
    -- SQ_CPM_PM3_STG_TBL (Source Qualifier)
    -- exp_Initial (Expression)
    -- exp_Final (Expression)
    -- exp_Determine_Allotments (Expression)
    -- agg_Allotments (Aggregator)
    -- exp_Convert (Expression)
    -- exp_Stage_Converted_Fields (Expression)
    -- lkp_PSEUDOSSN_TBL (Lookup Procedure)

    -- ========================================
    -- Load target: ERROR_TBL
    -- ========================================
    INSERT INTO ERROR_TBL (
        PROCESS_NAME, ERROR_MESSAGE, SOURCE_KEY, PP_END_YEAR, PP_NUM, ERROR_DATE
    )
    SELECT
        PROCESS_NAME,
        ERROR_MESSAGE,
        SOURCE_KEY,
        PP_END_YEAR,
        PP_NUM,
        SESSSTARTTIME AS ERROR_DATE
    FROM CPM_PM3_STG_TBL
    WHERE /* Filter: fil_Error_Message */ NOT ISNULL(ERROR_MESSAGE) AND /* Filter: fil_Bad_Records */ ERROR_FLAG = TRUE
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_NEWPAY_STG_ALT_TBL
    -- ========================================
    INSERT INTO CPM_NEWPAY_STG_ALT_TBL (
        ALT_6_ROUTE_DIGIT, CPP_ALT_6_DED, ALT_6_EE_ACCT_NO, ALT_6_ACCT_TYPE, ALT_7_ROUTE_ID, ALT_7_ROUTE_DIGIT, CPP_ALT_7_DED, ALT_7_EE_ACCT_NO, ALT_7_ACCT_TYPE, ALT_8_ROUTE_ID
        -- ... and 36 more columns
        -- (full column list omitted for brevity; see DDL for complete schema)
    )
    SELECT
        ALT_6_ROUTE_DIGIT,
        CPP_ALT_6_DED,
        ALT_6_EE_ACCT_NO,
        ALT_6_ACCT_TYPE,
        ALT_7_ROUTE_ID,
        ALT_7_ROUTE_DIGIT,
        CPP_ALT_7_DED,
        ALT_7_EE_ACCT_NO,
        ALT_7_ACCT_TYPE,
        ALT_8_ROUTE_ID,
        ALT_8_ROUTE_DIGIT,
        CPP_ALT_8_DED,
        ALT_8_EE_ACCT_NO,
        ALT_8_ACCT_TYPE,
        ALT_2_INST_ACCT_NO,
        -- ... and 31 more expressions
    FROM CPM_PM3_STG_TBL
    WHERE /* Filter: fil_Error_Message */ NOT ISNULL(ERROR_MESSAGE) AND /* Filter: fil_Bad_Records */ ERROR_FLAG = TRUE
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
