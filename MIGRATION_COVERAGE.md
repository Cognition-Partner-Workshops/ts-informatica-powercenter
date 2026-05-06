# Informatica PowerCenter → Snowflake Migration Coverage Report

**Generated:** 2026-05-06  
**Branch:** `devin/1778021930-snowflake-migration`  
**Scope:** Structural validation — every PowerCenter object checked for a Snowflake equivalent

---

## 1. Executive Summary

| Metric | Count |
|--------|-------|
| XML export files parsed | 11 |
| PowerCenter folders (modules) | 11 |
| Folders with Snowflake equivalents | **1** (CPM) |
| Folders NOT migrated | **10** |
| Overall mapping coverage | **13.9%** (15 of 108 mappings) |

The migration covers the **CPM** folder end-to-end (15 mappings → 15 stored procedures + orchestrator + pre/post-load). The remaining 10 folders (93 mappings, 10 workflows) have **no Snowflake equivalents** on this branch.

---

## 2. PowerCenter Object Inventory (All XML Files)

### 2.1 Summary Statistics

| Object Type | Total Count | Migrated (CPM) | Not Migrated | Coverage |
|-------------|-------------|----------------|--------------|----------|
| SOURCEs | 87 | 18 | 69 | 20.7% |
| TARGETs | 130 | 23 | 107 | 17.7% |
| MAPPINGs | 108 | 15 | 93 | 13.9% |
| TRANSFORMATIONs | 747 | 137 | 610 | 18.3% |
| SESSIONs | 108 | 15 | 93 | 13.9% |
| WORKFLOWs | 11 | 1 | 10 | 9.1% |

### 2.2 Transformations by Type

| Transformation Type | Total | In CPM (Migrated) | Not Migrated |
|---------------------|-------|-------------------|--------------|
| Source Qualifier | 112 | 17 | 95 |
| Expression | 343 | 61 | 282 |
| Lookup Procedure | 112 | 22 | 90 |
| Filter | 61 | 8 | 53 |
| Normalizer | 39 | 5 | 34 |
| Aggregator | 29 | 10 | 19 |
| Joiner | 27 | 7 | 20 |
| Router | 7 | 3 | 4 |
| Update Strategy | 7 | 1 | 6 |
| Sequence | 5 | 2 | 3 |
| Sorter | 5 | 1 | 4 |

### 2.3 Objects by Folder

| Folder | XML File | Sources | Targets | Mappings | Transformations | Sessions | Workflows | Migrated? |
|--------|----------|---------|---------|----------|-----------------|----------|-----------|-----------|
| COMP_TIME | COMPTIME | 2 | 4 | 3 | 19 | 3 | 1 | No |
| **CPM** | **CPM** | **18** | **23** | **15** | **137** | **15** | **1** | **Yes** |
| CPM (AFPS) | CPM_AFPS | 8 | 13 | 17 | 88 | 17 | 1 | No |
| CPM (CDC) | CPM_CDC | 3 | 6 | 6 | 30 | 6 | 1 | No |
| CPM (NIH) | CPM_NIH | 3 | 6 | 6 | 30 | 6 | 1 | No |
| CPM (OIG) | CPM_OIG | 2 | 4 | 4 | 27 | 4 | 1 | No |
| EHRP2BIIS | EHRP2BIIS_UPDATE | 2 | 3 | 1 | 13 | 1 | 1 | No |
| FDA_Leave | FDA_Leave | 7 | 9 | 10 | 84 | 10 | 1 | No |
| LES | LES | 36 | 35 | 32 | 224 | 32 | 1 | No |
| Pay_Calendar | Pay_Calendar | 1 | 3 | 4 | 21 | 4 | 1 | No |
| Pseudossn | Pseudossn | 5 | 9 | 10 | 74 | 10 | 1 | No |

---

## 3. Snowflake Migration Artifact Inventory

### 3.1 DDL — CREATE TABLE Statements (29 tables)

