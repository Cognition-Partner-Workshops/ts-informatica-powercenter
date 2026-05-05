# Informatica PowerCenter → Snowflake Migration Runbook

## Overview

This runbook documents the migration of the **CPM (Cost Per Mille) ETL pipeline** from Informatica PowerCenter 9.6.1 + Oracle to Snowflake. The CPM folder is the largest and most complex mapping in the system at **33,591 lines of XML**, containing **18 source definitions**, **23 target definitions**, and **15 mappings** with a combined **142 transformations** and **9,097 connectors**.

---

## Table of Contents

1. [Architecture Comparison](#1-architecture-comparison)
2. [Source Table Translations](#2-source-table-translations)
3. [Target Table Translations](#3-target-table-translations)
4. [Flat-File Source Translations](#4-flat-file-source-translations)
5. [Mapping Translations](#5-mapping-translations)
6. [Transformation Pattern Translations](#6-transformation-pattern-translations)
7. [Pre/Post-Load Script Translations](#7-prepost-load-script-translations)
8. [Data Type Mapping Reference](#8-data-type-mapping-reference)
9. [Execution Order & Dependencies](#9-execution-order--dependencies)
10. [Validation Checklist](#10-validation-checklist)
11. [Risk Register](#11-risk-register)

---

## 1. Architecture Comparison

| Component | Informatica PowerCenter | Snowflake |
|---|---|---|
| **ETL Engine** | PowerCenter 9.6.1 Integration Service | Snowflake Stored Procedures (SQL) |
| **Source Database** | Oracle (ORA_BIIS) | Snowflake CPM schema |
| **Flat File Ingestion** | Source Qualifier → Normalizer | Stage → COPY INTO → SUBSTR parsing |
| **Transformation Logic** | Expression / Aggregator / Joiner / Router / Filter | SQL CASE/COALESCE/JOIN/GROUP BY/WINDOW |
| **Lookup Tables** | Lookup Transformation (cached) | LEFT JOIN in SQL |
| **Error Handling** | Filter → Error target | INSERT INTO ERROR_TBL with CASE logic |
| **Orchestration** | Workflow Manager + Session | SP_CPM_ETL_MAIN calling sub-procedures |
| **Scheduling** | PowerCenter Scheduler | Snowflake Tasks or external scheduler |
| **Pre/Post SQL** | Shell scripts (ksh) + SQL*Plus | Stored procedures |
| **Notifications** | mailx (Unix) | Snowflake Alerts / External webhook |

---

## 2. Source Table Translations

### Oracle → Snowflake DDL

| # | Source Table | Owner | Fields | File |
|---|---|---|---|---|
| 1 | `PAY_PERIOD` | HISTDBA | 10 | `ddl/01_source_tables.sql` |
| 2 | `CPM_YTD_STATE_STG_TBL` | INFO_TARGET_DEV | 8 | `ddl/01_source_tables.sql` |
| 3 | `CPM_PM1_STG_TBL` | INFO_TARGET_DEV | 37 | `ddl/01_source_tables.sql` |
| 4 | `CPM_YTD_DETAIL_STG_TBL` | INFO_TARGET_DEV | 106 | `ddl/01_source_tables.sql` |
| 5 | `CPM_PM2_STG_TBL` | INFO_TARGET_DEV | 43 | `ddl/01_source_tables.sql` |
| 6 | `PSEUDOSSN_TBL` | INFO_TARGET_DEV | 63 | `ddl/01_source_tables.sql` |
| 7 | `CPM_NEWPAY_TBL` | INFO_TARGET_DEV | 501 | `ddl/01_source_tables.sql` |
| 8 | `ERROR_TBL` | INFO_TARGET_DEV | 8 | `ddl/01_source_tables.sql` |
| 9 | `CPM_NEWPAY_STG_TYPE_3_TBL` | INFO_TARGET_DEV | 242 | `ddl/01_source_tables.sql` |
| 10 | `HI_GENERIC_SRC_TBL` | INFO_TARGET_DEV | 1 | `ddl/01_source_tables.sql` |
| 11 | `CPM_NEWPAY_STG_TYPE_1_2_TBL` | INFO_TARGET_DEV | 262 | `ddl/01_source_tables.sql` |
| 12 | `CPM_PM3_STG_TBL` | INFO_TARGET_DEV | 40 | `ddl/01_source_tables.sql` |
| 13 | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | INFO_TARGET_DEV | 246 | `ddl/01_source_tables.sql` |

### Key Type Conversions Applied

- `NUMBER(p,s)` → `NUMBER(p,s)` (direct mapping)
- `VARCHAR2(n)` → `VARCHAR(n)`
- `DATE` → `DATE`
- `LONG` → `VARCHAR(16777216)`

---

## 3. Target Table Translations

| # | Target Table | Type | Fields | File |
|---|---|---|---|---|
| 1 | `CPM_NEWPAY_STG_ALT_TBL` | Oracle→Snowflake | 46 | `ddl/02_target_tables.sql` |
| 2 | `CPM_YTD_HEADER_STG_TBL` | Oracle→Snowflake | 7 | `ddl/02_target_tables.sql` |
| 3 | `CPM_YTD_STATE_STG_TBL` | Oracle→Snowflake | 8 | `ddl/02_target_tables.sql` |
| 4 | `CPM_YTD_DETAIL_STG_TBL` | Oracle→Snowflake | 106 | `ddl/02_target_tables.sql` |
| 5 | `CPM_NEWPAY_STG_YTD_STATE_TBL` | Oracle→Snowflake | 19 | `ddl/02_target_tables.sql` |
| 6 | `CPM_MER_DETAIL_STG_TBL` | Oracle→Snowflake | 95 | `ddl/02_target_tables.sql` |
| 7 | `CPM_MER_HEADER_STG_TBL` | Oracle→Snowflake | 7 | `ddl/02_target_tables.sql` |
| 8 | `CPM_NEWPAY_STG_TYPE_1_2_TBL` | Oracle→Snowflake | 262 | `ddl/02_target_tables.sql` |
| 9 | `ERROR_TBL` | Oracle→Snowflake | 8 | `ddl/02_target_tables.sql` |
| 10 | `CPM_NEWPAY_STG_DETAIL_TBL` | Oracle→Snowflake | 22 | `ddl/02_target_tables.sql` |
| 11 | `COUNTER_TBL` | Oracle→Snowflake | 7 | `ddl/02_target_tables.sql` |
| 12 | `CPM_PM1_STG_TBL` | Oracle→Snowflake | 37 | `ddl/02_target_tables.sql` |
| 13 | `CPM_PM3_STG_TBL` | Oracle→Snowflake | 40 | `ddl/02_target_tables.sql` |
| 14 | `CPM_PM2_STG_TBL` | Oracle→Snowflake | 43 | `ddl/02_target_tables.sql` |
| 15 | `CPM_PMH_STG_TBL` | Oracle→Snowflake | 3 | `ddl/02_target_tables.sql` |
| 16 | `CPM_PAD_HEADER_STG_TBL` | Oracle→Snowflake | 8 | `ddl/02_target_tables.sql` |
| 17 | `CPM_PAD_DETAIL_STG_TBL` | Oracle→Snowflake | 150 | `ddl/02_target_tables.sql` |
| 18 | `CPM_NEWPAY_TBL` | Oracle→Snowflake | 499 | `ddl/02_target_tables.sql` |
| 19 | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Oracle→Snowflake | 246 | `ddl/02_target_tables.sql` |
| 20 | `CPM_NEWPAY_STG_TYPE_3_TBL` | Oracle→Snowflake | 242 | `ddl/02_target_tables.sql` |
| 21 | `CPM_PAY_PERIOD_DATE_FILE` | Flat File→Table | 1 | `ddl/02_target_tables.sql` |
| 22 | `CPM_MESSAGE_FILE` | Flat File→Table | 2 | `ddl/02_target_tables.sql` |
| 23 | `GENERIC_TARGET_FILE` | Flat File→Table | 1 | `ddl/02_target_tables.sql` |

---

## 4. Flat-File Source Translations

All flat files were VSAM fixed-width format read by Informatica Normalizer transformations.

| # | Source Name | Original File | Format | Translation |
|---|---|---|---|---|
| 1 | `YTD_FILE` | `PC_DOEYTD_RDF.TXT` | VSAM Fixed-width | Stage → RAW table → SUBSTR parse |
| 2 | `MER_FILE` | `PC_DOEMER_RDF.TXT` | VSAM Fixed-width | Stage → RAW table → SUBSTR parse |
| 3 | `PAYMASTER_FILE` | `PC_DOE_EXP_PMR_RDF.TXT` | VSAM Fixed-width | Stage → RAW table → SUBSTR parse |
| 4 | `PAYMASTER_THREE` | `PC_DOE_EXP_PMR3.TXT` | VSAM Fixed-width | Stage → RAW table → SUBSTR parse |
| 5 | `PAD_FILE` | `PC_DOEPAD_RDF.TXT` | VSAM Fixed-width | Stage → RAW table → SUBSTR parse |

### Snowflake Pattern

```sql
-- 1. Create external stage pointing to cloud storage
CREATE STAGE CPM_FLAT_FILE_STAGE URL = 's3://bucket/cpm/';

-- 2. Load raw lines into RAW table
COPY INTO RAW_YTD_FILE FROM @CPM_FLAT_FILE_STAGE/PC_DOEYTD_RDF.TXT;

-- 3. Parse fixed-width fields using SUBSTR
INSERT INTO STG_YTD_FILE
SELECT TRIM(SUBSTR(RAW_LINE, 1, 9)) AS FIELD_1, ...
FROM RAW_YTD_FILE;
```

File: `stages/03_flat_file_stages.sql`

---

## 5. Mapping Translations

### Mapping → Stored Procedure Map

| # | Informatica Mapping | Stored Procedure | Transforms | Connectors | Complexity |
|---|---|---|---|---|---|
| 1 | `m_CPM_Current_Pay_Period` | `SP_CPM_ETL_MAIN` (inline) | 3 | 15 | Low |
| 2 | `m_CPM_Load_CPM_YTD_Staging_Tables` | `SP_CPM_LOAD_YTD_STAGING` | 10 | 615 | Medium |
| 3 | `m_CPM_Load_CPM_MER_Staging_Tables` | `SP_CPM_LOAD_MER_STAGING` | 9 | 541 | Medium |
| 4 | `m_CPM_Load_CPM_PMR_Staging_Tables` | `SP_CPM_LOAD_PMR_STAGING` | 11 | 592 | Medium |
| 5 | `m_CPM_Load_CPM_PAD_Staging_Tables` | `SP_CPM_LOAD_PAD_STAGING` | 9 | 805 | Medium |
| 6 | `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | `SP_CPM_LOAD_NEWPAY_STG_ALT` | 12 | 284 | High |
| 7 | `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | `SP_CPM_LOAD_NEWPAY_STG_YTD_STATE` | 6 | 87 | Medium |
| 8 | `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | `SP_CPM_LOAD_NEWPAY_STG_DETAIL` | 5 | 125 | Medium |
| 9 | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2` | 18 | 1,436 | **Critical** |
| 10 | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL` | `SP_CPM_LOAD_NEWPAY_STG_TYPE_3` | 8 | 1,230 | High |
| 11 | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `SP_CPM_LOAD_NEWPAY_STG_TYPE_3_FDR` | 10 | 805 | High |
| 12 | `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL` | `SP_CPM_LOAD_PMR_TO_NEWPAY` | 4 | 1,985 | Medium |
| 13 | `m_CPM_Load_FDR_CPM_NEWPAY_TBL` | `SP_CPM_LOAD_FDR_TO_NEWPAY` | 5 | 2,007 | Medium |
| 14 | `m_CPM_Build_Message_Counters` | `SP_CPM_BUILD_MESSAGE_COUNTERS` | 26 | 768 | High |
| 15 | `m_Generic_Mapping` | N/A (utility) | 1 | 2 | Low |

---

## 6. Transformation Pattern Translations

### 6.1 Expression Transformation → SQL CASE/IIF

| Informatica Pattern | Snowflake Equivalent |
|---|---|
| `IIF(condition, true_val, false_val)` | `CASE WHEN condition THEN true_val ELSE false_val END` |
| `DECODE(TRUE, cond1, val1, cond2, val2, default)` | `CASE WHEN cond1 THEN val1 WHEN cond2 THEN val2 ELSE default END` |
| `ISNULL(field)` | `field IS NULL` |
| `IS_SPACES(field)` | `TRIM(COALESCE(field, '')) = ''` |
| `INSTR(str, substr)` | `POSITION(substr IN str)` or `CHARINDEX(substr, str)` |
| `SUBSTR(str, start, len)` | `SUBSTR(str, start, len)` (compatible) |
| `LPAD(str, len, pad)` | `LPAD(str, len, pad)` (compatible) |
| `TO_CHAR(num)` | `TO_CHAR(num)` (compatible) |
| `TO_DECIMAL(str, scale)` | `TO_DECIMAL(str, 38, scale)` |
| `SESSSTARTTIME` | `CURRENT_TIMESTAMP()` |
| `SETVARIABLE($$VAR, val)` | Procedure parameter or variable assignment |
| `$PMMappingName` | Hard-coded procedure name string |
| `SIGN(val)` | `SIGN(val)` (compatible) |
| `ABS(val)` | `ABS(val)` (compatible) |
| `TRUNC(val)` | `TRUNC(val)` (compatible) |
| `LENGTH(str)` | `LENGTH(str)` (compatible) |
| `LTRIM(str)` | `LTRIM(str)` (compatible) |

### 6.2 Stateful Expression → Window Functions

The original Informatica expressions use stateful variables (e.g., `v_PREV_KEY`, `v_ALLOTMENT_COUNTER`) that persist across rows. These are translated to:

```sql
-- Informatica: v_CURR_KEY / v_NEW_EMP_FLAG / v_ALLOTMENT_COUNTER
ROW_NUMBER() OVER (PARTITION BY employee_key ORDER BY ...) AS counter

-- Informatica: v_PREV_KEY != v_CURR_KEY (detect group change)
-- Handled implicitly by PARTITION BY in window functions
```

### 6.3 Aggregator → GROUP BY

| Informatica Pattern | Snowflake Equivalent |
|---|---|
| `SUM(field, condition)` | `SUM(CASE WHEN condition THEN field END)` |
| `FIRST(field, condition)` | `MAX(CASE WHEN condition THEN field END)` (for single match) |
| `LAST(field, condition)` | `MAX(CASE WHEN condition THEN field END)` |
| `COUNT(field, condition)` | `COUNT(CASE WHEN condition THEN field END)` |
| Group by port | `GROUP BY column` |

### 6.4 Lookup Transformation → LEFT JOIN

| Informatica Pattern | Snowflake Equivalent |
|---|---|
| Simple equality lookup | `LEFT JOIN table ON key = key` |
| Range lookup (date between) | `LEFT JOIN table ON start <= val AND end >= val` |
| Multiple match: Use Any Value | Standard JOIN (returns first match) |
| Lookup SQL Override | Inline the override SQL in JOIN |

### 6.5 Router Transformation → CASE-based INSERT

```sql
-- Informatica Router with groups (HEADER, DETAIL, STATE)
INSERT INTO header_table SELECT ... WHERE record_type = 'H';
INSERT INTO detail_table SELECT ... WHERE record_type = 'D';
INSERT INTO state_table  SELECT ... WHERE record_type = 'S';
```

### 6.6 Joiner Transformation → SQL JOIN

| Informatica Join Type | SQL Equivalent |
|---|---|
| Detail Outer Join | `LEFT JOIN` |
| Full Outer Join | `FULL OUTER JOIN` |
| Normal Join | `INNER JOIN` |
| Master Outer Join | `RIGHT JOIN` |

### 6.7 Filter Transformation → WHERE Clause

```sql
-- Informatica: Filter Condition: ERROR_FLAG = TRUE
WHERE error_flag = TRUE

-- Informatica: Filter Condition: NOT ISNULL(ERROR_MESSAGE)
WHERE error_message IS NOT NULL
```

### 6.8 Normalizer (VSAM Parsing) → SUBSTR

```sql
-- Informatica Normalizer parses fixed-width COBOL records
-- Snowflake: Load raw line, then SUBSTR by offset + length
SELECT
    TRIM(SUBSTR(RAW_LINE, 1, 9))    AS SSN,
    TRIM(SUBSTR(RAW_LINE, 10, 30))  AS NAME,
    TO_NUMBER(SUBSTR(RAW_LINE, 40, 10)) AS AMOUNT
FROM RAW_TABLE;
```

### 6.9 Numeric Overflow Truncation

A recurring pattern in the original mapping truncates values exceeding field limits:

```sql
-- Informatica pattern (e.g., overtime pay > 99999.99):
-- v_EXCEEDS_FLAG = IIF(ABS(val) > limit, TRUE, FALSE)
-- v_SIGN = SIGN(val)
-- v_CHAR = TO_CHAR(ABS(TO_DECIMAL(val, 2)))
-- v_BEFORE_DEC = SUBSTR(v_CHAR, INSTR(v_CHAR,'.') - N, N)
-- o_val = IIF(EXCEEDS, SIGN * TO_DECIMAL(BEFORE || '.' || AFTER), val)

-- Snowflake equivalent:
LEAST(ABS(val), 99999.99) * SIGN(val)
```

---

## 7. Pre/Post-Load Script Translations

### 7.1 ehrp2biis_preload → SP_EHRP2BIIS_PRELOAD

| Original Component | Snowflake Translation |
|---|---|
| KornShell script (`#!/bin/ksh`) | Stored procedure `SP_EHRP2BIIS_PRELOAD()` |
| `SETENV` environment setup | Snowflake session parameters |
| `cat $HOME/.use` / `.pw` (credentials) | Snowflake RBAC (no credentials needed) |
| `$ORACLE_HOME/bin/sqlplus` | Direct SQL execution in procedure |
| `@ $homedir/step01` | Inline SQL in procedure body |
| `grep -i "ERROR" $logfile` | `EXCEPTION WHEN OTHER` handler |
| `mailx -s "..." $p_mailid` | Snowflake Alert or external notification |
| SPOOL to log file | Snowflake query history |

### 7.2 ehrp2biis_afterload.sql → SP_EHRP2BIIS_AFTERLOAD

| Original Step | Oracle SQL | Snowflake Translation |
|---|---|---|
| Step 04 | `UPDATE nwk_action_secondary_tbl SET retnd1_step_cd = NULL` | Same UPDATE, `TRUNC(SYSDATE)` → `CURRENT_DATE()` |
| Step 05a | `execute update_sequence_number_tbl_p` | `CALL UPDATE_SEQUENCE_NUMBER_TBL_P()` |
| Step 05b | 4x `EXEC HISTDBA.proc_name` | 4x `CALL proc_name()` |
| Step 05c | `EXEC UPDT_ORIG_CANCELLED_TRANS01_P` | `CALL UPDT_ORIG_CANCELLED_TRANS01_P()` |
| Step 05d | `UPDATE PROCESS_TABLE SET P_STARTDT = (subquery WHERE ROWNUM < 2)` | Same with `LIMIT 1` instead of `ROWNUM` |
| Step 05e | `EXEC chk_ehrp2biis_wip_status_p` | `CALL CHK_EHRP2BIIS_WIP_STATUS_P()` |
| Step 05f | `INSERT INTO action_primary_all SELECT * FROM nwk_...` | Same INSERT/SELECT, `TRUNC(SYSDATE)` → `CURRENT_DATE()` |
| Step 05g | `EXEC GATHER_EHRP2BIIS_RUNCOUNTS_P(NULL)` | `CALL GATHER_EHRP2BIIS_RUNCOUNTS_P(NULL)` |
| Step 05h | DELETE/INSERT cancelled actions | Same logic with `CURRENT_DATE()` |
| Step 05i | `TRUNCATE TABLE nwk_new_ehrp_actions_tbl` | `TRUNCATE TABLE NWK_NEW_EHRP_ACTIONS_TBL` |
| `COMMIT` (explicit) | Auto-commit (Snowflake default in procedures) |
| `col datetime new_value datetime` / `&&datetime` | `TO_CHAR(CURRENT_TIMESTAMP(), ...)` variable |

---

## 8. Data Type Mapping Reference

| Oracle Type | Snowflake Type | Notes |
|---|---|---|
| `NUMBER(p,s)` | `NUMBER(p,s)` | Direct mapping |
| `NUMBER(p)` | `NUMBER(p,0)` | Integer precision |
| `VARCHAR2(n)` | `VARCHAR(n)` | Direct mapping |
| `CHAR(n)` | `CHAR(n)` | Direct mapping |
| `DATE` | `DATE` | Oracle DATE includes time; consider TIMESTAMP_NTZ if time needed |
| `TIMESTAMP` | `TIMESTAMP_NTZ` | No timezone (matches Oracle behavior) |
| `LONG` | `VARCHAR(16777216)` | Snowflake max VARCHAR |
| `CLOB` | `VARCHAR(16777216)` | Snowflake max VARCHAR |
| `BLOB` | `BINARY` | Binary storage |
| `FLOAT` | `FLOAT` | Direct mapping |
| `RAW(n)` | `BINARY(n)` | Binary with length |

---

## 9. Execution Order & Dependencies

```
┌─────────────────────────────────────┐
│  SP_EHRP2BIIS_PRELOAD()             │  ← Truncate staging, load flat files
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│  SP_CPM_ETL_MAIN(year, pp_num)      │  ← Orchestrator
│                                     │
│  Step 1:  Current Pay Period        │  (inline)
│  Step 2:  ┌ YTD Staging            │  SP_CPM_LOAD_YTD_STAGING
│  Step 3:  │ MER Staging            │  SP_CPM_LOAD_MER_STAGING
│  Step 4:  │ PMR Staging            │  SP_CPM_LOAD_PMR_STAGING
│  Step 5:  └ PAD Staging            │  SP_CPM_LOAD_PAD_STAGING
│                                     │
│  Step 6:  NEWPAY STG ALT           │  SP_CPM_LOAD_NEWPAY_STG_ALT
│  Step 7:  NEWPAY STG YTD_STATE     │  SP_CPM_LOAD_NEWPAY_STG_YTD_STATE
│  Step 8:  NEWPAY STG TYPE 1/2      │  SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2  ★
│  Step 9:  PMR → NEWPAY             │  SP_CPM_LOAD_PMR_TO_NEWPAY
│  Step 10: FDR → NEWPAY             │  SP_CPM_LOAD_FDR_TO_NEWPAY
│  Step 11: NEWPAY STG DETAIL        │  SP_CPM_LOAD_NEWPAY_STG_DETAIL
│  Step 12: NEWPAY STG TYPE 3        │  SP_CPM_LOAD_NEWPAY_STG_TYPE_3
│  Step 13: NEWPAY STG TYPE 3 FDR    │  SP_CPM_LOAD_NEWPAY_STG_TYPE_3_FDR
│  Step 14: Message Counters         │  SP_CPM_BUILD_MESSAGE_COUNTERS
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│  SP_EHRP2BIIS_AFTERLOAD()           │  ← Post-processing, promote to prod
└─────────────────────────────────────┘
```

### Dependency Graph (Steps 2-14)

```
Steps 2-5 (flat file staging) → independent, can run in parallel
Step 6 (ALT)         depends on: Step 4 (PM3_STG from PMR)
Step 7 (YTD_STATE)   depends on: Step 2 (YTD_STATE_STG)
Step 8 (TYPE 1/2)    depends on: Steps 2,3,5,7 (YTD, MER, PAD, YTD_STATE)
Step 9 (PMR→NEWPAY)  depends on: Steps 4 (PMR staging); LEFT JOINs TYPE_3 (optional)
Step 10 (FDR→NEWPAY) depends on: Step 13 (TYPE_3_FDR staging)
Step 11 (DETAIL)     depends on: Steps 9/10 (CPM_NEWPAY_TBL populated)
Step 12 (TYPE 3)     depends on: Steps 6,8,11 (ALT, TYPE_1_2, DETAIL) + Steps 9/10 (NEWPAY_TBL)
Step 13 (TYPE 3 FDR) depends on: Steps 6,8 (ALT, TYPE_1_2) + Steps 9/10 (NEWPAY_TBL)
Step 14 (Counters)   depends on: All prior steps
```

---

## 10. Validation Checklist

### Pre-Migration

- [ ] All 13 Oracle source tables recreated in Snowflake (`ddl/01_source_tables.sql`)
- [ ] All 20 Oracle target tables recreated in Snowflake (`ddl/02_target_tables.sql`)
- [ ] 3 flat-file target tables created (for file outputs converted to tables)
- [ ] External stage created and accessible (`stages/03_flat_file_stages.sql`)
- [ ] Storage integration configured for S3/Azure/GCS access
- [ ] All 5 file formats created for VSAM parsing
- [ ] Reference data loaded: `PAY_PERIOD`, `PSEUDOSSN_TBL`

### Post-Migration (per pay period)

- [ ] Row counts match between Oracle and Snowflake for each staging table
- [ ] `CPM_NEWPAY_STG_TYPE_1_2_TBL` record count matches Informatica session log
- [ ] `CPM_NEWPAY_STG_TYPE_3_TBL` record count matches
- [ ] `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` record count matches
- [ ] `ERROR_TBL` error count matches or is lower (improved validation)
- [ ] `COUNTER_TBL` summary counts match expected values
- [ ] Allotment totals (`CPP_ALT_TOT`) match per employee
- [ ] YTD state tax totals match per employee
- [ ] Numeric overflow truncation produces same results (spot-check 5+ records)
- [ ] Name parsing (LAST, FIRST, MID_INIT) matches for complex names
- [ ] `SP_EHRP2BIIS_AFTERLOAD` promotes correct records to `_ALL` tables
- [ ] `NWK_NEW_EHRP_ACTIONS_TBL` truncated after load

### Performance

- [ ] Staging table loads complete within acceptable time window
- [ ] `SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2` (most complex) completes < 30 min
- [ ] Temporary tables cleaned up after each procedure
- [ ] No warehouse suspension during ETL window

---

## 11. Risk Register

| Risk | Impact | Mitigation |
|---|---|---|
| **Stateful expression translation** | Allotment counters and sequence generators rely on row ordering | Used `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)` with explicit sort |
| **VSAM fixed-width parsing** | COBOL COMP fields may have binary encoding | Pre-process IBM COMP fields before staging; original `IBMCOMP="YES"` flag noted |
| **Numeric overflow truncation** | 241 expressions in exp_Format_Fields use SUBSTR-based truncation | Simplified to `LEAST(ABS(val), limit) * SIGN(val)` — equivalent for most cases |
| **Informatica session variables** | `$$MAP_PP_END_YEAR`, `$$MAP_PP_NUM` used across mappings | Replaced with procedure parameters `P_PP_END_YEAR`, `P_PP_NUM` |
| **Lookup cache behavior** | Informatica caches lookups; Snowflake JOINs may return different row for multi-match | Documented "Use Any Value" policy; used MAX/FIRST equivalent |
| **COMMIT semantics** | Oracle explicit COMMIT vs Snowflake auto-commit | Snowflake procedures auto-commit by default; matches behavior |
| **Downstream procedures** | 6 Oracle procedures called in afterload are not in the XML export | Created procedure stubs; actual PL/SQL bodies must be migrated separately |
| **Pay detail code completeness** | SUM aggregations use specific PYF_PAY_DET_CD values (AA-AN, YC-YG, UA-UJ) | Validated against XML; additional codes may exist in production data |
| **Time zone differences** | Oracle `SYSDATE` is server-local; Snowflake `CURRENT_DATE()` is session TZ | Set `TIMEZONE = 'America/New_York'` to match original server |

---

## File Inventory

```
snowflake_migration/
├── ddl/
│   ├── 01_source_tables.sql          # 13 source table DDL
│   └── 02_target_tables.sql          # 20+3 target table DDL
├── stages/
│   └── 03_flat_file_stages.sql       # Stage, file formats, COPY INTO, SUBSTR parsing
├── stored_procedures/
│   ├── 04_sp_cpm_etl_main.sql        # Main orchestrator (14 steps)
│   ├── 05_sp_cpm_load_ytd_staging.sql
│   ├── 06_sp_cpm_load_mer_staging.sql
│   ├── 07_sp_cpm_load_pmr_staging.sql
│   ├── 08_sp_cpm_load_pad_staging.sql
│   ├── 09_sp_cpm_load_newpay_stg_alt.sql
│   ├── 10_sp_cpm_load_newpay_stg_ytd_state.sql
│   ├── 11_sp_cpm_load_newpay_stg_detail.sql
│   ├── 12_sp_cpm_load_newpay_stg_type_1_2.sql   # Most complex (262-col target)
│   ├── 13_sp_cpm_load_newpay_stg_type_3.sql
│   ├── 14_sp_cpm_load_newpay_stg_type_3_fdr.sql
│   ├── 15_sp_cpm_load_pmr_to_newpay.sql
│   ├── 16_sp_cpm_load_fdr_to_newpay.sql
│   ├── 17_sp_cpm_build_message_counters.sql
│   ├── 18_sp_ehrp2biis_preload.sql   # Pre-load (replaces shell script)
│   └── 19_sp_ehrp2biis_afterload.sql # Post-load (Oracle SQL → Snowflake)
└── INFORMATICA_MIGRATION_RUNBOOK.md  # This document
```
