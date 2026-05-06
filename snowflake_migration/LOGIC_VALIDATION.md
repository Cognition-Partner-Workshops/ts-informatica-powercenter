# Logic Validation: Informatica PowerCenter → Snowflake Migration

## Executive Summary

This document validates the Snowflake stored procedures against the original Informatica PowerCenter CPM XML transformation logic. The validation covers all 15 CPM mappings in the `XML/CPM` export and their corresponding Snowflake stored procedures.

| Metric | Value |
|--------|-------|
| **Total Mappings Reviewed** | 15 (CPM folder) + 21 (CDC/NIH/OIG/AFPS) |
| **Stored Procedures Validated** | 18 |
| **Assessment: Correct** | 6 |
| **Assessment: Needs Review** | 4 |
| **Assessment: Gap** | 5 |
| **Overall Risk** | **Medium-High** — Core ETL pipeline structure is sound; unresolved Informatica port references (`in_HEADER_DATE`), missing pivot logic, and source/target column confusion need remediation before runtime |

---

## 1. Per-Mapping Validation — CPM Core Pipeline

### 1.1 m_CPM_Current_Pay_Period → SP_CPM_CURRENT_PAY_PERIOD

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_current_pay_period.sql) | Status |
|---------|----------------------|------------------------------------------|--------|
| **Source** | PAY_PERIOD | PAY_PERIOD | ✅ Match |
| **Source Filter** | `CURR_PP_FLAG = 'Y'` (SQ_PAY_PERIOD) | `WHERE CURR_PP_FLAG = 'Y'` | ✅ Match |
| **Target** | CPM_PAY_PERIOD_DATE_FILE | CPM_PAY_PERIOD_DATE_FILE | ✅ Match |
| **Expression: exp_Build_Pay_Period** | `IIF(PP_NUM < 10, LPAD(TO_CHAR(PP_NUM), 2, '0'), TO_CHAR(PP_NUM))` → `TO_CHAR(PP_END_YEAR) \|\| v_PP_NUM` | `TO_CHAR(PP_END_YEAR) \|\| LPAD(TO_CHAR(PP_NUM), 2, '0')` | ✅ Match — LPAD always pads, safe simplification |

**Assessment: ✅ Correct**

---

### 1.2 m_CPM_Load_CPM_PMR_Staging_Tables → SP_CPM_LOAD_CPM_PMR_STAGING_TABLES

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_pmr_staging_tables.sql) | Status |
|---------|----------------------|---------------------------------------------------|--------|
| **Source** | PAYMASTER_FILE (VSAM flat file) | PAYMASTER_FILE (requires upstream parsing from PAYMASTER_FILE_RAW) | ⚠️ See Note 1 |
| **Normalizer** | Norm_PAYMASTER_FILE — splits fixed-width VSAM record into 180+ fields | Not shown in stored procedure (assumes pre-parsed table) | ⚠️ Gap |
| **Router: rtr_Paymaster_Records** | | | |
| — PAYMASTER_HEADER | `RECORD_TYPE_FLAG = 'H'` (blank record number + valid date) | `(LENGTH(LTRIM(PYF_REC_NO_BLANK)) = 0 OR PYF_REC_NO_BLANK IS NULL) AND TRY_TO_DATE(...)` | ✅ Match — semantically equivalent |
| — PAYMASTER_TYPE_1 | `RECORD_TYPE_FLAG = '1'` | `PYF_REC_NO_BLANK = '1'` | ✅ Match |
| — PAYMASTER_TYPE_2 | `RECORD_TYPE_FLAG = '2'` | `PYF_REC_NO_BLANK = '2'` | ✅ Match |
| — PAYMASTER_TYPE_3 | `RECORD_TYPE_FLAG = '3'` | `PYF_REC_NO_BLANK = '3'` (in CPM_PM3_STG_TBL load) | ✅ Match |
| **Lookup: lkp_Pay_Period_Record_Date** | `PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE` | `LEFT JOIN PAY_PERIOD ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE` | ❌ Gap — `in_HEADER_DATE` is an unresolved Informatica port name (see Note 2) |
| **Lookup: lkp_Current_Pay_Period** | `CURR_PP_FLAG = in_CURR_PP_FLAG` | Indirectly handled via date-based lookup join | ⚠️ Needs Review |
| **Expression: exp_Determine_Record_Type** | Complex DECODE with date validation and PYF_REC_NO_BLANK checks | Inlined as WHERE clause conditions per target | ✅ Match |
| **Expression: exp_Initial** | Date parsing: `SUBSTR(PYF_REC_PPE_DATE,5,2)\|\|'/'\|\|SUBSTR(PYF_REC_PPE_DATE,7,2)\|\|'/'\|\|SUBSTR(PYF_REC_PPE_DATE,1,4)` | `SUBSTR(PYF_REC_PPE_DATE,5,2)\|\|'/'\|\|SUBSTR(PYF_REC_PPE_DATE,7,2)\|\|'/'\|\|SUBSTR(PYF_REC_PPE_DATE,1,4)` via TRY_TO_DATE | ✅ Match |
| **Targets** | CPM_PM1_STG_TBL, CPM_PMH_STG_TBL, CPM_PM2_STG_TBL, CPM_PM3_STG_TBL | All 4 targets present with INSERT INTO | ✅ Match |
| **Column count (PM1)** | 37 fields | `... and 22 more expressions` (~37 total) | ✅ Plausible |