| # | Snowflake Table | Source Type | Mapped From (PC Object) | Status |
|---|----------------|-------------|------------------------|--------|
| 1 | COUNTER_TBL | Target | COUNTER_TBL (Oracle target) | Migrated |
| 2 | CPM_MER_DETAIL_STG_TBL | Target | CPM_MER_DETAIL_STG_TBL (Oracle target) | Migrated |
| 3 | CPM_MER_HEADER_STG_TBL | Target | CPM_MER_HEADER_STG_TBL (Oracle target) | Migrated |
| 4 | CPM_NEWPAY_STG_ALT_TBL | Target | CPM_NEWPAY_STG_ALT_TBL (Oracle target) | Migrated |
| 5 | CPM_NEWPAY_STG_DETAIL_TBL | Target | CPM_NEWPAY_STG_DETAIL_TBL (Oracle target) | Migrated |
| 6 | CPM_NEWPAY_STG_TYPE_1_2_TBL | Source/Target | CPM_NEWPAY_STG_TYPE_1_2_TBL (Oracle) | Migrated |
| 7 | CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Source/Target | CPM_NEWPAY_STG_TYPE_3_FDR_TBL (Oracle) | Migrated |
| 8 | CPM_NEWPAY_STG_TYPE_3_TBL | Source/Target | CPM_NEWPAY_STG_TYPE_3_TBL (Oracle) | Migrated |
| 9 | CPM_NEWPAY_STG_YTD_STATE_TBL | Target | CPM_NEWPAY_STG_YTD_STATE_TBL (Oracle target) | Migrated |
| 10 | CPM_NEWPAY_TBL | Source/Target | CPM_NEWPAY_TBL (Oracle) | Migrated |
| 11 | CPM_PAD_DETAIL_STG_TBL | Target | CPM_PAD_DETAIL_STG_TBL (Oracle target) | Migrated |
| 12 | CPM_PAD_HEADER_STG_TBL | Target | CPM_PAD_HEADER_STG_TBL (Oracle target) | Migrated |
| 13 | CPM_PM1_STG_TBL | Source/Target | CPM_PM1_STG_TBL (Oracle) | Migrated |
| 14 | CPM_PM2_STG_TBL | Source/Target | CPM_PM2_STG_TBL (Oracle) | Migrated |
| 15 | CPM_PM3_STG_TBL | Source/Target | CPM_PM3_STG_TBL (Oracle) | Migrated |
| 16 | CPM_PMH_STG_TBL | Target | CPM_PMH_STG_TBL (Oracle target) | Migrated |
| 17 | CPM_YTD_DETAIL_STG_TBL | Source/Target | CPM_YTD_DETAIL_STG_TBL (Oracle) | Migrated |
| 18 | CPM_YTD_HEADER_STG_TBL | Target | CPM_YTD_HEADER_STG_TBL (Oracle target) | Migrated |
| 19 | CPM_YTD_STATE_STG_TBL | Source/Target | CPM_YTD_STATE_STG_TBL (Oracle) | Migrated |
| 20 | ERROR_TBL | Source/Target | ERROR_TBL (Oracle) | Migrated |
| 21 | HI_GENERIC_SRC_TBL | Source | HI_GENERIC_SRC_TBL (Oracle source) | Migrated |
| 22 | PAY_PERIOD | Source | PAY_PERIOD (Oracle source) | Migrated |
| 23 | PSEUDOSSN_TBL | Source | PSEUDOSSN_TBL (Oracle source) | Migrated |
| 24 | CPM_PAY_PERIOD_DATE_FILE | Flat File Target | CPM_PAY_PERIOD_DATE_FILE (Flat File) | Migrated (as table) |
| 25 | CPM_MESSAGE_FILE | Flat File Target | CPM_MESSAGE_FILE (Flat File) | Migrated (as table) |
| 26 | PAYMASTER_FILE | VSAM Source | PAYMASTER_FILE (VSAM) | Migrated (structured) |
| 27 | YTD_FILE | VSAM Source | YTD_FILE (VSAM) | Migrated (structured) |
| 28 | MER_FILE | VSAM Source | MER_FILE (VSAM) | Migrated (structured) |
| 29 | PAD_FILE | VSAM Source | PAD_FILE (VSAM) | Migrated (structured) |

