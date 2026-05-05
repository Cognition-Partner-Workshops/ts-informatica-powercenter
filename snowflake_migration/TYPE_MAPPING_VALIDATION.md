# Type Mapping Validation Report

## Overview

This report validates the Oracle → Snowflake type mappings for the
Informatica PowerCenter CPM migration. It compares column definitions from
the PowerCenter XML exports (`XML/`) against the Snowflake DDL files
(`snowflake_migration/ddl/`).

## Summary

- **Total columns validated:** 1929
- **Columns mapped correctly:** 1929
- **Columns flagged for review:** 0
- **DDL tables matched to XML:** 23
- **DDL tables with no XML match:** 0
- **XML tables not in DDL:** 42

---

## Per-Table Validation

### COUNTER_TBL

**Origin:** TARGET | **XML file:** `COMPTIME` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| RUN_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| PROCESS_NAME | VARCHAR2(100) | VARCHAR(100) | Yes | — |
| COUNTER_DESCRIPTION | VARCHAR2(200) | VARCHAR(200) | Yes | — |
| COUNTER_VALUE | NUMBER(15,0) | NUMBER(15,0) | Yes | — |
| PP_END_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| PP_NUM | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CYCLE_ID | NUMBER(1,0) | NUMBER(1,0) | Yes | — |

### CPM_MER_DETAIL_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| MER_RECTYP | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| MER_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| MER_EMP_ACTVTY | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| MER_ORG | VARCHAR2(7) | VARCHAR(7) | Yes | — |
| MER_EMPTYPCD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| MER_ACTION_NATURE_CD | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| MER_TEMP_PROM_NTE_DT | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| MER_TEMP_DTL_NTE_DT | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| MER_PAY_BASIS_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| MER_PREM_PAY_IND | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| MER_PREM_HRLY_RT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_ANUITNT_IND | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| MER_ANUITNT_DIFF_HRLY_RT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_SPECL_PGM_IND | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| MER_COLA_HRLY_RT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_PST_DIFF_NON_FRGN_HRLY_RT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_MSTR_LV_HIST_EFF_DT | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| MER_SERVICE_COMP_DT_LV | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| MER_DUTY_ENTRY_DT | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| MER_SEP_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| MER_SEP_DT | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| MER_DT_LAST_INCR | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| MER_ADDR_STREET1 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| MER_ADDR_STREET2 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| MER_ADDR_CITY | VARCHAR2(13) | VARCHAR(13) | Yes | — |
| MER_ADDR_STATE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| MER_ADDR_ZIP | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| MER_FEDTX_WTHOLD_EXEMPTS | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| MER_FEDTX_MAR_STATUS | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| MER_ANN_LV_ACCRUAL_RT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_ANN_LV_ACCRD_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ADVNCD_ANN_LV_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ANN_LV_ENDBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ANN_LV_BEGBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ANN_LV_CEILING | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ANN_LV_CRED_REDN_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ANN_LV_FORFEIT_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ANN_LV_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ANN_LV_USED_PAY_PD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_COMP_TIME_ENDBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_COMP_TIME_BEGBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_COMP_TIME_EARN_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_COMP_TIME_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_CRED_HRS_ENDBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_CRED_HRS_BEGBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_CRED_HRS_EARN_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_CRED_HRS_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_MIL_LV_ENDBAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_MIL_LV_BEGBAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_MIL_LV_USED_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_NPAY_HRS_USED_PAY_PD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_NPAY_HRS_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_RELG_CMPTM_ENDBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_RELG_CMPTM_BEGBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_RELG_CMPTM_EARN_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_RELG_CMPTM_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_RSTRD_ANN_LV_ENDBAL_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_RSTRD_ANN_LV_ENDBAL_2 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_RSTRD_ANN_LV_ENDBAL_3 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_SICK_LV_ACCRUAL_RT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_SICK_LV_ACCRUED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_ADVNCD_SICK_LV_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_SICK_LV_ENDBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_SICK_LV_BEGBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_SICK_LV_CRED_REDN_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_SICK_LV_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_SICK_LV_USED_PAY_PD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_ST_TAX_AUTH_1 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| MER_ST_TX_EXEMPTS_1 | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| MER_ST_TAX_AUTH_2 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| MER_ST_TX_EXEMPTS_2 | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| MER_OT_EARN_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| MER_TOFF_AWRD_BEG_YRGAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_TOFF_AWRD_AUTHHRS_YTD | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| MER_TOFF_AWRD_USED_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_TOFF_AWRD_FORF_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_TOFF_AWRD_ENDBAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_FF_DIVISOR_IND | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| MER_ALT_HRLY_RT_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_ALT_HRLY_RT_2 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_ALT_ANUITNT_DIFF | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_ALT_COLA_HRLY_RT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_ALT_PSTDIFFNFHRLY_RT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_TVL_COMP_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_TVL_COMP_BEGIN_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_TVL_COMP_EARN_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_TVL_COMP_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_TVL_COMP_TIME_FORF | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_BRAC_ENDBAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_EMER_LV_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MER_FROZ_ANN_LV_USED_PAY_PD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_FROZ_ANN_LV_USED_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MER_FROZ_ANN_LV_ENDBAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |

### CPM_MER_HEADER_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| RECORD_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| RECORD_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| FILE_ID | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| PAYROLL_OFFICE_ID_CODE | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| REPORT_RECIPIENT | VARCHAR2(6) | VARCHAR(6) | Yes | — |

### CPM_NEWPAY_STG_ALT_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| DFAS_PSEUDO_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_PAY_DET_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| ALT_1_INST_AC_NO | NUMBER(9,0) | NUMBER(9,0) | Yes | — |
| ALT_1_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_1_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_1_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_1_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_2_INST_ACCT_NO | NUMBER(9,0) | NUMBER(9,0) | Yes | — |
| ALT_2_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_2_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_2_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_2_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_2_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_4_INST_AC_NO | NUMBER(9,0) | NUMBER(9,0) | Yes | — |
| ALT_4_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_4_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_4_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_4_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_4_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_5_INST_AC_NO | NUMBER(9,0) | NUMBER(9,0) | Yes | — |
| ALT_5_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_5_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_5_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_5_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_5_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_6_INST_AC_NO | NUMBER(9,0) | NUMBER(9,0) | Yes | — |
| ALT_6_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_6_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_6_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_6_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_6_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_7_INST_AC_NO | NUMBER(9,0) | NUMBER(9,0) | Yes | — |
| ALT_7_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_7_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_7_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_7_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_7_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_8_INST_AC_NO | NUMBER(9,0) | NUMBER(9,0) | Yes | — |
| ALT_8_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_8_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_8_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_8_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_8_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |

### CPM_NEWPAY_STG_DETAIL_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| DFAS_PSEUDO_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| CPP_REF_DED_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ADJ_REFUND_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FED_OPT_TAX_DED | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ST_TAX_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ST_TAX_EXEMP | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| ST_TAX_OPT_DED | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ST_TAX_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CITY_ST_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CITY_ID_CDE | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| CITY_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CITY_EXEMP | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| HLTH_ENROL_CDE_1_2 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| HLTH_ENROL_CDE_3 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| COMP_TIME_HRLY_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CSA_RECIPIENT_NAME | VARCHAR2(22) | VARCHAR(22) | Yes | — |
| CSA_RECIPIENT_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| VIS_DENT_1_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_2_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_3_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |

### CPM_NEWPAY_STG_TYPE_1_2_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| PP_NUM | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| DFAS_PSEUDO_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| FIR_NAME_1 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CODE_CONSL | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FIR_NAME_3_11 | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| MID_INIT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| SURNAME_3 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| SURNAME_OTHER | VARCHAR2(13) | VARCHAR(13) | Yes | — |
| SOC_SEC_NO | NUMBER(11,0) | NUMBER(11,0) | Yes | — |
| PYF_PAY_DET_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| OCCUP_CDE | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| JOB_LOC_CDE | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| ST_CONT_LOC | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CITY_LOC | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| CTY_CTRY_LOC | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| TK_NO | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| CAN | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| CAN_FY | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CAN_AGCY | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CAN_AP | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CAN_AGCY_ACCT_CDE | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| ORG_CDE | VARCHAR2(11) | VARCHAR(11) | Yes | — |
| ORG_P01 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P2 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P3 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P4 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P5 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P6 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P7 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P8 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P9 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_PX | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P11 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| SPOC | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| SEX_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| VET_PREF_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TENURE_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| EHRP_EMP_ID | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| EHRP_EMP_REC_NO | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PERM_TEMP_POS_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FT_PT_INTER_POS_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CITIZEN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TYPE_APPT_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| EOD_DATE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| PHY_HNDCP | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CEILING_EN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FUNC_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| SUPV_CDE | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| PAY_BASIS | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| POS_SEN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CAR_SERV_DTE | NUMBER(16,0) | NUMBER(16,0) | Yes | — |
| PROB_DTE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| SPO_TERM_ID | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| ABNOR_RATE_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FED_RETIRE_CDE_OLD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TSPA_STATUS_CODE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TSPA_VEST_PERIOD | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| EFT_EMPL_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| EFT_EMPL_ACCT_NUMBER | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| FS_DATE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| TSPA_STATUS_CODE_DTE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| TSPA_SCD | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| OT_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| LOCAL_PCENT_RATE | NUMBER(5,4) | NUMBER(5,4) | Yes | — |
| CPP_LOCAL_DIFF | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| AGCY_CDE_PER | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| SEP_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| SEP_DATE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| PERS_NOA | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| ANNUAL_SAL | NUMBER(7,0) | NUMBER(7,0) | Yes | — |
| FLSA_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_NO | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| DATE_BIRTH | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| EFT_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| EFT_CK_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| EFT_ROUT_CK_ID | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| POSITION_1 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| POSITION_2 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| GRADE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| STEP | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FEGLI_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FEGLI_CDE_2 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TOT_FED_TAX_EXEMP | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| FED_TAX_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| HRLY_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SEV_PAY_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HLTH_DED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HLTH_GOVT_SHARE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| UNION_IDENT_CDE | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| UNION_DED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PCA_BIWEEK_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| AN_LV_EARNED_CPP | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| SICK_LV_ERN_CPP | NUMBER(4,2) | NUMBER(4,2) | Yes | — |
| COMP_LV_ERN_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| COMP_LV_USD_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| ADMIN_LV_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| LWOP_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| STAFFING_BIW_AMT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| INCENT_TIME_CUR_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PSP_BIWKLY_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_ERND_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| REL_COMP_USED_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_ERND_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_USED_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| FERS_BAL_FWD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| AN_LV_CR_RED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_CR_RED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| LV_CAT_CDE | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| AN_LV_USED_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| AN_LV_ERND_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| AN_LV_ADV_CBAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| AN_LV_USED_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| AN_LV_CUR_BAL | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| AN_LV_MAX_COVER | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| AN_LV_USE_LOSE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_USD_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_ERN_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_AD_CBAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_USD_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| SICK_LV_CUR_BAL | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| COMP_LV_CUR_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| RESTOR_AL_BALANCE | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| RESTOR_AL_BAL_1 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| RESTOR_AL_BAL_2 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| RESTOR_AL_BAL_3 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PSI_START_DATE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| REL_COMP_CURR_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_CUR_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| TVL_COMP_BEGIN_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TVL_COMP_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TVL_COMP_EARN_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TVL_COMP_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TVL_COMP_FORFEITED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_OT_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ND_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_SD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_HOL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_PD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_COLA_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_UNIF_ALLOW | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_SEV_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_CASH_AWARDS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_MP_CASH_AWARD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LSL_PAY_OLD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_MISC_OTH_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_NON_TAX_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_FED_TAX_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TAXABLE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_CSR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_CSR_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_CSR_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FICA_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FICA_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_MEDC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_MEDC_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_PAY_S_MEDC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_FERS_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FERS_AGY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FERS_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_LEVY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_STATE_1 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_1_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_1_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_2 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_2_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_2_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_2_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_3 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_3_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_3_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_3_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_4 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_4_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_4_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_4_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_HLTH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_HLTH_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_BOND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LI_REG_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LI_REG_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LI_OPT_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FEGLI_OPTB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FEGLI_OPTC | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_CHAR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_UNION_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ALT_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_QUARTERS_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_SUBSIST_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LAUNDRY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_CSA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| EIC_YTD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PCA_YTD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TSPA_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_TSPG_GBADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TSPG_EADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TSPG_GMADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_STAFFING | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LOAN_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_HEALTH_SAVINGS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ON_CALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| T38_OT_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_HOL_OT_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_ND_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_ONCALL_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_SAT_DIF_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_SUN_DIF_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_LTC_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_DCS_DEBT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_PSP_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| RET_BAL_FWD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_SEP_INCENT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LSL_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_RECRUIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_RELOC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_RETENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_TEA_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_CHILD_SUB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_LS_PAY_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CR_HRS_LS_PAY_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_PREPD_HB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FSAHC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FSADC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TSP_OVER50 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_1_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_2_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_3_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TRANSFER_IN_FICA_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| TRANSFER_IN_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| FEHB_PC_PRE_TAX_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADMIN_LV_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MILITARY_LV_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| LWOP_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| RESTOR_AL_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| OC_1217_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| OC_121S_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| OC_1211_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| OC_1111_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| WORK_ADDR_STREET1 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| WORK_ADDR_STREET2 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| WORK_ADDR_CITY | VARCHAR2(13) | VARCHAR(13) | Yes | — |
| WORK_ADDR_STATE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| WORK_ADDR_ZIP | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| BUSINESS_UNIT | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| FED_RETIRE_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| OPDIV | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PP_YEAR_NUM | NUMBER(6,0) | NUMBER(6,0) | Yes | — |
| SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| COMP_BEGIN_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_EARN_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_USED_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| OT_EARN_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_BEGIN_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_EARN_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_USED_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |

### CPM_NEWPAY_STG_TYPE_3_FDR_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| DFAS_PSEUDO_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| LINE_TYPE | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| PYF_PAY_TAC_TYP | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| PYF_PAY_DET_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| MP_POOL_DES | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| ADJ_NO | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CPP_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_REF_DED_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_REF_DED_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HLTH_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HLTH_EMPLR_AFPS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_REFUND_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ADJ_REFUND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_DCS_DEBT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_DCS_DEBT_AMT_AFPS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DCS_NBR_DEBTS | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ADJ_DCS_DEBT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_OTHER_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_OTHER_PAY_AFPS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_HLTH_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| OC_1217_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| FED_OPT_TAX_DED | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| CPP_FED_WITH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FED_WITH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ST_TAX_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ST_TAX_EXEMP | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| ST_TAX_OPT_DED | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ST_TAX_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CPP_ST_TAX_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_ST_TAX_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CITY_ST_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CITY_ID_CDE | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| CITY_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CITY_EXEMP | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CPP_CITY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CITY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LUMPSUM_LVPY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_LUMP_SUM | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| RESTOR_AL_PAID_CPP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| RESTOR_AL_PAID_ADJ | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| BASE_HRS | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| REG_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_BASE_PAY_AFPS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CASH_AWARD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CAS_AWARD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| RPT_CDE | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| REEMPLED | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| HRLY_RATE_UA | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| REEMP_ANN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| REEMP_ANU_HR_RTE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| ALT_1_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_1_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_1_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_1_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_2_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_2_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_2_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_2_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_2_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_4_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_4_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_4_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_4_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_4_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_5_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_5_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_5_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_5_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_5_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_6_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_6_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_6_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_6_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_6_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_7_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_7_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_7_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_7_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_7_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_8_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_8_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_8_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_8_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_8_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_LTC_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_LTC_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PSP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_PSP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HLTH_ENROL_CDE_1_2 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| HLTH_ENROL_CDE_3 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_HLTH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_HLTH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_HRS_PAID | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| COMP_TIME_HRLY_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_STAFFING | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_COUNTY_TAX_GROSS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_TEA_GVT_TV_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TEA_GVT_TV_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TEA_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TEA_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FSAHC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FSAHC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FSADC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FSADC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSP_OVER50 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSP_OVER50 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_OT_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_OT_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_OT_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_OT_PL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_ND_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_ND_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_ND_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_SD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HOL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_HOL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_OTHER_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_PD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_COLA_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_COLA_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_UNIF_ALLOW | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_UNIF_ALLOW | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SEV_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SEV_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_NS_FWIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_PAY_NS_FWIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PAY_S_FEDTX | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CSR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CSR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_CSR_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CSR_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_CSR | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FICA_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FICA_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_FICA | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_FICA_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_MEDC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_MEDC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_MEDC_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_MEDC_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_MEDC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_MEDC_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_FERS_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FERS_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FERS_AGY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FERS_AGY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FERS_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_FERS_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_BOND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_BOND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_REG_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LI_REG_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_OPT_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LI_OPT_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FEGLI_OPTB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FEGLI_OPTB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FEGLI_OPTC | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FEGLI_OPTC | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_CHAR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CHAR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_UNION_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_UNION_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_QUARTERS_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_QUARTERS_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SUBSIST_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SUBSIST_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SLRP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_SLRP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_NET_ALT_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CSA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CSA_RECIPIENT_NAME | VARCHAR2(22) | VARCHAR(22) | Yes | — |
| CSA_RECIPIENT_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| EIC_CPP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| EIC_ADJ_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PCA_CPP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PCA_ADJ_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPA_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_TSPA_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_TSPG_GBADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_GBADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPG_EADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_EADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPG_GMADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_GMADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_ND_2 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_ND_3 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_SD_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_HOL_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_INST_AGY_PAID | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_ON_CALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_T38_ONCALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_ON_CALL_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_ONCALL_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| ADJ_ON_CALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| T38_OT_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_HOL_OT_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_ND_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_SAT_DIF_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_SUN_DIF_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_UND_DED_G_PRYR_1 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SEP_INCENT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_RECRUIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RECRUIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_RELOC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RELOC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_RETENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RETENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| SUSP_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| REL_COMP_LS_PAY_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_LS_PAY_ADJ | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_LS_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_LS_PAY_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CR_HRS_LS_PAY_ADJ | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CR_HRS_LS_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_TEA_GVT_PK_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LOAN_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LOAN_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_HAZARD_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_ST_TAX_GROSS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| FURLO_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| VIS_DENT_1_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_1_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_2_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_2_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_3_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_3_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HEALTH_SAVINGS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MANUAL_PAYMENTS | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| COMP_HRS_ERND_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_HRS_USED_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_PAID_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TRAVEL_COMP_HRS_ERND_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TRAVEL_COMP_HRS_USED_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |

### CPM_NEWPAY_STG_TYPE_3_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| DFAS_PSEUDO_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_PAY_TAC_TYP_LINE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_PAY_TAC_TYP | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| PYF_PAY_DET_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| MP_POOL_DES | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| ADJ_NO | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CPP_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_REF_DED_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_REF_DED_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HLTH_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_REFUND_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ADJ_REFUND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_DCS_DEBT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DCS_NBR_DEBTS | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ADJ_DCS_DEBT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_OTHER_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_HLTH_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| OC_1217_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| FED_OPT_TAX_DED | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| CPP_FED_WITH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FED_WITH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ST_TAX_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ST_TAX_EXEMP | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| ST_TAX_OPT_DED | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ST_TAX_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CPP_ST_TAX_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_ST_TAX_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CITY_ST_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CITY_ID_CDE | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| CITY_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CITY_EXEMP | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CPP_CITY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CITY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LUMPSUM_LVPY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_LUMP_SUM | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| RESTOR_AL_PAID_CPP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| RESTOR_AL_PAID_ADJ | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| BASE_HRS | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| REG_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CASH_AWARD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CAS_AWARD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| RPT_CDE | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| REEMPLED | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| HRLY_RATE_UA | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| REEMP_ANN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| REEMP_ANU_HR_RTE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| ALT_1_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_1_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_1_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_1_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_2_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_2_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_2_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_2_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_2_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_4_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_4_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_4_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_4_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_4_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_5_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_5_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_5_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_5_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_5_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_6_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_6_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_6_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_6_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_6_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_7_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_7_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_7_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_7_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_7_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_8_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_8_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_8_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_8_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_8_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_LTC_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_LTC_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PSP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_PSP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HLTH_ENROL_CDE_1_2 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| HLTH_ENROL_CDE_3 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_HLTH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_HLTH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_HRS_PAID | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| COMP_TIME_HRLY_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_STAFFING | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_COUNTY_TAX_GROSS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_TEA_GVT_TV_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TEA_GVT_TV_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TEA_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TEA_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FSAHC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FSAHC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FSADC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FSADC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSP_OVER50 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSP_OVER50 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_OT_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_OT_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_OT_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_OT_PL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_ND_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_ND_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_ND_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_SD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HOL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_HOL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_OTHER_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_PD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_COLA_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_COLA_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_UNIF_ALLOW | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_UNIF_ALLOW | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SEV_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SEV_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_NS_FWIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_PAY_NS_FWIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PAY_S_FEDTX | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CSR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CSR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_CSR_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CSR_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_CSR | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FICA_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FICA_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_FICA | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_FICA_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_MEDC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_MEDC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_MEDC_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_MEDC_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_MEDC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_MEDC_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_FERS_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FERS_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FERS_AGY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FERS_AGY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FERS_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_FERS_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_BOND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_BOND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_REG_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LI_REG_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_OPT_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LI_OPT_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FEGLI_OPTB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FEGLI_OPTB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FEGLI_OPTC | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FEGLI_OPTC | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_CHAR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CHAR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_UNION_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_UNION_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_QUARTERS_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_QUARTERS_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SUBSIST_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SUBSIST_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SLRP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_SLRP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_NET_ALT_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CSA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CSA_RECIPIENT_NAME | VARCHAR2(22) | VARCHAR(22) | Yes | — |
| CSA_RECIPIENT_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| EIC_CPP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| EIC_ADJ_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PCA_CPP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PCA_ADJ_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPA_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_TSPA_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_TSPG_GBADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_GBADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPG_EADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_EADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPG_GMADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_GMADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_ND_2 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_ND_3 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_SD_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_HOL_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_INST_AGY_PAID | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_ON_CALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_T38_ONCALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_ON_CALL_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_ONCALL_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| ADJ_ON_CALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| T38_OT_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_HOL_OT_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_ND_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_SAT_DIF_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_SUN_DIF_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_UND_DED_G_PRYR_1 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SEP_INCENT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_RECRUIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RECRUIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_RELOC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RELOC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_RETENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RETENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| SUSP_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| REL_COMP_LS_PAY_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_LS_PAY_ADJ | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_LS_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_LS_PAY_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CR_HRS_LS_PAY_ADJ | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CR_HRS_LS_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_TEA_GVT_PK_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LOAN_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LOAN_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_HAZARD_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_ST_TAX_GROSS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| FURLO_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| VIS_DENT_1_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_1_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_2_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_2_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_3_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_3_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HEALTH_SAVINGS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| MANUAL_PAYMENTS | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| COMP_HRS_ERND_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_HRS_USED_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_PAID_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TRAVEL_COMP_HRS_ERND_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TRAVEL_COMP_HRS_USED_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |

### CPM_NEWPAY_STG_YTD_STATE_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| PP_NUM | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| DFAS_PSEUDO_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| YTD_STATE_1 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_1_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_1_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_2 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_2_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_2_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_2_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_3 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_3_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_3_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_3_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_4 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_4_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_4_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_4_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |

### CPM_NEWPAY_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| PP_NUM | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| DFAS_PSEUDO_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| LINE_TYPE | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| FIR_NAME_1 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CODE_CONSL | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FIR_NAME_3_11 | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| MID_INIT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| SURNAME_3 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| SURNAME_OTHER | VARCHAR2(13) | VARCHAR(13) | Yes | — |
| SOC_SEC_NO | NUMBER(11,0) | NUMBER(11,0) | Yes | — |
| PYF_PAY_DET_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| OCCUP_CDE | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| JOB_LOC_CDE | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| ST_CONT_LOC | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CITY_LOC | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| CTY_CTRY_LOC | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| TK_NO | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| CAN | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| CAN_FY | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CAN_AGCY | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CAN_AP | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CAN_AGCY_ACCT_CDE | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| ORG_CDE | VARCHAR2(11) | VARCHAR(11) | Yes | — |
| ORG_P01 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P2 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P3 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P4 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P5 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P6 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P7 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P8 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P9 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_PX | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ORG_P11 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| SPOC | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| SEX_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| VET_PREF_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TENURE_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| EHRP_EMP_ID | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| EHRP_EMP_REC_NO | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PERM_TEMP_POS_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FT_PT_INTER_POS_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CITIZEN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TYPE_APPT_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| EOD_DATE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| PHY_HNDCP | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CEILING_EN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FUNC_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| SUPV_CDE | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| PAY_BASIS | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| POS_SEN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CAR_SERV_DTE | NUMBER(16,0) | NUMBER(16,0) | Yes | — |
| PROB_DTE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| SPO_TERM_ID | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| ABNOR_RATE_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FED_RETIRE_CDE_OLD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TSPA_STATUS_CODE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TSPA_VEST_PERIOD | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| EFT_EMPL_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| EFT_EMPL_ACCT_NUMBER | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| FS_DATE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| TSPA_STATUS_CODE_DTE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| TSPA_SCD | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| OT_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| LOCAL_PCENT_RATE | NUMBER(5,4) | NUMBER(5,4) | Yes | — |
| CPP_LOCAL_DIFF | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| AGCY_CDE_PER | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| SEP_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| SEP_DATE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| PERS_NOA | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| ANNUAL_SAL | NUMBER(7,0) | NUMBER(7,0) | Yes | — |
| FLSA_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| RPT_CDE | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_NO | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| DATE_BIRTH | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| EFT_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| EFT_CK_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| POSITION_1 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| POSITION_2 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| GRADE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| STEP | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FEGLI_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FEGLI_CDE_2 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TOT_FED_TAX_EXEMP | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| FED_TAX_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| HRLY_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SEV_PAY_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HLTH_DED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HLTH_GOVT_SHARE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| UNION_IDENT_CDE | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| UNION_DED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PCA_BIWEEK_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REEMP_ANN_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| REEMP_ANU_HR_RTE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| AN_LV_EARNED_CPP | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| SICK_LV_ERN_CPP | NUMBER(4,2) | NUMBER(4,2) | Yes | — |
| COMP_LV_ERN_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| COMP_LV_USD_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| ADMIN_LV_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| LWOP_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| STAFFING_BIW_AMT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| INCENT_TIME_CUR_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PSP_BIWKLY_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_ERND_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| REL_COMP_USED_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_ERND_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_USED_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| FERS_BAL_FWD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| AN_LV_CR_RED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_CR_RED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| LV_CAT_CDE | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| AN_LV_USED_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| AN_LV_ERND_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| AN_LV_ADV_CBAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| AN_LV_USED_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| AN_LV_CUR_BAL | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| AN_LV_MAX_COVER | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| AN_LV_USE_LOSE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_USD_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_ERN_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_AD_CBAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| SICK_LV_USD_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| SICK_LV_CUR_BAL | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| COMP_LV_CUR_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| RESTOR_AL_BALANCE | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| RESTOR_AL_BAL_1 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| RESTOR_AL_BAL_2 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| RESTOR_AL_BAL_3 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PSI_START_DATE | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| REL_COMP_CURR_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_CUR_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| TVL_COMP_BEGIN_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TVL_COMP_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TVL_COMP_EARN_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TVL_COMP_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TVL_COMP_FORFEITED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_OT_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ND_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_SD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_HOL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_PD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_COLA_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_UNIF_ALLOW | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_SEV_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_CASH_AWARDS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_MP_CASH_AWARD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LSL_PAY_OLD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_MISC_OTH_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_NON_TAX_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_FED_TAX_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TAXABLE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_CSR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_CSR_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_CSR_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FICA_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FICA_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_MEDC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_MEDC_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_PAY_S_MEDC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_FERS_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FERS_AGY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FERS_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_LEVY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_STATE_1 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_1_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_1_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_2 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_2_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_2_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_2_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_3 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_3_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_3_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_3_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_STATE_4 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| YTD_ST_TX_4_CDE | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| YTD_ST_TX_4_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ST_TX_4_GRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_HLTH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_HLTH_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_BOND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LI_REG_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LI_REG_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LI_OPT_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FEGLI_OPTB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FEGLI_OPTC | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_CHAR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_UNION_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ALT_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_QUARTERS_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_SUBSIST_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LAUNDRY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_CSA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| EIC_YTD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PCA_YTD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TSPA_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_TSPG_GBADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TSPG_EADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TSPG_GMADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_STAFFING | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LOAN_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_HEALTH_SAVINGS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_ON_CALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| T38_OT_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_HOL_OT_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_ND_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_ONCALL_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_SAT_DIF_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| T38_SUN_DIF_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_LTC_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_DCS_DEBT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_PSP_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| RET_BAL_FWD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_SEP_INCENT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_LSL_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_RECRUIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_RELOC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_RETENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| YTD_TEA_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_CHILD_SUB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_LS_PAY_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CR_HRS_LS_PAY_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_PREPD_HB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FSAHC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_FSADC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| YTD_TSP_OVER50 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_1_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_2_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_3_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TRANSFER_IN_FICA_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| TRANSFER_IN_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| FEHB_PC_PRE_TAX_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADMIN_LV_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| MILITARY_LV_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| LWOP_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| RESTOR_AL_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| OC_1217_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| OC_121S_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| OC_1211_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| OC_1111_TOT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| MP_POOL_DES | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| ADJ_NO | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CPP_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_REF_DED_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_REF_DED_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HLTH_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HLTH_EMPLR_AFPS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_REFUND_CDE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ADJ_REFUND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_DCS_DEBT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_DCS_DEBT_AMT_AFPS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DCS_NBR_DEBTS | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ADJ_DCS_DEBT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_OTHER_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_OTHER_PAY_AFPS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_HLTH_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| FED_OPT_TAX_DED | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| CPP_FED_WITH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FED_WITH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ST_TAX_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ST_TAX_EXEMP | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| ST_TAX_OPT_DED | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ST_TAX_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CPP_ST_TAX_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_ST_TAX_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CITY_ST_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| CITY_ID_CDE | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| CITY_MAR_STAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CITY_EXEMP | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CPP_CITY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CITY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LUMPSUM_LVPY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_LUMP_SUM | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| RESTOR_AL_PAID_CPP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| RESTOR_AL_PAID_ADJ | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| BASE_HRS | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| REG_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_BASE_PAY_AFPS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CASH_AWARD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CAS_AWARD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_1_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_1_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_1_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_1_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_2_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_2_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_2_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_2_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_2_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_4_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_4_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_4_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_4_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_4_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_5_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_5_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_5_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_5_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_5_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_6_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_6_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_6_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_6_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_6_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_7_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_7_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_7_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_7_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_7_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| ALT_8_ROUTE_ID | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| ALT_8_ROUTE_DIGIT | NUMBER(1,0) | NUMBER(1,0) | Yes | — |
| CPP_ALT_8_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ALT_8_EE_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| ALT_8_ACCT_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_LTC_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_LTC_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PSP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_PSP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HLTH_ENROL_CDE_1_2 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| HLTH_ENROL_CDE_3 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CPP_HLTH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_HLTH_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_HRS_PAID | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| COMP_TIME_HRLY_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_STAFFING | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_COUNTY_TAX_GROSS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_TEA_GVT_TV_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TEA_GVT_TV_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TEA_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TEA_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FSAHC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FSAHC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FSADC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FSADC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSP_OVER50 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSP_OVER50 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_OT_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_OT_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_OT_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_OT_PL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_ND_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_ND_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_ND_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_SD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HOL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_HOL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_OTHER_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_PD_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_COLA_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_COLA_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_UNIF_ALLOW | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_UNIF_ALLOW | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SEV_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SEV_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_NS_FWIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_PAY_NS_FWIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_PAY_S_FEDTX | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CSR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CSR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_CSR_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CSR_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_CSR | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FICA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FICA_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FICA_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_FICA | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_FICA_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_MEDC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_MEDC_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_MEDC_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_MEDC_EMPL_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_PAY_S_MEDC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_MEDC_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_FERS_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FERS_EMP_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FERS_AGY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FERS_AGY_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FERS_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_FERS_WAGES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_BOND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_BOND_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_REG_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LI_REG_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_EMPLR | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LI_OPT_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LI_OPT_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FEGLI_OPTB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FEGLI_OPTB | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_FEGLI_OPTC | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_FEGLI_OPTC | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_CHAR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_CHAR_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_UNION_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_UNION_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_QUARTERS_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_QUARTERS_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SUBSIST_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_SUBSIST_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SLRP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_SLRP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_NET_ALT_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_CSA_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CSA_RECIPIENT_NAME | VARCHAR2(22) | VARCHAR(22) | Yes | — |
| CSA_RECIPIENT_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| EIC_CPP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| EIC_ADJ_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PCA_CPP_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PCA_ADJ_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPA_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_TSPA_PAY_SUB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_TSPG_GBADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_GBADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPG_EADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_EADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_TSPG_GMADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_TSPG_GMADIST | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_ND_2 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_ND_3 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_SD_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| HRS_HOL_1 | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_INST_AGY_PAID | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_ON_CALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_T38_ONCALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_ON_CALL_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_ONCALL_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| ADJ_ON_CALL_PAY | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| T38_OT_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_HOL_OT_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_ND_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_SAT_DIF_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| T38_SUN_DIF_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_UND_DED_G_PRYR_1 | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_SEP_INCENT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_RECRUIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RECRUIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_RELOC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RELOC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| CPP_RETENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| ADJ_RETENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| SUSP_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| REL_COMP_LS_PAY_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_LS_PAY_ADJ | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_LS_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CR_HRS_LS_PAY_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CR_HRS_LS_PAY_ADJ | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CR_HRS_LS_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| CPP_TEA_GVT_PK_CONT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_LOAN_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| ADJ_LOAN_1_DED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| HRS_HAZARD_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_ST_TAX_GROSS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| FURLO_HRS_CPP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| VIS_DENT_1_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_1_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_2_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_2_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| VIS_DENT_3_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| VIS_DENT_3_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| CPP_HEALTH_SAVINGS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| WORK_ADDR_STREET1 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| WORK_ADDR_STREET2 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| WORK_ADDR_CITY | VARCHAR2(13) | VARCHAR(13) | Yes | — |
| WORK_ADDR_STATE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| WORK_ADDR_ZIP | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| BUSINESS_UNIT | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| MANUAL_PAYMENTS | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| FED_RETIRE_CDE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| OPDIV | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PP_YEAR_NUM | NUMBER(6,0) | NUMBER(6,0) | Yes | — |
| SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| COMP_BEGIN_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_EARN_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_USED_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| OT_EARN_YTD_DOLL_VALUE | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_BEGIN_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_EARN_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| REL_COMP_USED_YTD_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_HRS_ERND_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_HRS_USED_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| COMP_PAID_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TRAVEL_COMP_HRS_ERND_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| TRAVEL_COMP_HRS_USED_CPP | NUMBER(7,2) | NUMBER(7,2) | Yes | — |

