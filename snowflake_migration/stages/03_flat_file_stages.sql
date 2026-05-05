-- =============================================================================
-- Snowflake Stages & COPY INTO: CPM Flat-File Sources (VSAM/CSV)
-- Migrated from Informatica PowerCenter CPM mapping
-- =============================================================================

USE SCHEMA CPM;

-- =============================================================================
-- Stage Definition: External stage for VSAM/CSV flat files
-- In the original Informatica workflow, these files were read from the
-- local filesystem (e.g., PC_DOEYTD_RDF.TXT, PC_DOEMER_RDF.TXT).
-- In Snowflake, we stage them via S3/Azure/GCS then COPY INTO.
-- =============================================================================

CREATE STAGE IF NOT EXISTS CPM_FLAT_FILE_STAGE
    URL = 's3://your-bucket/cpm-flat-files/'   -- Replace with actual bucket path
    STORAGE_INTEGRATION = your_storage_integration  -- Replace with actual integration
    FILE_FORMAT = (
        TYPE = 'CSV'
        FIELD_OPTIONALLY_ENCLOSED_BY = '"'
        SKIP_HEADER = 0
        TRIM_SPACE = FALSE
        NULL_IF = ('')
    );

-- -----------------------------------------------------------------------
-- Flat File: YTD_FILE (original: PC_DOEYTD_RDF.TXT)
-- Original format: FIXED-WIDTH | VSAM | IBM Comp: N/A
-- -----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STG_YTD_FILE (
    DFAS_YTD_HEADER                          VARCHAR(1050),
    DFAS_YTD_DETAIL                          VARCHAR(1129),
    DFAS_YTD_STATE                           VARCHAR(1052)
);

-- File format for fixed-width VSAM file
CREATE FILE FORMAT IF NOT EXISTS FF_YTD_FILE
    TYPE = 'CSV'
    RECORD_DELIMITER = '\n'
    FIELD_DELIMITER = NONE
    TRIM_SPACE = FALSE;

-- Load data from staged file into staging table
-- NOTE: Fixed-width VSAM files must be pre-processed into delimited
-- format before loading, or use SUBSTR() in a SELECT from RAW stage.
-- Example using raw line approach:
CREATE TABLE IF NOT EXISTS RAW_YTD_FILE (
    RAW_LINE VARCHAR(4096)
);

COPY INTO RAW_YTD_FILE
FROM @CPM_FLAT_FILE_STAGE/PC_DOEYTD_RDF.TXT
FILE_FORMAT = FF_YTD_FILE
ON_ERROR = 'CONTINUE';

-- Parse fixed-width fields from raw lines into staging table
INSERT INTO STG_YTD_FILE
SELECT
    RAW_LINE
FROM RAW_YTD_FILE;

-- -----------------------------------------------------------------------
-- Flat File: MER_FILE (original: PC_DOEMER_RDF.TXT)
-- Original format: FIXED-WIDTH | VSAM | IBM Comp: N/A
-- -----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STG_MER_FILE (
    MER_LV_HDR_RECORD                        VARCHAR(700),
    MER_LV_DETAIL_RECORD                     VARCHAR(768)
);

-- File format for fixed-width VSAM file
CREATE FILE FORMAT IF NOT EXISTS FF_MER_FILE
    TYPE = 'CSV'
    RECORD_DELIMITER = '\n'
    FIELD_DELIMITER = NONE
    TRIM_SPACE = FALSE;

-- Load data from staged file into staging table
-- NOTE: Fixed-width VSAM files must be pre-processed into delimited
-- format before loading, or use SUBSTR() in a SELECT from RAW stage.
-- Example using raw line approach:
CREATE TABLE IF NOT EXISTS RAW_MER_FILE (
    RAW_LINE VARCHAR(4096)
);

COPY INTO RAW_MER_FILE
FROM @CPM_FLAT_FILE_STAGE/PC_DOEMER_RDF.TXT
FILE_FORMAT = FF_MER_FILE
ON_ERROR = 'CONTINUE';

-- Parse fixed-width fields from raw lines into staging table
INSERT INTO STG_MER_FILE
SELECT
    RAW_LINE
FROM RAW_MER_FILE;

-- -----------------------------------------------------------------------
-- Flat File: PAYMASTER_THREE (original: PC_DOE_EXP_PMR3.TXT)
-- Original format: FIXED-WIDTH | VSAM | IBM Comp: N/A
-- -----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STG_PAYMASTER_THREE (
    WS_PAY_DETAIL_RECORD                     VARCHAR(260)
);

