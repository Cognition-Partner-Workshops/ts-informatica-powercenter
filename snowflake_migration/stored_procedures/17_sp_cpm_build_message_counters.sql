-- =============================================================================
-- SP_CPM_BUILD_MESSAGE_COUNTERS
-- Reimplements: m_CPM_Build_Message_Counters
--
-- THE REPORTING MAPPING: 26 transforms, generates summary counts
--
-- Flow: Multiple sources joined via 3 Full Outer Joins
--   - Input counts:  CPM_NEWPAY_TBL aggregated
--   - CPM counts:    CPM_NEWPAY_STG_TYPE_3_TBL + TYPE_1_2 + Lookups
--   - Error counts:  ERROR_TBL aggregated
--   - Multi-pay:     Multiple pay line detection
--   -> exp_Build_Message -> exp_Final_Message -> CPM_MESSAGE_FILE + COUNTER_TBL
--
-- Lookups: PSEUDOSSN_TBL, CPM_MER_DETAIL, CPM_PAD_DETAIL, CPM_YTD_DETAIL
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_BUILD_MESSAGE_COUNTERS(
    P_PP_END_YEAR   NUMBER,
    P_PP_NUM        NUMBER
)
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_input_count       NUMBER;
    v_cpm_count         NUMBER;
    v_error_count       NUMBER;
    v_multi_pay_count   NUMBER;
    v_ytd_count         NUMBER;
    v_mer_count         NUMBER;
    v_pad_count         NUMBER;
    v_pseudo_count      NUMBER;
    v_message           VARCHAR;
BEGIN
    -- Count input records from CPM_NEWPAY_TBL
    -- Mirrors: agg_Count_Inputs
    SELECT COUNT(DISTINCT DFAS_PSEUDO_SSN)
    INTO v_input_count
    FROM CPM_NEWPAY_TBL
    WHERE PP_END_YEAR = :P_PP_END_YEAR AND PP_NUM = :P_PP_NUM;

    -- Count CPM output records from staging tables
    -- Mirrors: agg_Count_CPM (counts from TYPE_3 + TYPE_1_2)
    SELECT COUNT(DISTINCT DFAS_PSEUDO_SSN)
    INTO v_cpm_count
    FROM CPM_NEWPAY_STG_TYPE_3_TBL
    WHERE PP_END_YEAR = :P_PP_END_YEAR AND PP_NUM = :P_PP_NUM;

    -- Count error records
    -- Mirrors: agg_Count_Errors
    SELECT COUNT(*)
    INTO v_error_count
    FROM ERROR_TBL
    WHERE PP_END_YEAR = :P_PP_END_YEAR AND PP_NUM = :P_PP_NUM;

    -- Count employees with multiple pay lines
    -- Mirrors: agg_Multiple_Pay_Lines
    SELECT COUNT(*)
    INTO v_multi_pay_count
    FROM (
        SELECT DFAS_PSEUDO_SSN
        FROM CPM_NEWPAY_TBL
        WHERE PP_END_YEAR = :P_PP_END_YEAR AND PP_NUM = :P_PP_NUM
        GROUP BY DFAS_PSEUDO_SSN
        HAVING COUNT(*) > 1
    );

    -- Lookup counts for validation
    SELECT COUNT(DISTINCT DYD_SSN_1) INTO v_ytd_count
    FROM CPM_YTD_DETAIL_STG_TBL
    WHERE PP_END_YEAR = :P_PP_END_YEAR AND PP_NUM = :P_PP_NUM;

    SELECT COUNT(DISTINCT MER_SSN) INTO v_mer_count
    FROM CPM_MER_DETAIL_STG_TBL
    WHERE PP_END_YEAR = :P_PP_END_YEAR AND PP_NUM = :P_PP_NUM;

    SELECT COUNT(DISTINCT PAD_SOC_SEC_NO) INTO v_pad_count
    FROM CPM_PAD_DETAIL_STG_TBL
    WHERE PP_END_YEAR = :P_PP_END_YEAR AND PP_NUM = :P_PP_NUM;

    SELECT COUNT(DISTINCT PSEUDOSSN) INTO v_pseudo_count
    FROM PSEUDOSSN_TBL;

    -- Build summary message
    -- Mirrors: exp_Build_Message and exp_Counters
    v_message := 'CPM Processing Summary for PP ' || TO_CHAR(:P_PP_END_YEAR) || '-' || TO_CHAR(:P_PP_NUM) ||
                 ' | Input SSNs: ' || TO_CHAR(v_input_count) ||
                 ' | CPM Output SSNs: ' || TO_CHAR(v_cpm_count) ||
                 ' | Errors: ' || TO_CHAR(v_error_count) ||
                 ' | Multiple Pay Lines: ' || TO_CHAR(v_multi_pay_count) ||
                 ' | YTD Records: ' || TO_CHAR(v_ytd_count) ||
                 ' | MER Records: ' || TO_CHAR(v_mer_count) ||
                 ' | PAD Records: ' || TO_CHAR(v_pad_count) ||
                 ' | PSEUDO SSNs: ' || TO_CHAR(v_pseudo_count);

    -- Write to message file target
    INSERT INTO CPM_MESSAGE_FILE (MESSAGE_LINE, MESSAGE_DATE)
    VALUES (:v_message, CURRENT_TIMESTAMP());

    -- Write to counter table target (one row per counter type per DDL schema)
    INSERT INTO COUNTER_TBL (RUN_DATE, PROCESS_NAME, COUNTER_DESCRIPTION, COUNTER_VALUE, PP_END_YEAR, PP_NUM)
    VALUES (CURRENT_DATE(), 'SP_CPM_BUILD_MESSAGE_COUNTERS', 'Input SSN Count', :v_input_count, :P_PP_END_YEAR, :P_PP_NUM);

    INSERT INTO COUNTER_TBL (RUN_DATE, PROCESS_NAME, COUNTER_DESCRIPTION, COUNTER_VALUE, PP_END_YEAR, PP_NUM)
    VALUES (CURRENT_DATE(), 'SP_CPM_BUILD_MESSAGE_COUNTERS', 'CPM Output SSN Count', :v_cpm_count, :P_PP_END_YEAR, :P_PP_NUM);

    INSERT INTO COUNTER_TBL (RUN_DATE, PROCESS_NAME, COUNTER_DESCRIPTION, COUNTER_VALUE, PP_END_YEAR, PP_NUM)
    VALUES (CURRENT_DATE(), 'SP_CPM_BUILD_MESSAGE_COUNTERS', 'Error Count', :v_error_count, :P_PP_END_YEAR, :P_PP_NUM);

    INSERT INTO COUNTER_TBL (RUN_DATE, PROCESS_NAME, COUNTER_DESCRIPTION, COUNTER_VALUE, PP_END_YEAR, PP_NUM)
    VALUES (CURRENT_DATE(), 'SP_CPM_BUILD_MESSAGE_COUNTERS', 'Multiple Pay Line Count', :v_multi_pay_count, :P_PP_END_YEAR, :P_PP_NUM);

    RETURN v_message;
END;
$$;