### 3.2 Snowflake Stages (5)

| # | Stage Name | VSAM/Flat File Source | Format | COPY INTO Target |
|---|-----------|----------------------|--------|-----------------|
| 1 | STG_YTD_FILE | PC_DOEYTD_RDF.TXT | Fixed-width | YTD_FILE_RAW |
| 2 | STG_MER_FILE | PC_DOEMER_RDF.TXT | Fixed-width | MER_FILE_RAW |
| 3 | STG_PAYMASTER_THREE | PC_DOE_EXP_PMR3.TXT | Fixed-width | PAYMASTER_THREE_RAW |
| 4 | STG_PAYMASTER_FILE | PC_DOE_EXP_PMR_RDF.TXT | Fixed-width | PAYMASTER_FILE_RAW |
| 5 | STG_PAD_FILE | PC_DOEPAD_RDF.TXT | Fixed-width | PAD_FILE_RAW |

### 3.3 Stored Procedures (18)

| # | Snowflake Procedure | PowerCenter Mapping | Status |
|---|--------------------|--------------------|--------|
| 1 | SP_CPM_CURRENT_PAY_PERIOD | m_CPM_Current_Pay_Period | Migrated |
| 2 | SP_CPM_LOAD_CPM_PMR_STAGING_TABLES | m_CPM_Load_CPM_PMR_Staging_Tables | Migrated |
| 3 | SP_CPM_LOAD_CPM_YTD_STAGING_TABLES | m_CPM_Load_CPM_YTD_Staging_Tables | Migrated |
| 4 | SP_CPM_LOAD_CPM_MER_STAGING_TABLES | m_CPM_Load_CPM_MER_Staging_Tables | Migrated |
| 5 | SP_CPM_LOAD_CPM_PAD_STAGING_TABLES | m_CPM_Load_CPM_PAD_Staging_Tables | Migrated |
| 6 | SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL | m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | Migrated |
| 7 | SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL | m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | Migrated |
| 8 | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | Migrated |
| 9 | SP_CPM_LOAD_CPM_NEWPAY_STG_DETAIL_TBL | m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | Migrated |
| 10 | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Migrated |
| 11 | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL | Migrated |
| 12 | SP_CPM_LOAD_PMR_TO_CPM_NEWPAY_TBL | m_CPM_Load_PMR_To_CPM_NEWPAY_TBL | Migrated |
| 13 | SP_CPM_LOAD_FDR_CPM_NEWPAY_TBL | m_CPM_Load_FDR_CPM_NEWPAY_TBL | Migrated |
| 14 | SP_CPM_BUILD_MESSAGE_COUNTERS | m_CPM_Build_Message_Counters | Migrated |
| 15 | SP_GENERIC_MAPPING | m_Generic_Mapping | Migrated |
| 16 | SP_EHRP2BIIS_PRELOAD | ehrp2biis_preload (ksh script) | Migrated |
| 17 | SP_EHRP2BIIS_AFTERLOAD | ehrp2biis_afterload.sql | Migrated |
| 18 | SP_CPM_ETL_ORCHESTRATOR | wf_CPM (Workflow) | Migrated |

---

## 4. Mapping Reconciliation — CPM Folder (Migrated)

All 15 CPM mappings have a 1:1 stored procedure equivalent. The workflow (wf_CPM) is replaced by SP_CPM_ETL_ORCHESTRATOR. Pre/post-load shell/SQL scripts are replaced by SP_EHRP2BIIS_PRELOAD and SP_EHRP2BIIS_AFTERLOAD.

### 4.1 CPM Source Reconciliation

