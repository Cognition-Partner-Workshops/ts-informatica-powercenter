-- =============================================================================
-- Stored Procedure: SP_CPM_CURRENT_PAY_PERIOD
-- Migrated from Informatica PowerCenter Mapping: m_CPM_Current_Pay_Period
-- Source tables: PAY_PERIOD
-- Target tables: CPM_PAY_PERIOD_DATE_FILE
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_CPM_CURRENT_PAY_PERIOD(
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
    -- SQ_PAY_PERIOD (Source Qualifier)
    -- exp_Build_Pay_Period (Expression)
    -- exp_Final (Expression)

    -- ========================================
    -- Load target: CPM_PAY_PERIOD_DATE_FILE
    -- ========================================
    INSERT INTO CPM_PAY_PERIOD_DATE_FILE (
        PAY_PERIOD_TXT
    )
    SELECT
        TO_CHAR(PP_END_YEAR) || LPAD(TO_CHAR(PP_NUM), 2, '0') AS PAY_PERIOD_TXT
    FROM PAY_PERIOD
    WHERE CURR_PP_FLAG = 'Y'
    ;

    v_row_count := v_row_count + SQLROWCOUNT;

    RETURN 'Procedure SP_CPM_CURRENT_PAY_PERIOD completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
