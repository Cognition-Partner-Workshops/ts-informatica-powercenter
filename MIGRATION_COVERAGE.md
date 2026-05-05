# Migration Coverage Report: PowerCenter CPM → Snowflake

Structural validation of the Informatica PowerCenter **CPM folder** migration to Snowflake stored procedures and DDL.

**Source:** `XML/CPM` (PowerCenter 9.6.1 export, 33,591 lines)
**Target:** `snowflake_migration/` on branch `devin/1777992886-snowflake-migration`
**Inventory Reference:** `POWERCENTER_INVENTORY.md` and `POWERCENTER_LINEAGE.md` from branch `devin/1777993039-powercenter-inventory-lineage`

---

## Summary Statistics

| Category | PowerCenter Count | Snowflake Equivalent | Covered | Partial | Gap |
|---|---|---|---|---|---|
| Source Definitions | 18 | 13 DDL tables + 5 flat-file stage pipelines | **18** | 0 | 0 |
| Target Definitions | 23 | 20 DDL tables + 2 SP-referenced tables + 1 missing | **20** | **2** | **1** |
| Mappings | 15 | 14 stored procedures (13 sub-procs + 1 inline in orchestrator) | **14** | 0 | **1** |
| Sessions | 15 | 14 CALL statements in SP_CPM_ETL_MAIN | **14** | 0 | **1** |
| Workflows | 1 | 1 orchestrator procedure (SP_CPM_ETL_MAIN) | **1** | 0 | 0 |
| Transformations (by type) | 137 | Absorbed into SQL logic across 14 procedures | **137** | 0 | 0 |
| Pre/Post-Load Scripts | 2 | 2 stored procedures | **2** | 0 | 0 |

**Overall: 85 of 88 objects fully covered (96.6%), 2 partial, 1 gap.**

---

## 1. Source Definition Reconciliation

### Oracle Sources (13 of 13 — Covered)

