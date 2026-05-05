# Informatica PowerCenter → Snowflake Migration Runbook

## Overview

This runbook documents the migration of the **CPM (Cost Per Mille)** ETL pipeline from Informatica PowerCenter 9.6.1 / Oracle to Snowflake. The CPM mapping is the largest and most complex in the repository (~33,000 lines of XML), handling payroll data integration between the Electronic Health Record Program (EHRP) and the Business Intelligence Information System (BIIS).

### Original Architecture
| Component | Technology |
|-----------|-----------|
| ETL Engine | Informatica PowerCenter 9.6.1 |
| Source/Target DB | Oracle (ORA_BIIS) |
| Flat File Sources | VSAM / fixed-width text files |
| Orchestration | KornShell (ksh) scripts |
| Scheduling | Unix cron / Informatica Workflow Manager |

### Target Architecture
| Component | Technology |
|-----------|-----------|
| ETL Engine | Snowflake Stored Procedures (SQL) |
| Database | Snowflake |
| Flat File Ingestion | Snowflake Stages + COPY INTO |
| Orchestration | SP_CPM_ETL_ORCHESTRATOR stored procedure |
| Scheduling | Snowflake Tasks or external scheduler |

---

## Migration Artifacts

### 1. DDL — Table Definitions (`ddl/01_cpm_tables.sql`)

**23 CREATE TABLE statements** generated from the PowerCenter XML SOURCE and TARGET definitions.

#### Oracle → Snowflake Type Mapping

| Oracle Type | Snowflake Type | Notes |
|-------------|---------------|-------|
| `NUMBER(p,s)` | `NUMBER(p,s)` | Direct mapping |
| `VARCHAR2(n)` | `VARCHAR(n)` | Direct mapping |
| `CHAR(n)` | `VARCHAR(n)` | Snowflake has no fixed-width CHAR |
| `DATE` | `TIMESTAMP_NTZ` | Oracle DATE includes time component |
| `CLOB` | `VARCHAR(16777216)` | Snowflake max VARCHAR |
| `BLOB` / `RAW` | `BINARY` | Binary data |
| `FLOAT` | `FLOAT` | Direct mapping |

#### Source Tables (from PowerCenter SOURCE definitions)

| # | Table Name | Type | Owner | Fields | Description |
|---|-----------|------|-------|--------|-------------|
| 1 | PAY_PERIOD | Oracle | HISTDBA | 10 | Pay period calendar reference |
| 2 | YTD_FILE | VSAM | — | 3 | Year-to-date flat file (PC_DOEYTD_RDF.TXT) |
| 3 | CPM_YTD_STATE_STG_TBL | Oracle | INFO_TARGET_DEV | 8 | YTD state tax staging |
| 4 | MER_FILE | VSAM | — | 2 | MER leave flat file (PC_DOEMER_RDF.TXT) |
| 5 | CPM_PM1_STG_TBL | Oracle | INFO_TARGET_DEV | 37 | Paymaster record type 1 staging |
| 6 | CPM_YTD_DETAIL_STG_TBL | Oracle | INFO_TARGET_DEV | 106 | YTD detail staging |
| 7 | CPM_PM2_STG_TBL | Oracle | INFO_TARGET_DEV | 43 | Paymaster record type 2 staging |
| 8 | PSEUDOSSN_TBL | Oracle | INFO_TARGET_DEV | 63 | Pseudo-SSN lookup for PII obfuscation |
| 9 | CPM_NEWPAY_TBL | Oracle | INFO_TARGET_DEV | 501 | Final CPM newpay output |
| 10 | PAYMASTER_THREE | VSAM | — | 1 | Paymaster type 3 flat file (PC_DOE_EXP_PMR3.TXT) |
| 11 | ERROR_TBL | Oracle | INFO_TARGET_DEV | 8 | Error tracking table |
| 12 | PAYMASTER_FILE | VSAM | — | 4 | Paymaster flat file (PC_DOE_EXP_PMR_RDF.TXT) |
| 13 | PAD_FILE | VSAM | — | 2 | PAD flat file (PC_DOEPAD_RDF.TXT) |
| 14 | CPM_NEWPAY_STG_TYPE_3_TBL | Oracle | INFO_TARGET_DEV | 242 | Newpay staging type 3 |
| 15 | HI_GENERIC_SRC_TBL | Oracle | INFO_TARGET_DEV | 1 | Generic source placeholder |
| 16 | CPM_NEWPAY_STG_TYPE_1_2_TBL | Oracle | INFO_TARGET_DEV | 262 | Newpay staging types 1 & 2 |
| 17 | CPM_PM3_STG_TBL | Oracle | INFO_TARGET_DEV | 40 | Paymaster record type 3 staging |
| 18 | CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Oracle | INFO_TARGET_DEV | 246 | Newpay staging type 3 FDR |