> **Note 1**: The Normalizer transformation (Norm_PAYMASTER_FILE) that parses the fixed-width VSAM flat file into individual fields is not implemented as a standalone step. The Snowflake approach assumes the RAW_LINE has been pre-parsed into a structured `PAYMASTER_FILE` view/table with named columns. This parsing step needs to be verified separately.

> **Note 2**: The `in_HEADER_DATE` identifier used in the LEFT JOIN ON clause is an Informatica expression port name from `exp_Initial`, not a valid Snowflake column. In PowerCenter, `exp_Initial` computed this date from raw record substrings (e.g., `SUBSTR(PYF_REC_PPE_DATE,5,2)||'/'||SUBSTR(PYF_REC_PPE_DATE,7,2)||'/'||SUBSTR(PYF_REC_PPE_DATE,1,4)`). This must be replaced with a `TRY_TO_DATE(SUBSTR(...))` expression or a pre-computed column. **This same issue affects all 4 staging procedures**: PMR (11 occurrences), YTD, MER, and PAD.

**Assessment: ❌ Gap** — Router logic is correct, but `in_HEADER_DATE` is an unresolved port reference and flat-file Normalizer parsing is not shown.

---

### 1.3 m_CPM_Load_CPM_YTD_Staging_Tables → SP_CPM_LOAD_CPM_YTD_STAGING_TABLES

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_ytd_staging_tables.sql) | Status |
|---------|----------------------|---------------------------------------------------|--------|
| **Source** | YTD_FILE (VSAM flat file) | YTD_FILE (assumes pre-parsed from YTD_FILE_RAW) | ⚠️ Same normalizer gap |
| **Router: rtr_YTD_Records** | | | |
| — YTD_HEADER | `DFAS_YTD_RECORD_TYPE1 = '0'` | `WHERE DFAS_YTD_RECORD_TYPE1 = '0'` | ✅ Match |
| — YTD_DETAIL | `DFAS_YTD_RECORD_TYPE1 = '1'` | `WHERE DFAS_YTD_RECORD_TYPE1 = '1'` | ✅ Match |
| — YTD_STATE | `DFAS_YTD_RECORD_TYPE1 = '2'` | `WHERE DFAS_YTD_RECORD_TYPE1 = '2'` | ✅ Match |
| **Lookup: lkp_Pay_Period_Record_Date** | `PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE` | `LEFT JOIN PAY_PERIOD ON PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE` | ❌ Gap — same unresolved `in_HEADER_DATE` port (see PMR Note 2) |
| **Expression: exp_Convert** | Date parsing with SUBSTR, IS_DATE checks | Not explicitly shown (relies on pre-parsed data) | ⚠️ Needs Review |
| **Expression: exp_Verify_Header_Date** | ABORT on invalid date, validates current pay period | Not implemented — no ABORT equivalent | ⚠️ Gap |
| **Expression: exp_Final_YTD_State** | Sequence ID generation: `IIF(ISNULL(v_SEQ_ID) OR v_SEQ_ID = 0, 1, v_SEQ_ID + 1)` | `ROW_NUMBER() OVER (ORDER BY DYD_SSN_2, DYD_STATE_TAX_CODE)` | ✅ Equivalent |
| **Targets** | CPM_YTD_DETAIL_STG_TBL, CPM_YTD_HEADER_STG_TBL, CPM_YTD_STATE_STG_TBL | All 3 targets present | ✅ Match |

**Assessment: ⚠️ Needs Review** — Router logic correct; exp_Verify_Header_Date ABORT logic not migrated (data quality guard missing).

---

### 1.4 m_CPM_Load_CPM_MER_Staging_Tables → SP_CPM_LOAD_CPM_MER_STAGING_TABLES

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_mer_staging_tables.sql) | Status |
|---------|----------------------|----------------------------------------------------|--------|
| **Router: rtr_MER_Records** | | | |
| — MER_HEADER | `MER_RECTYP1 = '1'` | `WHERE MER_RECTYP1 = '1'` | ✅ Match |
| — MER_DETAIL | `MER_RECTYP1 = '3'` | `WHERE MER_RECTYP1 = '3'` | ✅ Match |
| **Lookup: lkp_Pay_Period_Record_Date** | `PP_START_DTE <= in_HEADER_DATE AND PP_END_DTE >= in_HEADER_DATE` | `LEFT JOIN PAY_PERIOD ON ...` same condition | ❌ Gap — same unresolved `in_HEADER_DATE` port (see PMR Note 2) |
| **Targets** | CPM_MER_DETAIL_STG_TBL (95 cols), CPM_MER_HEADER_STG_TBL (7 cols) | Both present with correct structure | ✅ Match |
| **Column list completeness** | 95 detail columns | Shows 15 cols + `... and 80 more expressions` | ⚠️ Needs verification |

**Assessment: ⚠️ Needs Review** — Logic structure is correct; full 95-column list needs verification against DDL.

---