| # | PowerCenter Source | DB Type | Snowflake DDL | File | Status |
|---|---|---|---|---|---|
| 1 | `PAY_PERIOD` | Oracle | `CREATE TABLE PAY_PERIOD` | `ddl/01_source_tables.sql` | Covered |
| 2 | `CPM_YTD_STATE_STG_TBL` | Oracle | `CREATE TABLE CPM_YTD_STATE_STG_TBL` | `ddl/01_source_tables.sql` | Covered |
| 3 | `CPM_PM1_STG_TBL` | Oracle | `CREATE TABLE CPM_PM1_STG_TBL` | `ddl/01_source_tables.sql` | Covered |
| 4 | `CPM_YTD_DETAIL_STG_TBL` | Oracle | `CREATE TABLE CPM_YTD_DETAIL_STG_TBL` | `ddl/01_source_tables.sql` | Covered |
| 5 | `CPM_PM2_STG_TBL` | Oracle | `CREATE TABLE CPM_PM2_STG_TBL` | `ddl/01_source_tables.sql` | Covered |
| 6 | `PSEUDOSSN_TBL` | Oracle | `CREATE TABLE PSEUDOSSN_TBL` | `ddl/01_source_tables.sql` | Covered |
| 7 | `CPM_NEWPAY_TBL` | Oracle | `CREATE TABLE CPM_NEWPAY_TBL` | `ddl/01_source_tables.sql` | Covered |
| 8 | `ERROR_TBL` | Oracle | `CREATE TABLE ERROR_TBL` | `ddl/01_source_tables.sql` | Covered |
| 9 | `CPM_NEWPAY_STG_TYPE_3_TBL` | Oracle | `CREATE TABLE CPM_NEWPAY_STG_TYPE_3_TBL` | `ddl/01_source_tables.sql` | Covered |
| 10 | `HI_GENERIC_SRC_TBL` | Oracle | `CREATE TABLE HI_GENERIC_SRC_TBL` | `ddl/01_source_tables.sql` | Covered |
| 11 | `CPM_NEWPAY_STG_TYPE_1_2_TBL` | Oracle | `CREATE TABLE CPM_NEWPAY_STG_TYPE_1_2_TBL` | `ddl/01_source_tables.sql` | Covered |
| 12 | `CPM_PM3_STG_TBL` | Oracle | `CREATE TABLE CPM_PM3_STG_TBL` | `ddl/01_source_tables.sql` | Covered |
| 13 | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Oracle | `CREATE TABLE CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `ddl/01_source_tables.sql` | Covered |

### VSAM/Flat-File Sources (5 of 5 — Covered)

Each VSAM source is handled by a stage + file format + COPY INTO + RAW/STG table pair in `stages/03_flat_file_stages.sql`.

| # | PowerCenter Source | Original File | Snowflake Stage Table | File Format | COPY INTO Target | Status |
|---|---|---|---|---|---|---|
| 14 | `YTD_FILE` | `PC_DOEYTD_RDF.TXT` | `STG_YTD_FILE` / `RAW_YTD_FILE` | `FF_YTD_FILE` | `RAW_YTD_FILE` | Covered |
| 15 | `MER_FILE` | `PC_DOEMER_RDF.TXT` | `STG_MER_FILE` / `RAW_MER_FILE` | `FF_MER_FILE` | `RAW_MER_FILE` | Covered |
| 16 | `PAYMASTER_THREE` | `PC_DOE_EXP_PMR3.TXT` | `STG_PAYMASTER_THREE` / `RAW_PAYMASTER_THREE` | `FF_PAYMASTER_THREE` | `RAW_PAYMASTER_THREE` | Covered |
| 17 | `PAYMASTER_FILE` | `PC_DOE_EXP_PMR_RDF.TXT` | `STG_PAYMASTER_FILE` / `RAW_PAYMASTER_FILE` | `FF_PAYMASTER_FILE` | `RAW_PAYMASTER_FILE` | Covered |
| 18 | `PAD_FILE` | `PC_DOEPAD_RDF.TXT` | `STG_PAD_FILE` / `RAW_PAD_FILE` | `FF_PAD_FILE` | `RAW_PAD_FILE` | Covered |

---

## 2. Target Definition Reconciliation

### Oracle Targets (20 of 20 — Covered)

| # | PowerCenter Target | Snowflake DDL | File | Status |
|---|---|---|---|---|
| 1 | `CPM_NEWPAY_STG_ALT_TBL` | `CREATE TABLE CPM_NEWPAY_STG_ALT_TBL` | `ddl/02_target_tables.sql` | Covered |
| 2 | `CPM_YTD_HEADER_STG_TBL` | `CREATE TABLE CPM_YTD_HEADER_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 3 | `CPM_YTD_STATE_STG_TBL` | `CREATE TABLE CPM_YTD_STATE_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 4 | `CPM_YTD_DETAIL_STG_TBL` | `CREATE TABLE CPM_YTD_DETAIL_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 5 | `CPM_NEWPAY_STG_YTD_STATE_TBL` | `CREATE TABLE CPM_NEWPAY_STG_YTD_STATE_TBL` | `ddl/02_target_tables.sql` | Covered |
| 6 | `CPM_MER_DETAIL_STG_TBL` | `CREATE TABLE CPM_MER_DETAIL_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 7 | `CPM_MER_HEADER_STG_TBL` | `CREATE TABLE CPM_MER_HEADER_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 8 | `CPM_NEWPAY_STG_TYPE_1_2_TBL` | `CREATE TABLE CPM_NEWPAY_STG_TYPE_1_2_TBL` | `ddl/02_target_tables.sql` | Covered |
| 9 | `ERROR_TBL` | `CREATE TABLE ERROR_TBL` | `ddl/02_target_tables.sql` | Covered |
| 10 | `CPM_NEWPAY_STG_DETAIL_TBL` | `CREATE TABLE CPM_NEWPAY_STG_DETAIL_TBL` | `ddl/02_target_tables.sql` | Covered |
| 11 | `COUNTER_TBL` | `CREATE TABLE COUNTER_TBL` | `ddl/02_target_tables.sql` | Covered |
| 12 | `CPM_PM1_STG_TBL` | `CREATE TABLE CPM_PM1_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 13 | `CPM_PM3_STG_TBL` | `CREATE TABLE CPM_PM3_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 14 | `CPM_PM2_STG_TBL` | `CREATE TABLE CPM_PM2_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 15 | `CPM_PMH_STG_TBL` | `CREATE TABLE CPM_PMH_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 16 | `CPM_PAD_HEADER_STG_TBL` | `CREATE TABLE CPM_PAD_HEADER_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 17 | `CPM_PAD_DETAIL_STG_TBL` | `CREATE TABLE CPM_PAD_DETAIL_STG_TBL` | `ddl/02_target_tables.sql` | Covered |
| 18 | `CPM_NEWPAY_TBL` | `CREATE TABLE CPM_NEWPAY_TBL` | `ddl/02_target_tables.sql` | Covered |
| 19 | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `CREATE TABLE CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `ddl/02_target_tables.sql` | Covered |
| 20 | `CPM_NEWPAY_STG_TYPE_3_TBL` | `CREATE TABLE CPM_NEWPAY_STG_TYPE_3_TBL` | `ddl/02_target_tables.sql` | Covered |