#### Target Tables (from PowerCenter TARGET definitions)

| # | Table Name | Type | Fields | Description |
|---|-----------|------|--------|-------------|
| 1 | CPM_PAY_PERIOD_DATE_FILE | Flat File | 1 | Pay period date output |
| 2 | CPM_NEWPAY_STG_ALT_TBL | Oracle | 46 | Allotment staging |
| 3 | CPM_YTD_HEADER_STG_TBL | Oracle | 7 | YTD header staging |
| 4 | CPM_YTD_STATE_STG_TBL | Oracle | 8 | YTD state tax staging |
| 5 | CPM_YTD_DETAIL_STG_TBL | Oracle | 106 | YTD detail staging |
| 6 | CPM_NEWPAY_STG_YTD_STATE_TBL | Oracle | 19 | Newpay YTD state staging |
| 7 | CPM_MER_DETAIL_STG_TBL | Oracle | 95 | MER detail staging |
| 8 | CPM_MER_HEADER_STG_TBL | Oracle | 7 | MER header staging |
| 9 | CPM_NEWPAY_STG_TYPE_1_2_TBL | Oracle | 262 | Combined type 1/2 staging |
| 10 | ERROR_TBL | Oracle | 8 | Error tracking |
| 11 | CPM_NEWPAY_STG_DETAIL_TBL | Oracle | 22 | Newpay detail staging |
| 12 | CPM_MESSAGE_FILE | Flat File | 2 | Message/counter output file |
| 13 | COUNTER_TBL | Oracle | 7 | Run counter tracking |
| 14 | CPM_PM1_STG_TBL | Oracle | 37 | Paymaster type 1 staging |
| 15 | CPM_PM3_STG_TBL | Oracle | 40 | Paymaster type 3 staging |
| 16 | CPM_PM2_STG_TBL | Oracle | 43 | Paymaster type 2 staging |
| 17 | CPM_PMH_STG_TBL | Oracle | 3 | Paymaster header staging |
| 18 | CPM_PAD_HEADER_STG_TBL | Oracle | 8 | PAD header staging |
| 19 | CPM_PAD_DETAIL_STG_TBL | Oracle | 150 | PAD detail staging |
| 20 | GENERIC_TARGET_FILE | Flat File | 1 | Generic target placeholder |
| 21 | CPM_NEWPAY_TBL | Oracle | 499 | Final CPM newpay output |
| 22 | CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Oracle | 246 | Newpay type 3 FDR staging |
| 23 | CPM_NEWPAY_STG_TYPE_3_TBL | Oracle | 242 | Newpay type 3 staging |

---

### 2. Snowflake Stages (`stages/02_cpm_stages.sql`)

**5 Snowflake stages** created for the VSAM/flat-file sources. Each stage includes:
- A `CREATE STAGE` definition with appropriate file format
- A raw landing table (`*_RAW`) for initial data ingestion
- A `COPY INTO` statement with file pattern matching

