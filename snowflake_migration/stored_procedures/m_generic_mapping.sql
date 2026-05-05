-- =============================================================================
-- Stored Procedure: SP_GENERIC_MAPPING
-- Migrated from Informatica PowerCenter Mapping: m_Generic_Mapping
-- Source tables: HI_GENERIC_SRC_TBL
-- Target tables: GENERIC_TARGET_FILE
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_GENERIC_MAPPING(
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
    -- SQ_HI_GENERIC_SRC_TBL (Source Qualifier)

    RETURN 'Procedure SP_GENERIC_MAPPING completed. Rows affected: ' || v_row_count::VARCHAR;
END;
$$;