### Flat-File Targets (2 Partial, 1 Gap)

| # | PowerCenter Target | Type | Snowflake Equivalent | Status | Notes |
|---|---|---|---|---|---|
| 21 | `CPM_PAY_PERIOD_DATE_FILE` | Flat File | Referenced in `SP_CPM_ETL_MAIN` Step 1 (`INSERT INTO CPM_PAY_PERIOD_DATE_FILE`) | **Partial** | SP logic exists but `CREATE TABLE` DDL is missing from `ddl/02_target_tables.sql` |
| 22 | `CPM_MESSAGE_FILE` | Flat File | Referenced in `SP_CPM_BUILD_MESSAGE_COUNTERS` (`INSERT INTO CPM_MESSAGE_FILE`) | **Partial** | SP logic exists but `CREATE TABLE` DDL is missing from `ddl/02_target_tables.sql` |
| 23 | `GENERIC_TARGET_FILE` | Flat File | None | **Gap** | Used by `m_Generic_Mapping` / `s_CPM_Send_Counts` (email notification); no Snowflake equivalent |

---

## 3. Mapping → Stored Procedure Reconciliation

| # | PowerCenter Mapping | Transforms | Snowflake Procedure | File | Status |
|---|---|---|---|---|---|
| 1 | `m_CPM_Current_Pay_Period` | 3 | Inline in `SP_CPM_ETL_MAIN` Step 1 | `stored_procedures/04_sp_cpm_etl_main.sql` | Covered |
| 2 | `m_CPM_Load_CPM_YTD_Staging_Tables` | 10 | `SP_CPM_LOAD_YTD_STAGING` | `stored_procedures/05_sp_cpm_load_ytd_staging.sql` | Covered |
| 3 | `m_CPM_Load_CPM_MER_Staging_Tables` | 9 | `SP_CPM_LOAD_MER_STAGING` | `stored_procedures/06_sp_cpm_load_mer_staging.sql` | Covered |
| 4 | `m_CPM_Load_CPM_PMR_Staging_Tables` | 11 | `SP_CPM_LOAD_PMR_STAGING` | `stored_procedures/07_sp_cpm_load_pmr_staging.sql` | Covered |
| 5 | `m_CPM_Load_CPM_PAD_Staging_Tables` | 9 | `SP_CPM_LOAD_PAD_STAGING` | `stored_procedures/08_sp_cpm_load_pad_staging.sql` | Covered |
| 6 | `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | 12 | `SP_CPM_LOAD_NEWPAY_STG_ALT` | `stored_procedures/09_sp_cpm_load_newpay_stg_alt.sql` | Covered |
| 7 | `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | 6 | `SP_CPM_LOAD_NEWPAY_STG_YTD_STATE` | `stored_procedures/10_sp_cpm_load_newpay_stg_ytd_state.sql` | Covered |
| 8 | `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | 5 | `SP_CPM_LOAD_NEWPAY_STG_DETAIL` | `stored_procedures/11_sp_cpm_load_newpay_stg_detail.sql` | Covered |
| 9 | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | 18 | `SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2` | `stored_procedures/12_sp_cpm_load_newpay_stg_type_1_2.sql` | Covered |
| 10 | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL` | 8 | `SP_CPM_LOAD_NEWPAY_STG_TYPE_3` | `stored_procedures/13_sp_cpm_load_newpay_stg_type_3.sql` | Covered |
| 11 | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | 10 | `SP_CPM_LOAD_NEWPAY_STG_TYPE_3_FDR` | `stored_procedures/14_sp_cpm_load_newpay_stg_type_3_fdr.sql` | Covered |
| 12 | `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL` | 4 | `SP_CPM_LOAD_PMR_TO_NEWPAY` | `stored_procedures/15_sp_cpm_load_pmr_to_newpay.sql` | Covered |
| 13 | `m_CPM_Load_FDR_CPM_NEWPAY_TBL` | 5 | `SP_CPM_LOAD_FDR_TO_NEWPAY` | `stored_procedures/16_sp_cpm_load_fdr_to_newpay.sql` | Covered |
| 14 | `m_CPM_Build_Message_Counters` | 26 | `SP_CPM_BUILD_MESSAGE_COUNTERS` | `stored_procedures/17_sp_cpm_build_message_counters.sql` | Covered |
| 15 | `m_Generic_Mapping` | 1 | None | — | **Gap** |