| # | Stage Name | Source File | Format | Description |
|---|-----------|-------------|--------|-------------|
| 1 | STG_YTD_FILE | PC_DOEYTD_RDF.TXT | Fixed-width | Year-to-date payroll data |
| 2 | STG_MER_FILE | PC_DOEMER_RDF.TXT | Fixed-width | MER leave/benefit data |
| 3 | STG_PAYMASTER_THREE | PC_DOE_EXP_PMR3.TXT | Fixed-width | Paymaster record type 3 |
| 4 | STG_PAYMASTER_FILE | PC_DOE_EXP_PMR_RDF.TXT | Fixed-width | Paymaster records (all types) |
| 5 | STG_PAD_FILE | PC_DOEPAD_RDF.TXT | Fixed-width | PAD (personnel action data) |

**Note:** All VSAM sources use fixed-width (non-delimited) format. The Informatica Normalizer transformations that parsed these records into individual fields are replaced by Snowflake `SUBSTR()` operations within the stored procedures.

---

### 3. Stored Procedures (`stored_procedures/`)

**18 stored procedures** replacing the 15 Informatica mappings + 2 pre/post-load scripts + 1 orchestrator.

#### Mapping-Based Stored Procedures

| # | Procedure | Source Mapping | Sources → Targets | Key Logic |
|---|-----------|---------------|-------------------|-----------|
| 1 | SP_CPM_CURRENT_PAY_PERIOD | m_CPM_Current_Pay_Period | PAY_PERIOD → CPM_PAY_PERIOD_DATE_FILE | Determines current pay period from calendar |
| 2 | SP_CPM_LOAD_CPM_PMR_STAGING_TABLES | m_CPM_Load_CPM_PMR_Staging_Tables | PAYMASTER_FILE → PM1/PM2/PM3/PMH_STG | Normalizer splits records by type via Router |
| 3 | SP_CPM_LOAD_CPM_YTD_STAGING_TABLES | m_CPM_Load_CPM_YTD_Staging_Tables | YTD_FILE → YTD Detail/Header/State STG | Router splits by record_type (0/1/2) |
| 4 | SP_CPM_LOAD_CPM_MER_STAGING_TABLES | m_CPM_Load_CPM_MER_Staging_Tables | MER_FILE → MER Detail/Header STG | Router splits header vs detail records |
| 5 | SP_CPM_LOAD_CPM_PAD_STAGING_TABLES | m_CPM_Load_CPM_PAD_Staging_Tables | PAD_FILE → PAD Detail/Header STG | Router splits by record type |
| 6 | SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL | m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | YTD_STATE_STG → NEWPAY_STG_YTD_STATE | Aggregates YTD state tax data |
| 7 | SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL | m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | PM3_STG → NEWPAY_STG_ALT + ERROR | Allotment aggregation with PSEUDOSSN lookup |
| 8 | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | PM1/PM2/YTD_DETAIL/PSEUDOSSN → NEWPAY_STG_TYPE_1_2 + ERROR | Complex join of paymaster + YTD + MER + PAD lookups |
| 9 | SP_CPM_LOAD_CPM_NEWPAY_STG_DETAIL_TBL | m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | PM3_STG → NEWPAY_STG_DETAIL | Aggregates by PYF_EYE_ID and PP_NUM |
| 10 | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | PM3_STG → NEWPAY_STG_TYPE_3_FDR | FDR-specific type 3 with ALT + Type 1/2 lookups |
| 11 | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL | NEWPAY_STG_TYPE_3_FDR → NEWPAY_STG_TYPE_3 | Final type 3 with Detail + ALT lookups |
| 12 | SP_CPM_LOAD_PMR_TO_CPM_NEWPAY_TBL | m_CPM_Load_PMR_To_CPM_NEWPAY_TBL | NEWPAY_STG_TYPE_1_2 + TYPE_3 → CPM_NEWPAY_TBL | Combines type 1/2 and type 3 into final newpay |
| 13 | SP_CPM_LOAD_FDR_CPM_NEWPAY_TBL | m_CPM_Load_FDR_CPM_NEWPAY_TBL | NEWPAY_STG_TYPE_1_2 + TYPE_3_FDR → CPM_NEWPAY_TBL | FDR variant with REG_REEMPLED lookup |
| 14 | SP_CPM_BUILD_MESSAGE_COUNTERS | m_CPM_Build_Message_Counters | NEWPAY + ERROR + PAYMASTER_THREE → COUNTER + MESSAGE | Aggregates counts across inputs, CPM records, errors |
| 15 | SP_GENERIC_MAPPING | m_Generic_Mapping | HI_GENERIC_SRC → GENERIC_TARGET_FILE | Passthrough placeholder mapping |