### CPM_PAD_DETAIL_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PAD_SERVING_AGENCY | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PAD_CCPO_ID | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PAD_SOC_SEC_NO | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PAD_RESP_CTR_COST_CTR | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PAD_REGULAR_EARNINGS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_OVERTIME_EARNINGS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_HOLIDAY_PREMIUM_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_STNDBY_UNCO_AVAIL_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_SUNDAY_PREMIUM_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_NIGHT_DIFFERENTIAL_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_LUMP_SUM_LEAVE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_HAZARDOUS_DUTY_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_ENVIRONMENTAL_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_AWARD_AMOUNT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_ANNUAL_LVE_ENDING_BALANCE | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_SICK_LVE_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_SICK_LVE_ENDING_BALANCE | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_EMPLR_CONTR_FEGLI | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EMPLR_CONTR_FEHBA | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EMPLR_CONTR_CSRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EMPLR_CONTR_FERS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EMPLR_CONTR_TSP_M | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EMPLR_CONTR_TSP_C | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EMPLR_CONTR_TSP_F | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EMPLR_CONTR_FERS_1PERC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EMPLR_CONTR_MEDIC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_PAY_PERIOD_END_DATE | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PAD_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_ACTIVITY | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PAD_ORGANIZATION | VARCHAR2(7) | VARCHAR(7) | Yes | — |
| FILLER1 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_REGULAR_HOURS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_OVERTIME_HOURS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_NIGHT_DIFF_HOURS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_ENVR_HAZARD_HOURS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_HOLIDAY_PREMIUM_HOURS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_STNBY_UNC_AVAIL_HOURS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_SUNDAY_PREMIUM_HOURS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_ADMIN_LVE_HOURS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_SICK_LEAVE_ACCRUED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_COMP_TIME_EARNED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_COMP_TIME_USED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_COMP_TIME_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_RELIG_COMP_EARNED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_RELIG_COMP_USED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_RELIG_COMP_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_CREDIT_HOURS_EARNED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_CREDIT_HOURS_USED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_CREDIT_HOURS_END_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| FILLER0 | VARCHAR2(10) | VARCHAR(10) | Yes | — |
| PAD_COLA | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_REEMP_ANN_OFFSET_AMT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_RECRUITMENT_INCENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_INTEREST_AMOUNT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_TROPICAL_DIFF | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_BENEFIT_ALLOWANCE | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_PHYSICIANS_ALLOWANCE | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_REMOTE_SITE_ALLOWANCE | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_SEVERANCE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_DANGER_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EXTRACURR_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EXTRA_DUTY_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_TRANSFER_ALLOWANCE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_EDUC_TRAV_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_TIME_OFF_USED_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_TIME_OFF_END_BAL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_AGENCY_CODE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PAD_ACCOUNTING_ACTIVITY | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PAD_EMPLOYEE_NAME | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| PAD_EMPLOYEE_STATUS | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_PAYROLL_OFFICE_ID | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PAD_APPROPRIATION | VARCHAR2(13) | VARCHAR(13) | Yes | — |
| PAD_US_CODE_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_ASSIGNED_JON_CC_PC | VARCHAR2(18) | VARCHAR(18) | Yes | — |
| PAD_FISCAL_YEAR | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_PROGRAM_YEAR | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_FUND_CODE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PAD_MILITARY_LVE_BAL | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_MILITARY_LVE_EARNED_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_ANNUAL_LVE_EARNED_PP | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_PP_NON_PAY_USED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_PP_ANNUAL_LVE_USED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_ANNUAL_LVE_FORFEIT_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_SHORE_LVE_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_HOME_LVE_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_LAW_ENFORCE_LVE_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_DONATED_LVE_BAL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_DONATED_LVE_USED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_TIME_OFF_OLDEST_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_TIME_OFF_OLDEST_DATE | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PAD_COMP_OLDEST_UNUSED_HRS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_COMP_OLDEST_UNUSED_DATE | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PAD_COMP_OLDEST_RATE | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_SEPARATION_INCENTIVE | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_SUPERVISOR_DIFF_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_RECURRING_ALLOWANCES | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_ONE_TIME_BONUS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_PP_NAF_RETIREMENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_PP_401K | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_STATE_EMPL_RETIREMENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_PROGRAM_ELEM_CODE | VARCHAR2(10) | VARCHAR(10) | Yes | — |
| PAD_FEGLI_BASIC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_FEGLI_OPTIONAL | NUMBER(12,2) | NUMBER(12,2) | Yes | — |
| PAD_FEHB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_CSRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_FERS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_NON_PAY_HRS_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_ANNUAL_LVE_USED_YTD | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_SICK_LVE_FERS | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_GROSS_PAY_YTD | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_ADDRESS_STREET_1 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| PAD_ADDRESS_STREET_2 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| PAD_ADDRESS_CITY | VARCHAR2(13) | VARCHAR(13) | Yes | — |
| PAD_ADDRESS_STATE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PAD_ADDRESS_ZIP | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PAD_EMPL_ORG_CODE_1 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PAD_EMPL_ORG_DEDUCT_AMT_1 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_REMARKS_IDC_1 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_EMPL_ORG_CODE_2 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PAD_EMPL_ORG_DEDUCT_AMT_2 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_REMARKS_IDC_2 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_EMPL_ORG_CODE_3 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PAD_EMPL_ORG_DEDUCT_AMT_3 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_REMARKS_IDC_3 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_EMPL_ORG_CODE_4 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PAD_EMPL_ORG_DEDUCT_AMT_4 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_REMARKS_IDC_4 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_EMPL_ORG_CODE_5 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PAD_EMPL_ORG_DEDUCT_AMT_5 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_REMARKS_IDC_5 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_EMPL_ORG_CODE_6 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PAD_EMPL_ORG_DEDUCT_AMT_6 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_REMARKS_IDC_6 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_MILITARY_LVE_USED_YTD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_MMD_DDS_SPEC_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_RECRUIT_INCENTIVE_AMT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_RELOCAT_INCENTIVE_AMT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_RETENTN_INCENTIVE_AMT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PAD_COMPTIME_TRAVEL_EARNED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_COMPTIME_TRAVEL_USED | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_COMPTIME_TRAVEL_BALANCE | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PAD_BRAC_RESTORED_BEGBAL | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| PAD_BRAC_RESTORED_ADDED_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| PAD_BRAC_RESTORED_USED_PAYPD | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PAD_BRAC_RESTORED_USED_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| PAD_BRAC_RESTORED_PAID_YTD | NUMBER(6,2) | NUMBER(6,2) | Yes | — |
| PAD_BRAC_RESTORED_ENDBAL | NUMBER(6,2) | NUMBER(6,2) | Yes | — |