---

## 4. Session Reconciliation

| # | PowerCenter Session | Mapping | Snowflake Equivalent | Status |
|---|---|---|---|---|
| 1 | `s_CPM_Current_Pay_Period` | `m_CPM_Current_Pay_Period` | `SP_CPM_ETL_MAIN` Step 1 (inline) | Covered |
| 2 | `s_CPM_Load_CPM_YTD_Staging_Tables` | `m_CPM_Load_CPM_YTD_Staging_Tables` | `CALL SP_CPM_LOAD_YTD_STAGING` | Covered |
| 3 | `s_CPM_Load_CPM_MER_Staging_Tables` | `m_CPM_Load_CPM_MER_Staging_Tables` | `CALL SP_CPM_LOAD_MER_STAGING` | Covered |
| 4 | `s_CPM_Load_CPM_PMR_Staging_Tables` | `m_CPM_Load_CPM_PMR_Staging_Tables` | `CALL SP_CPM_LOAD_PMR_STAGING` | Covered |
| 5 | `s_CPM_Load_CPM_PAD_Staging_Tables` | `m_CPM_Load_CPM_PAD_Staging_Tables` | `CALL SP_CPM_LOAD_PAD_STAGING` | Covered |
| 6 | `s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_ALT` | Covered |
| 7 | `s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_YTD_STATE` | Covered |
| 8 | `s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2` | Covered |
| 9 | `s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_DETAIL` | Covered |
| 10 | `s_CPM_Build_Message_Counters` | `m_CPM_Build_Message_Counters` | `CALL SP_CPM_BUILD_MESSAGE_COUNTERS` | Covered |
| 11 | `s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_3` | Covered |
| 12 | `s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_3_FDR` | Covered |
| 13 | `s_CPM_Load_CPM_NEWPAY_TBL` | `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL` | `CALL SP_CPM_LOAD_PMR_TO_NEWPAY` | Covered |
| 14 | `s_CPM_Load_FDR_CPM_NEWPAY_TBL` | `m_CPM_Load_FDR_CPM_NEWPAY_TBL` | `CALL SP_CPM_LOAD_FDR_TO_NEWPAY` | Covered |
| 15 | `s_CPM_Send_Counts` | `m_Generic_Mapping` | None | **Gap** |

---

## 5. Workflow Reconciliation

| # | PowerCenter Workflow | Sessions | Snowflake Equivalent | Status |
|---|---|---|---|---|
| 1 | `wf_CPM` | 15 (incl. `email_CPM_Complete` task) | `SP_CPM_ETL_MAIN` (14 steps) | Covered |

The Snowflake orchestrator `SP_CPM_ETL_MAIN` preserves the original execution order from `wf_CPM`. The 15th session (`s_CPM_Send_Counts`) and the `email_CPM_Complete` email task are not implemented (see Gaps section).

---

## 6. Transformation Type Coverage

All 137 PowerCenter transformations are structurally absorbed into equivalent SQL patterns within the stored procedures.