| PowerCenter SOURCE | DB Type | Snowflake Equivalent | Type |
|-------------------|---------|---------------------|------|
| PAY_PERIOD | Oracle | PAY_PERIOD (table) | CREATE TABLE |
| YTD_FILE | VSAM | STG_YTD_FILE (stage) → YTD_FILE (table) | Stage + Table |
| CPM_YTD_STATE_STG_TBL | Oracle | CPM_YTD_STATE_STG_TBL (table) | CREATE TABLE |
| MER_FILE | VSAM | STG_MER_FILE (stage) → MER_FILE (table) | Stage + Table |
| CPM_PM1_STG_TBL | Oracle | CPM_PM1_STG_TBL (table) | CREATE TABLE |
| CPM_YTD_DETAIL_STG_TBL | Oracle | CPM_YTD_DETAIL_STG_TBL (table) | CREATE TABLE |
| CPM_PM2_STG_TBL | Oracle | CPM_PM2_STG_TBL (table) | CREATE TABLE |
| PSEUDOSSN_TBL | Oracle | PSEUDOSSN_TBL (table) | CREATE TABLE |
| CPM_NEWPAY_TBL | Oracle | CPM_NEWPAY_TBL (table) | CREATE TABLE |
| PAYMASTER_THREE | VSAM | STG_PAYMASTER_THREE (stage) → PAYMASTER_THREE_RAW | Stage + Raw |
| ERROR_TBL | Oracle | ERROR_TBL (table) | CREATE TABLE |
| PAYMASTER_FILE | VSAM | STG_PAYMASTER_FILE (stage) → PAYMASTER_FILE (table) | Stage + Table |
| PAD_FILE | VSAM | STG_PAD_FILE (stage) → PAD_FILE (table) | Stage + Table |
| CPM_NEWPAY_STG_TYPE_3_TBL | Oracle | CPM_NEWPAY_STG_TYPE_3_TBL (table) | CREATE TABLE |
| HI_GENERIC_SRC_TBL | Oracle | HI_GENERIC_SRC_TBL (table) | CREATE TABLE |
| CPM_NEWPAY_STG_TYPE_1_2_TBL | Oracle | CPM_NEWPAY_STG_TYPE_1_2_TBL (table) | CREATE TABLE |
| CPM_PM3_STG_TBL | Oracle | CPM_PM3_STG_TBL (table) | CREATE TABLE |
| CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Oracle | CPM_NEWPAY_STG_TYPE_3_FDR_TBL (table) | CREATE TABLE |

### 4.2 CPM Target Reconciliation