### CPM_PAD_HEADER_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PAD_RECORD_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PAD_PAYROLL_OFFICE_ID_CODE | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PAD_FILE_ID | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PAD_PP_END_DTE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| PAD_DISBURSING_DTE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| PAD_QTR_END_DTE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |

### CPM_PM1_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PYF_REC_NO_1 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_EYE_ID_1 | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_PAY_BLK_1 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PYF_EMP_ACT | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PYF_ORG | VARCHAR2(7) | VARCHAR(7) | Yes | — |
| PYF_EYE_NME | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| PYF_PMT_MET_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_FIN_ORG_RTN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_GR_UNGR_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_DOB_DATE | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_EYE_AGE_CAT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_GLI_CVG_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_MLT_APMT_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_MS_FED | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_FITW_ADD_PAY_PD | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| PYF_FITW_XMP | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| PYF_EYE_TYP_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_FLSA_XMP_STA | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_PAY_PN_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_GR_CIV | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_PAY_RAT_STP | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_SRY_BSE_ANL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PYF_SRY_HR | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PYF_ADR_STR_1 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| PYF_ADR_STR_2 | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| PYF_ADR_CITY | VARCHAR2(13) | VARCHAR(13) | Yes | — |
| PYF_ADR_ST | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_ADR_ZIP | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_WALK_SEQ | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_CHK_CODE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_FILLER_RT1 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_SEC_DISB_OFC_RT1 | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PYF_HIS_PGRANGE_RT1 | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| PYF_DISB_OFC_RT1 | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PYF_MPH_PGRANGE_RT1 | NUMBER(8,0) | NUMBER(8,0) | Yes | — |

### CPM_PM2_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PYF_REC_NO_2 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_EYE_ID_2 | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_PAY_BLK_2 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PYF_AGY_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_SON | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| PYF_ACTG_ACT | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PYF_MAJOR_CLAIMANT | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_FIN_ORG_ACCT_NO | VARCHAR2(17) | VARCHAR(17) | Yes | — |
| PYF_FIN_ORG_ACCT_TYP | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_TSP_SVC_CMP_DATE | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_TSP_VEST_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_TSP_STA_DATE | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_TSP_STA_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_TSP_ELG_DATE | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_RET_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_EYE_STA_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_SEP_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_LOC_ADJ | NUMBER(8,2) | NUMBER(8,2) | Yes | — |
| PYF_BSC_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PYF_BSC_OT_RAT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PYF_LOC_PAY_PCT | NUMBER(5,4) | NUMBER(5,4) | Yes | — |
| PYF_SVC_CMP_DATE_LV | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_MIL_DEP_OWED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PYF_MIL_DEP_PAID | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PYF_DY_ENT_DATE | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_TPY_POS_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_BWKLY_SCD_HRS | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PYF_PAY_PN_ID | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_TAX_STA_FED | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_EMP_STAT_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_FILLER_PAY | VARCHAR2(14) | VARCHAR(14) | Yes | — |
| PYF_SEP_CD_8 | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_SEP_DATE_8 | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_PRIOR_EYE_ID_8 | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_PRIOR_DOB_DATE_8 | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_TSP_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_FILLER_RT2 | VARCHAR2(14) | VARCHAR(14) | Yes | — |
| PYF_SEC_DISB_OFC_RT2 | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PYF_HIS_PGRANGE_RT2 | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| PYF_DISB_OFC_RT2 | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PYF_MPH_PGRANGE_RT2 | NUMBER(8,0) | NUMBER(8,0) | Yes | — |