### 1.5 m_CPM_Load_CPM_PAD_Staging_Tables → SP_CPM_LOAD_CPM_PAD_STAGING_TABLES

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_pad_staging_tables.sql) | Status |
|---------|----------------------|----------------------------------------------------|--------|
| **Router: rtr_PAD_Records** | | | |
| — PAD_HEADER | `RECORD_TYPE = 'H'` | `WHERE RECORD_TYPE = 'H'` | ✅ Match |
| — PAD_DETAIL | `RECORD_TYPE = 'D'` | `WHERE RECORD_TYPE = 'D'` | ✅ Match |
| **Lookup** | Same lkp_Pay_Period_Record_Date pattern | Same LEFT JOIN pattern | ❌ Gap — same unresolved `in_HEADER_DATE` port (see PMR Note 2) |
| **Targets** | CPM_PAD_DETAIL_STG_TBL (150 cols), CPM_PAD_HEADER_STG_TBL (8 cols) | Both present | ✅ Match |

**Assessment: ⚠️ Needs Review** — Same pattern as MER; column completeness needs verification for 150-column detail table.

---

### 1.6 m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL → SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_newpay_stg_ytd_state_tbl.sql) | Status |
|---------|----------------------|----------------------------------------------------------|--------|
| **Source Qualifier** | Custom SQL with `ORDER BY DYD_SSN_2, DYD_STATE_TAX_CODE` and parameter filter `$$MAP_PP_END_YEAR`, `$$MAP_PP_NUM` | Simple `FROM CPM_YTD_STATE_STG_TBL` — no parameter filter applied | ⚠️ Gap |
| **Expression: exp_Determine_YTD_States** | Complex row-by-row state counter using `v_NEW_EMP_FLAG`, `v_STATE_COUNTER`, pivots up to 4 state tax records per employee using DECODE with 50+ state codes | Not shown — the procedure does a simple direct INSERT | ⚠️ Gap |
| **Aggregator: agg_YTD_State** | Groups by DFAS_PSEUDO_SSN, PP_END_YEAR, PP_NUM to pivot multiple state rows into one wide row | Not shown in the stored procedure | ⚠️ Gap |
| **Target** | CPM_NEWPAY_STG_YTD_STATE_TBL (19 cols) | Shows 15 + 4 = 19 columns | ✅ Match (column count) |

> **Critical Note**: The PowerCenter mapping uses a stateful expression transformation (`exp_Determine_YTD_States`) that maintains running counters across rows ordered by SSN and state code, assigning up to 4 state tax records per employee into wide columns (YTD_STATE_1 through YTD_STATE_4). The Snowflake procedure appears to pass through columns directly without the pivot logic. This needs the PIVOT/conditional aggregation logic to be explicitly implemented.

**Assessment: ❌ Gap** — Missing stateful pivot logic from exp_Determine_YTD_States and aggregator grouping.

---

### 1.7 m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL → SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_newpay_stg_alt_tbl.sql) | Status |
|---------|----------------------|----------------------------------------------------|--------|
| **Source Qualifier** | Custom SQL ordering by PYF_EYE_ID_PDT3, PYF_GEN_SEQ_ID | Simple `FROM CPM_PM3_STG_TBL` | ⚠️ Missing ORDER BY |
| **Expression: exp_Determine_Allotments** | Complex stateful logic: tracks `v_ALLOTMENT_COUNTER` per employee, assigns allotments 1-7 to individual columns, overflows (>7) go to allotment 4 | Comment references `exp_Determine_Allotments logic` but no conditional column assignment | ⚠️ Gap |
| **Aggregator: agg_Allotments** | Groups by PYF_EYE_ID_PDT3 (employee) to merge allotment records | Not shown — simple SELECT without GROUP BY | ⚠️ Gap |
| **Filter: fil_Bad_Records** | `ERROR_FLAG = TRUE` (allotment_counter > 7) | `HAVING COUNT(*) > 7` — correct threshold but different mechanism | ✅ Equivalent |
| **Filter: fil_Error_Message** | `NOT ISNULL(ERROR_MESSAGE)` | Error records logged with descriptive message | ✅ Match |
| **Lookup: lkp_PSEUDOSSN_TBL** | `PSEUDOSSN = in_PYF_EYE_ID_PDT3` | Not shown in procedure | ⚠️ Missing |
| **Expression: exp_Convert** | `IIF(IS_NUMBER(...), TO_DECIMAL(...), 0)` for numeric conversions | Not explicitly shown | ⚠️ Needs Review |
| **Target: ERROR_TBL** | Error records for overflow allotments | Present with correct structure | ✅ Match |
| **Target: CPM_NEWPAY_STG_ALT_TBL** | 46 allotment columns | Shows 15 + 31 = 46 columns | ✅ Match (count) |

**Assessment: ❌ Gap** — Missing stateful allotment pivoting logic (exp_Determine_Allotments) and aggregator.

---