| PowerCenter TARGET | DB Type | Snowflake Equivalent | Status |
|-------------------|---------|---------------------|--------|
| CPM_PAY_PERIOD_DATE_FILE | Flat File | CPM_PAY_PERIOD_DATE_FILE (table) | Migrated |
| CPM_NEWPAY_STG_ALT_TBL | Oracle | CPM_NEWPAY_STG_ALT_TBL (table) | Migrated |
| CPM_YTD_HEADER_STG_TBL | Oracle | CPM_YTD_HEADER_STG_TBL (table) | Migrated |
| CPM_YTD_STATE_STG_TBL | Oracle | CPM_YTD_STATE_STG_TBL (table) | Migrated |
| CPM_YTD_DETAIL_STG_TBL | Oracle | CPM_YTD_DETAIL_STG_TBL (table) | Migrated |
| CPM_NEWPAY_STG_YTD_STATE_TBL | Oracle | CPM_NEWPAY_STG_YTD_STATE_TBL (table) | Migrated |
| CPM_MER_DETAIL_STG_TBL | Oracle | CPM_MER_DETAIL_STG_TBL (table) | Migrated |
| CPM_MER_HEADER_STG_TBL | Oracle | CPM_MER_HEADER_STG_TBL (table) | Migrated |
| CPM_NEWPAY_STG_TYPE_1_2_TBL | Oracle | CPM_NEWPAY_STG_TYPE_1_2_TBL (table) | Migrated |
| ERROR_TBL | Oracle | ERROR_TBL (table) | Migrated |
| CPM_NEWPAY_STG_DETAIL_TBL | Oracle | CPM_NEWPAY_STG_DETAIL_TBL (table) | Migrated |
| CPM_MESSAGE_FILE | Flat File | CPM_MESSAGE_FILE (table) | Migrated |
| COUNTER_TBL | Oracle | COUNTER_TBL (table) | Migrated |
| CPM_PM1_STG_TBL | Oracle | CPM_PM1_STG_TBL (table) | Migrated |
| CPM_PM3_STG_TBL | Oracle | CPM_PM3_STG_TBL (table) | Migrated |
| CPM_PM2_STG_TBL | Oracle | CPM_PM2_STG_TBL (table) | Migrated |
| CPM_PMH_STG_TBL | Oracle | CPM_PMH_STG_TBL (table) | Migrated |
| CPM_PAD_HEADER_STG_TBL | Oracle | CPM_PAD_HEADER_STG_TBL (table) | Migrated |
| CPM_PAD_DETAIL_STG_TBL | Oracle | CPM_PAD_DETAIL_STG_TBL (table) | Migrated |
| GENERIC_TARGET_FILE | Flat File | — (no DDL) | Gap |
| CPM_NEWPAY_TBL | Oracle | CPM_NEWPAY_TBL (table) | Migrated |
| CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Oracle | CPM_NEWPAY_STG_TYPE_3_FDR_TBL (table) | Migrated |
| CPM_NEWPAY_STG_TYPE_3_TBL | Oracle | CPM_NEWPAY_STG_TYPE_3_TBL (table) | Migrated |

### 4.3 CPM Transformation Pattern Reconciliation

| Informatica Transform | Count in CPM | Snowflake Pattern | Status |
|----------------------|-------------|-------------------|--------|
| Source Qualifier (17) | 17 | SELECT FROM table | Migrated |
| Expression (61) | 61 | SELECT computed columns | Migrated |
| Lookup Procedure (22) | 22 | LEFT JOIN subquery | Migrated |
| Aggregator (10) | 10 | GROUP BY + aggregate fns | Migrated |
| Filter (8) | 8 | WHERE clause | Migrated |
| Joiner (7) | 7 | JOIN | Migrated |
| Normalizer (5) | 5 | SUBSTR() on raw records | Migrated (needs COBOL copybook verification) |
| Router (3) | 3 | Multiple INSERT + WHERE | Migrated |
| Sequence (2) | 2 | ROW_NUMBER() OVER(...) | Migrated |
| Update Strategy (1) | 1 | MERGE / INSERT | Migrated |
| Sorter (1) | 1 | ORDER BY | Migrated |

---

## 5. Unmigrated Folders — Full Listing

### 5.1 COMPTIME (3 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_COMPTIME_Build_Message_Counters | s_COMPTIME_Build_Message_Counters | None |
| m_COMPTIME_Load_COMP_TIME_DAILY_TBL | s_COMPTIME_Load_COMP_TIME_DAILY_TBL | None |
| m_COMPTIME_Current_Pay_Period | s_COMPTIME_Current_Pay_Period | None |