### CPM_PM3_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PYF_REC_NO_PDT3 | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_EYE_ID_PDT3 | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_GEN_SEQ_ID | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PYF_PAY_BLK_PDT3 | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| PYF_PAY_TAC_TYP | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| PYF_DATE_EFF | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_PAY_DET_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_OT_ENV_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_HRS_SCD_AMT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PYF_ACTUAL_AMT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| PYF_PAY_RAT | NUMBER(5,2) | NUMBER(5,2) | Yes | — |
| PYF_CASH_PMT_AMT | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| PYF_ADJ_RSN_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_ADJ_DATE_EFF | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_ADJ_SYS_GEN_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_RSN_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PFY_ID_BREAK_SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PFY_ID_BREAK_CODE | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| PFY_FILLER | VARCHAR2(12) | VARCHAR(12) | Yes | — |
| PYF_DDU_PYE | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| PYF_ITW_MS | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_ITW_XMP | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| PYF_ITW_ADD | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| PYF_ALLOW_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_OFFSET_IDC | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_USER_NME | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_ACC_DATE | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PYF_ACC_TME | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| PYF_AWD_SEQ_NO | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| PYF_RETRO_TAXES_DONE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_RETRO_RETIREMENT_DONE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_RETRO_OTH_DONE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_FILLER_PDT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| PYF_FILLER_RT3 | VARCHAR2(55) | VARCHAR(55) | Yes | — |
| PYF_SEC_DISB_OFC_RT3 | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PYF_HIS_PGRANGE_RT3 | NUMBER(8,0) | NUMBER(8,0) | Yes | — |
| PYF_DISB_OFC_RT3 | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| PYF_MPH_PGRANGE_RT3 | NUMBER(8,0) | NUMBER(8,0) | Yes | — |

### CPM_PMH_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PYF_REC_PPE_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |

### CPM_YTD_DETAIL_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| RECORD_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| DYD_SSN_1 | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| DYD_NAME | VARCHAR2(27) | VARCHAR(27) | Yes | — |
| DYD_ORGANIZATION | VARCHAR2(6) | VARCHAR(6) | Yes | — |
| DYD_ACTIVITY | VARCHAR2(7) | VARCHAR(7) | Yes | — |
| DYD_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_ADD_BASE_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_OVERTIME_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_NIGHT_DIFF_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_SUN_PREM_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_HOL_PREM_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_POST_DIFF_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FOREIGN_ALLOW | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_COLA_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_UNIF_ALLOW | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_SEVER_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_CASH_AWARDS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_GROSS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEDERAL_TAX_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_FED_TAX | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_CSRS_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_CSRS_EMPL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_CSRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_OASDI_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_OASDI_EMPL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_OASDI | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_MEDICARE_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_MEDICARE_EMPL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_MEDICARE | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FERS_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FERS_EMPL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_FERS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEHB_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEHB_EMPL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_BOND_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEGLI_REG | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEGLI_EMPL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEGLI_OPTA | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEGLI_OPTB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEGLI_OPTC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_CHARITY_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_UNION_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_ALLOTMENTS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_QUARTERS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_NET_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_CS_ALIMONY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_EIC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PCA | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_TSP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_TSP_BASIC_EMPL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_TSP_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_TSP_EMPL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_TSP_LOAN_DED | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_STAFF_DIFF | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_ON_CALL_TITLE5 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_ON_CALL_TITLE38 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_OVERTIME_TITLE38 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_HOLIDAY_TITLE38 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_TOUR_DIFF_TITLE38 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_SAT_PREM_TITLE38 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_SUN_PREM_TITLE38 | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_LTC_PREM | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_DEBT_AMT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PHY_SPEC_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_SEP_INCENTIVE | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_LSL_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_RECRUIT_BONUS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_RELOC_BONUS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_RETENT_ALLOW | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_CHILD_CARE_SUBSIDY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_REL_COMP_LS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_CR_HRS_LS_PAY | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PREPAY_FEHB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FSA_HLTH | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FSA_DC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_VISION | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_DENTAL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_VISION_DENTAL | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_HEALTH_SAVINGS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_TSP_CATCHUP | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_ENVIR_HAZ | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_MILITARY_DEPOSIT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_OTHER_RETIREMENT | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_TEA | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_NAF_RET | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_OTHER_RET | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_RET_DED_SUB_PR | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_FEHB_DED_SUB_PR | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_COLA_DED_SUB_PR | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_ACCUMULATIVE_CSRS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_ACCUMULATIVE_FERS | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_OASDI_EARNINGS_TRANS_IN | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_OASDI_DEDUCT_TRANS_IN | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PRETAX_FEHB | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_ADMINISTRATIVE_LEAVE | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_ANNUAL_LEAVE_EARNED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_ANNUAL_LEAVE_USED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_SICK_LEAVE_EARNED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_SICK_LEAVE_USED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_MILITARY_LEAVE_EARNED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_MILITARY_LEAVE_USED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_LWOP_AWOL | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_RESTORED_LEAVE_EARNED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |
| DYD_RESTORED_LEAVE_USED | NUMBER(7,2) | NUMBER(7,2) | Yes | — |

### CPM_YTD_HEADER_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| RECORD_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| DFAS_YTD_FILE_NAME | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| DFAS_YTD_DB_NAME | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| DFAS_YTD_PPEND_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| DFAS_YTD_DATE_OF_FILE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |

### CPM_YTD_STATE_STG_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_END_YEAR | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| PP_NUM | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| RECORD_TYPE | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| GEN_SEQ_ID | NUMBER(10,0) | NUMBER(10,0) | Yes | — |
| DYD_SSN_2 | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| DYD_STATE_TAX_CODE | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| DYD_STATE_TAX_DEDUC | NUMBER(9,2) | NUMBER(9,2) | Yes | — |
| DYD_PAY_SUB_STATE_TAX | NUMBER(9,2) | NUMBER(9,2) | Yes | — |

### ERROR_TBL

**Origin:** TARGET | **XML file:** `CPM` | **DDL file:** `02_target_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PROCESS_NAME | VARCHAR2(100) | VARCHAR(100) | Yes | — |
| ERROR_MESSAGE | VARCHAR2(200) | VARCHAR(200) | Yes | — |
| SOURCE_KEY | VARCHAR2(50) | VARCHAR(50) | Yes | — |
| ERROR_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| PP_END_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| PP_NUM | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| CYCLE_ID | NUMBER(3,0) | NUMBER(3,0) | Yes | — |
| ERROR_CODE | VARCHAR2(50) | VARCHAR(50) | Yes | — |

### HI_GENERIC_SRC_TBL

**Origin:** SOURCE | **XML file:** `CPM` | **DDL file:** `01_source_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| ID | NUMBER(10,0) | NUMBER(10,0) | Yes | — |

### PAY_PERIOD