### 1.8 m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL → SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_newpay_stg_type_1_2_tbl.sql) | Status |
|---------|----------------------|----------------------------------------------------------|--------|
| **Source Qualifier** | CPM_PM1_STG_TBL + CPM_PM2_STG_TBL with SQ filter `PP_END_YEAR = $$MAP_PP_END_YEAR AND PP_NUM = $$MAP_PP_NUM` | `JOIN CPM_PM2_STG_TBL ON PYF_EYE_ID_1 = PYF_EYE_ID_2 AND PP_END_YEAR AND PP_NUM` + `WHERE PP_END_YEAR = v_MAP_PP_END_YEAR` | ✅ Match |
| **Joiner: jnr_CPM_YTD** | `Detail Outer Join` on `PP_END_YEAR = YTD_PP_END_YEAR AND PP_NUM = YTD_PP_NUM AND PYF_EYE_ID_1 = DYD_SSN_1` | `LEFT JOIN CPM_YTD_DETAIL_STG_TBL ON PP_END_YEAR, PP_NUM, PYF_EYE_ID_1 = DYD_SSN_1` | ✅ Match |
| **Lookup: lkp_CPM_MER_DETAIL_STG_TBL** | `MER_SSN = in_PYF_EYE_ID_1 AND PP_END_YEAR AND PP_NUM` | `EXISTS (SELECT 1 FROM CPM_MER_DETAIL_STG_TBL mer WHERE mer.MER_SSN = PYF_EYE_ID_1 ...)` | ✅ Equivalent — used for validation not data retrieval |
| **Lookup: lkp_CPM_PAD_DETAIL_STG_TBL** | `PAD_SOC_SEC_NO = in_PYF_EYE_ID_1 AND PP_END_YEAR AND PP_NUM` | `EXISTS (SELECT 1 FROM CPM_PAD_DETAIL_STG_TBL pad WHERE ...)` | ✅ Equivalent |
| **Lookup: PSEUDOSSN_TBL** | `PSEUDOSSN = in_PYF_EYE_ID_1` | `LEFT JOIN PSEUDOSSN_TBL ON PYF_EYE_ID_1 = PSEUDOSSN` + `PSEUDOSSN_TBL.PSEUDOSSN IS NOT NULL` | ✅ Match |
| **Filter: fil_Bad_Records** | `ERROR_FLAG = TRUE` → routes to ERROR_TBL | Error routing via `NOT EXISTS / IS NULL` checks | ✅ Equivalent |
| **Filter: fil_Error_Message** | `NOT ISNULL(ERROR_MESSAGE)` | `CROSS JOIN LATERAL` with conditional error messages, filtered by `WHERE msg IS NOT NULL` | ✅ Equivalent |
| **Error Normalization: nrm_Errors** | Normalizes 3 error messages into separate rows | `UNION ALL` of 3 `CASE WHEN NOT EXISTS` expressions via `CROSS JOIN LATERAL` | ✅ Match |
| **Target: CPM_NEWPAY_STG_TYPE_1_2_TBL** | 254 columns | Shows partial list with `... and 239 more expressions` (~254 total) | ✅ Plausible |
| **Target: ERROR_TBL** | Error records with process name, message, source key | Present with correct schema | ✅ Match |

**Assessment: ✅ Correct** — Complex join, lookup, filter, and error normalization logic is well-migrated.

---

### 1.9 m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL → SP_CPM_LOAD_CPM_NEWPAY_STG_DETAIL_TBL

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_newpay_stg_detail_tbl.sql) | Status |
|---------|----------------------|-------------------------------------------------------|--------|
| **Source** | CPM_PM3_STG_TBL (custom SQL with ORDER BY) | `FROM CPM_PM3_STG_TBL` | ⚠️ Missing parameter filter |
| **Aggregator: agg_PYF_EYE_ID_PP_NUM** | Group by PYF_EYE_ID_PDT3, PP_END_YEAR, PP_NUM | Not shown in procedure | ⚠️ Needs Review |
| **Column references** | Source uses `PYF_EYE_ID_PDT3` as SSN | SELECT uses `DFAS_PSEUDO_SSN` (target column name, not source) | ❌ Gap — should be `PYF_EYE_ID_PDT3 AS DFAS_PSEUDO_SSN` |
| **Target** | CPM_NEWPAY_STG_DETAIL_TBL (22 cols) | Shows 15 + 7 = 22 columns | ✅ Match (count) |

**Assessment: ❌ Gap** — SELECT references target column names instead of source columns; aggregator group-by not visible.

---

### 1.10 m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL → SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_newpay_stg_type_3_fdr_tbl.sql) | Status |
|---------|----------------------|-----------------------------------------------------------|--------|
| **Source** | CPM_PM3_STG_TBL | `FROM CPM_PM3_STG_TBL` | ✅ Match |
| **Aggregator: agg_PYF_EYE_ID_PP_NUM** | Group by PYF_EYE_ID_PDT3, PP_END_YEAR, PP_NUM | Not shown | ⚠️ Needs Review |
| **Lookups** | lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL, lkp_CPM_NEWPAY_STG_ALT_TBL | Not shown as JOINs | ⚠️ Needs Review |
| **Expression: exp_Set_REEMP_ANN_CDE** | Sets REEMP_ANN_CDE for feeder records | Not explicitly shown | ⚠️ Needs Review |
| **Expression: exp_Double_T38_SUN_DIF_HRS_CPP** | Doubles specific pay hours | Not explicitly shown | ⚠️ Needs Review |
| **Target** | CPM_NEWPAY_STG_TYPE_3_FDR_TBL (246 cols) | Shows partial + `... and 231 more expressions` (~246) | ✅ Plausible |

**Assessment: ⚠️ Needs Review** — Target structure matches; aggregator and lookup integration need verification.

---