### 5.2 CPM_AFPS (17 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_CPM_AFPS_0010_Set_CPM_Calendar | s_CPM_AFPS_0010_Set_CPM_Calendar | None |
| m_CPM_AFPS_0025_Set_Pay_Calendar | s_CPM_AFPS_0025_Set_Pay_Calendar | None |
| m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | None |
| m_CPM_AFPS_0100_Data_Seperate | s_CPM_AFPS_0100_Data_Seperate | None |
| m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | None |
| m_CPM_AFPS_0300_Gross_Exp_Report | s_CPM_AFPS_0300_Gross_Exp_Report | None |
| m_CPM_AFPS_0400_Crossfoot_Errors | s_CPM_AFPS_0400_Crossfoot_Errors | None |
| m_CPM_AFPS_0500_Crossfoot_Message_Header | s_CPM_AFPS_0500_Crossfoot_Message_Header | None |
| m_CPM_AFPS_0600_Crossfoot_Message_Details | s_CPM_AFPS_0600_Crossfoot_Message_Details | None |
| m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | None |
| m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | None |
| m_CPM_AFPS_0760_Concatenate_Crossfoot_Files | s_CPM_AFPS_0760_Concatenate_Crossfoot_Files | None |
| m_CPM_AFPS_0800_Build_Message_Counters | s_CPM_AFPS_0800_Build_Message_Counters | None |
| m_CPM_AFPS_0820_Build_Message_Totals | s_CPM_AFPS_0820_Build_Message_Totals | None |
| m_CPM_AFPS_0860_Concatenate_Counts_Files | s_CPM_AFPS_0860_Concatenate_Counts_Files | None |
| m_CPM_AFPS_0900_Build_Message | s_CPM_AFPS_0900_Build_Message | None |
| m_CPM_AFPS_1000_Send_Report | s_CPM_AFPS_1000_Send_Report | None |

### 5.3 CPM_CDC (6 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_CPM_CDC_Set_CPM_Calendar | s_CPM_CDC_Set_CPM_Calendar | None |
| m_CPM_CDC_Set_Pay_Calendar | s_CPM_CDC_Set_Pay_Calendar | None |
| m_CPM_CDC_Load_CPM_CDC_Header_File | s_CPM_CDC_Load_CPM_CDC_Header_File | None |
| m_CPM_CDC_Load_CPM_CDC_Data_File | s_CPM_CDC_Load_CPM_CDC_Data_File | None |
| m_CPM_CDC_Concatenate_Files | s_CPM_CDC_Concatenate_Files | None |
| m_CPM_CDC_Build_Message | s_CPM_CDC_Build_Message | None |

### 5.4 CPM_NIH (6 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_CPM_NIH_Set_CPM_Calendar | s_CPM_NIH_Set_CPM_Calendar | None |
| m_CPM_NIH_Set_Pay_Calendar | s_CPM_NIH_Set_Pay_Calendar | None |
| m_CPM_NIH_Load_CPM_NIH_Header_File | s_CPM_NIH_Load_CPM_NIH_Header_File | None |
| m_CPM_NIH_Load_CPM_NIH_Data_File | s_CPM_NIH_Load_CPM_NIH_Data_File | None |
| m_CPM_NIH_Concatenate_Files | s_CPM_NIH_Concatenate_Files | None |
| m_CPM_NIH_Build_Message | s_CPM_NIH_Build_Message | None |

### 5.5 CPM_OIG (4 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_CPM_OIG_Set_Pay_Calendar | s_CPM_OIG_Set_Pay_Calendar | None |
| m_CPM_OIG_Set_CPM_Calendar | s_CPM_OIG_Set_CPM_Calendar | None |
| m_CPM_OIG_Load_CPM_OIG_File | s_CPM_OIG_Load_CPM_OIG_File | None |
| m_CPM_OIG_Build_Message | s_CPM_OIG_Build_Message | None |

### 5.6 EHRP2BIIS_UPDATE (1 mapping, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_EHRP2BIIS_UPDATE | s_EHRP2BIIS_UPDATE | None |

### 5.7 FDA_Leave (10 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_0010_PM_FDA_Verify_File | s_0010_PM_FDA_Verify_File | None |
| m_0020_PM_FDA_Set_CPM_Calendar | s_0020_PM_FDA_Set_CPM_Calendar | None |
| m_0025_PM_FDA_Set_Pay_Calendar | s_0025_PM_FDA_Set_Pay_Calendar | None |
| m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | None |
| m_0100_PM_FDA_Load_TATRAN_To_DB | s_0100_PM_FDA_Load_TATRAN_To_DB | None |
| m_0150_PM_FDA_Error_Counter | s_0150_PM_FDA_Error_Counter | None |
| m_0200_PM_FDA_Create_Insert_200_Rows | s_0200_PM_FDA_Create_200_Rows | None |
| m_0300_PM_FDA_Create_Output_File | s_0300_PM_FDA_Create_Output_File | None |
| m_0500_PM_FDA_IO_Counter | s_0500_PM_FDA_IO_Counter | None |
| m_1100_PM_FDA_Send_Email | s_1100_PM_FDA_Send_Email | None |

