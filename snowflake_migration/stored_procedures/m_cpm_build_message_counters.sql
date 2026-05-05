-- =============================================================================
-- Stored Procedure: SP_CPM_BUILD_MESSAGE_COUNTERS
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Build_Message_Counters
-- Source tables: CPM_NEWPAY_TBL, ERROR_TBL, PAYMASTER_THREE_RAW, CPM_NEWPAY_TBL
-- Target tables: COUNTER_TBL, CPM_MESSAGE_FILE
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_BUILD_MESSAGE_COUNTERS(
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
    -- nrm_Counters_Message (Normalizer)
    -- exp_Final_Message (Expression)
    -- exp_Build_Message (Expression)
    -- lkp_PSEUDOSSN_TBL (Lookup Procedure)
    -- lkp_CPM_MER_DETAIL_STG_TBL (Lookup Procedure)
    -- lkp_CPM_PAD_DETAIL_STG_TBL (Lookup Procedure)
    -- SQ_CPM_NEWPAY_TBL (Source Qualifier)
    -- SQ_ERROR_TBL (Source Qualifier)
    -- exp_Initial_Input (Expression)
    -- exp_Initial_CPM (Expression)
    -- exp_Initial_Errors (Expression)
    -- jnr_Inputs_CPM (Joiner)
    -- agg_Count_Inputs (Aggregator)
    -- agg_Count_CPM (Aggregator)
    -- exp_Stage_CPM (Expression)
    -- agg_Count_Errors (Aggregator)
    -- jnr_Inputs_CPM_Errors (Joiner)
    -- nrm_Counters (Normalizer)
    -- exp_Counters (Expression)
    -- exp_Final_Counters (Expression)
    -- lkp_CPM_YTD_DETAIL_STG_TBL (Lookup Procedure)
    -- Norm_PAYMASTER_THREE (Normalizer)
    -- SQ_CPM_NEWPAY_TBL1 (Source Qualifier)
    -- exp_Initial_Multiple_Pay_Lines (Expression)
    -- jnr_Inputs_CPM_Errors_Pay_Lines (Joiner)
    -- agg_Multiple_Pay_Lines (Aggregator)

    -- ========================================
    -- Load target: COUNTER_TBL
    -- ========================================
    INSERT INTO COUNTER_TBL (
        COUNTER_DESCRIPTION, COUNTER_VALUE, PP_END_YEAR, PP_NUM, RUN_DATE, PROCESS_NAME
    )
    SELECT
        COUNTER_DESCRIPTION,
        COUNTER_VALUE,
        PP_END_YEAR,
        PP_NUM,
        v_start_ts AS RUN_DATE,
        'SP_CPM_BUILD_MESSAGE_COUNTERS' AS PROCESS_NAME
    FROM CPM_NEWPAY_TBL, ERROR_TBL, PAYMASTER_THREE_RAW
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    -- ========================================
    -- Load target: CPM_MESSAGE_FILE
    -- ========================================
    INSERT INTO CPM_MESSAGE_FILE (
        COUNT_VALUE, COUNT_DESC
    )
    SELECT
        COUNT_VALUE,
        COUNT_DESC
    FROM CPM_NEWPAY_TBL, ERROR_TBL, PAYMASTER_THREE_RAW
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_BUILD_MESSAGE_COUNTERS completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