**Origin:** SOURCE | **XML file:** `COMPTIME` | **DDL file:** `01_source_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| PP_NUM | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| PP_END_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| PP_START_DTE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| PP_END_DTE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| LV_NUM | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| LV_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| PAY_DTE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| CURR_PP_FLAG | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| HOLIDAY_1 | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| HOLIDAY_2 | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |

### PSEUDOSSN_TBL

**Origin:** SOURCE | **XML file:** `CPM` | **DDL file:** `01_source_tables.sql`

| Column Name | Oracle Type | Snowflake Type | Match? | Risk Notes |
|-------------|------------|----------------|--------|------------|
| SSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| CAN_CD | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| PSEUDOSSN | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| EMPLID | VARCHAR2(8) | VARCHAR(8) | Yes | — |
| EMPL_RCD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| APPT_NUM | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| EMP_FIRST_NAME | VARCHAR2(11) | VARCHAR(11) | Yes | — |
| EMP_MID_INIT | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| EMP_LAST_NAME | VARCHAR2(16) | VARCHAR(16) | Yes | — |
| SEX | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| VETERANS_PREFERENCE_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| TENURE_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| POSITION_NUM | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| US_CITIZENSHIP_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| APPT_TYPE_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| HIRE_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| HANDICAP_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| UNF_ALLOW_CD | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| UNIF_ALLOW_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| UNIF_ALLOW_AMT | NUMBER(10,2) | NUMBER(10,2) | Yes | — |
| RSSSDP | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| CEIL_REPORTING_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| FUNCTNL_CLASSFCTN_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| EMP_STATUS | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| MANAGER_STATUS | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| POSITION_SENSITIVITY_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| CAREER_START_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| CAREER_CONV_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| PROBATION_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| ABNORMAL_RATE_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| APPT_LIMIT_HRS | NUMBER(10,2) | NUMBER(10,2) | Yes | — |
| APPT_LIMIT_PAY | NUMBER(10,2) | NUMBER(10,2) | Yes | — |
| LAST_PAY_CHANGE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| CHARITY_AREA_CD | VARCHAR2(3) | VARCHAR(3) | Yes | — |
| CHARITY_EFF_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| CHARITY_DED_AMT | NUMBER(10,2) | NUMBER(10,2) | Yes | — |
| LAST_NOA_CD | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| QUARTERS_DED_AMT | NUMBER(10,2) | NUMBER(10,2) | Yes | — |
| SUBSIST_DED_AMT | NUMBER(10,2) | NUMBER(10,2) | Yes | — |
| PAY_BASIS_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| WORK_SCHEDULE_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| OCCUPATION_CD | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| DUTY_STATION | VARCHAR2(9) | VARCHAR(9) | Yes | — |
| JOB_IND | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| REG_TEMP_CD | VARCHAR2(1) | VARCHAR(1) | Yes | — |
| SEPERATION_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| PCA_CONTR_EFF_START_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| PCA_CONTR_EFF_END_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| MAX_ANNUAL_PAY | NUMBER(10,2) | NUMBER(10,2) | Yes | — |
| PCA_BIWEEKLY_AMT | NUMBER(10,2) | NUMBER(10,2) | Yes | — |
| PAY_PLAN_CD | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| APPT_NTE_DTE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| SPECIAL_PROGRAM_CD | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| TERM_ID | VARCHAR2(2) | VARCHAR(2) | Yes | — |
| EFFECTIVE_DATE | DATE | DATE | Yes | Oracle DATE includes time; Snowflake DATE is date-only. Verify no time data is stored. |
| EFFECTIVE_SEQ | NUMBER(5,0) | NUMBER(5,0) | Yes | — |
| PAY_TABL_NO | VARCHAR2(4) | VARCHAR(4) | Yes | — |
| BUSINESS_UNIT | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| DEPTID | VARCHAR2(10) | VARCHAR(10) | Yes | — |
| PCA_CONTR_LEN_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |
| TK_NUM | VARCHAR2(5) | VARCHAR(5) | Yes | — |
| PP_NUM | NUMBER(2,0) | NUMBER(2,0) | Yes | — |
| PP_END_YEAR | NUMBER(4,0) | NUMBER(4,0) | Yes | — |

---

## Oracle Tables Not Migrated to Snowflake DDL

These tables appear in the PowerCenter XML exports but have no corresponding
DDL in the migration. They may be intentionally excluded or require attention.

| Table Name | Origin | XML File | DB Type |
|------------|--------|----------|---------|
| AFPS_COUNTER_TBL | TARGET | CPM_AFPS | Oracle |
| COMP_TIME_DAILY_TBL | TARGET | COMPTIME | Oracle |
| CPM_CYCLE_TBL | SOURCE | CPM_AFPS | Oracle |
| EHRP_RECS_TRACKING_TBL | TARGET | EHRP2BIIS_UPDATE | Oracle |
| HI_AFPS_FEEDER_TBL | SOURCE | CPM_AFPS | Oracle |
| HI_ARCH_PSEUDOSSN_TBL | TARGET | Pseudossn | Oracle |
| HI_GROSS_EXP_TBL | SOURCE | CPM_AFPS | Oracle |
| HI_PM_FDA_TATRAN_TBL | SOURCE | FDA_Leave | Oracle |
| LESC | TARGET | LES | Oracle |
| LESD | TARGET | LES | Oracle |
| LESL | TARGET | LES | Oracle |
| LESM | TARGET | LES | Oracle |
| LESR | TARGET | LES | Oracle |
| LESS | TARGET | LES | Oracle |
| LEST | TARGET | LES | Oracle |
| LESU | TARGET | LES | Oracle |
| LES_EMP_DETAIL_CURR_EARN_TBL | TARGET | LES | Oracle |
| LES_EMP_DETAIL_LEAVE_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_1_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_2_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_3_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_4_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_5_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_6_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_C_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_D_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_L_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_M_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_R_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_T_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RECTYPE_U_TBL | SOURCE | LES | Oracle |
| LES_EMP_DETAIL_RETRO_EARN_TBL | TARGET | LES | Oracle |
| LES_EMP_DETAIL_TBL | SOURCE | LES | Oracle |
| LES_HEADER_TBL | SOURCE | LES | Oracle |
| LES_NIH_EMPLOYEE_SUMMARY_TBL | SOURCE | LES | Oracle |
| LES_PRIMARY_DATA_TBL | SOURCE | LES | Oracle |
| NWK_ACTION_PRIMARY_TBL | TARGET | EHRP2BIIS_UPDATE | Oracle |
| NWK_ACTION_SECONDARY_TBL | TARGET | EHRP2BIIS_UPDATE | Oracle |
| NWK_NEW_EHRP_ACTIONS_TBL | SOURCE | EHRP2BIIS_UPDATE | Oracle |
| PSEUDOSSN_FROM_SDA_TBL | SOURCE | Pseudossn | Oracle |
| PSEUDO_RECORD_COUNT | TARGET | Pseudossn | Oracle |
| PS_GVT_JOB | SOURCE | EHRP2BIIS_UPDATE | Oracle |

---

## Type Mapping Reference

| Oracle Type | Expected Snowflake Type | Notes |
|-------------|------------------------|-------|
| NUMBER(p,s) | NUMBER(p,s) | Precision and scale should be preserved |
| DATE | DATE | Oracle DATE includes time component; Snowflake DATE is date-only |
| DATE | TIMESTAMP_NTZ | Preferred if time component is used |
| VARCHAR2(n) | VARCHAR(n) | Length should be preserved or widened |
| CHAR(n) | VARCHAR(n) | Trailing-space padding behavior differs |
| TIMESTAMP | TIMESTAMP_NTZ | No timezone in source |
| CLOB | VARCHAR(16777216) | Max Snowflake VARCHAR size |
| LONG | VARCHAR(16777216) | Deprecated Oracle type |

### Match Legend

- **Yes** — Type, precision, scale, and nullability all match correctly
- **Yes*** — Type matches but nullability differs (relaxed or tightened)
- **No** — Potential data-loss risk or type mismatch requiring review
- **MISSING** — Column present in XML but absent from Snowflake DDL
- **N/A** — Column in DDL with no corresponding XML source definition