#### Pre/Post-Load Stored Procedures

| # | Procedure | Original Script | Description |
|---|-----------|----------------|-------------|
| 16 | SP_EHRP2BIIS_PRELOAD | ehrp2biis_preload (ksh + step01 SQL) | Truncates all staging tables before ETL run |
| 17 | SP_EHRP2BIIS_AFTERLOAD | ehrp2biis_afterload.sql | Post-load: sequence updates, record formatting, WIP status check, promotion to production ALL tables, cancelled action re-sync |

#### Orchestrator

| # | Procedure | Description |
|---|-----------|-------------|
| 18 | SP_CPM_ETL_ORCHESTRATOR | Master procedure that calls all above in correct dependency order |

---

### 4. Transformation Pattern Reference

The following Informatica transformation types were translated to Snowflake SQL patterns:

| Informatica Transform | Snowflake Equivalent | Notes |
|----------------------|---------------------|-------|
| **Source Qualifier** | `SELECT FROM` table | Direct table read |
| **Expression** | `SELECT` computed columns | Inline expressions in SELECT |
| **Router** | `WHERE` clause per target | Each group becomes a separate INSERT with filter |
| **Normalizer** | `SUBSTR()` on raw records | Fixed-width parsing of VSAM records |
| **Aggregator** | `GROUP BY` + aggregate functions | `SUM`, `COUNT`, `MAX`, `MIN` |
| **Joiner** | `JOIN` | `INNER JOIN`, `LEFT JOIN` |
| **Lookup** | `LEFT JOIN` subquery | Lookup SQL Override → subquery |
| **Filter** | `WHERE` clause | Filter condition → WHERE predicate |
| **Sequence Generator** | `ROW_NUMBER() OVER(...)` | Or Snowflake SEQUENCE object |
| **Mapplet** | Inline SQL or helper UDF | `mplt_Convert_Num_To_Prec7` → ROUND/CAST |

#### Key Expression Translations

| Informatica Function | Snowflake Function |
|---------------------|-------------------|
| `IIF(cond, true, false)` | `IFF(cond, true, false)` |
| `IS_DATE(val, fmt)` | `TRY_TO_DATE(val, fmt) IS NOT NULL` |
| `DECODE(TRUE, c1, v1, ...)` | `CASE WHEN c1 THEN v1 ... END` |
| `SYSDATE` | `CURRENT_TIMESTAMP()` |
| `TRUNC(SYSDATE)` | `CURRENT_DATE()` |
| `TO_CHAR(val)` | `TO_CHAR(val)` (same) |
| `LPAD/RPAD/SUBSTR/TRIM` | Same in Snowflake |
| `ABORT('msg')` | `-- RAISE 'msg'` (manual review needed) |
| `$$MAP_VARIABLE` | Stored procedure parameters |

---

## Execution Order

The ETL pipeline must execute in this specific order due to data dependencies:

```
Phase 1: Pre-Load
  └── SP_EHRP2BIIS_PRELOAD (truncate all staging)

Phase 2: File Ingestion
  ├── COPY INTO YTD_FILE_RAW FROM @STG_YTD_FILE
  ├── COPY INTO MER_FILE_RAW FROM @STG_MER_FILE
  ├── COPY INTO PAYMASTER_THREE_RAW FROM @STG_PAYMASTER_THREE
  ├── COPY INTO PAYMASTER_FILE_RAW FROM @STG_PAYMASTER_FILE
  └── COPY INTO PAD_FILE_RAW FROM @STG_PAD_FILE

Phase 3: Reference Data
  └── SP_CPM_CURRENT_PAY_PERIOD

Phase 4: First-Level Staging (can run in parallel)
  ├── SP_CPM_LOAD_CPM_PMR_STAGING_TABLES
  ├── SP_CPM_LOAD_CPM_YTD_STAGING_TABLES
  ├── SP_CPM_LOAD_CPM_MER_STAGING_TABLES
  └── SP_CPM_LOAD_CPM_PAD_STAGING_TABLES

Phase 5: Second-Level Staging (depends on Phase 4)
  ├── SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL
  ├── SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL
  ├── SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL
  └── SP_CPM_LOAD_CPM_NEWPAY_STG_DETAIL_TBL

Phase 6: Third-Level Staging (depends on Phase 5)
  ├── SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL
  └── SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_TBL

Phase 7: Final Assembly (depends on Phase 6)
  ├── SP_CPM_LOAD_PMR_TO_CPM_NEWPAY_TBL
  └── SP_CPM_LOAD_FDR_CPM_NEWPAY_TBL

Phase 8: Reporting
  └── SP_CPM_BUILD_MESSAGE_COUNTERS

Phase 9: Post-Load
  └── SP_EHRP2BIIS_AFTERLOAD
```

---

## Deployment Steps

### 1. Create Schema and Tables
```sql
CREATE DATABASE IF NOT EXISTS BIIS_DW;
CREATE SCHEMA IF NOT EXISTS BIIS_DW.CPM;
USE SCHEMA BIIS_DW.CPM;

-- Run table DDL
@ddl/01_cpm_tables.sql
```

### 2. Create Stages and Raw Tables
```sql
-- Run stage definitions
@stages/02_cpm_stages.sql
```

### 3. Deploy Stored Procedures
```sql
-- Deploy in order (dependencies matter for CALL statements)
@stored_procedures/sp_ehrp2biis_preload.sql
@stored_procedures/m_cpm_current_pay_period.sql
@stored_procedures/m_cpm_load_cpm_pmr_staging_tables.sql
@stored_procedures/m_cpm_load_cpm_ytd_staging_tables.sql
@stored_procedures/m_cpm_load_cpm_mer_staging_tables.sql
@stored_procedures/m_cpm_load_cpm_pad_staging_tables.sql
@stored_procedures/m_cpm_load_cpm_newpay_stg_ytd_state_tbl.sql
@stored_procedures/m_cpm_load_cpm_newpay_stg_alt_tbl.sql
@stored_procedures/m_cpm_load_cpm_newpay_stg_type_1_2_tbl.sql
@stored_procedures/m_cpm_load_cpm_newpay_stg_detail_tbl.sql
@stored_procedures/m_cpm_load_cpm_newpay_stg_type_3_fdr_tbl.sql
@stored_procedures/m_cpm_load_cpm_newpay_stg_type_3_tbl.sql
@stored_procedures/m_cpm_load_pmr_to_cpm_newpay_tbl.sql
@stored_procedures/m_cpm_load_fdr_cpm_newpay_tbl.sql
@stored_procedures/m_cpm_build_message_counters.sql
@stored_procedures/m_generic_mapping.sql
@stored_procedures/sp_ehrp2biis_afterload.sql
@stored_procedures/sp_cpm_etl_orchestrator.sql
```