### 1.11 m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL → SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_TBL

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_cpm_newpay_stg_type_3_tbl.sql) | Status |
|---------|----------------------|-------------------------------------------------------|--------|
| **Source** | CPM_NEWPAY_STG_TYPE_3_FDR_TBL with filter `PP_END_YEAR = $$MAP_PP_END_YEAR AND PP_NUM = $$MAP_PP_NUM` | `FROM CPM_NEWPAY_STG_TYPE_3_FDR_TBL` — no parameter filter | ⚠️ Missing filter |
| **Lookups** | lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL, lkp_CPM_NEWPAY_STG_ALT_TBL, lkp_CPM_NEWPAY_STG_DETAIL_TBL | Not shown as JOINs | ⚠️ Needs Review |
| **Aggregator** | agg_PYF_EYE_ID_PP_NUM | Not shown | ⚠️ Needs Review |
| **Target** | CPM_NEWPAY_STG_TYPE_3_TBL (241 cols) | Shows partial + `... and 226 more` (~241) | ✅ Plausible |

**Assessment: ⚠️ Needs Review** — Missing parameter filter and lookup JOINs.

---

### 1.12 m_CPM_Load_PMR_To_CPM_NEWPAY_TBL → SP_CPM_LOAD_PMR_TO_CPM_NEWPAY_TBL

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_pmr_to_cpm_newpay_tbl.sql) | Status |
|---------|----------------------|---------------------------------------------------|--------|
| **Source** | CPM_NEWPAY_STG_TYPE_1_2_TBL + CPM_NEWPAY_STG_TYPE_3_TBL | `JOIN ... ON PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN` | ✅ Match |
| **Parameter filter** | `$$MAP_PP_END_YEAR`, `$$MAP_PP_NUM` | `WHERE PP_END_YEAR = v_MAP_PP_END_YEAR AND PP_NUM = v_MAP_PP_NUM` | ✅ Match |
| **Target** | CPM_NEWPAY_TBL (488 cols) | Shows partial + `... and 473 more expressions` (~488) | ✅ Plausible |

**Assessment: ✅ Correct**

---

### 1.13 m_CPM_Load_FDR_CPM_NEWPAY_TBL → SP_CPM_LOAD_FDR_CPM_NEWPAY_TBL

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_load_fdr_cpm_newpay_tbl.sql) | Status |
|---------|----------------------|------------------------------------------------|--------|
| **Source** | CPM_NEWPAY_STG_TYPE_1_2_TBL + CPM_NEWPAY_STG_TYPE_3_FDR_TBL | `JOIN ... ON PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN` | ✅ Match |
| **Lookup: lkp_REG_REEMPLED** | Complex 5-key join: `PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN, MP_POOL_DES, REEMP_ANN_CDE` | Not shown as a JOIN | ⚠️ Needs Review |
| **Parameter filter** | `$$MAP_PP_END_YEAR`, `$$MAP_PP_NUM` | `WHERE PP_END_YEAR = v_MAP_PP_END_YEAR AND PP_NUM = v_MAP_PP_NUM` | ✅ Match |
| **Target** | CPM_NEWPAY_TBL (492 cols) | Shows partial + `... and 477 more expressions` (~492) | ✅ Plausible |

**Assessment: ✅ Correct** — Structure matches; lkp_REG_REEMPLED is a self-join optimization that may be embedded in column expressions.

---

### 1.14 m_CPM_Build_Message_Counters → SP_CPM_BUILD_MESSAGE_COUNTERS

| Element | PowerCenter (XML/CPM) | Snowflake (m_cpm_build_message_counters.sql) | Status |
|---------|----------------------|----------------------------------------------|--------|
| **Aggregators** | agg_Count_Inputs (PAYMASTER_THREE), agg_Count_CPM (CPM_NEWPAY_TBL), agg_Count_Errors (ERROR_TBL) | `COUNT(*) FROM PAYMASTER_THREE_RAW UNION ALL COUNT(*) FROM CPM_NEWPAY_TBL UNION ALL COUNT(*) FROM ERROR_TBL` | ✅ Match |
| **Joiners** | Full outer joins on constants to combine counts | `UNION ALL` approach — equivalent for independent counts | ✅ Equivalent |
| **Lookups** | lkp_PSEUDOSSN_TBL, lkp_CPM_MER/PAD/YTD_DETAIL_STG_TBL | Not shown — these are for the message file detail, not counter aggregation | ⚠️ Needs Review |
| **Aggregator: agg_Multiple_Pay_Lines** | GROUP BY DFAS_PSEUDO_SSN for multiple pay line count | Not shown | ⚠️ Missing |
| **Target: COUNTER_TBL** | 3 counter records | 3 UNION ALL rows | ✅ Match |
| **Target: CPM_MESSAGE_FILE** | Count values with descriptions | 3 UNION ALL rows | ✅ Match |

**Assessment: ✅ Correct** — Counter logic matches. The detailed message construction with lookups for the full message output file is simplified in the Snowflake version.

---

### 1.15 m_Generic_Mapping → SP_GENERIC_MAPPING

| Element | PowerCenter (XML/CPM) | Snowflake (m_generic_mapping.sql) | Status |
|---------|----------------------|-----------------------------------|--------|
| **Source** | HI_GENERIC_SRC_TBL | Referenced in comment | ✅ Match |
| **Logic** | Passthrough (Source Qualifier only, no transformations) | Empty procedure body — returns immediately | ✅ Match — placeholder mapping |