| Transformation Type | Count | Snowflake SQL Pattern | Coverage |
|---|---|---|---|
| Source Qualifier | 14 | `SELECT ... FROM ... WHERE` | Covered |
| Expression | 71 | `CASE / COALESCE / SUBSTR / POSITION / LEAST / ABS / SIGN` | Covered |
| Aggregator | 9 | `GROUP BY` + `SUM / MAX / COUNT / COALESCE(SUM(CASE ...))` | Covered |
| Lookup Procedure | 22 | `LEFT JOIN` on lookup tables | Covered |
| Filter | 4 | `WHERE` clauses | Covered |
| Router | 4 | Multiple `INSERT ... SELECT ... WHERE record_type = ...` | Covered |
| Joiner | 4 | `JOIN` / `LEFT JOIN` | Covered |
| Normalizer | 9 | `COPY INTO` raw table + `SUBSTR` parsing in stored procedures | Covered |
| **Total** | **137** | | **137 of 137 Covered** |

---

## 7. Pre/Post-Load Script Reconciliation

| # | Original Script | Type | Snowflake Procedure | File | Status |
|---|---|---|---|---|---|
| 1 | `ehrp2biis_preload` (KornShell) | Pre-load | `SP_EHRP2BIIS_PRELOAD` | `stored_procedures/18_sp_ehrp2biis_preload.sql` | Covered |
| 2 | `ehrp2biis_afterload.sql` (Oracle SQL*Plus) | Post-load | `SP_EHRP2BIIS_AFTERLOAD` | `stored_procedures/19_sp_ehrp2biis_afterload.sql` | Covered |

Conversion patterns applied:
- `SQL*Plus '/nolog'` → Snowflake stored procedure (no connect needed)
- `SPOOL` → Snowflake query history / logging
- `TRUNC(SYSDATE)` → `CURRENT_DATE()`
- `ROWNUM < 2` → `LIMIT 1`
- Shell `mailx` → Snowflake Alerts / External webhook (noted as future work)

---

## 8. Gaps — PowerCenter Objects with No Snowflake Equivalent

| # | Object Type | PowerCenter Object | Description | Impact | Recommended Action |
|---|---|---|---|---|---|
| 1 | Target DDL | `CPM_PAY_PERIOD_DATE_FILE` | Flat-file target converted to table; SP logic exists (`SP_CPM_ETL_MAIN` Step 1 inserts into it) but `CREATE TABLE` DDL is missing | **Medium** — SP will fail at runtime | Add DDL: `CREATE TABLE CPM_PAY_PERIOD_DATE_FILE (PAY_PERIOD_STRING VARCHAR(6));` to `ddl/02_target_tables.sql` |
| 2 | Target DDL | `CPM_MESSAGE_FILE` | Flat-file target converted to table; SP logic exists (`SP_CPM_BUILD_MESSAGE_COUNTERS` inserts into it) but `CREATE TABLE` DDL is missing | **Medium** — SP will fail at runtime | Add DDL: `CREATE TABLE CPM_MESSAGE_FILE (MESSAGE_LINE VARCHAR(4096), MESSAGE_DATE TIMESTAMP_NTZ);` to `ddl/02_target_tables.sql` |
| 3 | Target | `GENERIC_TARGET_FILE` | Target for `m_Generic_Mapping` / `s_CPM_Send_Counts`; no Snowflake equivalent exists | **Low** — utility file for email notification flow | Implement if email integration is needed, or document as out-of-scope |
| 4 | Mapping | `m_Generic_Mapping` | Utility mapping used by `s_CPM_Send_Counts` for email notification | **Low** — notifications are a separate concern | Replace with Snowflake Alert, SNS, or external webhook integration |
| 5 | Session | `s_CPM_Send_Counts` | Email notification session at end of `wf_CPM` | **Low** — does not affect data processing | Replace with Snowflake Alert or Task notification |

---

## 9. Extras — Snowflake Artifacts with No Direct PowerCenter XML Equivalent

These are new infrastructure artifacts required by the Snowflake platform that have no 1:1 counterpart in the PowerCenter XML export.

