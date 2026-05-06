# Type Mapping Validation: Oracle/Informatica PowerCenter → Snowflake

## Executive Summary

| Metric | Count |
|--------|-------|
| Snowflake tables | 29 |
| Oracle/Source tables (XML) | 31 |
| Oracle tables not migrated | 2 |
| Total columns validated | 1947 |
| Columns OK | 1943 |
| Lossy conversions | 0 |
| Warnings | 0 |
| Columns missing in Snowflake | 0 |
| Extra columns in Snowflake | 2 |

**Overall Status: Pass**

### Oracle Tables Not Migrated to Snowflake

- **GENERIC_TARGET_FILE** (Flat File, 1 columns)
- **PAYMASTER_THREE** (VSAM, 1 columns)

---

## Standard Type Mapping Reference

| Oracle / Source Type | Snowflake Type | Notes |
|---------------------|---------------|-------|
| `NUMBER(p,s)` | `NUMBER(p,s)` | Exact precision/scale preserved |
| `VARCHAR2(n)` | `VARCHAR(n)` | Direct mapping |
| `VARCHAR(n)` | `VARCHAR(n)` | Direct mapping |
| `DATE` | `TIMESTAMP_NTZ` | Oracle DATE includes time; TIMESTAMP_NTZ preserves this |
| `BIGINT` | `NUMBER(p,0)` | Flat file integer type |
| `STRING(n)` | `VARCHAR(n)` | Flat file string type |
| VSAM record | `VARCHAR(n)` | Fixed-length record → VARCHAR with sufficient length |

---

## Per-Table Validation

### `COUNTER_TBL` — PASS