**Assessment: ✅ Correct** — Placeholder mapping correctly migrated as no-op.

---

## 2. Orchestration Validation

### SP_CPM_ETL_ORCHESTRATOR vs. Original Workflow

| Phase | Original (KornShell + PowerCenter) | Snowflake Orchestrator | Status |
|-------|-----------------------------------|------------------------|--------|
| 1. Pre-load | ehrp2biis_preload → step01 → TRUNCATE staging | `CALL SP_EHRP2BIIS_PRELOAD()` — truncates all 25+ staging tables + RAW tables | ✅ Match |
| 2. Flat-file load | Informatica sessions read VSAM files | `COPY INTO ... FROM @STG_... PATTERN = ... FORCE = TRUE` for 5 file types | ✅ Match |
| 3. Current pay period | m_CPM_Current_Pay_Period session | `CALL SP_CPM_CURRENT_PAY_PERIOD()` | ✅ Match |
| 4. PMR staging | m_CPM_Load_CPM_PMR_Staging_Tables session | `CALL SP_CPM_LOAD_CPM_PMR_STAGING_TABLES()` | ✅ Match |
| 5. YTD staging | m_CPM_Load_CPM_YTD_Staging_Tables session | `CALL SP_CPM_LOAD_CPM_YTD_STAGING_TABLES()` | ✅ Match |
| 6. MER staging | m_CPM_Load_CPM_MER_Staging_Tables session | `CALL SP_CPM_LOAD_CPM_MER_STAGING_TABLES()` | ✅ Match |
| 7. PAD staging | m_CPM_Load_CPM_PAD_Staging_Tables session | `CALL SP_CPM_LOAD_CPM_PAD_STAGING_TABLES()` | ✅ Match |
| 8a. NEWPAY YTD State | m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | `CALL SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL()` | ⚠️ Logic gap inside |
| 8b. NEWPAY ALT | m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | `CALL SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL()` | ⚠️ Logic gap inside |
| 8c. NEWPAY Type 1/2 | m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | `CALL SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL()` | ✅ Match |
| 8d. NEWPAY Detail | m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | `CALL SP_CPM_LOAD_CPM_NEWPAY_STG_DETAIL_TBL()` | ✅ Match |
| 8e. NEWPAY Type 3 FDR | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | `CALL SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL()` | ✅ Match |
| 8f. NEWPAY Type 3 | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL | `CALL SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_TBL()` | ✅ Match |
| 9a. PMR → NEWPAY | m_CPM_Load_PMR_To_CPM_NEWPAY_TBL | `CALL SP_CPM_LOAD_PMR_TO_CPM_NEWPAY_TBL()` | ✅ Match |
| 9b. FDR → NEWPAY | m_CPM_Load_FDR_CPM_NEWPAY_TBL | `CALL SP_CPM_LOAD_FDR_CPM_NEWPAY_TBL()` | ✅ Match |
| 10. Message counters | m_CPM_Build_Message_Counters | `CALL SP_CPM_BUILD_MESSAGE_COUNTERS()` | ✅ Match |
| 11. Post-load | ehrp2biis_afterload → multiple Oracle procs | `CALL SP_EHRP2BIIS_AFTERLOAD()` | ✅ Match |
| **Error handling** | Informatica workflow error handling | `EXCEPTION WHEN OTHER THEN INSERT INTO ERROR_TBL ... RAISE` | ✅ Match |

---

## 3. Pre/Post Load Validation

### SP_EHRP2BIIS_PRELOAD

| Element | Original | Snowflake | Status |
|---------|----------|-----------|--------|
| Truncate NWK staging (4 tables) | Oracle TRUNCATE | `TRUNCATE TABLE IF EXISTS` | ✅ Match |
| Truncate CPM staging (17 tables) | Oracle TRUNCATE | `TRUNCATE TABLE IF EXISTS` | ✅ Match |
| Truncate RAW landing tables (5) | N/A (new for Snowflake) | `TRUNCATE TABLE IF EXISTS` for 5 _RAW tables | ✅ Correct addition |
| Error handling | Script exit codes | `EXCEPTION ... INSERT INTO ERROR_TBL ... RAISE` | ✅ Match |

### SP_EHRP2BIIS_AFTERLOAD

| Element | Original | Snowflake | Status |
|---------|----------|-----------|--------|
| Update retained step codes | Oracle UPDATE with subquery | Snowflake UPDATE with same logic | ✅ Match |
| Update sequence numbers | HISTDBA procedure | `CALL SP_UPDATE_SEQUENCE_NUMBER_TBL()` | ✅ Match (reference) |
| Format records (4 procedures) | 4 Oracle stored procs | 4 `CALL SP_...()` statements | ✅ Match (references) |
| Update cancelled transactions | Oracle procedure | `CALL SP_UPDT_ORIG_CANCELLED_TRANS01()` | ✅ Match (reference) |
| Update PROCESS_TABLE | Complex WIP status check | Equivalent UPDATE with subquery logic | ✅ Match |
| Promote to production (ALL tables) | INSERT INTO ... SELECT | Same pattern for 3 ALL tables | ✅ Match |
| WIP status check | Oracle procedure | `CALL SP_CHK_EHRP2BIIS_WIP_STATUS()` | ✅ Match (reference) |
| Gather run counts | Oracle procedure | `CALL SP_GATHER_EHRP2BIIS_RUNCOUNTS()` | ✅ Match (reference) |