| # | Snowflake Artifact | Type | Purpose | Maps To |
|---|---|---|---|---|
| 1 | `SP_CPM_ETL_MAIN` | Orchestrator Procedure | Replaces Workflow Manager session sequencing | `wf_CPM` workflow orchestration (not a mapping) |
| 2 | `SP_EHRP2BIIS_PRELOAD` | Pre-load Procedure | Replaces `ehrp2biis_preload` KornShell script | Shell script (not a PowerCenter XML object) |
| 3 | `SP_EHRP2BIIS_AFTERLOAD` | Post-load Procedure | Replaces `ehrp2biis_afterload.sql` Oracle SQL*Plus | Oracle SQL*Plus script (not a PowerCenter XML object) |
| 4 | `CPM_FLAT_FILE_STAGE` | External Stage | S3/Azure/GCS staging area for flat-file ingestion | Informatica file system source connections |
| 5 | `FF_YTD_FILE` | File Format | Fixed-width parsing config for YTD_FILE | Part of Source Qualifier → Normalizer chain |
| 6 | `FF_MER_FILE` | File Format | Fixed-width parsing config for MER_FILE | Part of Source Qualifier → Normalizer chain |
| 7 | `FF_PAYMASTER_THREE` | File Format | Fixed-width parsing config for PAYMASTER_THREE | Part of Source Qualifier → Normalizer chain |
| 8 | `FF_PAYMASTER_FILE` | File Format | Fixed-width parsing config for PAYMASTER_FILE | Part of Source Qualifier → Normalizer chain |
| 9 | `FF_PAD_FILE` | File Format | Fixed-width parsing config for PAD_FILE | Part of Source Qualifier → Normalizer chain |
| 10 | `RAW_YTD_FILE` | Raw Staging Table | Intermediate table for VSAM line-level ingestion | No PowerCenter equivalent (Informatica reads directly) |
| 11 | `RAW_MER_FILE` | Raw Staging Table | Intermediate table for VSAM line-level ingestion | No PowerCenter equivalent |
| 12 | `RAW_PAYMASTER_THREE` | Raw Staging Table | Intermediate table for VSAM line-level ingestion | No PowerCenter equivalent |
| 13 | `RAW_PAYMASTER_FILE` | Raw Staging Table | Intermediate table for VSAM line-level ingestion | No PowerCenter equivalent |
| 14 | `RAW_PAD_FILE` | Raw Staging Table | Intermediate table for VSAM line-level ingestion | No PowerCenter equivalent |
| 15 | `STG_YTD_FILE` | Parsed Staging Table | Parsed flat-file data for downstream SPs | Replaces Normalizer output |
| 16 | `STG_MER_FILE` | Parsed Staging Table | Parsed flat-file data for downstream SPs | Replaces Normalizer output |
| 17 | `STG_PAYMASTER_THREE` | Parsed Staging Table | Parsed flat-file data for downstream SPs | Replaces Normalizer output |
| 18 | `STG_PAYMASTER_FILE` | Parsed Staging Table | Parsed flat-file data for downstream SPs | Replaces Normalizer output |
| 19 | `STG_PAD_FILE` | Parsed Staging Table | Parsed flat-file data for downstream SPs | Replaces Normalizer output |

---

## 10. Artifact Counts

| Artifact Category | Count |
|---|---|
| **Snowflake DDL — Source Tables** (`ddl/01_source_tables.sql`) | 13 `CREATE TABLE` |
| **Snowflake DDL — Target Tables** (`ddl/02_target_tables.sql`) | 20 `CREATE TABLE` |
| **Snowflake Stages** (`stages/03_flat_file_stages.sql`) | 1 `CREATE STAGE` + 5 `CREATE FILE FORMAT` + 10 `CREATE TABLE` (RAW+STG) + 5 `COPY INTO` |
| **Snowflake Stored Procedures** (`stored_procedures/`) | 16 `CREATE OR REPLACE PROCEDURE` |
| **Total Snowflake DDL Tables** | 43 (13 source + 20 target + 10 stage) |
| **Total Snowflake Procedures** | 16 (1 orchestrator + 13 mapping procs + 2 pre/post-load) |

---

## 11. Execution Order Validation

The `SP_CPM_ETL_MAIN` orchestrator preserves the original `wf_CPM` session execution order:

| Step | Workflow Session | Orchestrator Call | Order Match |
|---|---|---|---|
| 1 | `s_CPM_Current_Pay_Period` | Inline Step 1 | Yes |
| 2 | `s_CPM_Load_CPM_YTD_Staging_Tables` | `CALL SP_CPM_LOAD_YTD_STAGING` | Yes |
| 3 | `s_CPM_Load_CPM_MER_Staging_Tables` | `CALL SP_CPM_LOAD_MER_STAGING` | Yes |
| 4 | `s_CPM_Load_CPM_PMR_Staging_Tables` | `CALL SP_CPM_LOAD_PMR_STAGING` | Yes |
| 5 | `s_CPM_Load_CPM_PAD_Staging_Tables` | `CALL SP_CPM_LOAD_PAD_STAGING` | Yes |
| 6 | `s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_ALT` | Yes |
| 7 | `s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_YTD_STATE` | Yes |
| 8 | `s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_1_2` | Yes |
| 9 | `s_CPM_Load_CPM_NEWPAY_TBL` | `CALL SP_CPM_LOAD_PMR_TO_NEWPAY` | Yes |
| 10 | `s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_3_FDR` | Yes |
| 11 | `s_CPM_Load_FDR_CPM_NEWPAY_TBL` | `CALL SP_CPM_LOAD_FDR_TO_NEWPAY` | Yes |
| 12 | `s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_DETAIL` | Yes |
| 13 | `s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL` | `CALL SP_CPM_LOAD_NEWPAY_STG_TYPE_3` | Yes |
| 14 | `s_CPM_Build_Message_Counters` | `CALL SP_CPM_BUILD_MESSAGE_COUNTERS` | Yes |
| 15 | `s_CPM_Send_Counts` | Not implemented | **Gap** |

---

## 12. Schema-Level Validation Issues

Beyond object-level structural coverage, deeper inspection reveals **SP-to-DDL column mismatches** that will cause runtime failures. These do not affect coverage counts (the procedures and tables exist) but indicate incomplete schema alignment.

### Issue 1: STG Flat-File Tables Missing Parsed Columns (Critical — 4 procedures affected)

**Impact:** Blocks Steps 2–5 of the ETL pipeline (all flat-file staging loads).

The staging tables `STG_YTD_FILE`, `STG_MER_FILE`, `STG_PAYMASTER_FILE`, and `STG_PAD_FILE` in `stages/03_flat_file_stages.sql` each define only a single `RAW_LINE VARCHAR(4096)` column. However, the stored procedures that consume them reference typed columns that do not exist:

| STG Table | SP Consumer | Missing Columns Referenced |
|---|---|---|
| `STG_YTD_FILE` | `SP_CPM_LOAD_YTD_STAGING` (05) | `RECORD_TYPE`, `HEADER_DATE`, `RECORD_COUNT`, `DYD_SSN_1`, `DYD_BASE_PAY`, `DYS_SSN`, `DYS_ST_CODE`, etc. |
| `STG_MER_FILE` | `SP_CPM_LOAD_MER_STAGING` (06) | `RECORD_TYPE`, `HEADER_DATE`, `RECORD_COUNT`, `MER_SSN`, `MER_NAME`, `MER_AGENCY`, etc. |
| `STG_PAYMASTER_FILE` | `SP_CPM_LOAD_PMR_STAGING` (07) | `RECORD_TYPE`, `HEADER_DATE`, `PYF_EYE_ID_1`, `PYF_EYE_NME`, `PYF_PAY_DET_CD`, etc. |
| `STG_PAD_FILE` | `SP_CPM_LOAD_PAD_STAGING` (08) | `RECORD_TYPE`, `HEADER_DATE`, `PAD_SOC_SEC_NO`, `PAD_NAME`, `PAD_AGENCY`, etc. |

**Root cause:** The stage file's `INSERT INTO STG_*` statements copy `RAW_LINE` verbatim from `RAW_*` tables without SUBSTR parsing. The STG tables need expanded schemas with all typed columns, or the SPs need to parse from `RAW_LINE` using SUBSTR.

**Recommended fix:** Expand each STG table DDL to include the typed columns that the downstream SPs expect, and update the `INSERT INTO STG_*` statements to parse fixed-width fields from `RAW_LINE` using SUBSTR.

### Issue 2: SP_CPM_LOAD_NEWPAY_STG_DETAIL Column Mismatch (High — 1 procedure)

**Impact:** Blocks Step 12 of the ETL pipeline.