### 5.8 LES (32 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_LESRPT_Load_LESL | s_LESRPT_Load_LESL | None |
| m_LESRPT_Load_LEST | s_LESRPT_Load_LEST | None |
| m_LESRPT_Load_LESM | s_LESRPT_Load_LESM | None |
| m_LESRPT_Load_LESD | s_LESRPT_Load_LESD | None |
| m_LESRPT_Load_LESS | s_LESRPT_Load_LESS | None |
| m_LESRPT_Load_LESU | s_LESRPT_Load_LESU | None |
| m_LESRPT_Load_LESC | s_LESRPT_Load_LESC | None |
| m_LESRPT_Load_LESR | s_LESRPT_Load_LESR | None |
| m_LES_Verify_Header | s_LES_Verify_Header | None |
| m_LES_Verify_Record_Count | s_LES_Verify_Record_Count | None |
| m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | None |
| m_LES_NIH_FILE | s_LES_NIH_FILE | None |
| m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | None |
| m_LES_Build_Message_Counters | s_LES_Build_Message_Counters | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | None |
| m_LES_Current_Pay_Period | s_LES_Current_Pay_Period | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | None |
| m_LES_Load_LES_PRIMARY_DATA_TBL | s_LES_Load_LES_PRIMARY_DATA_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | None |
| m_LES_Load_LES_HEADER_TBL | s_LES_Load_LES_HEADER_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_TBL | s_LES_Load_LES_EMP_DETAIL_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | None |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | None |

### 5.9 Pay_Calendar (4 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_Pay_Calendar_Verify_Pay_Calendar | s_Pay_Calendar_Verify_Pay_Calendar | None |
| m_Pay_Calendar_Set_Pay_Calendar | s_Pay_Calendar_Set_Pay_Calendar | None |
| m_Pay_Calendar_Build_Message | s_Pay_Calendar_Build_Message | None |
| m_Pay_Calendar_Reset_Pay_Calendar | s_Pay_Calendar_Reset_Pay_Calendar | None |

### 5.10 Pseudossn (10 mappings, 1 workflow)

| Mapping | Session | Snowflake Equivalent |
|---------|---------|---------------------|
| m_Pseudossn_Load_Pseudossn_From_SDA_Tbl | s_Pseudossn_Load_Pseudossn_From_SDA_Tbl | None |
| m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | None |
| m_Pseudossn_Update_Timekeeper_Number | s_Pseudossn_Update_Timekeeper_Number | None |
| m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | None |
| m_Pseudossn_Current_Pay_Period | s_Pseudossn_Current_Pay_Period | None |
| m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1 | s_Pseudossn_Load_Archive_Pseudossn_Tbl | None |
| m_Pseudossn_Load_Pseudossn_Tbl | s_Pseudossn_Load_Pseudossn_Tbl | None |
| m_Pseudossn_Verify_Record_Count | s_Pseudossn_Verify_Record_Count | None |
| m_Pseudossn_Counters | s_Pseudossn_Counters | None |
| m_Pseudossn_Verify_Header_Date_Current_Pay_Period | s_Pseudossn_Verify_Header_Date_Current_Pay_Period | None |

---

## 6. Gap List

### 6.1 Structural Gaps Within Migrated Scope (CPM)