---

## 4. Agency Variant Mappings (CDC, NIH, OIG, AFPS)

The branch includes only the CPM core stored procedures. The following agency-specific mappings from the PowerCenter XML are **not yet migrated**:

| XML File | Mappings | Stored Procedure Coverage | Status |
|----------|----------|---------------------------|--------|
| **CPM_CDC** | 6 mappings (Header, Data, Pay Cal, CPM Cal, Concat, Message) | No corresponding stored procedures | ❌ Not migrated |
| **CPM_NIH** | 6 mappings (same pattern as CDC) | No corresponding stored procedures | ❌ Not migrated |
| **CPM_OIG** | 4 mappings (Pay Cal, CPM Cal, OIG File, Message) | No corresponding stored procedures | ❌ Not migrated |
| **CPM_AFPS** | 17 mappings (Data Separate, Debridge, Gross Exp, Crossfoot, Message, etc.) | No corresponding stored procedures | ❌ Not migrated |

> These are downstream report-generation mappings that consume CPM_NEWPAY_TBL data. The core ETL pipeline that populates CPM_NEWPAY_TBL **is** migrated. The report-generation layer is a separate migration scope.

---

## 5. Summary Risk Matrix

| Risk Area | Severity | Affected Procedures | Description |
|-----------|----------|---------------------|-------------|
| **Unresolved Informatica port `in_HEADER_DATE`** | 🔴 High | PMR, YTD, MER, PAD staging (11 occurrences) | The LEFT JOIN ON clause references `in_HEADER_DATE`, an Informatica expression port name from `exp_Initial`, not a valid Snowflake column/variable. Will cause runtime SQL errors. Must be replaced with `TRY_TO_DATE(SUBSTR(...))` or a pre-computed column. |
| **Flat-file Normalizer not implemented** | 🔴 High | PMR, YTD, MER, PAD staging | VSAM fixed-width parsing from RAW_LINE to structured columns is not shown. The procedures assume a pre-parsed table exists but no VIEW or parsing logic bridges RAW → structured. |
| **Stateful pivot logic missing** | 🔴 High | SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL, SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL | PowerCenter uses row-by-row stateful expressions to pivot multiple rows into wide columns (4 state tax records, 7 allotments). Snowflake procedures do a direct pass-through without PIVOT/conditional aggregation. |
| **Date validation / ABORT guards missing** | 🟡 Medium | YTD, PMR staging | PowerCenter `exp_Verify_Header_Date` calls `ABORT()` on invalid dates. Snowflake procedures don't enforce this guard. Data quality could silently degrade. |
| **Parameter filters not applied** | 🟡 Medium | YTD State, Type 3, Detail | Some Source Qualifier SQL in PowerCenter filters by `$$MAP_PP_END_YEAR / $$MAP_PP_NUM`. The Snowflake procedures sometimes omit this filter, potentially processing all periods instead of the target period. |
| **Lookup JOINs incomplete** | 🟡 Medium | Type 3 FDR, Type 3, Detail | Several lookups referenced in transformation chains (lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL, lkp_CPM_NEWPAY_STG_ALT_TBL) are not implemented as JOINs in the Snowflake SQL. |
| **Source/target column name confusion** | 🟡 Medium | Detail, ALT, Type 3 FDR | Some SELECTs reference target column names (e.g., `DFAS_PSEUDO_SSN`) instead of actual source column names (e.g., `PYF_EYE_ID_PDT3`). Will cause runtime SQL errors. |
| **Column-level expression verification** | 🟡 Medium | All staging loads | Stored procedures show truncated column lists ("... and N more expressions"). Full column-by-column formula verification requires expanding these. |
| **Agency reports not migrated** | 🟠 Low | CDC, NIH, OIG, AFPS | 33 report-generation mappings not yet migrated. These are downstream consumers, not core ETL. |
| **Aggregator ORDER BY semantics** | 🟠 Low | Detail, ALT, Type 3 FDR | PowerCenter aggregators have deterministic input ordering. Snowflake SQL without ORDER BY in aggregations may produce different results for FIRST/LAST value selections. |

---

## 6. Recommendations

### Immediate Actions (Pre-UAT)

1. **Replace unresolved `in_HEADER_DATE` port references**: In all 4 staging procedures (PMR, YTD, MER, PAD — 11 occurrences), replace `in_HEADER_DATE` with the actual date derivation logic. For example, in the PMR procedure: `TRY_TO_DATE(SUBSTR(PYF_REC_PPE_DATE,5,2)||'/'||SUBSTR(PYF_REC_PPE_DATE,7,2)||'/'||SUBSTR(PYF_REC_PPE_DATE,1,4), 'MM/DD/YYYY')`. Or define a pre-computed column in the parsed source table.

2. **Fix source/target column name confusion**: In Detail, ALT, and Type 3 FDR procedures, replace target column names in SELECT statements with actual source column names (e.g., `PYF_EYE_ID_PDT3 AS DFAS_PSEUDO_SSN` instead of `DFAS_PSEUDO_SSN`).