-- File format for fixed-width VSAM file
CREATE FILE FORMAT IF NOT EXISTS FF_PAYMASTER_THREE
    TYPE = 'CSV'
    RECORD_DELIMITER = '\n'
    FIELD_DELIMITER = NONE
    TRIM_SPACE = FALSE;

-- Load data from staged file into staging table
-- NOTE: Fixed-width VSAM files must be pre-processed into delimited
-- format before loading, or use SUBSTR() in a SELECT from RAW stage.
-- Example using raw line approach:
CREATE TABLE IF NOT EXISTS RAW_PAYMASTER_THREE (
    RAW_LINE VARCHAR(4096)
);

COPY INTO RAW_PAYMASTER_THREE
FROM @CPM_FLAT_FILE_STAGE/PC_DOE_EXP_PMR3.TXT
FILE_FORMAT = FF_PAYMASTER_THREE
ON_ERROR = 'CONTINUE';

-- Parse fixed-width fields from raw lines into staging table
INSERT INTO STG_PAYMASTER_THREE
SELECT
    RAW_LINE
FROM RAW_PAYMASTER_THREE;

-- -----------------------------------------------------------------------
-- Flat File: PAYMASTER_FILE (original: PC_DOE_EXP_PMR_RDF.TXT)
-- Original format: FIXED-WIDTH | VSAM | IBM Comp: N/A
-- -----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STG_PAYMASTER_FILE (
    WS_PAYMASTER_HEADER                      VARCHAR(256),
    WS_PAYMASTER_RECORD_1                    VARCHAR(258),
    WS_PAYMASTER_RECORD_2                    VARCHAR(263),
    WS_PAYMASTER_RECORD_3                    VARCHAR(260)
);

-- File format for fixed-width VSAM file
CREATE FILE FORMAT IF NOT EXISTS FF_PAYMASTER_FILE
    TYPE = 'CSV'
    RECORD_DELIMITER = '\n'
    FIELD_DELIMITER = NONE
    TRIM_SPACE = FALSE;

-- Load data from staged file into staging table
-- NOTE: Fixed-width VSAM files must be pre-processed into delimited
-- format before loading, or use SUBSTR() in a SELECT from RAW stage.
-- Example using raw line approach:
CREATE TABLE IF NOT EXISTS RAW_PAYMASTER_FILE (
    RAW_LINE VARCHAR(4096)
);

COPY INTO RAW_PAYMASTER_FILE
FROM @CPM_FLAT_FILE_STAGE/PC_DOE_EXP_PMR_RDF.TXT
FILE_FORMAT = FF_PAYMASTER_FILE
ON_ERROR = 'CONTINUE';

-- Parse fixed-width fields from raw lines into staging table
INSERT INTO STG_PAYMASTER_FILE
SELECT
    RAW_LINE
FROM RAW_PAYMASTER_FILE;

-- -----------------------------------------------------------------------
-- Flat File: PAD_FILE (original: PC_DOEPAD_RDF.TXT)
-- Original format: FIXED-WIDTH | VSAM | IBM Comp: N/A
-- -----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STG_PAD_FILE (
    PAD_RECORD_HEADER                        VARCHAR(1400),
    PAD_RECORD_DETAIL                        VARCHAR(1508)
);

-- File format for fixed-width VSAM file
CREATE FILE FORMAT IF NOT EXISTS FF_PAD_FILE
    TYPE = 'CSV'
    RECORD_DELIMITER = '\n'
    FIELD_DELIMITER = NONE
    TRIM_SPACE = FALSE;

-- Load data from staged file into staging table
-- NOTE: Fixed-width VSAM files must be pre-processed into delimited
-- format before loading, or use SUBSTR() in a SELECT from RAW stage.
-- Example using raw line approach:
CREATE TABLE IF NOT EXISTS RAW_PAD_FILE (
    RAW_LINE VARCHAR(4096)
);

COPY INTO RAW_PAD_FILE
FROM @CPM_FLAT_FILE_STAGE/PC_DOEPAD_RDF.TXT
FILE_FORMAT = FF_PAD_FILE
ON_ERROR = 'CONTINUE';

-- Parse fixed-width fields from raw lines into staging table
INSERT INTO STG_PAD_FILE
SELECT
    RAW_LINE
FROM RAW_PAD_FILE;
