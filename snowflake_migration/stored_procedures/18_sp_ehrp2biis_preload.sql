-- =============================================================================
-- SP_EHRP2BIIS_PRELOAD
-- Converts: ehrp2biis_preload (KornShell + Oracle SQL*Plus script)
--
-- Original: Shell script that calls SQL*Plus to execute step01 SQL script
--   against the Oracle BIIS database. The step01 script performs initial
--   data ingestion from EHRP to BIIS staging tables.
--
-- Oracle patterns converted:
--   - TRUNC(SYSDATE)         -> CURRENT_DATE()
--   - SQLPLUS '/nolog'       -> Snowflake stored procedure (no connect needed)
--   - SPOOL                  -> Snowflake query history / logging
--   - SET SERVEROUTPUT ON    -> RETURN value from procedure
--   - Shell error detection  -> Snowflake EXCEPTION handling
--   - mailx notifications    -> Can integrate with Snowflake notifications
-- =============================================================================

CREATE OR REPLACE PROCEDURE SP_EHRP2BIIS_PRELOAD()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    v_start_ts  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP();
    v_log       VARCHAR DEFAULT '';
    v_err_flag  BOOLEAN DEFAULT FALSE;
BEGIN
    v_log := 'EHRP2BIIS Preload started at ' || TO_CHAR(v_start_ts) || '. ';

    -- =========================================================================
    -- The original step01 script performs the initial staging load.
    -- In the Snowflake migration, this is replaced by the flat-file
    -- COPY INTO operations and the main ETL orchestration procedure.
    --
    -- Original Oracle flow:
    --   1. Connect to Oracle via SQL*Plus
    --   2. Execute step01 SQL (staging table loads)
    --   3. Check for errors in spool log
    --   4. Send email notification via mailx
    --
    -- Snowflake equivalent:
    --   1. Load flat files via COPY INTO (from stages)
    --   2. Execute SP_CPM_ETL_MAIN for transformation logic
    --   3. Errors captured in ERROR_TBL and procedure return values
    --   4. Notifications via Snowflake alerts or external integration
    -- =========================================================================

    -- Truncate staging tables before load (idempotent reload)
    TRUNCATE TABLE IF EXISTS CPM_YTD_HEADER_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_YTD_DETAIL_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_YTD_STATE_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_MER_HEADER_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_MER_DETAIL_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_PMH_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_PM1_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_PM2_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_PM3_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_PAD_HEADER_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_PAD_DETAIL_STG_TBL;
    TRUNCATE TABLE IF EXISTS CPM_NEWPAY_STG_ALT_TBL;
    TRUNCATE TABLE IF EXISTS CPM_NEWPAY_STG_YTD_STATE_TBL;
    TRUNCATE TABLE IF EXISTS CPM_NEWPAY_STG_DETAIL_TBL;
    TRUNCATE TABLE IF EXISTS CPM_NEWPAY_STG_TYPE_1_2_TBL;
    TRUNCATE TABLE IF EXISTS CPM_NEWPAY_STG_TYPE_3_TBL;
    TRUNCATE TABLE IF EXISTS CPM_NEWPAY_STG_TYPE_3_FDR_TBL;

    v_log := v_log || 'Staging tables truncated. ';

    -- Clear error table for this run
    DELETE FROM ERROR_TBL WHERE ERROR_DATE = CURRENT_DATE();

    v_log := v_log || 'Error table cleared. ';

    -- Load flat files from stages
    -- These replace the Informatica source qualifiers reading from the filesystem
    COPY INTO RAW_YTD_FILE FROM @CPM_FLAT_FILE_STAGE/PC_DOEYTD_RDF.TXT
        FILE_FORMAT = FF_YTD_FILE ON_ERROR = 'CONTINUE';
    COPY INTO RAW_MER_FILE FROM @CPM_FLAT_FILE_STAGE/PC_DOEMER_RDF.TXT
        FILE_FORMAT = FF_MER_FILE ON_ERROR = 'CONTINUE';
    COPY INTO RAW_PAYMASTER_FILE FROM @CPM_FLAT_FILE_STAGE/PC_DOE_EXP_PMR_RDF.TXT
        FILE_FORMAT = FF_PAYMASTER_FILE ON_ERROR = 'CONTINUE';
    COPY INTO RAW_PAYMASTER_THREE FROM @CPM_FLAT_FILE_STAGE/PC_DOE_EXP_PMR3.TXT
        FILE_FORMAT = FF_PAYMASTER_THREE ON_ERROR = 'CONTINUE';
    COPY INTO RAW_PAD_FILE FROM @CPM_FLAT_FILE_STAGE/PC_DOEPAD_RDF.TXT
        FILE_FORMAT = FF_PAD_FILE ON_ERROR = 'CONTINUE';

    v_log := v_log || 'Flat files loaded. ';

    v_log := v_log || 'Preload completed at ' || TO_CHAR(CURRENT_TIMESTAMP()) ||
             '. Duration: ' || DATEDIFF('second', v_start_ts, CURRENT_TIMESTAMP()) || 's.';

    RETURN v_log;

EXCEPTION
    WHEN OTHER THEN
        RETURN 'EHRP2BIIS Preload FAILED: ' || SQLERRM;
END;
$$;