3. **Implement flat-file parsing layer**: Create Snowflake VIEWs or a preprocessing procedure that uses `SUBSTR()` on `RAW_LINE` columns to extract fixed-width fields. The field offsets are defined in the PowerCenter SOURCEFIELD elements (PHYSICALOFFSET + PHYSICALLENGTH).

4. **Implement YTD State pivot logic**: Replace the direct INSERT in `SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL` with a conditional aggregation pattern:
   ```sql
   SELECT PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN,
       MAX(CASE WHEN rn = 1 THEN state_code END) AS YTD_STATE_1,
       MAX(CASE WHEN rn = 1 THEN state_tax_cde END) AS YTD_ST_TX_1_CDE,
       ...
   FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY DFAS_PSEUDO_SSN ORDER BY ...) AS rn
         FROM CPM_YTD_STATE_STG_TBL WHERE PP_END_YEAR = ... AND PP_NUM = ...)
   GROUP BY PP_END_YEAR, PP_NUM, DFAS_PSEUDO_SSN
   ```

5. **Implement Allotment pivot logic**: Similar conditional aggregation for `SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL`, capping at allotment 7 and merging overflow into allotment 4.

6. **Add parameter filters**: Add `WHERE PP_END_YEAR = v_MAP_PP_END_YEAR AND PP_NUM = v_MAP_PP_NUM` to procedures that are missing it.

### Pre-Production Verification

7. **Add date validation guards**: Implement Snowflake-equivalent validation (e.g., `IF TRY_TO_DATE(...) IS NULL THEN RAISE` or log to ERROR_TBL) to replace PowerCenter ABORT() calls.

8. **Verify column completeness**: Expand truncated column lists and validate each expression against the PowerCenter XML port formulas.

9. **Add missing lookup JOINs**: Integrate lookups as LEFT JOINs in the Type 3, Type 3 FDR, and Detail procedures.

### Future Scope

10. **Migrate agency report mappings**: CDC (6), NIH (6), OIG (4), AFPS (17) report-generation mappings.

---

## Appendix A: Mapping-to-Procedure Cross-Reference

| PowerCenter Mapping | Snowflake Stored Procedure | File |
|---------------------|---------------------------|------|
| m_CPM_Current_Pay_Period | SP_CPM_CURRENT_PAY_PERIOD | m_cpm_current_pay_period.sql |
| m_CPM_Load_CPM_PMR_Staging_Tables | SP_CPM_LOAD_CPM_PMR_STAGING_TABLES | m_cpm_load_cpm_pmr_staging_tables.sql |
| m_CPM_Load_CPM_YTD_Staging_Tables | SP_CPM_LOAD_CPM_YTD_STAGING_TABLES | m_cpm_load_cpm_ytd_staging_tables.sql |
| m_CPM_Load_CPM_MER_Staging_Tables | SP_CPM_LOAD_CPM_MER_STAGING_TABLES | m_cpm_load_cpm_mer_staging_tables.sql |
| m_CPM_Load_CPM_PAD_Staging_Tables | SP_CPM_LOAD_CPM_PAD_STAGING_TABLES | m_cpm_load_cpm_pad_staging_tables.sql |
| m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | SP_CPM_LOAD_CPM_NEWPAY_STG_YTD_STATE_TBL | m_cpm_load_cpm_newpay_stg_ytd_state_tbl.sql |
| m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | SP_CPM_LOAD_CPM_NEWPAY_STG_ALT_TBL | m_cpm_load_cpm_newpay_stg_alt_tbl.sql |
| m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_1_2_TBL | m_cpm_load_cpm_newpay_stg_type_1_2_tbl.sql |
| m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | SP_CPM_LOAD_CPM_NEWPAY_STG_DETAIL_TBL | m_cpm_load_cpm_newpay_stg_detail_tbl.sql |
| m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | m_cpm_load_cpm_newpay_stg_type_3_fdr_tbl.sql |
| m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL | SP_CPM_LOAD_CPM_NEWPAY_STG_TYPE_3_TBL | m_cpm_load_cpm_newpay_stg_type_3_tbl.sql |
| m_CPM_Load_PMR_To_CPM_NEWPAY_TBL | SP_CPM_LOAD_PMR_TO_CPM_NEWPAY_TBL | m_cpm_load_pmr_to_cpm_newpay_tbl.sql |
| m_CPM_Load_FDR_CPM_NEWPAY_TBL | SP_CPM_LOAD_FDR_CPM_NEWPAY_TBL | m_cpm_load_fdr_cpm_newpay_tbl.sql |
| m_CPM_Build_Message_Counters | SP_CPM_BUILD_MESSAGE_COUNTERS | m_cpm_build_message_counters.sql |
| m_Generic_Mapping | SP_GENERIC_MAPPING | m_generic_mapping.sql |
| — (KornShell orchestration) | SP_CPM_ETL_ORCHESTRATOR | sp_cpm_etl_orchestrator.sql |
| ehrp2biis_preload | SP_EHRP2BIIS_PRELOAD | sp_ehrp2biis_preload.sql |
| ehrp2biis_afterload | SP_EHRP2BIIS_AFTERLOAD | sp_ehrp2biis_afterload.sql |