### 4. Upload Source Files to Stages
```sql
-- Upload flat files to internal stages
PUT file:///path/to/PC_DOEYTD_RDF.TXT @STG_YTD_FILE;
PUT file:///path/to/PC_DOEMER_RDF.TXT @STG_MER_FILE;
PUT file:///path/to/PC_DOE_EXP_PMR3.TXT @STG_PAYMASTER_THREE;
PUT file:///path/to/PC_DOE_EXP_PMR_RDF.TXT @STG_PAYMASTER_FILE;
PUT file:///path/to/PC_DOEPAD_RDF.TXT @STG_PAD_FILE;
```

### 5. Run the Pipeline
```sql
CALL SP_CPM_ETL_ORCHESTRATOR(2024, 26);
-- Parameters: PP_END_YEAR, PP_NUM (pay period)
```

### 6. Optional: Schedule with Snowflake Tasks
```sql
CREATE OR REPLACE TASK CPM_ETL_DAILY
  WAREHOUSE = COMPUTE_WH
  SCHEDULE = 'USING CRON 0 6 * * MON-FRI America/New_York'
AS
  CALL SP_CPM_ETL_ORCHESTRATOR(
    YEAR(CURRENT_DATE()),
    WEEKOFYEAR(CURRENT_DATE()) -- Adjust to biweekly as needed
  );

ALTER TASK CPM_ETL_DAILY RESUME;
```

---

## Validation Checklist

- [ ] All 23 tables created in Snowflake
- [ ] All 5 stages created and accessible
- [ ] Sample flat files successfully loaded via COPY INTO
- [ ] SP_EHRP2BIIS_PRELOAD truncates all staging tables
- [ ] Each staging SP loads correct record counts
- [ ] CPM_NEWPAY_TBL row count matches Oracle source
- [ ] COUNTER_TBL reports correct input/output/error counts
- [ ] SP_EHRP2BIIS_AFTERLOAD promotes records to production ALL tables
- [ ] Error handling captures and logs failures appropriately

---

## Known Limitations & Manual Review Items

1. **Informatica Normalizer → SUBSTR()**: The original Normalizer transformations parsed fixed-width VSAM records using byte-level offsets. The Snowflake procedures use `SUBSTR()` but the exact offsets must be verified against the original COBOL copybook definitions.

2. **Mapplet `mplt_Convert_Num_To_Prec7`**: This reusable mapplet converts numeric fields to precision-7 format. It is referenced ~15 times across mappings. A Snowflake UDF should be created: `CREATE FUNCTION convert_num_to_prec7(val NUMBER) RETURNS NUMBER(15,7) AS 'ROUND(val, 7)'`.

3. **ABORT() calls**: Informatica `ABORT()` expressions that halt the workflow on validation failures are commented out. These should be replaced with Snowflake exception handling or logged to an error table.

4. **Sequence Generation**: `v_SEQ_ID` counters from Informatica Sequence Generator transformations have been replaced with `ROW_NUMBER() OVER (ORDER BY ...)` window functions. Verify the ordering columns produce the expected sequence values.

5. **Afterload Stored Procedure Dependencies**: `SP_EHRP2BIIS_AFTERLOAD` calls several sub-procedures (`SP_UPDATE_SEQUENCE_NUMBER_TBL`, `SP_UPDT_ERP2BIIS_CRE8_REMARKS01`, etc.) that correspond to Oracle PL/SQL procedures not included in this XML export. These need separate migration from the Oracle database.

6. **Informatica Session Variables (`$$MAP_PP_END_YEAR`, `$$MAP_PP_NUM`)**: Converted to stored procedure parameters. Ensure calling code passes correct pay period values.

7. **Oracle `ROWNUM` usage**: Converted to `LIMIT 1` in Snowflake. Verify ordering is preserved.

8. **Schema references**: Original Oracle used `HISTDBA`, `NKNIGHT`, `INFO_TARGET_DEV`, and `EHRP` schemas. These are unified into a single Snowflake `CPM` schema. Adjust if multi-schema architecture is desired.