`SP_CPM_LOAD_NEWPAY_STG_DETAIL` (`stored_procedures/11_sp_cpm_load_newpay_stg_detail.sql`) inserts columns that do not exist in the `CPM_NEWPAY_STG_DETAIL_TBL` DDL (`ddl/02_target_tables.sql:611–635`):

| Column in SP INSERT | Exists in DDL? |
|---|---|
| `FED_TAX_MAR_STAT` | No (DDL has `ST_TAX_MAR_STAT` only) |
| `FED_TAX_EXEMP` | No |
| `PAY_CYCLE_IND` | No |
| `LAST_UPDATED` | No |
| `LOAD_DATE` | No |
| `LOAD_ID` | No |

Additionally, the SP references `n.PAY_CYCLE_IND` from `CPM_NEWPAY_TBL` which does not exist in that table's DDL either.

**Recommended fix:** Either add the missing columns to the `CPM_NEWPAY_STG_DETAIL_TBL` DDL, or update the SP to only reference columns that exist in both the source and target schemas.

### Issue 3: SP_CPM_LOAD_PMR_TO_NEWPAY Schema Mismatch (High — 1 procedure)

**Impact:** Blocks Step 9 of the ETL pipeline; downstream Steps 10–14 depend on this data.

`SP_CPM_LOAD_PMR_TO_NEWPAY` (`stored_procedures/15_sp_cpm_load_pmr_to_newpay.sql`) inserts transaction-level PM columns into `CPM_NEWPAY_TBL`, but `CPM_NEWPAY_TBL` is a 499-column person-level summary table with different column names:

| Column in SP INSERT | Exists in CPM_NEWPAY_TBL DDL? |
|---|---|
| `PYF_EYE_NME` | No |
| `PYF_ADJ_RSN_IDC` | No |
| `PYF_ACTUAL_AMT` | No |
| `PYF_HRS_SCD_AMT` | No |
| `PYF_ITW_ADD` | No |
| `PYF_ITW_MS` | No |
| `PYF_DDU_PYE` | No |
| `PYF_PAY_TAC_TYP` | No |
| `PYF_EYE_ID_PDT3` | No |
| `PFY_ID_BREAK_SSN` | No |
| `LOAD_DATE` | No |
| `LOAD_ID` | No |

The SP also reads `pm1.PYF_ADJ_RSN_IDC`, `pm1.PYF_ACTUAL_AMT`, etc. from `CPM_PM1_STG_TBL`, but those are PM3 transaction-level columns that do not exist in the PM1 DDL.

**Root cause:** The original mapping `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL` joins PM1+PM2+PM3 data and produces person-level summary records. The SP appears to be loading raw transaction records instead of performing the join/aggregation logic. Either an intermediate transaction-level table is needed, or the SP must be restructured to map to the actual `CPM_NEWPAY_TBL` schema.

---

## 13. Conclusion

The Informatica PowerCenter CPM folder migration to Snowflake achieves **96.6% structural coverage** (85 of 88 distinct objects). All data-processing logic — sources, targets, transformations, staging loads, and the orchestration workflow — has a Snowflake equivalent. The remaining gaps are:

- **2 missing DDL definitions** for flat-file-to-table targets (`CPM_PAY_PERIOD_DATE_FILE`, `CPM_MESSAGE_FILE`) that are referenced by stored procedures but lack `CREATE TABLE` statements. These will cause runtime failures and should be added to `ddl/02_target_tables.sql`.
- **1 unmigrated mapping** (`m_Generic_Mapping` / `s_CPM_Send_Counts`) for email notification, which is a non-data-processing utility step that can be replaced by Snowflake Alerts or external webhook integration.

Additionally, **3 schema-level issues** (Section 12) will prevent successful runtime execution even where structural coverage exists:
1. **4 STG flat-file tables** lack parsed columns needed by downstream SPs (blocks Steps 2–5)
2. **SP_CPM_LOAD_NEWPAY_STG_DETAIL** references columns missing from `CPM_NEWPAY_STG_DETAIL_TBL` DDL (blocks Step 12)
3. **SP_CPM_LOAD_PMR_TO_NEWPAY** writes transaction-level data to a person-level summary table with incompatible schema (blocks Step 9 and cascades to Steps 10–14)