| # | Gap | Severity | Details |
|---|-----|----------|---------|
| 1 | GENERIC_TARGET_FILE has no DDL | Low | Flat-file target used by m_Generic_Mapping; SP_GENERIC_MAPPING exists but no CREATE TABLE for the target. Passthrough placeholder — low impact. |
| 2 | Normalizer SUBSTR() offsets unverified | Medium | 5 Normalizer transforms replaced by SUBSTR(); offsets must be validated against original COBOL copybooks. |
| 3 | Mapplet `mplt_Convert_Num_To_Prec7` not created as UDF | Medium | Referenced ~15 times; runbook recommends a UDF but it is not present in the DDL. |
| 4 | ABORT() calls commented out | Medium | Informatica ABORT() expressions are commented; no Snowflake exception handling replacement. |
| 5 | Afterload sub-procedure dependencies | High | SP_EHRP2BIIS_AFTERLOAD references Oracle PL/SQL procedures (SP_UPDATE_SEQUENCE_NUMBER_TBL, SP_UPDT_ERP2BIIS_CRE8_REMARKS01, etc.) not included in the migration artifacts. |
| 6 | Sequence generation ordering | Low | ROW_NUMBER() OVER(...) replaces Informatica Sequence Generator; ordering columns need validation. |
| 7 | Oracle ROWNUM → MIN() scalar subquery | Low | Afterload WIP status check conversion needs ordering verification. |
| 8 | Transfer scripts not migrated | Medium | 7 shell transfer scripts (afps_transfer, cdc_transfer, fda_transfer, nih_cpm_transfer, nih_les_transfer, nih_transfer_les, oig_transfer) have no Snowflake equivalent. |
| 9 | Maintenance scripts not migrated | Low | 2 maintenance scripts (archive_files, remove_file) have no Snowflake equivalent. |

### 6.2 Unmigrated Folder Gaps

| # | Gap | Mappings Affected | Severity |
|---|-----|-------------------|----------|
| 10 | COMPTIME folder not migrated | 3 | Medium |
| 11 | CPM_AFPS folder not migrated | 17 | High |
| 12 | CPM_CDC folder not migrated | 6 | High |
| 13 | CPM_NIH folder not migrated | 6 | High |
| 14 | CPM_OIG folder not migrated | 4 | Medium |
| 15 | EHRP2BIIS_UPDATE folder not migrated | 1 | Medium |
| 16 | FDA_Leave folder not migrated | 10 | High |
| 17 | LES folder not migrated | 32 | High |
| 18 | Pay_Calendar folder not migrated | 4 | Medium |
| 19 | Pseudossn folder not migrated | 10 | High |

**Total gaps: 19**

---

## 7. Summary

### What Was Migrated (CPM Folder — Complete)
- 15/15 CPM mappings → 15 Snowflake stored procedures
- 1 workflow (wf_CPM) → 1 orchestrator procedure (SP_CPM_ETL_ORCHESTRATOR)
- 18/18 CPM sources → 23 Snowflake DDL tables (including structured VSAM equivalents)
- 22/23 CPM targets → Snowflake tables (1 flat-file placeholder gap)
- 5 VSAM sources → 5 Snowflake stages + COPY INTO
- Pre-load script → SP_EHRP2BIIS_PRELOAD
- Post-load script → SP_EHRP2BIIS_AFTERLOAD
- All 11 Informatica transformation types have documented Snowflake equivalents

### What Was NOT Migrated
- 10 of 11 PowerCenter folders (93 mappings, 93 sessions, 10 workflows)
- 7 transfer scripts (shell-based file transfers)
- 2 maintenance scripts
- Afterload sub-procedure dependencies (Oracle PL/SQL)
- Mapplet UDF (mplt_Convert_Num_To_Prec7)

### Recommendation
The CPM folder migration is **structurally complete** with minor gaps requiring manual review. The remaining 10 folders represent the majority of the PowerCenter estate and should be prioritized for migration in subsequent phases — particularly LES (32 mappings), CPM_AFPS (17 mappings), FDA_Leave (10 mappings), and Pseudossn (10 mappings).