- **Source**: `COUNTER_TBL` (Oracle)
- **Columns**: 7 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (7 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `RUN_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `PROCESS_NAME` | `VARCHAR2(100)` | `VARCHAR(100)` | OK |  |
| `COUNTER_DESCRIPTION` | `VARCHAR2(200)` | `VARCHAR(200)` | OK |  |
| `COUNTER_VALUE` | `NUMBER(15,0)` | `NUMBER(15,0)` | OK |  |
| `PP_END_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `PP_NUM` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CYCLE_ID` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |

</details>

### `CPM_MER_DETAIL_STG_TBL` — PASS

- **Source**: `CPM_MER_DETAIL_STG_TBL` (Oracle)
- **Columns**: 95 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (95 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `MER_RECTYP` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `MER_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `MER_EMP_ACTVTY` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `MER_ORG` | `VARCHAR2(7)` | `VARCHAR(7)` | OK |  |
| `MER_EMPTYPCD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `MER_ACTION_NATURE_CD` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `MER_TEMP_PROM_NTE_DT` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `MER_TEMP_DTL_NTE_DT` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `MER_PAY_BASIS_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `MER_PREM_PAY_IND` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `MER_PREM_HRLY_RT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_ANUITNT_IND` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `MER_ANUITNT_DIFF_HRLY_RT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_SPECL_PGM_IND` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `MER_COLA_HRLY_RT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_PST_DIFF_NON_FRGN_HRLY_RT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_MSTR_LV_HIST_EFF_DT` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `MER_SERVICE_COMP_DT_LV` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `MER_DUTY_ENTRY_DT` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `MER_SEP_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `MER_SEP_DT` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `MER_DT_LAST_INCR` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `MER_ADDR_STREET1` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `MER_ADDR_STREET2` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `MER_ADDR_CITY` | `VARCHAR2(13)` | `VARCHAR(13)` | OK |  |
| `MER_ADDR_STATE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `MER_ADDR_ZIP` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `MER_FEDTX_WTHOLD_EXEMPTS` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `MER_FEDTX_MAR_STATUS` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `MER_ANN_LV_ACCRUAL_RT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_ANN_LV_ACCRD_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ADVNCD_ANN_LV_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ANN_LV_ENDBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ANN_LV_BEGBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ANN_LV_CEILING` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ANN_LV_CRED_REDN_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ANN_LV_FORFEIT_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ANN_LV_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ANN_LV_USED_PAY_PD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_COMP_TIME_ENDBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_COMP_TIME_BEGBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_COMP_TIME_EARN_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_COMP_TIME_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_CRED_HRS_ENDBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_CRED_HRS_BEGBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_CRED_HRS_EARN_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_CRED_HRS_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_MIL_LV_ENDBAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_MIL_LV_BEGBAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_MIL_LV_USED_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_NPAY_HRS_USED_PAY_PD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_NPAY_HRS_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_RELG_CMPTM_ENDBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_RELG_CMPTM_BEGBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_RELG_CMPTM_EARN_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_RELG_CMPTM_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_RSTRD_ANN_LV_ENDBAL_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_RSTRD_ANN_LV_ENDBAL_2` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_RSTRD_ANN_LV_ENDBAL_3` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_SICK_LV_ACCRUAL_RT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_SICK_LV_ACCRUED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_ADVNCD_SICK_LV_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_SICK_LV_ENDBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_SICK_LV_BEGBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_SICK_LV_CRED_REDN_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_SICK_LV_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_SICK_LV_USED_PAY_PD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_ST_TAX_AUTH_1` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `MER_ST_TX_EXEMPTS_1` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `MER_ST_TAX_AUTH_2` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `MER_ST_TX_EXEMPTS_2` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `MER_OT_EARN_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `MER_TOFF_AWRD_BEG_YRGAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_TOFF_AWRD_AUTHHRS_YTD` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `MER_TOFF_AWRD_USED_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_TOFF_AWRD_FORF_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_TOFF_AWRD_ENDBAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_FF_DIVISOR_IND` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `MER_ALT_HRLY_RT_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_ALT_HRLY_RT_2` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_ALT_ANUITNT_DIFF` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_ALT_COLA_HRLY_RT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_ALT_PSTDIFFNFHRLY_RT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_TVL_COMP_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_TVL_COMP_BEGIN_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_TVL_COMP_EARN_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_TVL_COMP_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_TVL_COMP_TIME_FORF` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_BRAC_ENDBAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_EMER_LV_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MER_FROZ_ANN_LV_USED_PAY_PD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_FROZ_ANN_LV_USED_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MER_FROZ_ANN_LV_ENDBAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |

</details>

### `CPM_MER_HEADER_STG_TBL` — PASS

- **Source**: `CPM_MER_HEADER_STG_TBL` (Oracle)
- **Columns**: 7 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (7 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `RECORD_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `RECORD_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `FILE_ID` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `PAYROLL_OFFICE_ID_CODE` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `REPORT_RECIPIENT` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |

</details>

### `CPM_MESSAGE_FILE` — PASS

- **Source**: `CPM_MESSAGE_FILE` (Flat File)
- **Columns**: 2 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (2 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `COUNT_VALUE` | `BIGINT(19)` | `NUMBER(15,0)` | OK | BIGINT → NUMBER: appropriate mapping |
| `COUNT_DESC` | `STRING(50)` | `VARCHAR(200)` | OK | STRING(50) → VARCHAR(200): widened |

</details>

### `CPM_NEWPAY_STG_ALT_TBL` — PASS

- **Source**: `CPM_NEWPAY_STG_ALT_TBL` (Oracle)
- **Columns**: 46 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (46 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `DFAS_PSEUDO_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_PAY_DET_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `ALT_1_INST_AC_NO` | `NUMBER(9,0)` | `NUMBER(9,0)` | OK |  |
| `ALT_1_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_1_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_1_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_1_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_2_INST_ACCT_NO` | `NUMBER(9,0)` | `NUMBER(9,0)` | OK |  |
| `ALT_2_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_2_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_2_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_2_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_2_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_4_INST_AC_NO` | `NUMBER(9,0)` | `NUMBER(9,0)` | OK |  |
| `ALT_4_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_4_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_4_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_4_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_4_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_5_INST_AC_NO` | `NUMBER(9,0)` | `NUMBER(9,0)` | OK |  |
| `ALT_5_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_5_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_5_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_5_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_5_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_6_INST_AC_NO` | `NUMBER(9,0)` | `NUMBER(9,0)` | OK |  |
| `ALT_6_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_6_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_6_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_6_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_6_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_7_INST_AC_NO` | `NUMBER(9,0)` | `NUMBER(9,0)` | OK |  |
| `ALT_7_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_7_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_7_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_7_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_7_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_8_INST_AC_NO` | `NUMBER(9,0)` | `NUMBER(9,0)` | OK |  |
| `ALT_8_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_8_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_8_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_8_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_8_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |

</details>

### `CPM_NEWPAY_STG_DETAIL_TBL` — PASS

- **Source**: `CPM_NEWPAY_STG_DETAIL_TBL` (Oracle)
- **Columns**: 22 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (22 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `DFAS_PSEUDO_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `CPP_REF_DED_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ADJ_REFUND_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FED_OPT_TAX_DED` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ST_TAX_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ST_TAX_EXEMP` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `ST_TAX_OPT_DED` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ST_TAX_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CITY_ST_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CITY_ID_CDE` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `CITY_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CITY_EXEMP` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `HLTH_ENROL_CDE_1_2` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `HLTH_ENROL_CDE_3` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `COMP_TIME_HRLY_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CSA_RECIPIENT_NAME` | `VARCHAR2(22)` | `VARCHAR(22)` | OK |  |
| `CSA_RECIPIENT_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `VIS_DENT_1_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_2_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_3_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |

</details>

### `CPM_NEWPAY_STG_TYPE_1_2_TBL` — PASS

- **Source**: `CPM_NEWPAY_STG_TYPE_1_2_TBL` (Oracle)
- **Columns**: 262 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (262 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `PP_NUM` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `DFAS_PSEUDO_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `FIR_NAME_1` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CODE_CONSL` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FIR_NAME_3_11` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `MID_INIT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `SURNAME_3` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `SURNAME_OTHER` | `VARCHAR2(13)` | `VARCHAR(13)` | OK |  |
| `SOC_SEC_NO` | `NUMBER(11,0)` | `NUMBER(11,0)` | OK |  |
| `PYF_PAY_DET_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `OCCUP_CDE` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `JOB_LOC_CDE` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `ST_CONT_LOC` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CITY_LOC` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `CTY_CTRY_LOC` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `TK_NO` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `CAN` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `CAN_FY` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CAN_AGCY` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CAN_AP` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CAN_AGCY_ACCT_CDE` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `ORG_CDE` | `VARCHAR2(11)` | `VARCHAR(11)` | OK |  |
| `ORG_P01` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P2` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P3` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P4` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P5` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P6` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P7` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P8` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P9` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_PX` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P11` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `SPOC` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `SEX_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `VET_PREF_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TENURE_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `EHRP_EMP_ID` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `EHRP_EMP_REC_NO` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PERM_TEMP_POS_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FT_PT_INTER_POS_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CITIZEN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TYPE_APPT_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `EOD_DATE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `PHY_HNDCP` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CEILING_EN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FUNC_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `SUPV_CDE` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `PAY_BASIS` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `POS_SEN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CAR_SERV_DTE` | `NUMBER(16,0)` | `NUMBER(16,0)` | OK |  |
| `PROB_DTE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `SPO_TERM_ID` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `ABNOR_RATE_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FED_RETIRE_CDE_OLD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TSPA_STATUS_CODE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TSPA_VEST_PERIOD` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `EFT_EMPL_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `EFT_EMPL_ACCT_NUMBER` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `FS_DATE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `TSPA_STATUS_CODE_DTE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `TSPA_SCD` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `OT_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `LOCAL_PCENT_RATE` | `NUMBER(5,4)` | `NUMBER(5,4)` | OK |  |
| `CPP_LOCAL_DIFF` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `AGCY_CDE_PER` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `SEP_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `SEP_DATE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `PERS_NOA` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `ANNUAL_SAL` | `NUMBER(7,0)` | `NUMBER(7,0)` | OK |  |
| `FLSA_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_NO` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `DATE_BIRTH` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `EFT_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `EFT_CK_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `EFT_ROUT_CK_ID` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `POSITION_1` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `POSITION_2` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `GRADE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `STEP` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FEGLI_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FEGLI_CDE_2` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TOT_FED_TAX_EXEMP` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `FED_TAX_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `HRLY_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SEV_PAY_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HLTH_DED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HLTH_GOVT_SHARE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `UNION_IDENT_CDE` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `UNION_DED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PCA_BIWEEK_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `AN_LV_EARNED_CPP` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `SICK_LV_ERN_CPP` | `NUMBER(4,2)` | `NUMBER(4,2)` | OK |  |
| `COMP_LV_ERN_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `COMP_LV_USD_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `ADMIN_LV_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `LWOP_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `STAFFING_BIW_AMT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `INCENT_TIME_CUR_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PSP_BIWKLY_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_ERND_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `REL_COMP_USED_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_ERND_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_USED_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `FERS_BAL_FWD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `AN_LV_CR_RED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_CR_RED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `LV_CAT_CDE` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `AN_LV_USED_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `AN_LV_ERND_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `AN_LV_ADV_CBAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `AN_LV_USED_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `AN_LV_CUR_BAL` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `AN_LV_MAX_COVER` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `AN_LV_USE_LOSE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_USD_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_ERN_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_AD_CBAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_USD_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `SICK_LV_CUR_BAL` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `COMP_LV_CUR_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `RESTOR_AL_BALANCE` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `RESTOR_AL_BAL_1` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `RESTOR_AL_BAL_2` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `RESTOR_AL_BAL_3` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PSI_START_DATE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `REL_COMP_CURR_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_CUR_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `TVL_COMP_BEGIN_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TVL_COMP_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TVL_COMP_EARN_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TVL_COMP_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TVL_COMP_FORFEITED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_OT_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ND_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_SD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_HOL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_PD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_COLA_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_UNIF_ALLOW` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_SEV_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_CASH_AWARDS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_MP_CASH_AWARD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LSL_PAY_OLD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_MISC_OTH_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_NON_TAX_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_FED_TAX_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TAXABLE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_CSR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_CSR_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_CSR_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FICA_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FICA_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_MEDC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_MEDC_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_PAY_S_MEDC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_FERS_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FERS_AGY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FERS_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_LEVY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_STATE_1` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_1_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_1_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_2` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_2_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_2_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_2_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_3` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_3_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_3_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_3_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_4` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_4_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_4_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_4_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_HLTH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_HLTH_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_BOND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LI_REG_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LI_REG_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LI_OPT_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FEGLI_OPTB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FEGLI_OPTC` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_CHAR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_UNION_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ALT_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_QUARTERS_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_SUBSIST_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LAUNDRY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_CSA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `EIC_YTD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PCA_YTD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TSPA_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_TSPG_GBADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TSPG_EADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TSPG_GMADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_STAFFING` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LOAN_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_HEALTH_SAVINGS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ON_CALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `T38_OT_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_HOL_OT_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_ND_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_ONCALL_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_SAT_DIF_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_SUN_DIF_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_LTC_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_DCS_DEBT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_PSP_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `RET_BAL_FWD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_SEP_INCENT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LSL_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_RECRUIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_RELOC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_RETENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_TEA_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_CHILD_SUB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_LS_PAY_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CR_HRS_LS_PAY_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_PREPD_HB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FSAHC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FSADC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TSP_OVER50` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_1_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_2_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_3_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TRANSFER_IN_FICA_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `TRANSFER_IN_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `FEHB_PC_PRE_TAX_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADMIN_LV_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MILITARY_LV_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `LWOP_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `RESTOR_AL_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `OC_1217_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `OC_121S_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `OC_1211_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `OC_1111_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `WORK_ADDR_STREET1` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `WORK_ADDR_STREET2` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `WORK_ADDR_CITY` | `VARCHAR2(13)` | `VARCHAR(13)` | OK |  |
| `WORK_ADDR_STATE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `WORK_ADDR_ZIP` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `BUSINESS_UNIT` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `FED_RETIRE_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `OPDIV` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PP_YEAR_NUM` | `NUMBER(6,0)` | `NUMBER(6,0)` | OK |  |
| `SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `COMP_BEGIN_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_EARN_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_USED_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `OT_EARN_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_BEGIN_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_EARN_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_USED_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |

</details>

### `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` — PASS

- **Source**: `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` (Oracle)
- **Columns**: 246 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (246 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `DFAS_PSEUDO_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `LINE_TYPE` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `PYF_PAY_TAC_TYP` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `PYF_PAY_DET_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `MP_POOL_DES` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `ADJ_NO` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CPP_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_REF_DED_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_REF_DED_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HLTH_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HLTH_EMPLR_AFPS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_REFUND_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ADJ_REFUND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_DCS_DEBT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_DCS_DEBT_AMT_AFPS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DCS_NBR_DEBTS` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ADJ_DCS_DEBT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_OTHER_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_OTHER_PAY_AFPS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_HLTH_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `OC_1217_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `FED_OPT_TAX_DED` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `CPP_FED_WITH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FED_WITH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ST_TAX_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ST_TAX_EXEMP` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `ST_TAX_OPT_DED` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ST_TAX_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CPP_ST_TAX_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_ST_TAX_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CITY_ST_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CITY_ID_CDE` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `CITY_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CITY_EXEMP` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CPP_CITY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CITY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LUMPSUM_LVPY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_LUMP_SUM` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `RESTOR_AL_PAID_CPP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `RESTOR_AL_PAID_ADJ` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `BASE_HRS` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `REG_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_BASE_PAY_AFPS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CASH_AWARD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CAS_AWARD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `RPT_CDE` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `REEMPLED` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `HRLY_RATE_UA` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `REEMP_ANN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `REEMP_ANU_HR_RTE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `ALT_1_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_1_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_1_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_1_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_2_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_2_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_2_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_2_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_2_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_4_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_4_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_4_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_4_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_4_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_5_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_5_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_5_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_5_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_5_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_6_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_6_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_6_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_6_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_6_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_7_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_7_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_7_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_7_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_7_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_8_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_8_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_8_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_8_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_8_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_LTC_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_LTC_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PSP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_PSP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HLTH_ENROL_CDE_1_2` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `HLTH_ENROL_CDE_3` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_HLTH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_HLTH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_HRS_PAID` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `COMP_TIME_HRLY_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_STAFFING` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_COUNTY_TAX_GROSS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_TEA_GVT_TV_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TEA_GVT_TV_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TEA_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TEA_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FSAHC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FSAHC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FSADC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FSADC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSP_OVER50` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSP_OVER50` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_OT_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_OT_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_OT_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_OT_PL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_ND_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_ND_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_ND_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_SD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HOL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_HOL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_OTHER_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_PD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_COLA_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_COLA_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_UNIF_ALLOW` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_UNIF_ALLOW` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SEV_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SEV_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_NS_FWIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_PAY_NS_FWIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PAY_S_FEDTX` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CSR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CSR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_CSR_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CSR_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_CSR` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FICA_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FICA_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_FICA` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_FICA_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_MEDC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_MEDC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_MEDC_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_MEDC_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_MEDC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_MEDC_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_FERS_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FERS_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FERS_AGY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FERS_AGY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FERS_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_FERS_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_BOND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_BOND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_REG_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LI_REG_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_OPT_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LI_OPT_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FEGLI_OPTB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FEGLI_OPTB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FEGLI_OPTC` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FEGLI_OPTC` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_CHAR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CHAR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_UNION_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_UNION_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_QUARTERS_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_QUARTERS_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SUBSIST_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SUBSIST_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SLRP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_SLRP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_NET_ALT_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CSA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CSA_RECIPIENT_NAME` | `VARCHAR2(22)` | `VARCHAR(22)` | OK |  |
| `CSA_RECIPIENT_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `EIC_CPP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `EIC_ADJ_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PCA_CPP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PCA_ADJ_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPA_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_TSPA_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_TSPG_GBADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_GBADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPG_EADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_EADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPG_GMADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_GMADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_ND_2` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_ND_3` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_SD_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_HOL_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_INST_AGY_PAID` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_ON_CALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_T38_ONCALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_ON_CALL_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_ONCALL_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `ADJ_ON_CALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `T38_OT_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_HOL_OT_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_ND_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_SAT_DIF_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_SUN_DIF_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_UND_DED_G_PRYR_1` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SEP_INCENT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_RECRUIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RECRUIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_RELOC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RELOC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_RETENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RETENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `SUSP_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `REL_COMP_LS_PAY_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_LS_PAY_ADJ` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_LS_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_LS_PAY_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CR_HRS_LS_PAY_ADJ` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CR_HRS_LS_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_TEA_GVT_PK_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LOAN_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LOAN_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_HAZARD_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_ST_TAX_GROSS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `FURLO_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `VIS_DENT_1_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_1_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_2_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_2_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_3_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_3_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HEALTH_SAVINGS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MANUAL_PAYMENTS` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `COMP_HRS_ERND_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_HRS_USED_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_PAID_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TRAVEL_COMP_HRS_ERND_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TRAVEL_COMP_HRS_USED_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |

</details>

### `CPM_NEWPAY_STG_TYPE_3_TBL` — PASS

- **Source**: `CPM_NEWPAY_STG_TYPE_3_TBL` (Oracle)
- **Columns**: 242 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (242 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `DFAS_PSEUDO_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_PAY_TAC_TYP_LINE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_PAY_TAC_TYP` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `PYF_PAY_DET_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `MP_POOL_DES` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `ADJ_NO` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CPP_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_REF_DED_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_REF_DED_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HLTH_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_REFUND_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ADJ_REFUND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_DCS_DEBT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DCS_NBR_DEBTS` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ADJ_DCS_DEBT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_OTHER_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_HLTH_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `OC_1217_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `FED_OPT_TAX_DED` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `CPP_FED_WITH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FED_WITH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ST_TAX_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ST_TAX_EXEMP` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `ST_TAX_OPT_DED` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ST_TAX_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CPP_ST_TAX_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_ST_TAX_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CITY_ST_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CITY_ID_CDE` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `CITY_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CITY_EXEMP` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CPP_CITY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CITY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LUMPSUM_LVPY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_LUMP_SUM` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `RESTOR_AL_PAID_CPP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `RESTOR_AL_PAID_ADJ` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `BASE_HRS` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `REG_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CASH_AWARD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CAS_AWARD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `RPT_CDE` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `REEMPLED` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `HRLY_RATE_UA` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `REEMP_ANN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `REEMP_ANU_HR_RTE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `ALT_1_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_1_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_1_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_1_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_2_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_2_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_2_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_2_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_2_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_4_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_4_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_4_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_4_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_4_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_5_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_5_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_5_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_5_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_5_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_6_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_6_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_6_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_6_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_6_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_7_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_7_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_7_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_7_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_7_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_8_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_8_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_8_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_8_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_8_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_LTC_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_LTC_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PSP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_PSP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HLTH_ENROL_CDE_1_2` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `HLTH_ENROL_CDE_3` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_HLTH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_HLTH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_HRS_PAID` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `COMP_TIME_HRLY_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_STAFFING` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_COUNTY_TAX_GROSS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_TEA_GVT_TV_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TEA_GVT_TV_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TEA_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TEA_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FSAHC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FSAHC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FSADC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FSADC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSP_OVER50` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSP_OVER50` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_OT_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_OT_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_OT_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_OT_PL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_ND_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_ND_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_ND_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_SD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HOL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_HOL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_OTHER_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_PD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_COLA_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_COLA_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_UNIF_ALLOW` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_UNIF_ALLOW` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SEV_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SEV_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_NS_FWIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_PAY_NS_FWIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PAY_S_FEDTX` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CSR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CSR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_CSR_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CSR_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_CSR` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FICA_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FICA_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_FICA` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_FICA_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_MEDC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_MEDC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_MEDC_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_MEDC_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_MEDC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_MEDC_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_FERS_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FERS_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FERS_AGY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FERS_AGY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FERS_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_FERS_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_BOND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_BOND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_REG_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LI_REG_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_OPT_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LI_OPT_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FEGLI_OPTB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FEGLI_OPTB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FEGLI_OPTC` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FEGLI_OPTC` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_CHAR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CHAR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_UNION_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_UNION_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_QUARTERS_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_QUARTERS_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SUBSIST_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SUBSIST_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SLRP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_SLRP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_NET_ALT_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CSA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CSA_RECIPIENT_NAME` | `VARCHAR2(22)` | `VARCHAR(22)` | OK |  |
| `CSA_RECIPIENT_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `EIC_CPP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `EIC_ADJ_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PCA_CPP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PCA_ADJ_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPA_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_TSPA_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_TSPG_GBADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_GBADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPG_EADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_EADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPG_GMADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_GMADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_ND_2` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_ND_3` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_SD_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_HOL_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_INST_AGY_PAID` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_ON_CALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_T38_ONCALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_ON_CALL_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_ONCALL_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `ADJ_ON_CALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `T38_OT_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_HOL_OT_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_ND_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_SAT_DIF_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_SUN_DIF_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_UND_DED_G_PRYR_1` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SEP_INCENT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_RECRUIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RECRUIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_RELOC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RELOC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_RETENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RETENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `SUSP_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `REL_COMP_LS_PAY_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_LS_PAY_ADJ` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_LS_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_LS_PAY_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CR_HRS_LS_PAY_ADJ` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CR_HRS_LS_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_TEA_GVT_PK_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LOAN_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LOAN_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_HAZARD_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_ST_TAX_GROSS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `FURLO_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `VIS_DENT_1_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_1_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_2_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_2_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_3_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_3_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HEALTH_SAVINGS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `MANUAL_PAYMENTS` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `COMP_HRS_ERND_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_HRS_USED_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_PAID_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TRAVEL_COMP_HRS_ERND_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TRAVEL_COMP_HRS_USED_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |

</details>

### `CPM_NEWPAY_STG_YTD_STATE_TBL` — PASS

- **Source**: `CPM_NEWPAY_STG_YTD_STATE_TBL` (Oracle)
- **Columns**: 19 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (19 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `PP_NUM` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `DFAS_PSEUDO_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `YTD_STATE_1` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_1_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_1_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_2` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_2_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_2_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_2_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_3` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_3_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_3_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_3_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_4` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_4_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_4_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_4_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |

</details>

### `CPM_NEWPAY_TBL` — PASS

- **Source**: `CPM_NEWPAY_TBL` (Oracle)
- **Columns**: 499 matched | 0 missing in Snowflake | 2 extra in Snowflake

<details>
<summary>Column mappings (499 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `PP_NUM` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `DFAS_PSEUDO_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `LINE_TYPE` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `FIR_NAME_1` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CODE_CONSL` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FIR_NAME_3_11` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `MID_INIT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `SURNAME_3` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `SURNAME_OTHER` | `VARCHAR2(13)` | `VARCHAR(13)` | OK |  |
| `SOC_SEC_NO` | `NUMBER(11,0)` | `NUMBER(11,0)` | OK |  |
| `PYF_PAY_DET_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `OCCUP_CDE` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `JOB_LOC_CDE` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `ST_CONT_LOC` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CITY_LOC` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `CTY_CTRY_LOC` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `TK_NO` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `CAN` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `CAN_FY` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CAN_AGCY` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CAN_AP` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CAN_AGCY_ACCT_CDE` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `ORG_CDE` | `VARCHAR2(11)` | `VARCHAR(11)` | OK |  |
| `ORG_P01` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P2` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P3` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P4` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P5` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P6` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P7` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P8` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P9` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_PX` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ORG_P11` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `SPOC` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `SEX_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `VET_PREF_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TENURE_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `EHRP_EMP_ID` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `EHRP_EMP_REC_NO` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PERM_TEMP_POS_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FT_PT_INTER_POS_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CITIZEN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TYPE_APPT_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `EOD_DATE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `PHY_HNDCP` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CEILING_EN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FUNC_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `SUPV_CDE` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `PAY_BASIS` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `POS_SEN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CAR_SERV_DTE` | `NUMBER(16,0)` | `NUMBER(16,0)` | OK |  |
| `PROB_DTE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `SPO_TERM_ID` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `ABNOR_RATE_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FED_RETIRE_CDE_OLD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TSPA_STATUS_CODE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TSPA_VEST_PERIOD` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `EFT_EMPL_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `EFT_EMPL_ACCT_NUMBER` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `FS_DATE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `TSPA_STATUS_CODE_DTE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `TSPA_SCD` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `OT_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `LOCAL_PCENT_RATE` | `NUMBER(5,4)` | `NUMBER(5,4)` | OK |  |
| `CPP_LOCAL_DIFF` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `AGCY_CDE_PER` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `SEP_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `SEP_DATE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `PERS_NOA` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `ANNUAL_SAL` | `NUMBER(7,0)` | `NUMBER(7,0)` | OK |  |
| `FLSA_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `RPT_CDE` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_NO` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `DATE_BIRTH` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `EFT_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `EFT_CK_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `POSITION_1` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `POSITION_2` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `GRADE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `STEP` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FEGLI_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FEGLI_CDE_2` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TOT_FED_TAX_EXEMP` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `FED_TAX_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `HRLY_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SEV_PAY_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HLTH_DED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HLTH_GOVT_SHARE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `UNION_IDENT_CDE` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `UNION_DED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PCA_BIWEEK_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REEMP_ANN_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `REEMP_ANU_HR_RTE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `AN_LV_EARNED_CPP` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `SICK_LV_ERN_CPP` | `NUMBER(4,2)` | `NUMBER(4,2)` | OK |  |
| `COMP_LV_ERN_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `COMP_LV_USD_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `ADMIN_LV_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `LWOP_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `STAFFING_BIW_AMT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `INCENT_TIME_CUR_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PSP_BIWKLY_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_ERND_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `REL_COMP_USED_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_ERND_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_USED_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `FERS_BAL_FWD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `AN_LV_CR_RED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_CR_RED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `LV_CAT_CDE` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `AN_LV_USED_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `AN_LV_ERND_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `AN_LV_ADV_CBAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `AN_LV_USED_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `AN_LV_CUR_BAL` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `AN_LV_MAX_COVER` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `AN_LV_USE_LOSE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_USD_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_ERN_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_AD_CBAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `SICK_LV_USD_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `SICK_LV_CUR_BAL` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `COMP_LV_CUR_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `RESTOR_AL_BALANCE` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `RESTOR_AL_BAL_1` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `RESTOR_AL_BAL_2` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `RESTOR_AL_BAL_3` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PSI_START_DATE` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `REL_COMP_CURR_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_CUR_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `TVL_COMP_BEGIN_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TVL_COMP_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TVL_COMP_EARN_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TVL_COMP_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TVL_COMP_FORFEITED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_OT_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ND_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_SD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_HOL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_PD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_COLA_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_UNIF_ALLOW` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_SEV_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_CASH_AWARDS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_MP_CASH_AWARD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LSL_PAY_OLD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_MISC_OTH_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_NON_TAX_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_FED_TAX_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TAXABLE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_CSR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_CSR_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_CSR_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FICA_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FICA_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_MEDC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_MEDC_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_PAY_S_MEDC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_FERS_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FERS_AGY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FERS_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_LEVY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_STATE_1` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_1_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_1_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_2` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_2_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_2_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_2_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_3` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_3_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_3_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_3_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_STATE_4` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `YTD_ST_TX_4_CDE` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `YTD_ST_TX_4_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ST_TX_4_GRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_HLTH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_HLTH_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_BOND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LI_REG_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LI_REG_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LI_OPT_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FEGLI_OPTB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FEGLI_OPTC` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_CHAR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_UNION_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ALT_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_QUARTERS_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_SUBSIST_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LAUNDRY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_CSA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `EIC_YTD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PCA_YTD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TSPA_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_TSPG_GBADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TSPG_EADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TSPG_GMADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_STAFFING` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LOAN_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_HEALTH_SAVINGS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_ON_CALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `T38_OT_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_HOL_OT_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_ND_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_ONCALL_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_SAT_DIF_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `T38_SUN_DIF_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_LTC_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_DCS_DEBT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_PSP_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `RET_BAL_FWD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_SEP_INCENT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_LSL_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_RECRUIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_RELOC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_RETENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `YTD_TEA_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_CHILD_SUB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_LS_PAY_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CR_HRS_LS_PAY_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_PREPD_HB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FSAHC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_FSADC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `YTD_TSP_OVER50` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_1_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_2_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_3_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TRANSFER_IN_FICA_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `TRANSFER_IN_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `FEHB_PC_PRE_TAX_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADMIN_LV_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `MILITARY_LV_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `LWOP_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `RESTOR_AL_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `OC_1217_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `OC_121S_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `OC_1211_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `OC_1111_TOT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `MP_POOL_DES` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `ADJ_NO` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CPP_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_REF_DED_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_REF_DED_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HLTH_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HLTH_EMPLR_AFPS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_REFUND_CDE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ADJ_REFUND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_DCS_DEBT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_DCS_DEBT_AMT_AFPS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DCS_NBR_DEBTS` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ADJ_DCS_DEBT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_OTHER_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_OTHER_PAY_AFPS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_HLTH_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `FED_OPT_TAX_DED` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `CPP_FED_WITH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FED_WITH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ST_TAX_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ST_TAX_EXEMP` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `ST_TAX_OPT_DED` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ST_TAX_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CPP_ST_TAX_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_ST_TAX_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CITY_ST_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `CITY_ID_CDE` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `CITY_MAR_STAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CITY_EXEMP` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CPP_CITY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CITY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LUMPSUM_LVPY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_LUMP_SUM` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `RESTOR_AL_PAID_CPP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `RESTOR_AL_PAID_ADJ` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `BASE_HRS` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `REG_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_BASE_PAY_AFPS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CASH_AWARD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CAS_AWARD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_1_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_1_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_1_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_1_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_2_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_2_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_2_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_2_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_2_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_4_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_4_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_4_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_4_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_4_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_5_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_5_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_5_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_5_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_5_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_6_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_6_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_6_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_6_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_6_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_7_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_7_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_7_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_7_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_7_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `ALT_8_ROUTE_ID` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `ALT_8_ROUTE_DIGIT` | `NUMBER(1,0)` | `NUMBER(1,0)` | OK |  |
| `CPP_ALT_8_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ALT_8_EE_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `ALT_8_ACCT_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_LTC_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_LTC_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PSP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_PSP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HLTH_ENROL_CDE_1_2` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `HLTH_ENROL_CDE_3` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CPP_HLTH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_HLTH_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_HRS_PAID` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `COMP_TIME_HRLY_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_STAFFING` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_COUNTY_TAX_GROSS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_TEA_GVT_TV_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TEA_GVT_TV_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TEA_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TEA_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FSAHC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FSAHC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FSADC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FSADC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSP_OVER50` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSP_OVER50` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_OT_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_OT_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_OT_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_OT_PL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_ND_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_ND_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_ND_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_SD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HOL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_HOL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_OTHER_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_PD_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_COLA_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_COLA_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_UNIF_ALLOW` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_UNIF_ALLOW` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SEV_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SEV_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_NS_FWIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_PAY_NS_FWIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_PAY_S_FEDTX` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CSR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CSR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_CSR_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CSR_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_CSR` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FICA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FICA_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FICA_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_FICA` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_FICA_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_MEDC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_MEDC_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_MEDC_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_MEDC_EMPL_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_PAY_S_MEDC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_MEDC_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_FERS_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FERS_EMP_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FERS_AGY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FERS_AGY_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FERS_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_FERS_WAGES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_BOND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_BOND_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_REG_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LI_REG_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_EMPLR` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LI_OPT_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LI_OPT_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FEGLI_OPTB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FEGLI_OPTB` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_FEGLI_OPTC` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_FEGLI_OPTC` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_CHAR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_CHAR_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_UNION_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_UNION_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_QUARTERS_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_QUARTERS_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SUBSIST_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_SUBSIST_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SLRP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_SLRP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_NET_ALT_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_CSA_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CSA_RECIPIENT_NAME` | `VARCHAR2(22)` | `VARCHAR(22)` | OK |  |
| `CSA_RECIPIENT_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `EIC_CPP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `EIC_ADJ_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PCA_CPP_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PCA_ADJ_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPA_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_TSPA_PAY_SUB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_TSPG_GBADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_GBADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPG_EADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_EADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_TSPG_GMADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_TSPG_GMADIST` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_ND_2` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_ND_3` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_SD_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `HRS_HOL_1` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_INST_AGY_PAID` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_ON_CALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_T38_ONCALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_ON_CALL_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_ONCALL_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `ADJ_ON_CALL_PAY` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `T38_OT_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_HOL_OT_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_ND_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_SAT_DIF_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `T38_SUN_DIF_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_UND_DED_G_PRYR_1` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_SEP_INCENT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_RECRUIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RECRUIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_RELOC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RELOC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `CPP_RETENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `ADJ_RETENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `SUSP_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `REL_COMP_LS_PAY_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_LS_PAY_ADJ` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_LS_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CR_HRS_LS_PAY_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CR_HRS_LS_PAY_ADJ` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CR_HRS_LS_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `CPP_TEA_GVT_PK_CONT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_LOAN_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `ADJ_LOAN_1_DED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `HRS_HAZARD_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_ST_TAX_GROSS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `FURLO_HRS_CPP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `VIS_DENT_1_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_1_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_2_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_2_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `VIS_DENT_3_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `VIS_DENT_3_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `CPP_HEALTH_SAVINGS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `WORK_ADDR_STREET1` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `WORK_ADDR_STREET2` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `WORK_ADDR_CITY` | `VARCHAR2(13)` | `VARCHAR(13)` | OK |  |
| `WORK_ADDR_STATE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `WORK_ADDR_ZIP` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `BUSINESS_UNIT` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `MANUAL_PAYMENTS` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `FED_RETIRE_CDE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `OPDIV` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PP_YEAR_NUM` | `NUMBER(6,0)` | `NUMBER(6,0)` | OK |  |
| `SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `COMP_BEGIN_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_EARN_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_USED_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `OT_EARN_YTD_DOLL_VALUE` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_BEGIN_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_EARN_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `REL_COMP_USED_YTD_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_HRS_ERND_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_HRS_USED_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `COMP_PAID_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TRAVEL_COMP_HRS_ERND_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `TRAVEL_COMP_HRS_USED_CPP` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |

</details>

**Extra in Snowflake (no Oracle source)**: `DON_LV_HRS_BAL`, `DON_LV_HRS_USED_CPP`

### `CPM_PAD_DETAIL_STG_TBL` — PASS

- **Source**: `CPM_PAD_DETAIL_STG_TBL` (Oracle)
- **Columns**: 150 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (150 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PAD_SERVING_AGENCY` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PAD_CCPO_ID` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PAD_SOC_SEC_NO` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PAD_RESP_CTR_COST_CTR` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PAD_REGULAR_EARNINGS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_OVERTIME_EARNINGS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_HOLIDAY_PREMIUM_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_STNDBY_UNCO_AVAIL_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_SUNDAY_PREMIUM_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_NIGHT_DIFFERENTIAL_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_LUMP_SUM_LEAVE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_HAZARDOUS_DUTY_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_ENVIRONMENTAL_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_AWARD_AMOUNT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_ANNUAL_LVE_ENDING_BALANCE` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_SICK_LVE_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_SICK_LVE_ENDING_BALANCE` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_EMPLR_CONTR_FEGLI` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EMPLR_CONTR_FEHBA` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EMPLR_CONTR_CSRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EMPLR_CONTR_FERS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EMPLR_CONTR_TSP_M` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EMPLR_CONTR_TSP_C` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EMPLR_CONTR_TSP_F` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EMPLR_CONTR_FERS_1PERC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EMPLR_CONTR_MEDIC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_PAY_PERIOD_END_DATE` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PAD_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_ACTIVITY` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PAD_ORGANIZATION` | `VARCHAR2(7)` | `VARCHAR(7)` | OK |  |
| `FILLER1` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_REGULAR_HOURS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_OVERTIME_HOURS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_NIGHT_DIFF_HOURS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_ENVR_HAZARD_HOURS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_HOLIDAY_PREMIUM_HOURS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_STNBY_UNC_AVAIL_HOURS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_SUNDAY_PREMIUM_HOURS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_ADMIN_LVE_HOURS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_SICK_LEAVE_ACCRUED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_COMP_TIME_EARNED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_COMP_TIME_USED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_COMP_TIME_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_RELIG_COMP_EARNED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_RELIG_COMP_USED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_RELIG_COMP_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_CREDIT_HOURS_EARNED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_CREDIT_HOURS_USED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_CREDIT_HOURS_END_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `FILLER0` | `VARCHAR2(10)` | `VARCHAR(10)` | OK |  |
| `PAD_COLA` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_REEMP_ANN_OFFSET_AMT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_RECRUITMENT_INCENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_INTEREST_AMOUNT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_TROPICAL_DIFF` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_BENEFIT_ALLOWANCE` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_PHYSICIANS_ALLOWANCE` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_REMOTE_SITE_ALLOWANCE` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_SEVERANCE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_DANGER_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EXTRACURR_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EXTRA_DUTY_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_TRANSFER_ALLOWANCE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_EDUC_TRAV_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_TIME_OFF_USED_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_TIME_OFF_END_BAL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_AGENCY_CODE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PAD_ACCOUNTING_ACTIVITY` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PAD_EMPLOYEE_NAME` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `PAD_EMPLOYEE_STATUS` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_PAYROLL_OFFICE_ID` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PAD_APPROPRIATION` | `VARCHAR2(13)` | `VARCHAR(13)` | OK |  |
| `PAD_US_CODE_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_ASSIGNED_JON_CC_PC` | `VARCHAR2(18)` | `VARCHAR(18)` | OK |  |
| `PAD_FISCAL_YEAR` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_PROGRAM_YEAR` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_FUND_CODE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PAD_MILITARY_LVE_BAL` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_MILITARY_LVE_EARNED_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_ANNUAL_LVE_EARNED_PP` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_PP_NON_PAY_USED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_PP_ANNUAL_LVE_USED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_ANNUAL_LVE_FORFEIT_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_SHORE_LVE_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_HOME_LVE_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_LAW_ENFORCE_LVE_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_DONATED_LVE_BAL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_DONATED_LVE_USED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_TIME_OFF_OLDEST_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_TIME_OFF_OLDEST_DATE` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PAD_COMP_OLDEST_UNUSED_HRS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_COMP_OLDEST_UNUSED_DATE` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PAD_COMP_OLDEST_RATE` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_SEPARATION_INCENTIVE` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_SUPERVISOR_DIFF_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_RECURRING_ALLOWANCES` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_ONE_TIME_BONUS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_PP_NAF_RETIREMENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_PP_401K` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_STATE_EMPL_RETIREMENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_PROGRAM_ELEM_CODE` | `VARCHAR2(10)` | `VARCHAR(10)` | OK |  |
| `PAD_FEGLI_BASIC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_FEGLI_OPTIONAL` | `NUMBER(12,2)` | `NUMBER(12,2)` | OK |  |
| `PAD_FEHB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_CSRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_FERS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_NON_PAY_HRS_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_ANNUAL_LVE_USED_YTD` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_SICK_LVE_FERS` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_GROSS_PAY_YTD` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_ADDRESS_STREET_1` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `PAD_ADDRESS_STREET_2` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `PAD_ADDRESS_CITY` | `VARCHAR2(13)` | `VARCHAR(13)` | OK |  |
| `PAD_ADDRESS_STATE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PAD_ADDRESS_ZIP` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PAD_EMPL_ORG_CODE_1` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PAD_EMPL_ORG_DEDUCT_AMT_1` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_REMARKS_IDC_1` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_EMPL_ORG_CODE_2` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PAD_EMPL_ORG_DEDUCT_AMT_2` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_REMARKS_IDC_2` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_EMPL_ORG_CODE_3` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PAD_EMPL_ORG_DEDUCT_AMT_3` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_REMARKS_IDC_3` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_EMPL_ORG_CODE_4` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PAD_EMPL_ORG_DEDUCT_AMT_4` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_REMARKS_IDC_4` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_EMPL_ORG_CODE_5` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PAD_EMPL_ORG_DEDUCT_AMT_5` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_REMARKS_IDC_5` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_EMPL_ORG_CODE_6` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PAD_EMPL_ORG_DEDUCT_AMT_6` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_REMARKS_IDC_6` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PAD_MILITARY_LVE_USED_YTD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_MMD_DDS_SPEC_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_RECRUIT_INCENTIVE_AMT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_RELOCAT_INCENTIVE_AMT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_RETENTN_INCENTIVE_AMT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PAD_COMPTIME_TRAVEL_EARNED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_COMPTIME_TRAVEL_USED` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_COMPTIME_TRAVEL_BALANCE` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PAD_BRAC_RESTORED_BEGBAL` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `PAD_BRAC_RESTORED_ADDED_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `PAD_BRAC_RESTORED_USED_PAYPD` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PAD_BRAC_RESTORED_USED_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `PAD_BRAC_RESTORED_PAID_YTD` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |
| `PAD_BRAC_RESTORED_ENDBAL` | `NUMBER(6,2)` | `NUMBER(6,2)` | OK |  |

</details>

### `CPM_PAD_HEADER_STG_TBL` — PASS

- **Source**: `CPM_PAD_HEADER_STG_TBL` (Oracle)
- **Columns**: 8 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (8 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PAD_RECORD_TYPE` | `VARCHAR(1)` | `VARCHAR(1)` | OK |  |
| `PAD_PAYROLL_OFFICE_ID_CODE` | `VARCHAR(6)` | `VARCHAR(6)` | OK |  |
| `PAD_FILE_ID` | `VARCHAR(8)` | `VARCHAR(8)` | OK |  |
| `PAD_PP_END_DTE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `PAD_DISBURSING_DTE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `PAD_QTR_END_DTE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |

</details>

### `CPM_PAY_PERIOD_DATE_FILE` — PASS

- **Source**: `CPM_PAY_PERIOD_DATE_FILE` (Flat File)
- **Columns**: 1 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (1 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PAY_PERIOD_TXT` | `STRING(6)` | `VARCHAR(100)` | OK | STRING(6) → VARCHAR(100): widened |

</details>

### `CPM_PM1_STG_TBL` — PASS

- **Source**: `CPM_PM1_STG_TBL` (Oracle)
- **Columns**: 37 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (37 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PYF_REC_NO_1` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_EYE_ID_1` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_PAY_BLK_1` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PYF_EMP_ACT` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PYF_ORG` | `VARCHAR2(7)` | `VARCHAR(7)` | OK |  |
| `PYF_EYE_NME` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `PYF_PMT_MET_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_FIN_ORG_RTN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_GR_UNGR_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_DOB_DATE` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_EYE_AGE_CAT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_GLI_CVG_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_MLT_APMT_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_MS_FED` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_FITW_ADD_PAY_PD` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `PYF_FITW_XMP` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `PYF_EYE_TYP_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_FLSA_XMP_STA` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_PAY_PN_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_GR_CIV` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_PAY_RAT_STP` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_SRY_BSE_ANL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PYF_SRY_HR` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PYF_ADR_STR_1` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `PYF_ADR_STR_2` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `PYF_ADR_CITY` | `VARCHAR2(13)` | `VARCHAR(13)` | OK |  |
| `PYF_ADR_ST` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_ADR_ZIP` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_WALK_SEQ` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_CHK_CODE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_FILLER_RT1` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_SEC_DISB_OFC_RT1` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PYF_HIS_PGRANGE_RT1` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `PYF_DISB_OFC_RT1` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PYF_MPH_PGRANGE_RT1` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |

</details>

### `CPM_PM2_STG_TBL` — PASS

- **Source**: `CPM_PM2_STG_TBL` (Oracle)
- **Columns**: 43 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (43 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PYF_REC_NO_2` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_EYE_ID_2` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_PAY_BLK_2` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PYF_AGY_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_SON` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `PYF_ACTG_ACT` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PYF_MAJOR_CLAIMANT` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_FIN_ORG_ACCT_NO` | `VARCHAR2(17)` | `VARCHAR(17)` | OK |  |
| `PYF_FIN_ORG_ACCT_TYP` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_TSP_SVC_CMP_DATE` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_TSP_VEST_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_TSP_STA_DATE` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_TSP_STA_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_TSP_ELG_DATE` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_RET_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_EYE_STA_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_SEP_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_LOC_ADJ` | `NUMBER(8,2)` | `NUMBER(8,2)` | OK |  |
| `PYF_BSC_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PYF_BSC_OT_RAT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PYF_LOC_PAY_PCT` | `NUMBER(5,4)` | `NUMBER(5,4)` | OK |  |
| `PYF_SVC_CMP_DATE_LV` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_MIL_DEP_OWED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PYF_MIL_DEP_PAID` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PYF_DY_ENT_DATE` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_TPY_POS_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_BWKLY_SCD_HRS` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PYF_PAY_PN_ID` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_TAX_STA_FED` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_EMP_STAT_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_FILLER_PAY` | `VARCHAR2(14)` | `VARCHAR(14)` | OK |  |
| `PYF_SEP_CD_8` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_SEP_DATE_8` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_PRIOR_EYE_ID_8` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_PRIOR_DOB_DATE_8` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_TSP_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_FILLER_RT2` | `VARCHAR2(14)` | `VARCHAR(14)` | OK |  |
| `PYF_SEC_DISB_OFC_RT2` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PYF_HIS_PGRANGE_RT2` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `PYF_DISB_OFC_RT2` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PYF_MPH_PGRANGE_RT2` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |

</details>

### `CPM_PM3_STG_TBL` — PASS

- **Source**: `CPM_PM3_STG_TBL` (Oracle)
- **Columns**: 40 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (40 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PYF_REC_NO_PDT3` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_EYE_ID_PDT3` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_GEN_SEQ_ID` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PYF_PAY_BLK_PDT3` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `PYF_PAY_TAC_TYP` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `PYF_DATE_EFF` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_PAY_DET_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_OT_ENV_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_HRS_SCD_AMT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PYF_ACTUAL_AMT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `PYF_PAY_RAT` | `NUMBER(5,2)` | `NUMBER(5,2)` | OK |  |
| `PYF_CASH_PMT_AMT` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `PYF_ADJ_RSN_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_ADJ_DATE_EFF` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_ADJ_SYS_GEN_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_RSN_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PFY_ID_BREAK_SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PFY_ID_BREAK_CODE` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `PFY_FILLER` | `VARCHAR2(12)` | `VARCHAR(12)` | OK |  |
| `PYF_DDU_PYE` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `PYF_ITW_MS` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_ITW_XMP` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `PYF_ITW_ADD` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `PYF_ALLOW_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_OFFSET_IDC` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_USER_NME` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_ACC_DATE` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PYF_ACC_TME` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `PYF_AWD_SEQ_NO` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `PYF_RETRO_TAXES_DONE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_RETRO_RETIREMENT_DONE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_RETRO_OTH_DONE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_FILLER_PDT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `PYF_FILLER_RT3` | `VARCHAR2(55)` | `VARCHAR(55)` | OK |  |
| `PYF_SEC_DISB_OFC_RT3` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PYF_HIS_PGRANGE_RT3` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |
| `PYF_DISB_OFC_RT3` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `PYF_MPH_PGRANGE_RT3` | `NUMBER(8,0)` | `NUMBER(8,0)` | OK |  |

</details>

### `CPM_PMH_STG_TBL` — PASS

- **Source**: `CPM_PMH_STG_TBL` (Oracle)
- **Columns**: 3 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (3 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PYF_REC_PPE_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |

</details>

### `CPM_YTD_DETAIL_STG_TBL` — PASS

- **Source**: `CPM_YTD_DETAIL_STG_TBL` (Oracle)
- **Columns**: 106 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (106 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `RECORD_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `DYD_SSN_1` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `DYD_NAME` | `VARCHAR2(27)` | `VARCHAR(27)` | OK |  |
| `DYD_ORGANIZATION` | `VARCHAR2(6)` | `VARCHAR(6)` | OK |  |
| `DYD_ACTIVITY` | `VARCHAR2(7)` | `VARCHAR(7)` | OK |  |
| `DYD_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_ADD_BASE_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_OVERTIME_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_NIGHT_DIFF_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_SUN_PREM_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_HOL_PREM_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_POST_DIFF_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FOREIGN_ALLOW` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_COLA_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_UNIF_ALLOW` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_SEVER_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_CASH_AWARDS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_GROSS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEDERAL_TAX_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_FED_TAX` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_CSRS_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_CSRS_EMPL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_CSRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_OASDI_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_OASDI_EMPL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_OASDI` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_MEDICARE_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_MEDICARE_EMPL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_MEDICARE` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FERS_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FERS_EMPL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_FERS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEHB_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEHB_EMPL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_BOND_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEGLI_REG` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEGLI_EMPL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEGLI_OPTA` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEGLI_OPTB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEGLI_OPTC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_CHARITY_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_UNION_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_ALLOTMENTS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_QUARTERS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_NET_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_CS_ALIMONY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_EIC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PCA` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_TSP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_TSP_BASIC_EMPL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_TSP_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_TSP_EMPL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_TSP_LOAN_DED` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_STAFF_DIFF` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_ON_CALL_TITLE5` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_ON_CALL_TITLE38` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_OVERTIME_TITLE38` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_HOLIDAY_TITLE38` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_TOUR_DIFF_TITLE38` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_SAT_PREM_TITLE38` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_SUN_PREM_TITLE38` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_LTC_PREM` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_DEBT_AMT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PHY_SPEC_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_SEP_INCENTIVE` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_LSL_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_RECRUIT_BONUS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_RELOC_BONUS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_RETENT_ALLOW` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_CHILD_CARE_SUBSIDY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_REL_COMP_LS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_CR_HRS_LS_PAY` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PREPAY_FEHB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FSA_HLTH` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FSA_DC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_VISION` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_DENTAL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_VISION_DENTAL` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_HEALTH_SAVINGS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_TSP_CATCHUP` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_ENVIR_HAZ` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_MILITARY_DEPOSIT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_OTHER_RETIREMENT` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_TEA` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_NAF_RET` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_OTHER_RET` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_RET_DED_SUB_PR` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_FEHB_DED_SUB_PR` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_COLA_DED_SUB_PR` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_ACCUMULATIVE_CSRS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_ACCUMULATIVE_FERS` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_OASDI_EARNINGS_TRANS_IN` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_OASDI_DEDUCT_TRANS_IN` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PRETAX_FEHB` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_ADMINISTRATIVE_LEAVE` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_ANNUAL_LEAVE_EARNED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_ANNUAL_LEAVE_USED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_SICK_LEAVE_EARNED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_SICK_LEAVE_USED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_MILITARY_LEAVE_EARNED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_MILITARY_LEAVE_USED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_LWOP_AWOL` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_RESTORED_LEAVE_EARNED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |
| `DYD_RESTORED_LEAVE_USED` | `NUMBER(7,2)` | `NUMBER(7,2)` | OK |  |

</details>

### `CPM_YTD_HEADER_STG_TBL` — PASS

- **Source**: `CPM_YTD_HEADER_STG_TBL` (Oracle)
- **Columns**: 7 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (7 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `RECORD_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `DFAS_YTD_FILE_NAME` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `DFAS_YTD_DB_NAME` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `DFAS_YTD_PPEND_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `DFAS_YTD_DATE_OF_FILE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |

</details>

### `CPM_YTD_STATE_STG_TBL` — PASS

- **Source**: `CPM_YTD_STATE_STG_TBL` (Oracle)
- **Columns**: 8 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (8 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_END_YEAR` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `PP_NUM` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `RECORD_TYPE` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `GEN_SEQ_ID` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |
| `DYD_SSN_2` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `DYD_STATE_TAX_CODE` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `DYD_STATE_TAX_DEDUC` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |
| `DYD_PAY_SUB_STATE_TAX` | `NUMBER(9,2)` | `NUMBER(9,2)` | OK |  |

</details>

### `ERROR_TBL` — PASS

- **Source**: `ERROR_TBL` (Oracle)
- **Columns**: 8 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (8 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PROCESS_NAME` | `VARCHAR2(100)` | `VARCHAR(100)` | OK |  |
| `ERROR_MESSAGE` | `VARCHAR2(200)` | `VARCHAR(200)` | OK |  |
| `SOURCE_KEY` | `VARCHAR2(50)` | `VARCHAR(50)` | OK |  |
| `ERROR_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `PP_END_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `PP_NUM` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `CYCLE_ID` | `NUMBER(3,0)` | `NUMBER(3,0)` | OK |  |
| `ERROR_CODE` | `VARCHAR2(50)` | `VARCHAR(50)` | OK |  |

</details>

### `HI_GENERIC_SRC_TBL` — PASS

- **Source**: `HI_GENERIC_SRC_TBL` (Oracle)
- **Columns**: 1 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (1 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `ID` | `NUMBER(10,0)` | `NUMBER(10,0)` | OK |  |

</details>

### `MER_FILE` — PASS

- **Source**: `MER_FILE` (VSAM)
- **Columns**: 2 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (2 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `MER_LV_HDR_RECORD` | `VSAM_RECORD` | `VARCHAR(700)` | OK | VSAM record → VARCHAR (manual mapping) |
| `MER_LV_DETAIL_RECORD` | `VSAM_RECORD` | `VARCHAR(768)` | OK | VSAM record → VARCHAR (manual mapping) |

</details>

### `PAD_FILE` — PASS

- **Source**: `PAD_FILE` (VSAM)
- **Columns**: 2 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (2 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PAD_RECORD_HEADER` | `VSAM_RECORD` | `VARCHAR(1400)` | OK | VSAM record → VARCHAR (manual mapping) |
| `PAD_RECORD_DETAIL` | `VSAM_RECORD` | `VARCHAR(1508)` | OK | VSAM record → VARCHAR (manual mapping) |

</details>

### `PAYMASTER_FILE` — PASS

- **Source**: `PAYMASTER_FILE` (VSAM)
- **Columns**: 4 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (4 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `WS_PAYMASTER_HEADER` | `VSAM_RECORD` | `VARCHAR(256)` | OK | VSAM record → VARCHAR (manual mapping) |
| `WS_PAYMASTER_RECORD_1` | `VSAM_RECORD` | `VARCHAR(258)` | OK | VSAM record → VARCHAR (manual mapping) |
| `WS_PAYMASTER_RECORD_2` | `VSAM_RECORD` | `VARCHAR(263)` | OK | VSAM record → VARCHAR (manual mapping) |
| `WS_PAYMASTER_RECORD_3` | `VSAM_RECORD` | `VARCHAR(260)` | OK | VSAM record → VARCHAR (manual mapping) |

</details>

### `PAY_PERIOD` — PASS

- **Source**: `PAY_PERIOD` (Oracle)
- **Columns**: 10 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (10 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `PP_NUM` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `PP_END_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `PP_START_DTE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `PP_END_DTE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `LV_NUM` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `LV_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `PAY_DTE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `CURR_PP_FLAG` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `HOLIDAY_1` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `HOLIDAY_2` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |

</details>

### `PSEUDOSSN_TBL` — PASS

- **Source**: `PSEUDOSSN_TBL` (Oracle)
- **Columns**: 63 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (63 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `SSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `CAN_CD` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `PSEUDOSSN` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `EMPLID` | `VARCHAR2(8)` | `VARCHAR(8)` | OK |  |
| `EMPL_RCD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `APPT_NUM` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `EMP_FIRST_NAME` | `VARCHAR2(11)` | `VARCHAR(11)` | OK |  |
| `EMP_MID_INIT` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `EMP_LAST_NAME` | `VARCHAR2(16)` | `VARCHAR(16)` | OK |  |
| `SEX` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `VETERANS_PREFERENCE_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `TENURE_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `POSITION_NUM` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `US_CITIZENSHIP_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `APPT_TYPE_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `HIRE_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `HANDICAP_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `UNF_ALLOW_CD` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `UNIF_ALLOW_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `UNIF_ALLOW_AMT` | `NUMBER(10,2)` | `NUMBER(10,2)` | OK |  |
| `RSSSDP` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `CEIL_REPORTING_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `FUNCTNL_CLASSFCTN_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `EMP_STATUS` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `MANAGER_STATUS` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `POSITION_SENSITIVITY_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `CAREER_START_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `CAREER_CONV_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `PROBATION_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `ABNORMAL_RATE_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `APPT_LIMIT_HRS` | `NUMBER(10,2)` | `NUMBER(10,2)` | OK |  |
| `APPT_LIMIT_PAY` | `NUMBER(10,2)` | `NUMBER(10,2)` | OK |  |
| `LAST_PAY_CHANGE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `CHARITY_AREA_CD` | `VARCHAR2(3)` | `VARCHAR(3)` | OK |  |
| `CHARITY_EFF_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `CHARITY_DED_AMT` | `NUMBER(10,2)` | `NUMBER(10,2)` | OK |  |
| `LAST_NOA_CD` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `QUARTERS_DED_AMT` | `NUMBER(10,2)` | `NUMBER(10,2)` | OK |  |
| `SUBSIST_DED_AMT` | `NUMBER(10,2)` | `NUMBER(10,2)` | OK |  |
| `PAY_BASIS_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `WORK_SCHEDULE_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `OCCUPATION_CD` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `DUTY_STATION` | `VARCHAR2(9)` | `VARCHAR(9)` | OK |  |
| `JOB_IND` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `REG_TEMP_CD` | `VARCHAR2(1)` | `VARCHAR(1)` | OK |  |
| `SEPERATION_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `PCA_CONTR_EFF_START_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `PCA_CONTR_EFF_END_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `MAX_ANNUAL_PAY` | `NUMBER(10,2)` | `NUMBER(10,2)` | OK |  |
| `PCA_BIWEEKLY_AMT` | `NUMBER(10,2)` | `NUMBER(10,2)` | OK |  |
| `PAY_PLAN_CD` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `APPT_NTE_DTE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `SPECIAL_PROGRAM_CD` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `TERM_ID` | `VARCHAR2(2)` | `VARCHAR(2)` | OK |  |
| `EFFECTIVE_DATE` | `DATE` | `TIMESTAMP_NTZ` | OK | DATE → TIMESTAMP_NTZ: standard Oracle-to-Snowflake mapping |
| `EFFECTIVE_SEQ` | `NUMBER(5,0)` | `NUMBER(5,0)` | OK |  |
| `PAY_TABL_NO` | `VARCHAR2(4)` | `VARCHAR(4)` | OK |  |
| `BUSINESS_UNIT` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `DEPTID` | `VARCHAR2(10)` | `VARCHAR(10)` | OK |  |
| `PCA_CONTR_LEN_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |
| `TK_NUM` | `VARCHAR2(5)` | `VARCHAR(5)` | OK |  |
| `PP_NUM` | `NUMBER(2,0)` | `NUMBER(2,0)` | OK |  |
| `PP_END_YEAR` | `NUMBER(4,0)` | `NUMBER(4,0)` | OK |  |

</details>

### `YTD_FILE` — PASS

- **Source**: `YTD_FILE` (VSAM)
- **Columns**: 3 matched | 0 missing in Snowflake | 0 extra in Snowflake

<details>
<summary>Column mappings (3 columns)</summary>

| Column | Oracle Type | Snowflake Type | Status | Notes |
|--------|-----------|---------------|--------|-------|
| `DFAS_YTD_HEADER` | `VSAM_RECORD` | `VARCHAR(1050)` | OK | VSAM record → VARCHAR (manual mapping) |
| `DFAS_YTD_DETAIL` | `VSAM_RECORD` | `VARCHAR(1129)` | OK | VSAM record → VARCHAR (manual mapping) |
| `DFAS_YTD_STATE` | `VSAM_RECORD` | `VARCHAR(1052)` | OK | VSAM record → VARCHAR (manual mapping) |

</details>

---

## Methodology

1. Parsed the Informatica PowerCenter XML export (`XML/CPM`) to extract all `<SOURCE>` and `<TARGET>` element definitions including column names, data types, precision, and scale.
2. Parsed the Snowflake DDL (`snowflake_migration/ddl/01_cpm_tables.sql`) to extract all `CREATE TABLE` column definitions.
3. Matched tables by name and compared each column's Oracle type against its Snowflake type using standard Oracle→Snowflake mapping rules.
4. Flagged any conversions where precision, scale, or data type class could result in data loss.

### Validation Criteria

- **OK**: Type mapping follows standard Oracle→Snowflake conversion rules with no data loss risk
- **LOSSY**: Conversion may result in data truncation or precision loss
- **WARN**: Unexpected type mapping that should be reviewed
