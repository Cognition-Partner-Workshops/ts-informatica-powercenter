# PowerCenter Inventory

Comprehensive inventory of all Informatica PowerCenter 9.6.1 objects exported from the EHRP-to-BIIS data integration platform.

---

## Summary by XML Export

| XML Export | Sources | Targets | Mappings | Sessions | Workflows |
|---|---:|---:|---:|---:|---:|
| COMPTIME | 2 | 4 | 3 | 3 | 1 |
| CPM | 18 | 23 | 15 | 15 | 1 |
| CPM_AFPS | 8 | 13 | 17 | 17 | 1 |
| CPM_CDC | 3 | 6 | 6 | 6 | 1 |
| CPM_NIH | 3 | 6 | 6 | 6 | 1 |
| CPM_OIG | 2 | 4 | 4 | 4 | 1 |
| EHRP2BIIS_UPDATE | 2 | 3 | 1 | 1 | 1 |
| FDA_Leave | 7 | 9 | 10 | 10 | 1 |
| LES | 36 | 35 | 32 | 32 | 1 |
| Pay_Calendar | 1 | 3 | 4 | 4 | 1 |
| Pseudossn | 5 | 9 | 10 | 10 | 1 |
| **TOTAL** | **87** | **115** | **108** | **108** | **11** |

## Object Totals

| Object Type | Count |
|---|---:|
| SOURCE definitions | 87 |
| TARGET definitions | 115 |
| MAPPING definitions | 108 |
| SESSION definitions | 108 |
| WORKFLOW definitions | 11 |

---

## SOURCE Definitions

### COMPTIME

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `U0287D01` | Flat File | — | 12 |
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |

<details><summary><code>U0287D01</code> — 12 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 2 | `NAME` | string | 30 | 0 | NOT A KEY | NULL |
| 3 | `CURRENT_ACCT` | string | 6 | 0 | NOT A KEY | NULL |
| 4 | `CURRENT_ORG` | string | 7 | 0 | NOT A KEY | NULL |
| 5 | `FLSA_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 6 | `COMP_TIME_CUR_BAL` | number | 8 | 2 | NOT A KEY | NULL |
| 7 | `COMP_TIME_YEAR_EARNED` | number | 4 | 0 | NOT A KEY | NULL |
| 8 | `PP_END_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 9 | `DAILY_DATE_EARNED` | string | 8 | 0 | NOT A KEY | NULL |
| 10 | `COMP_TIME_RATE` | number | 6 | 2 | NOT A KEY | NULL |
| 11 | `COMP_TIME_HOURS` | number | 8 | 2 | NOT A KEY | NULL |
| 12 | `COMP_TIME_UNDEF` | number | 6 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

### CPM

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |
| `YTD_FILE` | VSAM | — | 124 |
| `CPM_YTD_STATE_STG_TBL` | Oracle | INFO_TARGET_DEV | 8 |
| `MER_FILE` | VSAM | — | 110 |
| `CPM_PM1_STG_TBL` | Oracle | INFO_TARGET_DEV | 37 |
| `CPM_YTD_DETAIL_STG_TBL` | Oracle | INFO_TARGET_DEV | 106 |
| `CPM_PM2_STG_TBL` | Oracle | INFO_TARGET_DEV | 43 |
| `PSEUDOSSN_TBL` | Oracle | INFO_TARGET_DEV | 63 |
| `CPM_NEWPAY_TBL` | Oracle | INFO_TARGET_DEV | 501 |
| `PAYMASTER_THREE` | VSAM | — | 37 |
| `ERROR_TBL` | Oracle | INFO_TARGET_DEV | 8 |
| `PAYMASTER_FILE` | VSAM | — | 117 |
| `PAD_FILE` | VSAM | — | 158 |
| `CPM_NEWPAY_STG_TYPE_3_TBL` | Oracle | INFO_TARGET_DEV | 242 |
| `HI_GENERIC_SRC_TBL` | Oracle | INFO_TARGET_DEV | 1 |
| `CPM_NEWPAY_STG_TYPE_1_2_TBL` | Oracle | INFO_TARGET_DEV | 262 |
| `CPM_PM3_STG_TBL` | Oracle | INFO_TARGET_DEV | 40 |
| `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Oracle | INFO_TARGET_DEV | 246 |

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>YTD_FILE</code> — 124 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `DFAS_YTD_HEADER` |  |  |  | — | — |
| 2 | `DFAS_YTD_RECORD_TYPE1` | string | 1 | 0 | NOT A KEY | NULL |
| 3 | `FILLER_1` | string | 1 | 0 | NOT A KEY | NULL |
| 4 | `DFAS_YTD_FILE_NAME` | string | 8 | 0 | NOT A KEY | NULL |
| 5 | `FILLER_2` | string | 1 | 0 | NOT A KEY | NULL |
| 6 | `DFAS_YTD_DB_NAME` | string | 3 | 0 | NOT A KEY | NULL |
| 7 | `FILLER_3` | string | 1 | 0 | NOT A KEY | NULL |
| 8 | `DFAS_YTD_PPEND_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 9 | `FILLER_4` | string | 1 | 0 | NOT A KEY | NULL |
| 10 | `DFAS_YTD_DATE_OF_FILE` | string | 8 | 0 | NOT A KEY | NULL |
| 11 | `FILLER_5` | string | 1018 | 0 | NOT A KEY | NULL |
| 12 | `DFAS_YTD_DETAIL` |  |  |  | — | — |
| 13 | `DFAS_YTD_RECORD_TYPE2` | string | 1 | 0 | NOT A KEY | NULL |
| 14 | `DYD_SSN_1` | string | 9 | 0 | NOT A KEY | NULL |
| 15 | `DYD_NAME` | string | 27 | 0 | NOT A KEY | NULL |
| 16 | `DYD_ORGANIZATION` | string | 6 | 0 | NOT A KEY | NULL |
| 17 | `DYD_ACTIVITY` | string | 7 | 0 | NOT A KEY | NULL |
| 18 | `DYD_BASE_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 19 | `DYD_ADD_BASE_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 20 | `DYD_OVERTIME_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 21 | `DYD_NIGHT_DIFF_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 22 | `DYD_SUN_PREM_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 23 | `DYD_HOL_PREM_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 24 | `DYD_POST_DIFF_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 25 | `DYD_FOREIGN_ALLOW` | number | 9 | 2 | NOT A KEY | NULL |
| 26 | `DYD_COLA_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 27 | `DYD_UNIF_ALLOW` | number | 9 | 2 | NOT A KEY | NULL |
| 28 | `DYD_SEVER_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 29 | `DYD_CASH_AWARDS` | number | 9 | 2 | NOT A KEY | NULL |
| 30 | `DYD_GROSS_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 31 | `DYD_FEDERAL_TAX_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 32 | `DYD_PAY_SUB_FED_TAX` | number | 9 | 2 | NOT A KEY | NULL |
| 33 | `DYD_CSRS_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 34 | `DYD_CSRS_EMPL` | number | 9 | 2 | NOT A KEY | NULL |
| 35 | `DYD_PAY_SUB_CSRS` | number | 9 | 2 | NOT A KEY | NULL |
| 36 | `DYD_OASDI_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 37 | `DYD_OASDI_EMPL` | number | 9 | 2 | NOT A KEY | NULL |
| 38 | `DYD_PAY_SUB_OASDI` | number | 9 | 2 | NOT A KEY | NULL |
| 39 | `DYD_MEDICARE_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 40 | `DYD_MEDICARE_EMPL` | number | 9 | 2 | NOT A KEY | NULL |
| 41 | `DYD_PAY_SUB_MEDICARE` | number | 9 | 2 | NOT A KEY | NULL |
| 42 | `DYD_FERS_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 43 | `DYD_FERS_EMPL` | number | 9 | 2 | NOT A KEY | NULL |
| 44 | `DYD_PAY_SUB_FERS` | number | 9 | 2 | NOT A KEY | NULL |
| 45 | `DYD_FEHB_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 46 | `DYD_FEHB_EMPL` | number | 9 | 2 | NOT A KEY | NULL |
| 47 | `DYD_BOND_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 48 | `DYD_FEGLI_REG` | number | 9 | 2 | NOT A KEY | NULL |
| 49 | `DYD_FEGLI_EMPL` | number | 9 | 2 | NOT A KEY | NULL |
| 50 | `DYD_FEGLI_OPTA` | number | 9 | 2 | NOT A KEY | NULL |
| 51 | `DYD_FEGLI_OPTB` | number | 9 | 2 | NOT A KEY | NULL |
| 52 | `DYD_FEGLI_OPTC` | number | 9 | 2 | NOT A KEY | NULL |
| 53 | `DYD_CHARITY_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 54 | `DYD_UNION_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 55 | `DYD_ALLOTMENTS` | number | 9 | 2 | NOT A KEY | NULL |
| 56 | `DYD_QUARTERS` | number | 9 | 2 | NOT A KEY | NULL |
| 57 | `DYD_NET_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 58 | `DYD_CS_ALIMONY` | number | 9 | 2 | NOT A KEY | NULL |
| 59 | `DYD_EIC` | number | 9 | 2 | NOT A KEY | NULL |
| 60 | `DYD_PCA` | number | 9 | 2 | NOT A KEY | NULL |
| 61 | `DYD_PAY_SUB_TSP` | number | 9 | 2 | NOT A KEY | NULL |
| 62 | `DYD_TSP_BASIC_EMPL` | number | 9 | 2 | NOT A KEY | NULL |
| 63 | `DYD_TSP_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 64 | `DYD_TSP_EMPL` | number | 9 | 2 | NOT A KEY | NULL |
| 65 | `DYD_TSP_LOAN_DED` | number | 9 | 2 | NOT A KEY | NULL |
| 66 | `DYD_STAFF_DIFF` | number | 9 | 2 | NOT A KEY | NULL |
| 67 | `DYD_ON_CALL_TITLE5` | number | 9 | 2 | NOT A KEY | NULL |
| 68 | `DYD_ON_CALL_TITLE38` | number | 9 | 2 | NOT A KEY | NULL |
| 69 | `DYD_OVERTIME_TITLE38` | number | 9 | 2 | NOT A KEY | NULL |
| 70 | `DYD_HOLIDAY_TITLE38` | number | 9 | 2 | NOT A KEY | NULL |
| 71 | `DYD_TOUR_DIFF_TITLE38` | number | 9 | 2 | NOT A KEY | NULL |
| 72 | `DYD_SAT_PREM_TITLE38` | number | 9 | 2 | NOT A KEY | NULL |
| 73 | `DYD_SUN_PREM_TITLE38` | number | 9 | 2 | NOT A KEY | NULL |
| 74 | `DYD_LTC_PREM` | number | 9 | 2 | NOT A KEY | NULL |
| 75 | `DYD_DEBT_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 76 | `DYD_PHY_SPEC_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 77 | `DYD_SEP_INCENTIVE` | number | 9 | 2 | NOT A KEY | NULL |
| 78 | `DYD_LSL_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 79 | `DYD_RECRUIT_BONUS` | number | 9 | 2 | NOT A KEY | NULL |
| 80 | `DYD_RELOC_BONUS` | number | 9 | 2 | NOT A KEY | NULL |
| 81 | `DYD_RETENT_ALLOW` | number | 9 | 2 | NOT A KEY | NULL |
| 82 | `DYD_CHILD_CARE_SUBSIDY` | number | 9 | 2 | NOT A KEY | NULL |
| 83 | `DYD_REL_COMP_LS_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 84 | `DYD_CR_HRS_LS_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 85 | `DYD_PREPAY_FEHB` | number | 9 | 2 | NOT A KEY | NULL |
| 86 | `DYD_FSA_HLTH` | number | 9 | 2 | NOT A KEY | NULL |
| 87 | `DYD_FSA_DC` | number | 9 | 2 | NOT A KEY | NULL |
| 88 | `DYD_VISION` | number | 9 | 2 | NOT A KEY | NULL |
| 89 | `DYD_DENTAL` | number | 9 | 2 | NOT A KEY | NULL |
| 90 | `DYD_VISION_DENTAL` | number | 9 | 2 | NOT A KEY | NULL |
| 91 | `DYD_HEALTH_SAVINGS` | number | 9 | 2 | NOT A KEY | NULL |
| 92 | `DYD_TSP_CATCHUP` | number | 9 | 2 | NOT A KEY | NULL |
| 93 | `DYD_ENVIR_HAZ` | number | 9 | 2 | NOT A KEY | NULL |
| 94 | `DYD_MILITARY_DEPOSIT` | number | 9 | 2 | NOT A KEY | NULL |
| 95 | `DYD_OTHER_RETIREMENT` | number | 9 | 2 | NOT A KEY | NULL |
| 96 | `DYD_TEA` | number | 9 | 2 | NOT A KEY | NULL |
| 97 | `DYD_PAY_SUB_NAF_RET` | number | 9 | 2 | NOT A KEY | NULL |
| 98 | `DYD_PAY_SUB_OTHER_RET` | number | 9 | 2 | NOT A KEY | NULL |
| 99 | `DYD_RET_DED_SUB_PR` | number | 9 | 2 | NOT A KEY | NULL |
| 100 | `DYD_FEHB_DED_SUB_PR` | number | 9 | 2 | NOT A KEY | NULL |
| 101 | `DYD_COLA_DED_SUB_PR` | number | 9 | 2 | NOT A KEY | NULL |
| 102 | `DYD_ACCUMULATIVE_CSRS` | number | 9 | 2 | NOT A KEY | NULL |
| 103 | `DYD_ACCUMULATIVE_FERS` | number | 9 | 2 | NOT A KEY | NULL |
| 104 | `DYD_OASDI_EARNINGS_TRANS_IN` | number | 9 | 2 | NOT A KEY | NULL |
| 105 | `DYD_OASDI_DEDUCT_TRANS_IN` | number | 9 | 2 | NOT A KEY | NULL |
| 106 | `DYD_PRETAX_FEHB` | number | 9 | 2 | NOT A KEY | NULL |
| 107 | `DYD_ADMINISTRATIVE_LEAVE` | number | 7 | 2 | NOT A KEY | NULL |
| 108 | `DYD_ANNUAL_LEAVE_EARNED` | number | 7 | 2 | NOT A KEY | NULL |
| 109 | `DYD_ANNUAL_LEAVE_USED` | number | 7 | 2 | NOT A KEY | NULL |
| 110 | `DYD_SICK_LEAVE_EARNED` | number | 7 | 2 | NOT A KEY | NULL |
| 111 | `DYD_SICK_LEAVE_USED` | number | 7 | 2 | NOT A KEY | NULL |
| 112 | `DYD_MILITARY_LEAVE_EARNED` | number | 7 | 2 | NOT A KEY | NULL |
| 113 | `DYD_MILITARY_LEAVE_USED` | number | 7 | 2 | NOT A KEY | NULL |
| 114 | `DYD_LWOP_AWOL` | number | 7 | 2 | NOT A KEY | NULL |
| 115 | `DYD_RESTORED_LEAVE_EARNED` | number | 7 | 2 | NOT A KEY | NULL |
| 116 | `DYD_RESTORED_LEAVE_USED` | number | 7 | 2 | NOT A KEY | NULL |
| 117 | `FILLER1` | string | 10 | 0 | NOT A KEY | NULL |
| 118 | `DFAS_YTD_STATE` |  |  |  | — | — |
| 119 | `DFAS_YTD_RECORD_TYPE` | string | 1 | 0 | NOT A KEY | NULL |
| 120 | `DYD_SSN_2` | string | 9 | 0 | NOT A KEY | NULL |
| 121 | `DYD_STATE_TAX_CODE` | string | 2 | 0 | NOT A KEY | NULL |
| 122 | `DYD_STATE_TAX_DEDUC` | number | 9 | 2 | NOT A KEY | NULL |
| 123 | `DYD_PAY_SUB_STATE_TAX` | number | 9 | 2 | NOT A KEY | NULL |
| 124 | `FILLER` | string | 1018 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_YTD_STATE_STG_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `RECORD_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `GEN_SEQ_ID` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `DYD_SSN_2` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `DYD_STATE_TAX_CODE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `DYD_STATE_TAX_DEDUC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 8 | `DYD_PAY_SUB_STATE_TAX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>MER_FILE</code> — 110 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `MER_LV_HDR_RECORD` |  |  |  | — | — |
| 2 | `MER_RECTYP1` | string | 1 | 0 | NOT A KEY | NULL |
| 3 | `MER_REPORT_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 4 | `MER_FILE_ID` | string | 5 | 0 | NOT A KEY | NULL |
| 5 | `MER_PAYROLL_OFFICE_ID_CD` | string | 6 | 0 | NOT A KEY | NULL |
| 6 | `MER_REPORT_RECIPIENT` | string | 6 | 0 | NOT A KEY | NULL |
| 7 | `MER_FILLER1` | string | 676 | 0 | NOT A KEY | NULL |
| 8 | `MER_LV_DETAIL_RECORD` |  |  |  | — | — |
| 9 | `MER_RECTYP` | string | 1 | 0 | NOT A KEY | NULL |
| 10 | `MER_SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 11 | `MER_EMP_ACTVTY` | string | 6 | 0 | NOT A KEY | NULL |
| 12 | `MER_ORG` | string | 7 | 0 | NOT A KEY | NULL |
| 13 | `MER_EMPTYPCD` | string | 1 | 0 | NOT A KEY | NULL |
| 14 | `MER_ACTION_NATURE_CD` | string | 4 | 0 | NOT A KEY | NULL |
| 15 | `MER_TEMP_PROM_NTE_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 16 | `MER_TEMP_DTL_NTE_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 17 | `MER_PAY_BASIS_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 18 | `MER_PREM_PAY_IND` | string | 1 | 0 | NOT A KEY | NULL |
| 19 | `MER_PREM_HRLY_RT` | number | 5 | 2 | NOT A KEY | NULL |
| 20 | `MER_ANUITNT_IND` | string | 1 | 0 | NOT A KEY | NULL |
| 21 | `MER_ANUITNT_DIFF_HRLY_RT` | number | 5 | 2 | NOT A KEY | NULL |
| 22 | `MER_SPECL_PGM_IND` | string | 2 | 0 | NOT A KEY | NULL |
| 23 | `MER_COLA_HRLY_RT` | number | 5 | 2 | NOT A KEY | NULL |
| 24 | `MER_PST_DIFF_NON_FRGN_HRLY_RT` | number | 5 | 2 | NOT A KEY | NULL |
| 25 | `MER_MSTR_LV_HIST_EFF_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 26 | `MER_SERVICE_COMP_DT_LV` | string | 6 | 0 | NOT A KEY | NULL |
| 27 | `MER_DUTY_ENTRY_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 28 | `MER_SEP_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 29 | `MER_SEP_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 30 | `MER_DT_LAST_INCR` | string | 6 | 0 | NOT A KEY | NULL |
| 31 | `MER_ADDR_STREET1` | string | 27 | 0 | NOT A KEY | NULL |
| 32 | `MER_ADDR_STREET2` | string | 27 | 0 | NOT A KEY | NULL |
| 33 | `MER_ADDR_CITY` | string | 13 | 0 | NOT A KEY | NULL |
| 34 | `MER_ADDR_STATE` | string | 2 | 0 | NOT A KEY | NULL |
| 35 | `MER_ADDR_ZIP` | string | 9 | 0 | NOT A KEY | NULL |
| 36 | `MER_FEDTX_WTHOLD_EXEMPTS` | number | 3 | 0 | NOT A KEY | NULL |
| 37 | `MER_FEDTX_MAR_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 38 | `MER_ANN_LV_ACCRUAL_RT` | number | 5 | 2 | NOT A KEY | NULL |
| 39 | `MER_ANN_LV_ACCRD_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 40 | `MER_ADVNCD_ANN_LV_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 41 | `MER_ANN_LV_ENDBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 42 | `MER_ANN_LV_BEGBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 43 | `MER_ANN_LV_CEILING` | number | 7 | 2 | NOT A KEY | NULL |
| 44 | `MER_ANN_LV_CRED_REDN_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 45 | `MER_ANN_LV_FORFEIT_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 46 | `MER_ANN_LV_USED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 47 | `MER_ANN_LV_USED_PAY_PD` | number | 5 | 2 | NOT A KEY | NULL |
| 48 | `MER_COMP_TIME_ENDBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 49 | `MER_COMP_TIME_BEGBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 50 | `MER_COMP_TIME_EARN_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 51 | `MER_COMP_TIME_USED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 52 | `MER_CRED_HRS_ENDBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 53 | `MER_CRED_HRS_BEGBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 54 | `MER_CRED_HRS_EARN_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 55 | `MER_CRED_HRS_USED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 56 | `MER_MIL_LV_ENDBAL` | number | 5 | 2 | NOT A KEY | NULL |
| 57 | `MER_MIL_LV_BEGBAL` | number | 5 | 2 | NOT A KEY | NULL |
| 58 | `MER_MIL_LV_USED_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 59 | `MER_NPAY_HRS_USED_PAY_PD` | number | 5 | 2 | NOT A KEY | NULL |
| 60 | `MER_NPAY_HRS_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 61 | `MER_RELG_CMPTM_ENDBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 62 | `MER_RELG_CMPTM_BEGBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 63 | `MER_RELG_CMPTM_EARN_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 64 | `MER_RELG_CMPTM_USED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 65 | `MER_RSTRD_ANN_LV_ENDBAL_1` | number | 5 | 2 | NOT A KEY | NULL |
| 66 | `MER_RSTRD_ANN_LV_ENDBAL_2` | number | 5 | 2 | NOT A KEY | NULL |
| 67 | `MER_RSTRD_ANN_LV_ENDBAL_3` | number | 5 | 2 | NOT A KEY | NULL |
| 68 | `MER_SICK_LV_ACCRUAL_RT` | number | 5 | 2 | NOT A KEY | NULL |
| 69 | `MER_SICK_LV_ACCRUED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 70 | `MER_ADVNCD_SICK_LV_BAL` | number | 5 | 2 | NOT A KEY | NULL |
| 71 | `MER_SICK_LV_ENDBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 72 | `MER_SICK_LV_BEGBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 73 | `MER_SICK_LV_CRED_REDN_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 74 | `MER_SICK_LV_USED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 75 | `MER_SICK_LV_USED_PAY_PD` | number | 5 | 2 | NOT A KEY | NULL |
| 76 | `MER_ST_TAX_AUTH_1` | string | 3 | 0 | NOT A KEY | NULL |
| 77 | `MER_ST_TX_EXEMPTS_1` | number | 3 | 0 | NOT A KEY | NULL |
| 78 | `MER_ST_TAX_AUTH_2` | string | 3 | 0 | NOT A KEY | NULL |
| 79 | `MER_ST_TX_EXEMPTS_2` | number | 3 | 0 | NOT A KEY | NULL |
| 80 | `MER_OT_EARN_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 81 | `MER_TOFF_AWRD_BEG_YRGAL` | number | 7 | 2 | NOT A KEY | NULL |
| 82 | `MER_TOFF_AWRD_AUTHHRS_YTD` | number | 3 | 0 | NOT A KEY | NULL |
| 83 | `MER_TOFF_AWRD_USED_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 84 | `MER_TOFF_AWRD_FORF_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 85 | `MER_TOFF_AWRD_ENDBAL` | number | 5 | 2 | NOT A KEY | NULL |
| 86 | `MER_FF_DIVISOR_IND` | string | 1 | 0 | NOT A KEY | NULL |
| 87 | `MER_ALT_HRLY_RT_1` | number | 5 | 2 | NOT A KEY | NULL |
| 88 | `MER_ALT_HRLY_RT_2` | number | 5 | 2 | NOT A KEY | NULL |
| 89 | `MER_ALT_ANUITNT_DIFF` | number | 5 | 2 | NOT A KEY | NULL |
| 90 | `MER_ALT_COLA_HRLY_RT` | number | 5 | 2 | NOT A KEY | NULL |
| 91 | `MER_ALT_PSTDIFFNFHRLY_RT` | number | 5 | 2 | NOT A KEY | NULL |
| 92 | `MER_TVL_COMP_END_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 93 | `MER_TVL_COMP_BEGIN_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 94 | `MER_TVL_COMP_EARN_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 95 | `MER_TVL_COMP_USED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 96 | `MER_TVL_COMP_TIME_FORF` | number | 7 | 2 | NOT A KEY | NULL |
| 97 | `MER_BRAC_ENDBAL` | number | 7 | 2 | NOT A KEY | NULL |
| 98 | `MER_EMER_LV_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 99 | `MER_FROZ_ANN_LV_USED_PAY_PD` | number | 5 | 2 | NOT A KEY | NULL |
| 100 | `MER_FROZ_ANN_LV_USED_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 101 | `MER_FROZ_ANN_LV_ENDBAL` | number | 5 | 2 | NOT A KEY | NULL |
| 102 | `MER_DIS_VET_LV_ELIG_BEG_DT` | string | 8 | 0 | NOT A KEY | NULL |
| 103 | `MER_DIS_VET_LV_ELIG_END_DT` | string | 8 | 0 | NOT A KEY | NULL |
| 104 | `MER_DIS_VET_LV_BEG_YR_BAL` | number | 5 | 2 | NOT A KEY | NULL |
| 105 | `MER_DIS_VET_LV_REC_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 106 | `MER_DIS_VET_LV_USED_PP` | number | 5 | 2 | NOT A KEY | NULL |
| 107 | `MER_DIS_VET_LV_USED_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 108 | `MER_DIS_VET_LV_FORF_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 109 | `MER_DIS_VET_LV_END_BAL` | number | 5 | 2 | NOT A KEY | NULL |
| 110 | `MER_FILLER` | string | 24 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PM1_STG_TBL</code> — 37 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PYF_REC_NO_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `PYF_EYE_ID_1` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_PAY_BLK_1` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 6 | `PYF_EMP_ACT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 7 | `PYF_ORG` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 8 | `PYF_EYE_NME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 9 | `PYF_PMT_MET_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 10 | `PYF_FIN_ORG_RTN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 11 | `PYF_GR_UNGR_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `PYF_DOB_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 13 | `PYF_EYE_AGE_CAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `PYF_GLI_CVG_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 15 | `PYF_MLT_APMT_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `PYF_MS_FED` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `PYF_FITW_ADD_PAY_PD` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 18 | `PYF_FITW_XMP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 19 | `PYF_EYE_TYP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 20 | `PYF_FLSA_XMP_STA` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `PYF_PAY_PN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 22 | `PYF_GR_CIV` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `PYF_PAY_RAT_STP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 24 | `PYF_SRY_BSE_ANL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 25 | `PYF_SRY_HR` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 26 | `PYF_ADR_STR_1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 27 | `PYF_ADR_STR_2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 28 | `PYF_ADR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 29 | `PYF_ADR_ST` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 30 | `PYF_ADR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 31 | `PYF_WALK_SEQ` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 32 | `PYF_CHK_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `PYF_FILLER_RT1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `PYF_SEC_DISB_OFC_RT1` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 35 | `PYF_HIS_PGRANGE_RT1` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 36 | `PYF_DISB_OFC_RT1` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 37 | `PYF_MPH_PGRANGE_RT1` | number(p,s) | 8 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_YTD_DETAIL_STG_TBL</code> — 106 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `RECORD_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `DYD_SSN_1` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `DYD_NAME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 6 | `DYD_ORGANIZATION` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 7 | `DYD_ACTIVITY` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 8 | `DYD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 9 | `DYD_ADD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 10 | `DYD_OVERTIME_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 11 | `DYD_NIGHT_DIFF_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `DYD_SUN_PREM_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 13 | `DYD_HOL_PREM_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 14 | `DYD_POST_DIFF_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 15 | `DYD_FOREIGN_ALLOW` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 16 | `DYD_COLA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 17 | `DYD_UNIF_ALLOW` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 18 | `DYD_SEVER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 19 | `DYD_CASH_AWARDS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 20 | `DYD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 21 | `DYD_FEDERAL_TAX_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 22 | `DYD_PAY_SUB_FED_TAX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 23 | `DYD_CSRS_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 24 | `DYD_CSRS_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 25 | `DYD_PAY_SUB_CSRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 26 | `DYD_OASDI_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 27 | `DYD_OASDI_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 28 | `DYD_PAY_SUB_OASDI` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 29 | `DYD_MEDICARE_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 30 | `DYD_MEDICARE_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 31 | `DYD_PAY_SUB_MEDICARE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 32 | `DYD_FERS_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 33 | `DYD_FERS_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 34 | `DYD_PAY_SUB_FERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 35 | `DYD_FEHB_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 36 | `DYD_FEHB_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 37 | `DYD_BOND_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 38 | `DYD_FEGLI_REG` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 39 | `DYD_FEGLI_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 40 | `DYD_FEGLI_OPTA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 41 | `DYD_FEGLI_OPTB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 42 | `DYD_FEGLI_OPTC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 43 | `DYD_CHARITY_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 44 | `DYD_UNION_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 45 | `DYD_ALLOTMENTS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 46 | `DYD_QUARTERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 47 | `DYD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 48 | `DYD_CS_ALIMONY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 49 | `DYD_EIC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 50 | `DYD_PCA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 51 | `DYD_PAY_SUB_TSP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 52 | `DYD_TSP_BASIC_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 53 | `DYD_TSP_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 54 | `DYD_TSP_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 55 | `DYD_TSP_LOAN_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 56 | `DYD_STAFF_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 57 | `DYD_ON_CALL_TITLE5` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 58 | `DYD_ON_CALL_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 59 | `DYD_OVERTIME_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 60 | `DYD_HOLIDAY_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 61 | `DYD_TOUR_DIFF_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 62 | `DYD_SAT_PREM_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 63 | `DYD_SUN_PREM_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 64 | `DYD_LTC_PREM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 65 | `DYD_DEBT_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 66 | `DYD_PHY_SPEC_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 67 | `DYD_SEP_INCENTIVE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `DYD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 69 | `DYD_RECRUIT_BONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 70 | `DYD_RELOC_BONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 71 | `DYD_RETENT_ALLOW` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 72 | `DYD_CHILD_CARE_SUBSIDY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 73 | `DYD_REL_COMP_LS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 74 | `DYD_CR_HRS_LS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 75 | `DYD_PREPAY_FEHB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 76 | `DYD_FSA_HLTH` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 77 | `DYD_FSA_DC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 78 | `DYD_VISION` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 79 | `DYD_DENTAL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 80 | `DYD_VISION_DENTAL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 81 | `DYD_HEALTH_SAVINGS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 82 | `DYD_TSP_CATCHUP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 83 | `DYD_ENVIR_HAZ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 84 | `DYD_MILITARY_DEPOSIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 85 | `DYD_OTHER_RETIREMENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 86 | `DYD_TEA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 87 | `DYD_PAY_SUB_NAF_RET` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 88 | `DYD_PAY_SUB_OTHER_RET` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 89 | `DYD_RET_DED_SUB_PR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 90 | `DYD_FEHB_DED_SUB_PR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 91 | `DYD_COLA_DED_SUB_PR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 92 | `DYD_ACCUMULATIVE_CSRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 93 | `DYD_ACCUMULATIVE_FERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 94 | `DYD_OASDI_EARNINGS_TRANS_IN` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 95 | `DYD_OASDI_DEDUCT_TRANS_IN` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 96 | `DYD_PRETAX_FEHB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 97 | `DYD_ADMINISTRATIVE_LEAVE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 98 | `DYD_ANNUAL_LEAVE_EARNED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 99 | `DYD_ANNUAL_LEAVE_USED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 100 | `DYD_SICK_LEAVE_EARNED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 101 | `DYD_SICK_LEAVE_USED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 102 | `DYD_MILITARY_LEAVE_EARNED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 103 | `DYD_MILITARY_LEAVE_USED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 104 | `DYD_LWOP_AWOL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `DYD_RESTORED_LEAVE_EARNED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 106 | `DYD_RESTORED_LEAVE_USED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PM2_STG_TBL</code> — 43 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PYF_REC_NO_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `PYF_EYE_ID_2` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_PAY_BLK_2` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 6 | `PYF_AGY_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `PYF_SON` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 8 | `PYF_ACTG_ACT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 9 | `PYF_MAJOR_CLAIMANT` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 10 | `PYF_FIN_ORG_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 11 | `PYF_FIN_ORG_ACCT_TYP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `PYF_TSP_SVC_CMP_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 13 | `PYF_TSP_VEST_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `PYF_TSP_STA_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 15 | `PYF_TSP_STA_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `PYF_TSP_ELG_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 17 | `PYF_RET_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 18 | `PYF_EYE_STA_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 19 | `PYF_SEP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 20 | `PYF_LOC_ADJ` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 21 | `PYF_BSC_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 22 | `PYF_BSC_OT_RAT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 23 | `PYF_LOC_PAY_PCT` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 24 | `PYF_SVC_CMP_DATE_LV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 25 | `PYF_MIL_DEP_OWED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 26 | `PYF_MIL_DEP_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 27 | `PYF_DY_ENT_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 28 | `PYF_TPY_POS_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `PYF_BWKLY_SCD_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 30 | `PYF_PAY_PN_ID` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `PYF_TAX_STA_FED` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `PYF_EMP_STAT_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `PYF_FILLER_PAY` | varchar2 | 14 | 0 | NOT A KEY | NULL |
| 34 | `PYF_SEP_CD_8` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 35 | `PYF_SEP_DATE_8` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 36 | `PYF_PRIOR_EYE_ID_8` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 37 | `PYF_PRIOR_DOB_DATE_8` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 38 | `PYF_TSP_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `PYF_FILLER_RT2` | varchar2 | 14 | 0 | NOT A KEY | NULL |
| 40 | `PYF_SEC_DISB_OFC_RT2` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 41 | `PYF_HIS_PGRANGE_RT2` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 42 | `PYF_DISB_OFC_RT2` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 43 | `PYF_MPH_PGRANGE_RT2` | number(p,s) | 8 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PSEUDOSSN_TBL</code> — 63 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 2 | `CAN_CD` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 3 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 5 | `EMPL_RCD` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 6 | `APPT_NUM` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 7 | `EMP_FIRST_NAME` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 8 | `EMP_MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 9 | `EMP_LAST_NAME` | varchar2 | 16 | 0 | NOT A KEY | NOTNULL |
| 10 | `SEX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `VETERANS_PREFERENCE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `TENURE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `POSITION_NUM` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `US_CITIZENSHIP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 15 | `APPT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `HIRE_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 17 | `HANDICAP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `UNF_ALLOW_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 19 | `UNIF_ALLOW_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 20 | `UNIF_ALLOW_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 21 | `RSSSDP` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 22 | `CEIL_REPORTING_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 23 | `FUNCTNL_CLASSFCTN_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `EMP_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `MANAGER_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `POSITION_SENSITIVITY_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `CAREER_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 28 | `CAREER_CONV_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 29 | `PROBATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `ABNORMAL_RATE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `APPT_LIMIT_HRS` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 32 | `APPT_LIMIT_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 33 | `LAST_PAY_CHANGE` | date | 19 | 0 | NOT A KEY | NULL |
| 34 | `CHARITY_AREA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 35 | `CHARITY_EFF_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 36 | `CHARITY_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 37 | `LAST_NOA_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 38 | `QUARTERS_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 39 | `SUBSIST_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 40 | `PAY_BASIS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 41 | `WORK_SCHEDULE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `OCCUPATION_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 43 | `DUTY_STATION` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 44 | `JOB_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `REG_TEMP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `SEPERATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 47 | `PCA_CONTR_EFF_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 48 | `PCA_CONTR_EFF_END_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 49 | `MAX_ANNUAL_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 50 | `PCA_BIWEEKLY_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 51 | `PAY_PLAN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 52 | `APPT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 53 | `SPECIAL_PROGRAM_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 54 | `TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 55 | `EFFECTIVE_DATE` | date | 19 | 0 | NOT A KEY | NOTNULL |
| 56 | `EFFECTIVE_SEQ` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 57 | `PAY_TABL_NO` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 58 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 59 | `DEPTID` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 60 | `PCA_CONTR_LEN_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 61 | `TK_NUM` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NOTNULL |
| 63 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>CPM_NEWPAY_TBL</code> — 501 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LINE_TYPE` | varchar2 | 5 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `FIR_NAME_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `CODE_CONSL` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `FIR_NAME_3_11` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 8 | `MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `SURNAME_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 10 | `SURNAME_OTHER` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 11 | `SOC_SEC_NO` | number(p,s) | 11 | 0 | NOT A KEY | NULL |
| 12 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 13 | `OCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 14 | `JOB_LOC_CDE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 15 | `ST_CONT_LOC` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `CITY_LOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 17 | `CTY_CTRY_LOC` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 18 | `TK_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 19 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 20 | `CAN_FY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `CAN_AGCY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `CAN_AP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `CAN_AGCY_ACCT_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 24 | `ORG_CDE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 25 | `ORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `ORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `ORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `ORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `ORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `ORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `ORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `SPOC` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 37 | `SEX_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `VET_PREF_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `TENURE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 40 | `EHRP_EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 41 | `EHRP_EMP_REC_NO` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `PERM_TEMP_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `FT_PT_INTER_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 44 | `CITIZEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `TYPE_APPT_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `EOD_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 47 | `PHY_HNDCP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 48 | `CEILING_EN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 49 | `FUNC_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 50 | `SUPV_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 51 | `PAY_BASIS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `POS_SEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 53 | `CAR_SERV_DTE` | number(p,s) | 16 | 0 | NOT A KEY | NULL |
| 54 | `PROB_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 55 | `SPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 56 | `ABNOR_RATE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `FED_RETIRE_CDE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `TSPA_STATUS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 59 | `TSPA_VEST_PERIOD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 60 | `EFT_EMPL_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 61 | `EFT_EMPL_ACCT_NUMBER` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 62 | `FS_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `TSPA_STATUS_CODE_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `TSPA_SCD` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 65 | `OT_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 66 | `LOCAL_PCENT_RATE` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 67 | `CPP_LOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `AGCY_CDE_PER` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 69 | `SEP_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 70 | `SEP_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 71 | `PERS_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 72 | `ANNUAL_SAL` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 73 | `FLSA_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 74 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 75 | `CPP_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 76 | `DATE_BIRTH` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 77 | `EFT_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 78 | `EFT_CK_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 79 | `POSITION_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `POSITION_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 81 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 82 | `STEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `FEGLI_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `FEGLI_CDE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 85 | `TOT_FED_TAX_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 86 | `FED_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 87 | `HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 88 | `SEV_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `HLTH_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 90 | `HLTH_GOVT_SHARE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 91 | `UNION_IDENT_CDE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 92 | `UNION_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 93 | `PCA_BIWEEK_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 94 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 95 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 96 | `AN_LV_EARNED_CPP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 97 | `SICK_LV_ERN_CPP` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 98 | `COMP_LV_ERN_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 99 | `COMP_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 100 | `ADMIN_LV_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `LWOP_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 102 | `STAFFING_BIW_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 103 | `INCENT_TIME_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 104 | `PSP_BIWKLY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `REL_COMP_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 106 | `REL_COMP_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 107 | `CR_HRS_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 108 | `CR_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 109 | `FERS_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 110 | `AN_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 111 | `SICK_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 112 | `LV_CAT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 113 | `AN_LV_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 114 | `AN_LV_ERND_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 115 | `AN_LV_ADV_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 116 | `AN_LV_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 117 | `AN_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 118 | `AN_LV_MAX_COVER` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 119 | `AN_LV_USE_LOSE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 120 | `SICK_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 121 | `SICK_LV_ERN_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 122 | `SICK_LV_AD_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 123 | `SICK_LV_USD_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 124 | `SICK_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 125 | `COMP_LV_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 126 | `RESTOR_AL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `RESTOR_AL_BAL_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `RESTOR_AL_BAL_2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `RESTOR_AL_BAL_3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `PSI_START_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 131 | `REL_COMP_CURR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 132 | `CR_HRS_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 133 | `TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 136 | `TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `TVL_COMP_FORFEITED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `YTD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 139 | `YTD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `YTD_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `YTD_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `YTD_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `YTD_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `YTD_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `YTD_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `YTD_SEV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 147 | `YTD_CASH_AWARDS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `YTD_MP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `YTD_LSL_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `YTD_MISC_OTH_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 151 | `YTD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 152 | `YTD_NON_TAX_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 153 | `YTD_FED_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `YTD_TAXABLE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `YTD_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `YTD_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `YTD_CSR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 158 | `YTD_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `YTD_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `YTD_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 161 | `YTD_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `YTD_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `YTD_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 164 | `YTD_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `YTD_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `YTD_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 167 | `YTD_LEVY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 169 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 170 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 172 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 173 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 174 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 177 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 178 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 181 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 182 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 184 | `YTD_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `YTD_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `YTD_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `YTD_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `YTD_LI_REG_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `YTD_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `YTD_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `YTD_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `YTD_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `YTD_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `YTD_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `YTD_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `YTD_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `YTD_LAUNDRY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `YTD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 199 | `YTD_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 200 | `EIC_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `PCA_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `YTD_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 203 | `YTD_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `YTD_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `YTD_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 206 | `YTD_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `YTD_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `YTD_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 209 | `YTD_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `T38_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 211 | `T38_HOL_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `T38_ND_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `T38_ONCALL_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `T38_SAT_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 215 | `T38_SUN_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `YTD_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `YTD_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `YTD_PSP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `RET_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `YTD_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 221 | `YTD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 222 | `YTD_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 223 | `YTD_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 224 | `YTD_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 225 | `YTD_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `YTD_CHILD_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `REL_COMP_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `CR_HRS_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `YTD_PREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `YTD_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `YTD_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `YTD_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `VIS_DENT_1_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_2_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `VIS_DENT_3_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `TRANSFER_IN_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 237 | `TRANSFER_IN_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `FEHB_PC_PRE_TAX_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 239 | `ADMIN_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 240 | `MILITARY_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 241 | `LWOP_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 242 | `RESTOR_AL_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 243 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 244 | `OC_121S_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 245 | `OC_1211_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 246 | `OC_1111_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 247 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 248 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 249 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 250 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 251 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 252 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 253 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 254 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 255 | `CPP_HLTH_EMPLR_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 256 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 257 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `CPP_DCS_DEBT_AMT_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 261 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 262 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 263 | `CPP_OTHER_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 264 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 265 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 266 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 267 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 268 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 269 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 270 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 271 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 272 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 273 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 274 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 275 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 276 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 277 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 278 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 279 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 280 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 281 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 282 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 283 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 284 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 285 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 286 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 287 | `CPP_BASE_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 288 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 289 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 290 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 291 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 292 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 293 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 294 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 295 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 296 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 297 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 298 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 299 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 300 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 301 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 302 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 303 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 304 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 305 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 306 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 307 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 308 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 309 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 310 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 311 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 312 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 313 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 314 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 315 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 316 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 317 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 318 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 319 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 320 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 321 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 322 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 323 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 324 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 325 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 326 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 327 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 328 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 329 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 330 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 331 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 332 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 333 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 334 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 335 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 336 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 337 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 338 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 339 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 340 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 341 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 342 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 343 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 344 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 345 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 346 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 347 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 348 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 349 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 350 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 351 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 352 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 353 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 354 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 355 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 356 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 357 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 358 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 359 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 360 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 361 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 362 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 363 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 364 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 365 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 366 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 367 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 368 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 369 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 370 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 371 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 372 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 373 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 374 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 375 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 376 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 377 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 378 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 379 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 380 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 381 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 382 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 383 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 384 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 385 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 386 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 387 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 388 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 389 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 390 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 391 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 392 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 393 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 394 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 395 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 396 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 397 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 398 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 399 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 400 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 401 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 402 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 403 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 404 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 405 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 406 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 407 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 408 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 409 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 410 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 411 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 412 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 413 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 414 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 415 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 416 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 417 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 418 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 419 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 420 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 421 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 422 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 423 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 424 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 425 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 426 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 427 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 428 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 429 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 430 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 431 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 432 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 433 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 434 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 435 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 436 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 437 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 438 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 439 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 440 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 441 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 442 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 443 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 444 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 445 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 446 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 447 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 448 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 449 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 450 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 451 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 452 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 453 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 454 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 455 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 456 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 457 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 458 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 459 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 460 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 461 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 462 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 463 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 464 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 465 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 466 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 467 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 468 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 469 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 470 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 471 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 472 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 473 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 474 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 475 | `WORK_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 476 | `WORK_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 477 | `WORK_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 478 | `WORK_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 479 | `WORK_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 480 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 481 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 482 | `FED_RETIRE_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 483 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 484 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 485 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 486 | `COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 487 | `COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 488 | `COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 489 | `COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 490 | `OT_EARN_YTD_DOLL_VALUE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 491 | `REL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 492 | `REL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 493 | `REL_COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 494 | `REL_COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 495 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 496 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 497 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 498 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 499 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 500 | `DON_LV_HRS_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 501 | `DON_LV_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>PAYMASTER_THREE</code> — 37 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_PAY_DETAIL_RECORD` |  |  |  | — | — |
| 2 | `PYF_REC_NO_PDT3` | string | 1 | 0 | NOT A KEY | NULL |
| 3 | `PYF_EYE_ID_PDT3` | string | 9 | 0 | NOT A KEY | NULL |
| 4 | `PYF_PAY_BLK_PDT3` | string | 3 | 0 | NOT A KEY | NULL |
| 5 | `PYF_PAY_DETAIL` |  |  |  | — | — |
| 6 | `PYF_PAY_TAC_TYP` | string | 5 | 0 | NOT A KEY | NULL |
| 7 | `PYF_DATE_EFF` | string | 8 | 0 | NOT A KEY | NULL |
| 8 | `PYF_PAY_DET_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 9 | `PYF_OT_ENV_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 10 | `PYF_HRS_SCD_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 11 | `PYF_ACTUAL_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 12 | `PYF_PAY_RAT` | number | 5 | 2 | NOT A KEY | NULL |
| 13 | `PYF_CASH_PMT_AMT` | number | 7 | 2 | NOT A KEY | NULL |
| 14 | `PYF_ADJ_RSN_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 15 | `PYF_ADJ_DATE_EFF` | string | 8 | 0 | NOT A KEY | NULL |
| 16 | `PYF_ADJ_SYS_GEN_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 17 | `PYF_RSN_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 18 | `PFY_ID_BREAK_SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 19 | `PFY_ID_BREAK_CODE` | string | 4 | 0 | NOT A KEY | NULL |
| 20 | `FILLER` | string | 12 | 0 | NOT A KEY | NULL |
| 21 | `PYF_DDU_PYE` | string | 9 | 0 | NOT A KEY | NULL |
| 22 | `PYF_ITW_MS` | string | 1 | 0 | NOT A KEY | NULL |
| 23 | `PYF_ITW_XMP` | number | 3 | 0 | NOT A KEY | NULL |
| 24 | `PYF_ITW_ADD` | number | 5 | 0 | NOT A KEY | NULL |
| 25 | `PYF_ALLOW_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 26 | `PYF_OFFSET_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 27 | `PYF_USER_NME` | string | 8 | 0 | NOT A KEY | NULL |
| 28 | `PYF_ACC_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 29 | `PYF_ACC_TME` | string | 4 | 0 | NOT A KEY | NULL |
| 30 | `PYF_AWD_SEQ_NO` | string | 2 | 0 | NOT A KEY | NULL |
| 31 | `PYF_RETRO_TAXES_DONE` | string | 1 | 0 | NOT A KEY | NULL |
| 32 | `PYF_RETRO_RETIREMENT_DONE` | string | 1 | 0 | NOT A KEY | NULL |
| 33 | `PYF_RETRO_OTH_DONE` | string | 1 | 0 | NOT A KEY | NULL |
| 34 | `PYF_FILLER_RT3` | string | 56 | 0 | NOT A KEY | NULL |
| 35 | `PYF_SEC_DISB_OFC_RT3` | string | 6 | 0 | NOT A KEY | NULL |
| 36 | `PYF_DISB_OFC_RT3` | string | 6 | 0 | NOT A KEY | NULL |
| 37 | `PYF_FILLER_2_RT3` | string | 42 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>ERROR_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 8 | `ERROR_CODE` | varchar2 | 50 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAYMASTER_FILE</code> — 117 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_PAYMASTER_HEADER` |  |  |  | — | — |
| 2 | `PYF_REC_NO_BLANK` | string | 1 | 0 | NOT A KEY | NULL |
| 3 | `PYF_REC_PPE_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 4 | `PYF_FILLER` | string | 247 | 0 | NOT A KEY | NULL |
| 5 | `WS_PAYMASTER_RECORD_1` |  |  |  | — | — |
| 6 | `PYF_REC_NO_1` | string | 1 | 0 | NOT A KEY | NULL |
| 7 | `PYF_EYE_ID_1` | string | 9 | 0 | NOT A KEY | NULL |
| 8 | `PYF_PAY_BLK_1` | string | 3 | 0 | NOT A KEY | NULL |
| 9 | `PYF_EMP_ACT` | string | 6 | 0 | NOT A KEY | NULL |
| 10 | `PYF_ORG` | string | 7 | 0 | NOT A KEY | NULL |
| 11 | `PYF_EYE_NME` | string | 27 | 0 | NOT A KEY | NULL |
| 12 | `PYF_PMT_MET_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 13 | `PYF_FIN_ORG_RTN` | string | 9 | 0 | NOT A KEY | NULL |
| 14 | `PYF_GR_UNGR_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 15 | `PYF_DOB_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 16 | `PYF_EYE_AGE_CAT` | string | 1 | 0 | NOT A KEY | NULL |
| 17 | `PYF_GLI_CVG_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 18 | `PYF_MLT_APMT_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 19 | `PYF_MS_FED` | string | 1 | 0 | NOT A KEY | NULL |
| 20 | `PYF_FITW_ADD_PAY_PD` | number | 5 | 0 | NOT A KEY | NULL |
| 21 | `PYF_FITW_XMP` | number | 3 | 0 | NOT A KEY | NULL |
| 22 | `PYF_EYE_TYP_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 23 | `PYF_FLSA_XMP_STA` | string | 1 | 0 | NOT A KEY | NULL |
| 24 | `PYF_PAY_PN_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 25 | `PYF_GR_CIV` | string | 2 | 0 | NOT A KEY | NULL |
| 26 | `PYF_PAY_RAT_STP` | string | 2 | 0 | NOT A KEY | NULL |
| 27 | `PYF_SRY_BSE_ANL` | number | 9 | 2 | NOT A KEY | NULL |
| 28 | `PYF_SRY_HR` | number | 5 | 2 | NOT A KEY | NULL |
| 29 | `PYF_ADR_STR_1` | string | 27 | 0 | NOT A KEY | NULL |
| 30 | `PYF_ADR_STR_2` | string | 27 | 0 | NOT A KEY | NULL |
| 31 | `PYF_ADR_CITY` | string | 13 | 0 | NOT A KEY | NULL |
| 32 | `PYF_ADR_ST` | string | 2 | 0 | NOT A KEY | NULL |
| 33 | `PYF_ADR_ZIP` | string | 9 | 0 | NOT A KEY | NULL |
| 34 | `PYF_WALK_SEQ` | string | 2 | 0 | NOT A KEY | NULL |
| 35 | `PYF_CHK_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 36 | `PYF_FILLER_RT1` | string | 1 | 0 | NOT A KEY | NULL |
| 37 | `PYF_SEC_DISB_OFC_RT1` | string | 6 | 0 | NOT A KEY | NULL |
| 38 | `PYF_DISB_OFC_RT1` | string | 6 | 0 | NOT A KEY | NULL |
| 39 | `PYF_FILLER_2_RT1` | string | 51 | 0 | NOT A KEY | NULL |
| 40 | `WS_PAYMASTER_RECORD_2` |  |  |  | — | — |
| 41 | `PYF_REC_NO_2` | string | 1 | 0 | NOT A KEY | NULL |
| 42 | `PYF_EYE_ID_2` | string | 9 | 0 | NOT A KEY | NULL |
| 43 | `PYF_PAY_BLK_2` | string | 3 | 0 | NOT A KEY | NULL |
| 44 | `PYF_AGY_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 45 | `PYF_SON` | string | 4 | 0 | NOT A KEY | NULL |
| 46 | `PYF_ACTG_ACT` | string | 6 | 0 | NOT A KEY | NULL |
| 47 | `PYF_MAJOR_CLAIMANT` | string | 2 | 0 | NOT A KEY | NULL |
| 48 | `PYF_FIN_ORG_ACCT_NO` | string | 17 | 0 | NOT A KEY | NULL |
| 49 | `PYF_FIN_ORG_ACCT_TYP` | string | 1 | 0 | NOT A KEY | NULL |
| 50 | `PYF_TSP_SVC_CMP_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 51 | `PYF_TSP_VEST_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 52 | `PYF_TSP_STA_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 53 | `PYF_TSP_STA_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 54 | `PYF_TSP_ELG_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 55 | `PYF_RET_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 56 | `PYF_EYE_STA_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 57 | `PYF_SEP_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 58 | `PYF_LOC_ADJ` | number | 8 | 2 | NOT A KEY | NULL |
| 59 | `PYF_BSC_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 60 | `PYF_BSC_OT_RAT` | number | 5 | 2 | NOT A KEY | NULL |
| 61 | `PYF_LOC_PAY_PCT` | number | 5 | 4 | NOT A KEY | NULL |
| 62 | `PYF_SVC_CMP_DATE_LV` | string | 8 | 0 | NOT A KEY | NULL |
| 63 | `PYF_MIL_DEP_OWED` | number | 9 | 2 | NOT A KEY | NULL |
| 64 | `PYF_MIL_DEP_PAID` | number | 9 | 2 | NOT A KEY | NULL |
| 65 | `PYF_DY_ENT_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 66 | `PYF_TPY_POS_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 67 | `PYF_BWKLY_SCD_HRS` | number | 5 | 2 | NOT A KEY | NULL |
| 68 | `PYF_PAY_PN_ID` | string | 1 | 0 | NOT A KEY | NULL |
| 69 | `PYF_TAX_STA_FED` | string | 1 | 0 | NOT A KEY | NULL |
| 70 | `PYF_EMP_STAT_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 71 | `PYF_FILLER_PAY` | string | 14 | 0 | NOT A KEY | NULL |
| 72 | `PYF_SEP_CD_8` | string | 2 | 0 | NOT A KEY | NULL |
| 73 | `PYF_SEP_DATE_8` | string | 8 | 0 | NOT A KEY | NULL |
| 74 | `PYF_PRIOR_EYE_ID_8` | string | 9 | 0 | NOT A KEY | NULL |
| 75 | `PYF_PRIOR_DOB_DATE_8` | string | 8 | 0 | NOT A KEY | NULL |
| 76 | `PYF_TSP_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 77 | `PYF_FILLER_RT2` | string | 14 | 0 | NOT A KEY | NULL |
| 78 | `PYF_SEC_DISB_OFC_RT2` | string | 6 | 0 | NOT A KEY | NULL |
| 79 | `PYF_DISB_OFC_RT2` | string | 6 | 0 | NOT A KEY | NULL |
| 80 | `PYF_FILLER_2_RT2` | string | 36 | 0 | NOT A KEY | NULL |
| 81 | `WS_PAYMASTER_RECORD_3` |  |  |  | — | — |
| 82 | `PYF_REC_NO_PDT3` | string | 1 | 0 | NOT A KEY | NULL |
| 83 | `PYF_EYE_ID_PDT3` | string | 9 | 0 | NOT A KEY | NULL |
| 84 | `PYF_PAY_BLK_PDT3` | string | 3 | 0 | NOT A KEY | NULL |
| 85 | `PYF_PAY_DETAIL` |  |  |  | — | — |
| 86 | `PYF_PAY_TAC_TYP` | string | 5 | 0 | NOT A KEY | NULL |
| 87 | `PYF_DATE_EFF` | string | 8 | 0 | NOT A KEY | NULL |
| 88 | `PYF_PAY_DET_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 89 | `PYF_OT_ENV_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 90 | `PYF_HRS_SCD_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 91 | `PYF_ACTUAL_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 92 | `PYF_PAY_RAT` | number | 5 | 2 | NOT A KEY | NULL |
| 93 | `PYF_CASH_PMT_AMT` | number | 7 | 2 | NOT A KEY | NULL |
| 94 | `PYF_ADJ_RSN_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 95 | `PYF_ADJ_DATE_EFF` | string | 8 | 0 | NOT A KEY | NULL |
| 96 | `PYF_ADJ_SYS_GEN_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 97 | `PYF_RSN_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 98 | `PFY_ID_BREAK_SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 99 | `PFY_ID_BREAK_CODE` | string | 4 | 0 | NOT A KEY | NULL |
| 100 | `FILLER` | string | 12 | 0 | NOT A KEY | NULL |
| 101 | `PYF_DDU_PYE` | string | 9 | 0 | NOT A KEY | NULL |
| 102 | `PYF_ITW_MS` | string | 1 | 0 | NOT A KEY | NULL |
| 103 | `PYF_ITW_XMP` | number | 3 | 0 | NOT A KEY | NULL |
| 104 | `PYF_ITW_ADD` | number | 5 | 0 | NOT A KEY | NULL |
| 105 | `PYF_ALLOW_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 106 | `PYF_OFFSET_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 107 | `PYF_USER_NME` | string | 8 | 0 | NOT A KEY | NULL |
| 108 | `PYF_ACC_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 109 | `PYF_ACC_TME` | string | 4 | 0 | NOT A KEY | NULL |
| 110 | `PYF_AWD_SEQ_NO` | string | 2 | 0 | NOT A KEY | NULL |
| 111 | `PYF_RETRO_TAXES_DONE` | string | 1 | 0 | NOT A KEY | NULL |
| 112 | `PYF_RETRO_RETIREMENT_DONE` | string | 1 | 0 | NOT A KEY | NULL |
| 113 | `PYF_RETRO_OTH_DONE` | string | 1 | 0 | NOT A KEY | NULL |
| 114 | `PYF_FILLER_RT3` | string | 56 | 0 | NOT A KEY | NULL |
| 115 | `PYF_SEC_DISB_OFC_RT3` | string | 6 | 0 | NOT A KEY | NULL |
| 116 | `PYF_DISB_OFC_RT3` | string | 6 | 0 | NOT A KEY | NULL |
| 117 | `PYF_FILLER_2_RT3` | string | 42 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAD_FILE</code> — 158 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PAD_RECORD_HEADER` |  |  |  | — | — |
| 2 | `PAD_RECORD_TYPE` | string | 1 | 0 | NOT A KEY | NULL |
| 3 | `PAD_PAYROLL_OFFICE_ID_CODE` | string | 6 | 0 | NOT A KEY | NULL |
| 4 | `PAD_FILE_ID` | string | 8 | 0 | NOT A KEY | NULL |
| 5 | `PAD_PP_END_DTE` | string | 6 | 0 | NOT A KEY | NULL |
| 6 | `PAD_DISBURSING_DTE` | string | 6 | 0 | NOT A KEY | NULL |
| 7 | `PAD_QTR_END_DTE` | string | 6 | 0 | NOT A KEY | NULL |
| 8 | `PAD_FILLER1` | string | 1367 | 0 | NOT A KEY | NULL |
| 9 | `PAD_RECORD_DETAIL` |  |  |  | — | — |
| 10 | `PAD_SERVING_AGENCY` | string | 2 | 0 | NOT A KEY | NULL |
| 11 | `PAD_CCPO_ID` | string | 2 | 0 | NOT A KEY | NULL |
| 12 | `PAD_SOC_SEC_NO` | string | 9 | 0 | NOT A KEY | NULL |
| 13 | `PAD_RESP_CTR_COST_CTR` | string | 6 | 0 | NOT A KEY | NULL |
| 14 | `PAD_REGULAR_EARNINGS` | number | 9 | 2 | NOT A KEY | NULL |
| 15 | `PAD_OVERTIME_EARNINGS` | number | 9 | 2 | NOT A KEY | NULL |
| 16 | `PAD_HOLIDAY_PREMIUM_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 17 | `PAD_STNDBY_UNCO_AVAIL_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 18 | `PAD_SUNDAY_PREMIUM_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 19 | `PAD_NIGHT_DIFFERENTIAL_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 20 | `PAD_LUMP_SUM_LEAVE_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 21 | `PAD_HAZARDOUS_DUTY_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 22 | `PAD_ENVIRONMENTAL_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 23 | `PAD_AWARD_AMOUNT` | number | 9 | 2 | NOT A KEY | NULL |
| 24 | `PAD_ANNUAL_LVE_ENDING_BALANCE` | number | 7 | 2 | NOT A KEY | NULL |
| 25 | `PAD_SICK_LVE_USED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 26 | `PAD_SICK_LVE_ENDING_BALANCE` | number | 7 | 2 | NOT A KEY | NULL |
| 27 | `PAD_EMPLR_CONTR_FEGLI` | number | 9 | 2 | NOT A KEY | NULL |
| 28 | `PAD_EMPLR_CONTR_FEHBA` | number | 9 | 2 | NOT A KEY | NULL |
| 29 | `PAD_EMPLR_CONTR_CSRS` | number | 9 | 2 | NOT A KEY | NULL |
| 30 | `PAD_EMPLR_CONTR_FERS` | number | 9 | 2 | NOT A KEY | NULL |
| 31 | `PAD_EMPLR_CONTR_TSP_M` | number | 9 | 2 | NOT A KEY | NULL |
| 32 | `PAD_EMPLR_CONTR_TSP_C` | number | 9 | 2 | NOT A KEY | NULL |
| 33 | `PAD_EMPLR_CONTR_TSP_F` | number | 9 | 2 | NOT A KEY | NULL |
| 34 | `PAD_EMPLR_CONTR_FERS_1PERC` | number | 9 | 2 | NOT A KEY | NULL |
| 35 | `PAD_EMPLR_CONTR_MEDIC` | number | 9 | 2 | NOT A KEY | NULL |
| 36 | `PAD_PAY_PERIOD_END_DATE` | string | 6 | 0 | NOT A KEY | NULL |
| 37 | `PAD_NET_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 38 | `PAD_GROSS_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 39 | `PAD_ACTIVITY` | string | 6 | 0 | NOT A KEY | NULL |
| 40 | `PAD_ORGANIZATION` | string | 7 | 0 | NOT A KEY | NULL |
| 41 | `FILLER1` | string | 1 | 0 | NOT A KEY | NULL |
| 42 | `PAD_REGULAR_HOURS` | number | 9 | 2 | NOT A KEY | NULL |
| 43 | `PAD_OVERTIME_HOURS` | number | 9 | 2 | NOT A KEY | NULL |
| 44 | `PAD_NIGHT_DIFF_HOURS` | number | 9 | 2 | NOT A KEY | NULL |
| 45 | `PAD_ENVR_HAZARD_HOURS` | number | 9 | 2 | NOT A KEY | NULL |
| 46 | `PAD_HOLIDAY_PREMIUM_HOURS` | number | 9 | 2 | NOT A KEY | NULL |
| 47 | `PAD_STNBY_UNC_AVAIL_HOURS` | number | 9 | 2 | NOT A KEY | NULL |
| 48 | `PAD_SUNDAY_PREMIUM_HOURS` | number | 9 | 2 | NOT A KEY | NULL |
| 49 | `PAD_ADMIN_LVE_HOURS` | number | 5 | 2 | NOT A KEY | NULL |
| 50 | `PAD_SICK_LEAVE_ACCRUED` | number | 5 | 2 | NOT A KEY | NULL |
| 51 | `PAD_COMP_TIME_EARNED` | number | 5 | 2 | NOT A KEY | NULL |
| 52 | `PAD_COMP_TIME_USED` | number | 5 | 2 | NOT A KEY | NULL |
| 53 | `PAD_COMP_TIME_END_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 54 | `PAD_RELIG_COMP_EARNED` | number | 5 | 2 | NOT A KEY | NULL |
| 55 | `PAD_RELIG_COMP_USED` | number | 5 | 2 | NOT A KEY | NULL |
| 56 | `PAD_RELIG_COMP_END_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 57 | `PAD_CREDIT_HOURS_EARNED` | number | 5 | 2 | NOT A KEY | NULL |
| 58 | `PAD_CREDIT_HOURS_USED` | number | 5 | 2 | NOT A KEY | NULL |
| 59 | `PAD_CREDIT_HOURS_END_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 60 | `FILLER` | string | 10 | 0 | NOT A KEY | NULL |
| 61 | `PAD_COLA` | number | 9 | 2 | NOT A KEY | NULL |
| 62 | `PAD_REEMP_ANN_OFFSET_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 63 | `PAD_RECRUITMENT_INCENT` | number | 9 | 2 | NOT A KEY | NULL |
| 64 | `PAD_INTEREST_AMOUNT` | number | 9 | 2 | NOT A KEY | NULL |
| 65 | `PAD_TROPICAL_DIFF` | number | 9 | 2 | NOT A KEY | NULL |
| 66 | `PAD_BENEFIT_ALLOWANCE` | number | 9 | 2 | NOT A KEY | NULL |
| 67 | `PAD_PHYSICIANS_ALLOWANCE` | number | 9 | 2 | NOT A KEY | NULL |
| 68 | `PAD_REMOTE_SITE_ALLOWANCE` | number | 9 | 2 | NOT A KEY | NULL |
| 69 | `PAD_SEVERANCE_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 70 | `PAD_DANGER_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 71 | `PAD_EXTRACURR_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 72 | `PAD_EXTRA_DUTY_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 73 | `PAD_TRANSFER_ALLOWANCE_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 74 | `PAD_EDUC_TRAV_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 75 | `PAD_TIME_OFF_USED_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 76 | `PAD_TIME_OFF_END_BAL` | number | 9 | 2 | NOT A KEY | NULL |
| 77 | `PAD_AGENCY_CODE` | string | 2 | 0 | NOT A KEY | NULL |
| 78 | `PAD_ACCOUNTING_ACTIVITY` | string | 6 | 0 | NOT A KEY | NULL |
| 79 | `PAD_EMPLOYEE_NAME` | string | 27 | 0 | NOT A KEY | NULL |
| 80 | `PAD_EMPLOYEE_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 81 | `PAD_PAYROLL_OFFICE_ID` | string | 6 | 0 | NOT A KEY | NULL |
| 82 | `PAD_APPROPRIATION` | string | 13 | 0 | NOT A KEY | NULL |
| 83 | `PAD_US_CODE_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 84 | `PAD_ASSIGNED_JON_CC_PC` | string | 18 | 0 | NOT A KEY | NULL |
| 85 | `PAD_FISCAL_YEAR` | string | 1 | 0 | NOT A KEY | NULL |
| 86 | `PAD_PROGRAM_YEAR` | string | 1 | 0 | NOT A KEY | NULL |
| 87 | `PAD_FUND_CODE` | string | 2 | 0 | NOT A KEY | NULL |
| 88 | `PAD_MILITARY_LVE_BAL` | number | 5 | 2 | NOT A KEY | NULL |
| 89 | `PAD_MILITARY_LVE_EARNED_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 90 | `PAD_ANNUAL_LVE_EARNED_PP` | number | 5 | 2 | NOT A KEY | NULL |
| 91 | `PAD_PP_NON_PAY_USED` | number | 5 | 2 | NOT A KEY | NULL |
| 92 | `PAD_PP_ANNUAL_LVE_USED` | number | 5 | 2 | NOT A KEY | NULL |
| 93 | `PAD_ANNUAL_LVE_FORFEIT_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 94 | `PAD_SHORE_LVE_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 95 | `PAD_HOME_LVE_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 96 | `PAD_LAW_ENFORCE_LVE_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 97 | `PAD_DONATED_LVE_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 98 | `PAD_DONATED_LVE_USED` | number | 5 | 2 | NOT A KEY | NULL |
| 99 | `PAD_TIME_OFF_OLDEST_HRS` | number | 7 | 2 | NOT A KEY | NULL |
| 100 | `PAD_TIME_OFF_OLDEST_DATE` | string | 6 | 0 | NOT A KEY | NULL |
| 101 | `PAD_COMP_OLDEST_UNUSED_HRS` | number | 7 | 2 | NOT A KEY | NULL |
| 102 | `PAD_COMP_OLDEST_UNUSED_DATE` | string | 6 | 0 | NOT A KEY | NULL |
| 103 | `PAD_COMP_OLDEST_RATE` | number | 5 | 2 | NOT A KEY | NULL |
| 104 | `PAD_SEPARATION_INCENTIVE` | number | 9 | 2 | NOT A KEY | NULL |
| 105 | `PAD_SUPERVISOR_DIFF_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 106 | `PAD_RECURRING_ALLOWANCES` | number | 9 | 2 | NOT A KEY | NULL |
| 107 | `PAD_ONE_TIME_BONUS` | number | 9 | 2 | NOT A KEY | NULL |
| 108 | `PAD_PP_NAF_RETIREMENT` | number | 9 | 2 | NOT A KEY | NULL |
| 109 | `PAD_PP_401K` | number | 9 | 2 | NOT A KEY | NULL |
| 110 | `PAD_STATE_EMPL_RETIREMENT` | number | 9 | 2 | NOT A KEY | NULL |
| 111 | `PAD_PROGRAM_ELEM_CODE` | string | 10 | 0 | NOT A KEY | NULL |
| 112 | `PAD_FEGLI_BASIC` | number | 9 | 2 | NOT A KEY | NULL |
| 113 | `PAD_FEGLI_OPTIONAL` | number | 12 | 2 | NOT A KEY | NULL |
| 114 | `PAD_FEHB` | number | 9 | 2 | NOT A KEY | NULL |
| 115 | `PAD_CSRS` | number | 9 | 2 | NOT A KEY | NULL |
| 116 | `PAD_FERS` | number | 9 | 2 | NOT A KEY | NULL |
| 117 | `PAD_NON_PAY_HRS_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 118 | `PAD_ANNUAL_LVE_USED_YTD` | number | 7 | 2 | NOT A KEY | NULL |
| 119 | `PAD_SICK_LVE_FERS` | number | 7 | 2 | NOT A KEY | NULL |
| 120 | `PAD_GROSS_PAY_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 121 | `PAD_ADDRESS_STREET_1` | string | 27 | 0 | NOT A KEY | NULL |
| 122 | `PAD_ADDRESS_STREET_2` | string | 27 | 0 | NOT A KEY | NULL |
| 123 | `PAD_ADDRESS_CITY` | string | 13 | 0 | NOT A KEY | NULL |
| 124 | `PAD_ADDRESS_STATE` | string | 2 | 0 | NOT A KEY | NULL |
| 125 | `PAD_ADDRESS_ZIP` | string | 9 | 0 | NOT A KEY | NULL |
| 126 | `PAD_EMPL_ORG_CODE_1` | string | 3 | 0 | NOT A KEY | NULL |
| 127 | `PAD_EMPL_ORG_DEDUCT_AMT_1` | number | 9 | 2 | NOT A KEY | NULL |
| 128 | `PAD_REMARKS_IDC_1` | string | 1 | 0 | NOT A KEY | NULL |
| 129 | `PAD_EMPL_ORG_CODE_2` | string | 3 | 0 | NOT A KEY | NULL |
| 130 | `PAD_EMPL_ORG_DEDUCT_AMT_2` | number | 9 | 2 | NOT A KEY | NULL |
| 131 | `PAD_REMARKS_IDC_2` | string | 1 | 0 | NOT A KEY | NULL |
| 132 | `PAD_EMPL_ORG_CODE_3` | string | 3 | 0 | NOT A KEY | NULL |
| 133 | `PAD_EMPL_ORG_DEDUCT_AMT_3` | number | 9 | 2 | NOT A KEY | NULL |
| 134 | `PAD_REMARKS_IDC_3` | string | 1 | 0 | NOT A KEY | NULL |
| 135 | `PAD_EMPL_ORG_CODE_4` | string | 3 | 0 | NOT A KEY | NULL |
| 136 | `PAD_EMPL_ORG_DEDUCT_AMT_4` | number | 9 | 2 | NOT A KEY | NULL |
| 137 | `PAD_REMARKS_IDC_4` | string | 1 | 0 | NOT A KEY | NULL |
| 138 | `PAD_EMPL_ORG_CODE_5` | string | 3 | 0 | NOT A KEY | NULL |
| 139 | `PAD_EMPL_ORG_DEDUCT_AMT_5` | number | 9 | 2 | NOT A KEY | NULL |
| 140 | `PAD_REMARKS_IDC_5` | string | 1 | 0 | NOT A KEY | NULL |
| 141 | `PAD_EMPL_ORG_CODE_6` | string | 3 | 0 | NOT A KEY | NULL |
| 142 | `PAD_EMPL_ORG_DEDUCT_AMT_6` | number | 9 | 2 | NOT A KEY | NULL |
| 143 | `PAD_REMARKS_IDC_6` | string | 1 | 0 | NOT A KEY | NULL |
| 144 | `PAD_MILITARY_LVE_USED_YTD` | number | 5 | 2 | NOT A KEY | NULL |
| 145 | `PAD_MMD_DDS_SPEC_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 146 | `PAD_RECRUIT_INCENTIVE_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 147 | `PAD_RELOCAT_INCENTIVE_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 148 | `PAD_RETENTN_INCENTIVE_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 149 | `PAD_COMPTIME_TRAVEL_EARNED` | number | 5 | 2 | NOT A KEY | NULL |
| 150 | `PAD_COMPTIME_TRAVEL_USED` | number | 5 | 2 | NOT A KEY | NULL |
| 151 | `PAD_COMPTIME_TRAVEL_BALANCE` | number | 7 | 2 | NOT A KEY | NULL |
| 152 | `PAD_BRAC_RESTORED_BEGBAL` | number | 6 | 2 | NOT A KEY | NULL |
| 153 | `PAD_BRAC_RESTORED_ADDED_YTD` | number | 6 | 2 | NOT A KEY | NULL |
| 154 | `PAD_BRAC_RESTORED_USED_PAYPD` | number | 5 | 2 | NOT A KEY | NULL |
| 155 | `PAD_BRAC_RESTORED_USED_YTD` | number | 6 | 2 | NOT A KEY | NULL |
| 156 | `PAD_BRAC_RESTORED_PAID_YTD` | number | 6 | 2 | NOT A KEY | NULL |
| 157 | `PAD_BRAC_RESTORED_ENDBAL` | number | 6 | 2 | NOT A KEY | NULL |
| 158 | `PAD_FILLER` | string | 197 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_TYPE_3_TBL</code> — 242 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PYF_PAY_TAC_TYP_LINE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 5 | `PYF_PAY_TAC_TYP` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 6 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 8 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 9 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 10 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 11 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 14 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 17 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 18 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 19 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 20 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 21 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 22 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 23 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 24 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 25 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 26 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 28 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 29 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 30 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 31 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 32 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 33 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 34 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 36 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 37 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 38 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 39 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 40 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 41 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 42 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 43 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 44 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 45 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 46 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 47 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 48 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 49 | `REEMPLED` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 50 | `HRLY_RATE_UA` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 51 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 53 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 54 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 55 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 56 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 57 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 59 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 60 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 61 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 62 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 63 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 65 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 66 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 67 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 68 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 69 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 70 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 71 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 72 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 73 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 74 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 75 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 76 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 77 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 78 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 79 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 80 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 81 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 82 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 84 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 85 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 86 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 87 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 88 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 89 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 90 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 91 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 92 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 93 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 94 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 95 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 96 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 97 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 98 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 99 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 100 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 101 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 102 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 103 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 104 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 106 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 107 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 108 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 109 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 110 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 111 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 112 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 113 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 114 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 115 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 116 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 117 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 118 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 119 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 120 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 121 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 122 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 123 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 124 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 125 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 126 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 131 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 132 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 133 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 136 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 138 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 139 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 143 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 144 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 147 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 149 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 150 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 151 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 152 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 153 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 156 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 158 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 161 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 164 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 167 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 169 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 170 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 172 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 173 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 174 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 177 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 178 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 179 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 180 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 181 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 182 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 184 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 187 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 188 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 195 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 196 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 197 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 198 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 199 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 200 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 202 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 203 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 205 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 206 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 207 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 208 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 209 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 211 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 215 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 218 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 219 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 220 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 221 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 222 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 223 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 224 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 225 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 229 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 230 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 231 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 233 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 235 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 237 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 238 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 239 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 240 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 241 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 242 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_GENERIC_SRC_TBL</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number(p,s) | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_TYPE_1_2_TBL</code> — 262 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `FIR_NAME_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 5 | `CODE_CONSL` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `FIR_NAME_3_11` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 7 | `MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 8 | `SURNAME_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 9 | `SURNAME_OTHER` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 10 | `SOC_SEC_NO` | number(p,s) | 11 | 0 | NOT A KEY | NULL |
| 11 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 12 | `OCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 13 | `JOB_LOC_CDE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 14 | `ST_CONT_LOC` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 15 | `CITY_LOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 16 | `CTY_CTRY_LOC` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 17 | `TK_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 18 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 19 | `CAN_FY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 20 | `CAN_AGCY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `CAN_AP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 22 | `CAN_AGCY_ACCT_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 23 | `ORG_CDE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 24 | `ORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `ORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `ORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `ORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `ORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `ORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `ORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `SPOC` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 36 | `SEX_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 37 | `VET_PREF_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `TENURE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `EHRP_EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 40 | `EHRP_EMP_REC_NO` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 41 | `PERM_TEMP_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `FT_PT_INTER_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `CITIZEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 44 | `TYPE_APPT_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `EOD_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 46 | `PHY_HNDCP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 47 | `CEILING_EN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 48 | `FUNC_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 49 | `SUPV_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 50 | `PAY_BASIS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 51 | `POS_SEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `CAR_SERV_DTE` | number(p,s) | 16 | 0 | NOT A KEY | NULL |
| 53 | `PROB_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 54 | `SPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 55 | `ABNOR_RATE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 56 | `FED_RETIRE_CDE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `TSPA_STATUS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `TSPA_VEST_PERIOD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 59 | `EFT_EMPL_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 60 | `EFT_EMPL_ACCT_NUMBER` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 61 | `FS_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 62 | `TSPA_STATUS_CODE_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `TSPA_SCD` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `OT_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 65 | `LOCAL_PCENT_RATE` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 66 | `CPP_LOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 67 | `AGCY_CDE_PER` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 68 | `SEP_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 69 | `SEP_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 70 | `PERS_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 71 | `ANNUAL_SAL` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 72 | `FLSA_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 73 | `CPP_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 74 | `DATE_BIRTH` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 75 | `EFT_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 76 | `EFT_CK_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 77 | `EFT_ROUT_CK_ID` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 78 | `POSITION_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 79 | `POSITION_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 81 | `STEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 82 | `FEGLI_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `FEGLI_CDE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `TOT_FED_TAX_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 85 | `FED_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 86 | `HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 87 | `SEV_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 88 | `HLTH_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 89 | `HLTH_GOVT_SHARE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 90 | `UNION_IDENT_CDE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 91 | `UNION_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 92 | `PCA_BIWEEK_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 93 | `AN_LV_EARNED_CPP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 94 | `SICK_LV_ERN_CPP` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 95 | `COMP_LV_ERN_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 96 | `COMP_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 97 | `ADMIN_LV_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 98 | `LWOP_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 99 | `STAFFING_BIW_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 100 | `INCENT_TIME_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `PSP_BIWKLY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 102 | `REL_COMP_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 103 | `REL_COMP_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 104 | `CR_HRS_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 105 | `CR_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 106 | `FERS_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 107 | `AN_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 108 | `SICK_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 109 | `LV_CAT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 110 | `AN_LV_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 111 | `AN_LV_ERND_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 112 | `AN_LV_ADV_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 113 | `AN_LV_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 114 | `AN_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 115 | `AN_LV_MAX_COVER` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 116 | `AN_LV_USE_LOSE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 117 | `SICK_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 118 | `SICK_LV_ERN_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 119 | `SICK_LV_AD_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 120 | `SICK_LV_USD_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 121 | `SICK_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 122 | `COMP_LV_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 123 | `RESTOR_AL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 124 | `RESTOR_AL_BAL_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 125 | `RESTOR_AL_BAL_2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 126 | `RESTOR_AL_BAL_3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `PSI_START_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 128 | `REL_COMP_CURR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 129 | `CR_HRS_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 130 | `TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 131 | `TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 132 | `TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 133 | `TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `TVL_COMP_FORFEITED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `YTD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 136 | `YTD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `YTD_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `YTD_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 139 | `YTD_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `YTD_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `YTD_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `YTD_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `YTD_SEV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 144 | `YTD_CASH_AWARDS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `YTD_MP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `YTD_LSL_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 147 | `YTD_MISC_OTH_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 148 | `YTD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 149 | `YTD_NON_TAX_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 150 | `YTD_FED_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 151 | `YTD_TAXABLE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 152 | `YTD_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 153 | `YTD_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `YTD_CSR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `YTD_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `YTD_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `YTD_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 158 | `YTD_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `YTD_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `YTD_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 161 | `YTD_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `YTD_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `YTD_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 164 | `YTD_LEVY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 166 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 167 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 169 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 170 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 171 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 172 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 173 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 174 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 175 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 176 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 177 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 178 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 179 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 180 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 181 | `YTD_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 182 | `YTD_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `YTD_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 184 | `YTD_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `YTD_LI_REG_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `YTD_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `YTD_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `YTD_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `YTD_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `YTD_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `YTD_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `YTD_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `YTD_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `YTD_LAUNDRY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `YTD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 196 | `YTD_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `EIC_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `PCA_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 199 | `YTD_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 200 | `YTD_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `YTD_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `YTD_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 203 | `YTD_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `YTD_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `YTD_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 206 | `YTD_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `T38_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 208 | `T38_HOL_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 209 | `T38_ND_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 210 | `T38_ONCALL_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 211 | `T38_SAT_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `T38_SUN_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `YTD_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `YTD_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 215 | `YTD_PSP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `RET_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `YTD_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `YTD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `YTD_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `YTD_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 221 | `YTD_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 222 | `YTD_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 223 | `YTD_CHILD_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 224 | `REL_COMP_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 225 | `CR_HRS_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `YTD_PREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `YTD_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `YTD_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `YTD_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `VIS_DENT_1_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `VIS_DENT_2_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `VIS_DENT_3_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `TRANSFER_IN_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 234 | `TRANSFER_IN_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `FEHB_PC_PRE_TAX_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 236 | `ADMIN_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 237 | `MILITARY_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 238 | `LWOP_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 239 | `RESTOR_AL_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 240 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 241 | `OC_121S_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 242 | `OC_1211_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 243 | `OC_1111_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 244 | `WORK_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 245 | `WORK_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 246 | `WORK_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 247 | `WORK_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 248 | `WORK_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 249 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 250 | `FED_RETIRE_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 251 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 252 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 253 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 254 | `COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 255 | `COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 256 | `COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 257 | `COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `OT_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `REL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `REL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 261 | `REL_COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 262 | `REL_COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PM3_STG_TBL</code> — 40 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PYF_REC_NO_PDT3` | varchar2 | 1 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PYF_EYE_ID_PDT3` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_GEN_SEQ_ID` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `PYF_PAY_BLK_PDT3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 7 | `PYF_PAY_TAC_TYP` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 8 | `PYF_DATE_EFF` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 9 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 10 | `PYF_OT_ENV_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `PYF_HRS_SCD_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `PYF_ACTUAL_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 13 | `PYF_PAY_RAT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 14 | `PYF_CASH_PMT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `PYF_ADJ_RSN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `PYF_ADJ_DATE_EFF` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 17 | `PYF_ADJ_SYS_GEN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 18 | `PYF_RSN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 19 | `PFY_ID_BREAK_SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 20 | `PFY_ID_BREAK_CODE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 21 | `PFY_FILLER` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 22 | `PYF_DDU_PYE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 23 | `PYF_ITW_MS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `PYF_ITW_XMP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 25 | `PYF_ITW_ADD` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 26 | `PYF_ALLOW_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `PYF_OFFSET_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `PYF_USER_NME` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 29 | `PYF_ACC_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 30 | `PYF_ACC_TME` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 31 | `PYF_AWD_SEQ_NO` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 32 | `PYF_RETRO_TAXES_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `PYF_RETRO_RETIREMENT_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `PYF_RETRO_OTH_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `PYF_FILLER_PDT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `PYF_FILLER_RT3` | varchar2 | 55 | 0 | NOT A KEY | NULL |
| 37 | `PYF_SEC_DISB_OFC_RT3` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 38 | `PYF_HIS_PGRANGE_RT3` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 39 | `PYF_DISB_OFC_RT3` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 40 | `PYF_MPH_PGRANGE_RT3` | number(p,s) | 8 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_TYPE_3_FDR_TBL</code> — 246 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LINE_TYPE` | varchar2 | 5 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_PAY_TAC_TYP` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 6 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 8 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 9 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 10 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 11 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 14 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `CPP_HLTH_EMPLR_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 16 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 18 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 19 | `CPP_DCS_DEBT_AMT_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 20 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 21 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 22 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 23 | `CPP_OTHER_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 24 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 25 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 26 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 27 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 28 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 29 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 31 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 32 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 33 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 34 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 35 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 36 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 37 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 39 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 40 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 41 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 42 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 43 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 44 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 45 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 46 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 47 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 48 | `CPP_BASE_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 49 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 50 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 51 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 52 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 53 | `REEMPLED` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 54 | `HRLY_RATE_UA` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 55 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 56 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 57 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 58 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 59 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 60 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 61 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 62 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 64 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 65 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 66 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 67 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 68 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 69 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 70 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 71 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 72 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 73 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 74 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 75 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 76 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 77 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 78 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 79 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 80 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 81 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 82 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 83 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 84 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 85 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 86 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 87 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 88 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 89 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 90 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 91 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 92 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 93 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 94 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 95 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 96 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 97 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 98 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 99 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 100 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 102 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 103 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 104 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 106 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 107 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 108 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 109 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 110 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 111 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 112 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 113 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 114 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 115 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 116 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 117 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 118 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 119 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 120 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 121 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 122 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 123 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 124 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 125 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 126 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 131 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 132 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 133 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 135 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 136 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 137 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 139 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 142 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 147 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 148 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 151 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 152 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 153 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 154 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 155 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 158 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 159 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 160 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 161 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 164 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 167 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 169 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 170 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 172 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 173 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 174 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 176 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 177 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 178 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 181 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 182 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 183 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 184 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 185 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 186 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 191 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 192 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 199 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 200 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 201 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 202 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 203 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 206 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 207 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 209 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 210 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 211 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 212 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 213 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 214 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 215 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 218 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 221 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 222 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 223 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 224 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 225 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 228 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 233 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 235 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 237 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 239 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 240 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 241 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 242 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 243 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 244 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 245 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 246 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

### CPM_AFPS

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `CPM_NEWPAY_TBL` | Oracle | INFO_TARGET_DEV | 501 |
| `HI_GENERIC_SRC_TBL` | Oracle | INFO_TARGET_DEV | 1 |
| `ERROR_TBL` | Oracle | INFO_TARGET_DEV | 8 |
| `CPM_CYCLE_TBL` | Oracle | INFO_TARGET_DEV | 5 |
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |
| `HI_AFPS_FEEDER_TBL` | Oracle | INFO_TARGET_DEV | 283 |
| `HI_GROSS_EXP_TBL` | Oracle | INFO_TARGET_DEV | 12 |
| `CPM_PM3_STG_TBL` | Oracle | INFO_TARGET_DEV | 40 |

<details><summary><code>CPM_NEWPAY_TBL</code> — 501 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LINE_TYPE` | varchar2 | 5 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `FIR_NAME_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `CODE_CONSL` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `FIR_NAME_3_11` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 8 | `MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `SURNAME_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 10 | `SURNAME_OTHER` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 11 | `SOC_SEC_NO` | number(p,s) | 11 | 0 | NOT A KEY | NULL |
| 12 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 13 | `OCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 14 | `JOB_LOC_CDE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 15 | `ST_CONT_LOC` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `CITY_LOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 17 | `CTY_CTRY_LOC` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 18 | `TK_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 19 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 20 | `CAN_FY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `CAN_AGCY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `CAN_AP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `CAN_AGCY_ACCT_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 24 | `ORG_CDE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 25 | `ORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `ORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `ORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `ORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `ORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `ORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `ORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `SPOC` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 37 | `SEX_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `VET_PREF_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `TENURE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 40 | `EHRP_EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 41 | `EHRP_EMP_REC_NO` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `PERM_TEMP_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `FT_PT_INTER_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 44 | `CITIZEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `TYPE_APPT_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `EOD_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 47 | `PHY_HNDCP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 48 | `CEILING_EN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 49 | `FUNC_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 50 | `SUPV_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 51 | `PAY_BASIS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `POS_SEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 53 | `CAR_SERV_DTE` | number(p,s) | 16 | 0 | NOT A KEY | NULL |
| 54 | `PROB_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 55 | `SPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 56 | `ABNOR_RATE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `FED_RETIRE_CDE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `TSPA_STATUS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 59 | `TSPA_VEST_PERIOD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 60 | `EFT_EMPL_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 61 | `EFT_EMPL_ACCT_NUMBER` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 62 | `FS_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `TSPA_STATUS_CODE_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `TSPA_SCD` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 65 | `OT_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 66 | `LOCAL_PCENT_RATE` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 67 | `CPP_LOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `AGCY_CDE_PER` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 69 | `SEP_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 70 | `SEP_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 71 | `PERS_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 72 | `ANNUAL_SAL` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 73 | `FLSA_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 74 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 75 | `CPP_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 76 | `DATE_BIRTH` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 77 | `EFT_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 78 | `EFT_CK_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 79 | `POSITION_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `POSITION_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 81 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 82 | `STEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `FEGLI_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `FEGLI_CDE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 85 | `TOT_FED_TAX_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 86 | `FED_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 87 | `HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 88 | `SEV_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `HLTH_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 90 | `HLTH_GOVT_SHARE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 91 | `UNION_IDENT_CDE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 92 | `UNION_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 93 | `PCA_BIWEEK_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 94 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 95 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 96 | `AN_LV_EARNED_CPP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 97 | `SICK_LV_ERN_CPP` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 98 | `COMP_LV_ERN_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 99 | `COMP_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 100 | `ADMIN_LV_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `LWOP_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 102 | `STAFFING_BIW_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 103 | `INCENT_TIME_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 104 | `PSP_BIWKLY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `REL_COMP_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 106 | `REL_COMP_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 107 | `CR_HRS_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 108 | `CR_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 109 | `FERS_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 110 | `AN_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 111 | `SICK_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 112 | `LV_CAT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 113 | `AN_LV_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 114 | `AN_LV_ERND_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 115 | `AN_LV_ADV_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 116 | `AN_LV_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 117 | `AN_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 118 | `AN_LV_MAX_COVER` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 119 | `AN_LV_USE_LOSE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 120 | `SICK_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 121 | `SICK_LV_ERN_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 122 | `SICK_LV_AD_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 123 | `SICK_LV_USD_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 124 | `SICK_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 125 | `COMP_LV_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 126 | `RESTOR_AL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `RESTOR_AL_BAL_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `RESTOR_AL_BAL_2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `RESTOR_AL_BAL_3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `PSI_START_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 131 | `REL_COMP_CURR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 132 | `CR_HRS_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 133 | `TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 136 | `TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `TVL_COMP_FORFEITED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `YTD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 139 | `YTD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `YTD_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `YTD_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `YTD_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `YTD_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `YTD_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `YTD_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `YTD_SEV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 147 | `YTD_CASH_AWARDS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `YTD_MP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `YTD_LSL_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `YTD_MISC_OTH_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 151 | `YTD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 152 | `YTD_NON_TAX_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 153 | `YTD_FED_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `YTD_TAXABLE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `YTD_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `YTD_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `YTD_CSR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 158 | `YTD_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `YTD_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `YTD_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 161 | `YTD_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `YTD_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `YTD_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 164 | `YTD_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `YTD_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `YTD_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 167 | `YTD_LEVY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 169 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 170 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 172 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 173 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 174 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 177 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 178 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 181 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 182 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 184 | `YTD_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `YTD_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `YTD_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `YTD_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `YTD_LI_REG_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `YTD_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `YTD_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `YTD_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `YTD_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `YTD_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `YTD_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `YTD_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `YTD_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `YTD_LAUNDRY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `YTD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 199 | `YTD_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 200 | `EIC_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `PCA_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `YTD_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 203 | `YTD_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `YTD_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `YTD_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 206 | `YTD_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `YTD_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `YTD_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 209 | `YTD_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `T38_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 211 | `T38_HOL_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `T38_ND_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `T38_ONCALL_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `T38_SAT_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 215 | `T38_SUN_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `YTD_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `YTD_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `YTD_PSP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `RET_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `YTD_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 221 | `YTD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 222 | `YTD_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 223 | `YTD_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 224 | `YTD_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 225 | `YTD_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `YTD_CHILD_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `REL_COMP_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `CR_HRS_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `YTD_PREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `YTD_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `YTD_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `YTD_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `VIS_DENT_1_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_2_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `VIS_DENT_3_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `TRANSFER_IN_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 237 | `TRANSFER_IN_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `FEHB_PC_PRE_TAX_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 239 | `ADMIN_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 240 | `MILITARY_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 241 | `LWOP_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 242 | `RESTOR_AL_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 243 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 244 | `OC_121S_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 245 | `OC_1211_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 246 | `OC_1111_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 247 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 248 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 249 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 250 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 251 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 252 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 253 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 254 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 255 | `CPP_HLTH_EMPLR_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 256 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 257 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `CPP_DCS_DEBT_AMT_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 261 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 262 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 263 | `CPP_OTHER_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 264 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 265 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 266 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 267 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 268 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 269 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 270 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 271 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 272 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 273 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 274 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 275 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 276 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 277 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 278 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 279 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 280 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 281 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 282 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 283 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 284 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 285 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 286 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 287 | `CPP_BASE_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 288 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 289 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 290 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 291 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 292 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 293 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 294 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 295 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 296 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 297 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 298 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 299 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 300 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 301 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 302 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 303 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 304 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 305 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 306 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 307 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 308 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 309 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 310 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 311 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 312 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 313 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 314 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 315 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 316 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 317 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 318 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 319 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 320 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 321 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 322 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 323 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 324 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 325 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 326 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 327 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 328 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 329 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 330 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 331 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 332 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 333 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 334 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 335 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 336 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 337 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 338 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 339 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 340 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 341 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 342 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 343 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 344 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 345 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 346 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 347 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 348 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 349 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 350 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 351 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 352 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 353 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 354 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 355 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 356 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 357 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 358 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 359 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 360 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 361 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 362 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 363 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 364 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 365 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 366 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 367 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 368 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 369 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 370 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 371 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 372 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 373 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 374 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 375 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 376 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 377 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 378 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 379 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 380 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 381 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 382 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 383 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 384 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 385 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 386 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 387 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 388 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 389 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 390 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 391 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 392 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 393 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 394 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 395 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 396 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 397 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 398 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 399 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 400 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 401 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 402 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 403 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 404 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 405 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 406 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 407 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 408 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 409 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 410 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 411 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 412 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 413 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 414 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 415 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 416 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 417 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 418 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 419 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 420 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 421 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 422 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 423 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 424 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 425 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 426 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 427 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 428 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 429 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 430 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 431 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 432 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 433 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 434 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 435 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 436 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 437 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 438 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 439 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 440 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 441 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 442 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 443 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 444 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 445 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 446 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 447 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 448 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 449 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 450 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 451 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 452 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 453 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 454 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 455 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 456 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 457 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 458 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 459 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 460 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 461 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 462 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 463 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 464 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 465 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 466 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 467 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 468 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 469 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 470 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 471 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 472 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 473 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 474 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 475 | `WORK_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 476 | `WORK_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 477 | `WORK_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 478 | `WORK_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 479 | `WORK_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 480 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 481 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 482 | `FED_RETIRE_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 483 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 484 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 485 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 486 | `COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 487 | `COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 488 | `COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 489 | `COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 490 | `OT_EARN_YTD_DOLL_VALUE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 491 | `REL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 492 | `REL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 493 | `REL_COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 494 | `REL_COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 495 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 496 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 497 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 498 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 499 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 500 | `DON_LV_HRS_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 501 | `DON_LV_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_GENERIC_SRC_TBL</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number(p,s) | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>ERROR_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 8 | `ERROR_CODE` | varchar2 | 50 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_CYCLE_TBL</code> — 5 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 30 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 3 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_AFPS_FEEDER_TBL</code> — 283 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FFEEDER_SORT` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 2 | `FPAYROLL_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 3 | `FPAY_PERIOD_CODE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 4 | `FFISCAL_YEAR` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 5 | `FAGY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `FACCT_PT` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `FSERIAL` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 8 | `FINVALID_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `FSOC_SEC_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 10 | `FTIME_KEEPER_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 11 | `FFIRST_INT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `FMIDDLE_INT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `FLST` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 14 | `FLST_FILL` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 15 | `FPP1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `FPP2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `FGRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `FSTEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 19 | `FHOURLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 20 | `FPERM_TEMP_POS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `FPART_FULL_TIME_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `FSTATE_TAX_CODE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `FFED_TAX_CODE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 24 | `FSEPARATION_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `FBASE_HOURS_TOUR` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 26 | `FFEHBA_CODE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 27 | `FFEGLI_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `FORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `FORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `FORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `FORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `FORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `FORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `FORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `FORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `FORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 37 | `FORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `FORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `FAPPROPRIATION_CODE` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 40 | `FENT_ON_DUTY_DATE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 41 | `FFED_SER_ENT_DATE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 42 | `FPER_STP_INC_DATE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 43 | `FLWOP_HOURS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 44 | `FAWOL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 45 | `FAPPOINT_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `FSEP_DATE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 47 | `FPAY_ADJ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 48 | `FNON_TAXABLE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 49 | `FST_EXEMPS` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 50 | `FP123` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 51 | `FSPOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 52 | `FHOME_FY` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 53 | `FHOME_CAN` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 54 | `FANN_HRS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 55 | `FSICK_HRS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 56 | `FCOMP_HRS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 57 | `FANN_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 58 | `FSICK_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 59 | `FCOMP_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 60 | `FANN_HRS_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 61 | `FSICK_HRS_BALAN` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 62 | `FCOMP_HRS_BALAN` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 63 | `FANN_LV_FORF_CURR_PP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 64 | `FCOMP_FORF_CURR_PP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 65 | `FMILITARY_LEAVE_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 66 | `FCOURT_LEAVE_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 67 | `FOTHER_LEAVE_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 68 | `FLEAVE_CEILING` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 69 | `FLEAVE_CATEGORY` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 70 | `FHOLIDAY_LEAVE_HRS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 71 | `FBASE_HOURS_WORKED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 72 | `FBASE_PAY_AMOUNT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 73 | `FOT_HOURS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 74 | `FOLD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 75 | `FND_HOURS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 76 | `FND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 77 | `FHOL_PREM_HRS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 78 | `FHOL_PREM_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 79 | `FSUN_HOURS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 80 | `FSUN_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 81 | `FLSLP_HOURS` | number(p,s) | 5 | 1 | NOT A KEY | NULL |
| 82 | `FLSLP_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 83 | `FICENT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 84 | `FPOST_DIFF_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 85 | `FCITY_TAX` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 86 | `FSEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 87 | `FEMPL_AWDS_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 88 | `FUNIF_ALLOW_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `FCOLA_ALLOW_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 90 | `FYOC_ADVANCE_REPAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 91 | `FOTHER_BEN_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 92 | `FOTHER_PAY_AB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 93 | `FTRAINEE_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 94 | `FNET_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 95 | `FFEDERAL_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 96 | `FOPT_FED_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 97 | `FSTATE_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 98 | `FFEGLI_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 99 | `FOPT_FEGLI_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 100 | `FBOND_PURCH_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 101 | `FBOND_BALAN_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 102 | `FBOND_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 103 | `FFICA_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 104 | `FCSRA_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `FUNION_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 106 | `FCHARITY_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 107 | `FFEHBA_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 108 | `FLEVY_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 109 | `FQTRS_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 110 | `FSUBST_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 111 | `FLAUNDRY_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 112 | `FREFUND_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 113 | `FOTHER_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 114 | `FALLOTMENT1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 115 | `FALLOTMENT2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 116 | `FNET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 117 | `FCSRA_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 118 | `FFICA_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 119 | `FFEGLI_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 120 | `FFEHBA_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 121 | `FGROSS_EXPEND` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 122 | `FNET_EXPEND` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 123 | `FOTH_NONTAX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 124 | `FOTH_TAXABLE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 125 | `FJOB_LOC` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 126 | `FCITY_CODE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 127 | `FAPPT_CODE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 128 | `FEARNED_INCOME_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `FOT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `FPCA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 131 | `FANNUITY_GROSS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 132 | `FMERIT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 133 | `FSES_CASH_AWD_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 134 | `FANNUITY_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 135 | `FTENURE_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 136 | `FNATURE_OF_ACTION` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 137 | `FCEILING_ID` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 138 | `FMEDICARE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 139 | `FMILITARY_COLA` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `FGROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 141 | `FRETIREMENT_CODE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 142 | `FSUBOBJ_GM_BONUSES` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `FFERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `FFERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `FTSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `FTSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 147 | `FTSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `FTSPG_UND_DED_EMP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `FTSPG_UND_DED_GVT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `FTSPG_PRADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 151 | `FLTC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 152 | `FFSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 153 | `FFSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `FTSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 155 | `FTSPF_UND_DED_EMP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `FTSPF_UND_DED_GVT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `FTSPC_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 158 | `FTSPC_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `FTSPC_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `FTSPC_PRADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 161 | `FTSPC_UND_DED_EMP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `FTSPC_UND_DED_GVT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `FTRVL_SAV_AWD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 164 | `FEFT_ROUTE_ID` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 165 | `FEFT_EMP_ACCT_NUM` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 166 | `FEFT_EMP_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 167 | `FADRS_1` | varchar2 | 25 | 0 | NOT A KEY | NULL |
| 168 | `FADRS_2` | varchar2 | 25 | 0 | NOT A KEY | NULL |
| 169 | `FADRS_3` | varchar2 | 25 | 0 | NOT A KEY | NULL |
| 170 | `FADRS_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 171 | `FADMIN_UNC_OT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 172 | `FFEGLI_OPTA` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 173 | `FFEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 174 | `FFEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `FALLOTMENT4` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 176 | `FLOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 177 | `FLOAN_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 178 | `FLOAN_OWED_TO_AGENCY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `FPAY_SUB_CSRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `FPAY_SUB_FERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 181 | `FCOUNTY_TAX` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 182 | `FCOUNTY_TAX_CDE` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 183 | `FCITY_OP_TAX` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 184 | `FCITY_OP_TAX_CDE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 185 | `FSTAND_BY_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `FSTAND_BY_PAY_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 187 | `FADJ_ST_TAX_CD1` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 188 | `FADJ_ST_TAX_DD1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `FADJ_ST_TAX_CD2` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 190 | `FADJ_ST_TAX_DD2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `FADJ_ST_TAX_CD3` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 192 | `FADJ_ST_TAX_DD3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `FADJ_ST_TAX_CD4` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 194 | `FADJ_ST_TAX_DD4` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `FREFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 196 | `FCSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `FINSTPDAGCY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `FUNION_CODE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 199 | `FCHARITY_CODE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 200 | `FCONTROL_NO` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 201 | `FLOCAL_DIFF_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `FMEDC_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 203 | `FPAY_SUB_FEDTAX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 204 | `FPAY_SUB_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 205 | `FPAY_SUB_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 206 | `FRECRUITBONUS_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `FRELOCBONUS_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `FRETENTALLOW_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 209 | `FSTAFFINGDIFF` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `FSUPVSRDIFF` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 211 | `FSP_PROG` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 212 | `FBAYLR_REG_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 213 | `FBAYLR_BASE_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 214 | `FON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 215 | `FON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 216 | `FNON_BAYLR_REG_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 217 | `FNON_BAYLR_BASE_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `FNON_BAYLR_BASE_HRLY_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 219 | `FT38_PREM_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 220 | `FT38_REG_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 221 | `FT38_BASE_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 222 | `FT38_OT_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 223 | `FT38_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 224 | `FT38_HOL_OT_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 225 | `FT38_HOL_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `FT38_ND_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 227 | `FT38_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `FT38_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 229 | `FT38_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `FT38_SAT_DIF_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 231 | `FT38_SAT_DIF_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `FT38_SUN_DIF_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 233 | `FT38_SUN_DIF_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `FMTOLDFUNDTAX` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `FADJCNTY_DED_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `FADJCNTY_CDE_1` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 237 | `FSEP_INCENT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `FADMIN_FEE_PCENT` | number(p,s) | 2 | 2 | NOT A KEY | NULL |
| 239 | `FANNUAL_SALARY` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 240 | `FNATL_UNION_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 241 | `FNATL_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 242 | `FCONTROL_NO_B` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 243 | `FDCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 244 | `FDCS_ADMIN_REFUND_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 245 | `FDCS_REFUND_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 246 | `FPSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 247 | `FFBPARKING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 248 | `FLSLP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 249 | `FSPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 250 | `FNO_CHARGE_NET` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 251 | `FFEGLI_CODE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 252 | `FOCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 253 | `FRECRUITBONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 254 | `FRELOCBONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 255 | `FRETENTALLOW` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 256 | `FTEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 257 | `FTEA_EMPLR_TV_CONTR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `FTEA_EMPLR_PK_CONTR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `FTEA_CASH_OUT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `FCHILD_SUP_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 261 | `FSUSP_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 262 | `FFURLO_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 263 | `FREL_COMP_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 264 | `FREL_COMP_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 265 | `FREL_COMP_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 266 | `FREL_COMP_LS_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 267 | `FCR_HRS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 268 | `FCR_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 269 | `FCR_HRS_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 270 | `FCR_HRS_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 271 | `FCR_HRS_LS_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 272 | `FPREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 273 | `FLOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 274 | `FILLER_1` | varchar2 | 134 | 0 | NOT A KEY | NULL |
| 275 | `FPSEUDO_SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 276 | `FOBJ_CLASS_1217` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 277 | `FOBJ_CLASS_121S` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 278 | `FOBJ_CLASS_1211` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 279 | `FOBJ_CLASS_1111` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 280 | `FILLER0` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 281 | `FED_RETIRE_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 282 | `FED_RETIRE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 283 | `FEMPLOYEE_ID` | varchar2 | 11 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_GROSS_EXP_TBL</code> — 12 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 3 | `EMPL_ID` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 4 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 5 | `TK_NO` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 6 | `CHECK_TOT_ADD` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 7 | `CHECK_TOT_SUBTRACT` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 8 | `TEST_NET` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 9 | `FEARNED_INCOME_PAY` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 10 | `TEST_NET_TOT` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 11 | `FNET_PAY` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 12 | `DIFF` | number(p,s) | 11 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PM3_STG_TBL</code> — 40 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PYF_REC_NO_PDT3` | varchar2 | 1 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PYF_EYE_ID_PDT3` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_GEN_SEQ_ID` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `PYF_PAY_BLK_PDT3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 7 | `PYF_PAY_TAC_TYP` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 8 | `PYF_DATE_EFF` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 9 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 10 | `PYF_OT_ENV_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `PYF_HRS_SCD_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `PYF_ACTUAL_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 13 | `PYF_PAY_RAT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 14 | `PYF_CASH_PMT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `PYF_ADJ_RSN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `PYF_ADJ_DATE_EFF` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 17 | `PYF_ADJ_SYS_GEN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 18 | `PYF_RSN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 19 | `PFY_ID_BREAK_SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 20 | `PFY_ID_BREAK_CODE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 21 | `PFY_FILLER` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 22 | `PYF_DDU_PYE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 23 | `PYF_ITW_MS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `PYF_ITW_XMP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 25 | `PYF_ITW_ADD` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 26 | `PYF_ALLOW_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `PYF_OFFSET_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `PYF_USER_NME` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 29 | `PYF_ACC_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 30 | `PYF_ACC_TME` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 31 | `PYF_AWD_SEQ_NO` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 32 | `PYF_RETRO_TAXES_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `PYF_RETRO_RETIREMENT_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `PYF_RETRO_OTH_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `PYF_FILLER_PDT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `PYF_FILLER_RT3` | varchar2 | 55 | 0 | NOT A KEY | NULL |
| 37 | `PYF_SEC_DISB_OFC_RT3` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 38 | `PYF_HIS_PGRANGE_RT3` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 39 | `PYF_DISB_OFC_RT3` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 40 | `PYF_MPH_PGRANGE_RT3` | number(p,s) | 8 | 0 | NOT A KEY | NULL |

</details>

### CPM_CDC

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `HI_GENERIC_SRC_TBL` | Oracle | INFO_TARGET_DEV | 1 |
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |
| `CPM_NEWPAY_TBL` | Oracle | INFO_TARGET_DEV | 501 |

<details><summary><code>HI_GENERIC_SRC_TBL</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number(p,s) | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_TBL</code> — 501 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LINE_TYPE` | varchar2 | 5 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `FIR_NAME_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `CODE_CONSL` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `FIR_NAME_3_11` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 8 | `MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `SURNAME_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 10 | `SURNAME_OTHER` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 11 | `SOC_SEC_NO` | number(p,s) | 11 | 0 | NOT A KEY | NULL |
| 12 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 13 | `OCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 14 | `JOB_LOC_CDE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 15 | `ST_CONT_LOC` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `CITY_LOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 17 | `CTY_CTRY_LOC` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 18 | `TK_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 19 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 20 | `CAN_FY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `CAN_AGCY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `CAN_AP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `CAN_AGCY_ACCT_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 24 | `ORG_CDE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 25 | `ORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `ORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `ORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `ORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `ORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `ORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `ORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `SPOC` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 37 | `SEX_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `VET_PREF_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `TENURE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 40 | `EHRP_EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 41 | `EHRP_EMP_REC_NO` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `PERM_TEMP_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `FT_PT_INTER_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 44 | `CITIZEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `TYPE_APPT_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `EOD_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 47 | `PHY_HNDCP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 48 | `CEILING_EN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 49 | `FUNC_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 50 | `SUPV_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 51 | `PAY_BASIS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `POS_SEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 53 | `CAR_SERV_DTE` | number(p,s) | 16 | 0 | NOT A KEY | NULL |
| 54 | `PROB_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 55 | `SPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 56 | `ABNOR_RATE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `FED_RETIRE_CDE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `TSPA_STATUS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 59 | `TSPA_VEST_PERIOD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 60 | `EFT_EMPL_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 61 | `EFT_EMPL_ACCT_NUMBER` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 62 | `FS_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `TSPA_STATUS_CODE_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `TSPA_SCD` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 65 | `OT_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 66 | `LOCAL_PCENT_RATE` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 67 | `CPP_LOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `AGCY_CDE_PER` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 69 | `SEP_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 70 | `SEP_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 71 | `PERS_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 72 | `ANNUAL_SAL` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 73 | `FLSA_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 74 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 75 | `CPP_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 76 | `DATE_BIRTH` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 77 | `EFT_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 78 | `EFT_CK_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 79 | `POSITION_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `POSITION_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 81 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 82 | `STEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `FEGLI_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `FEGLI_CDE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 85 | `TOT_FED_TAX_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 86 | `FED_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 87 | `HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 88 | `SEV_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `HLTH_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 90 | `HLTH_GOVT_SHARE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 91 | `UNION_IDENT_CDE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 92 | `UNION_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 93 | `PCA_BIWEEK_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 94 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 95 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 96 | `AN_LV_EARNED_CPP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 97 | `SICK_LV_ERN_CPP` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 98 | `COMP_LV_ERN_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 99 | `COMP_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 100 | `ADMIN_LV_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `LWOP_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 102 | `STAFFING_BIW_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 103 | `INCENT_TIME_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 104 | `PSP_BIWKLY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `REL_COMP_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 106 | `REL_COMP_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 107 | `CR_HRS_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 108 | `CR_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 109 | `FERS_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 110 | `AN_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 111 | `SICK_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 112 | `LV_CAT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 113 | `AN_LV_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 114 | `AN_LV_ERND_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 115 | `AN_LV_ADV_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 116 | `AN_LV_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 117 | `AN_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 118 | `AN_LV_MAX_COVER` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 119 | `AN_LV_USE_LOSE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 120 | `SICK_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 121 | `SICK_LV_ERN_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 122 | `SICK_LV_AD_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 123 | `SICK_LV_USD_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 124 | `SICK_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 125 | `COMP_LV_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 126 | `RESTOR_AL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `RESTOR_AL_BAL_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `RESTOR_AL_BAL_2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `RESTOR_AL_BAL_3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `PSI_START_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 131 | `REL_COMP_CURR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 132 | `CR_HRS_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 133 | `TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 136 | `TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `TVL_COMP_FORFEITED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `YTD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 139 | `YTD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `YTD_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `YTD_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `YTD_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `YTD_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `YTD_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `YTD_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `YTD_SEV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 147 | `YTD_CASH_AWARDS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `YTD_MP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `YTD_LSL_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `YTD_MISC_OTH_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 151 | `YTD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 152 | `YTD_NON_TAX_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 153 | `YTD_FED_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `YTD_TAXABLE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `YTD_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `YTD_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `YTD_CSR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 158 | `YTD_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `YTD_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `YTD_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 161 | `YTD_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `YTD_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `YTD_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 164 | `YTD_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `YTD_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `YTD_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 167 | `YTD_LEVY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 169 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 170 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 172 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 173 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 174 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 177 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 178 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 181 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 182 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 184 | `YTD_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `YTD_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `YTD_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `YTD_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `YTD_LI_REG_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `YTD_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `YTD_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `YTD_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `YTD_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `YTD_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `YTD_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `YTD_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `YTD_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `YTD_LAUNDRY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `YTD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 199 | `YTD_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 200 | `EIC_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `PCA_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `YTD_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 203 | `YTD_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `YTD_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `YTD_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 206 | `YTD_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `YTD_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `YTD_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 209 | `YTD_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `T38_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 211 | `T38_HOL_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `T38_ND_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `T38_ONCALL_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `T38_SAT_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 215 | `T38_SUN_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `YTD_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `YTD_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `YTD_PSP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `RET_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `YTD_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 221 | `YTD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 222 | `YTD_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 223 | `YTD_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 224 | `YTD_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 225 | `YTD_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `YTD_CHILD_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `REL_COMP_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `CR_HRS_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `YTD_PREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `YTD_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `YTD_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `YTD_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `VIS_DENT_1_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_2_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `VIS_DENT_3_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `TRANSFER_IN_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 237 | `TRANSFER_IN_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `FEHB_PC_PRE_TAX_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 239 | `ADMIN_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 240 | `MILITARY_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 241 | `LWOP_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 242 | `RESTOR_AL_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 243 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 244 | `OC_121S_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 245 | `OC_1211_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 246 | `OC_1111_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 247 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 248 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 249 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 250 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 251 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 252 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 253 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 254 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 255 | `CPP_HLTH_EMPLR_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 256 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 257 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `CPP_DCS_DEBT_AMT_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 261 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 262 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 263 | `CPP_OTHER_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 264 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 265 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 266 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 267 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 268 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 269 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 270 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 271 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 272 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 273 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 274 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 275 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 276 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 277 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 278 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 279 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 280 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 281 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 282 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 283 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 284 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 285 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 286 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 287 | `CPP_BASE_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 288 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 289 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 290 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 291 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 292 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 293 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 294 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 295 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 296 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 297 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 298 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 299 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 300 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 301 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 302 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 303 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 304 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 305 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 306 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 307 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 308 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 309 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 310 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 311 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 312 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 313 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 314 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 315 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 316 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 317 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 318 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 319 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 320 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 321 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 322 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 323 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 324 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 325 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 326 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 327 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 328 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 329 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 330 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 331 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 332 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 333 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 334 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 335 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 336 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 337 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 338 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 339 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 340 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 341 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 342 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 343 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 344 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 345 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 346 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 347 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 348 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 349 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 350 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 351 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 352 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 353 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 354 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 355 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 356 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 357 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 358 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 359 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 360 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 361 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 362 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 363 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 364 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 365 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 366 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 367 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 368 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 369 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 370 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 371 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 372 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 373 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 374 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 375 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 376 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 377 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 378 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 379 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 380 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 381 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 382 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 383 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 384 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 385 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 386 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 387 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 388 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 389 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 390 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 391 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 392 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 393 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 394 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 395 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 396 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 397 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 398 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 399 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 400 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 401 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 402 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 403 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 404 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 405 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 406 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 407 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 408 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 409 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 410 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 411 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 412 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 413 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 414 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 415 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 416 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 417 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 418 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 419 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 420 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 421 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 422 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 423 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 424 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 425 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 426 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 427 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 428 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 429 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 430 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 431 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 432 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 433 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 434 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 435 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 436 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 437 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 438 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 439 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 440 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 441 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 442 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 443 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 444 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 445 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 446 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 447 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 448 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 449 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 450 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 451 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 452 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 453 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 454 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 455 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 456 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 457 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 458 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 459 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 460 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 461 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 462 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 463 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 464 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 465 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 466 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 467 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 468 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 469 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 470 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 471 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 472 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 473 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 474 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 475 | `WORK_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 476 | `WORK_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 477 | `WORK_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 478 | `WORK_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 479 | `WORK_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 480 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 481 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 482 | `FED_RETIRE_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 483 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 484 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 485 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 486 | `COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 487 | `COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 488 | `COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 489 | `COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 490 | `OT_EARN_YTD_DOLL_VALUE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 491 | `REL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 492 | `REL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 493 | `REL_COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 494 | `REL_COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 495 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 496 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 497 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 498 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 499 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 500 | `DON_LV_HRS_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 501 | `DON_LV_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |

</details>

### CPM_NIH

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `CPM_NEWPAY_TBL` | Oracle | INFO_TARGET_DEV | 501 |
| `HI_GENERIC_SRC_TBL` | Oracle | INFO_TARGET_DEV | 1 |
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |

<details><summary><code>CPM_NEWPAY_TBL</code> — 501 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LINE_TYPE` | varchar2 | 5 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `FIR_NAME_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `CODE_CONSL` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `FIR_NAME_3_11` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 8 | `MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `SURNAME_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 10 | `SURNAME_OTHER` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 11 | `SOC_SEC_NO` | number(p,s) | 11 | 0 | NOT A KEY | NULL |
| 12 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 13 | `OCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 14 | `JOB_LOC_CDE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 15 | `ST_CONT_LOC` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `CITY_LOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 17 | `CTY_CTRY_LOC` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 18 | `TK_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 19 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 20 | `CAN_FY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `CAN_AGCY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `CAN_AP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `CAN_AGCY_ACCT_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 24 | `ORG_CDE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 25 | `ORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `ORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `ORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `ORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `ORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `ORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `ORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `SPOC` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 37 | `SEX_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `VET_PREF_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `TENURE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 40 | `EHRP_EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 41 | `EHRP_EMP_REC_NO` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `PERM_TEMP_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `FT_PT_INTER_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 44 | `CITIZEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `TYPE_APPT_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `EOD_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 47 | `PHY_HNDCP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 48 | `CEILING_EN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 49 | `FUNC_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 50 | `SUPV_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 51 | `PAY_BASIS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `POS_SEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 53 | `CAR_SERV_DTE` | number(p,s) | 16 | 0 | NOT A KEY | NULL |
| 54 | `PROB_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 55 | `SPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 56 | `ABNOR_RATE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `FED_RETIRE_CDE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `TSPA_STATUS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 59 | `TSPA_VEST_PERIOD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 60 | `EFT_EMPL_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 61 | `EFT_EMPL_ACCT_NUMBER` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 62 | `FS_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `TSPA_STATUS_CODE_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `TSPA_SCD` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 65 | `OT_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 66 | `LOCAL_PCENT_RATE` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 67 | `CPP_LOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `AGCY_CDE_PER` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 69 | `SEP_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 70 | `SEP_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 71 | `PERS_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 72 | `ANNUAL_SAL` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 73 | `FLSA_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 74 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 75 | `CPP_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 76 | `DATE_BIRTH` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 77 | `EFT_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 78 | `EFT_CK_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 79 | `POSITION_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `POSITION_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 81 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 82 | `STEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `FEGLI_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `FEGLI_CDE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 85 | `TOT_FED_TAX_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 86 | `FED_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 87 | `HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 88 | `SEV_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `HLTH_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 90 | `HLTH_GOVT_SHARE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 91 | `UNION_IDENT_CDE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 92 | `UNION_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 93 | `PCA_BIWEEK_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 94 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 95 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 96 | `AN_LV_EARNED_CPP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 97 | `SICK_LV_ERN_CPP` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 98 | `COMP_LV_ERN_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 99 | `COMP_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 100 | `ADMIN_LV_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `LWOP_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 102 | `STAFFING_BIW_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 103 | `INCENT_TIME_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 104 | `PSP_BIWKLY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `REL_COMP_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 106 | `REL_COMP_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 107 | `CR_HRS_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 108 | `CR_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 109 | `FERS_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 110 | `AN_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 111 | `SICK_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 112 | `LV_CAT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 113 | `AN_LV_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 114 | `AN_LV_ERND_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 115 | `AN_LV_ADV_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 116 | `AN_LV_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 117 | `AN_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 118 | `AN_LV_MAX_COVER` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 119 | `AN_LV_USE_LOSE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 120 | `SICK_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 121 | `SICK_LV_ERN_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 122 | `SICK_LV_AD_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 123 | `SICK_LV_USD_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 124 | `SICK_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 125 | `COMP_LV_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 126 | `RESTOR_AL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `RESTOR_AL_BAL_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `RESTOR_AL_BAL_2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `RESTOR_AL_BAL_3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `PSI_START_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 131 | `REL_COMP_CURR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 132 | `CR_HRS_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 133 | `TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 136 | `TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `TVL_COMP_FORFEITED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `YTD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 139 | `YTD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `YTD_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `YTD_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `YTD_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `YTD_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `YTD_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `YTD_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `YTD_SEV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 147 | `YTD_CASH_AWARDS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `YTD_MP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `YTD_LSL_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `YTD_MISC_OTH_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 151 | `YTD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 152 | `YTD_NON_TAX_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 153 | `YTD_FED_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `YTD_TAXABLE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `YTD_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `YTD_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `YTD_CSR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 158 | `YTD_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `YTD_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `YTD_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 161 | `YTD_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `YTD_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `YTD_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 164 | `YTD_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `YTD_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `YTD_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 167 | `YTD_LEVY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 169 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 170 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 172 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 173 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 174 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 177 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 178 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 181 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 182 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 184 | `YTD_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `YTD_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `YTD_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `YTD_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `YTD_LI_REG_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `YTD_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `YTD_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `YTD_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `YTD_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `YTD_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `YTD_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `YTD_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `YTD_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `YTD_LAUNDRY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `YTD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 199 | `YTD_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 200 | `EIC_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `PCA_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `YTD_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 203 | `YTD_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `YTD_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `YTD_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 206 | `YTD_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `YTD_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `YTD_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 209 | `YTD_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `T38_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 211 | `T38_HOL_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `T38_ND_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `T38_ONCALL_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `T38_SAT_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 215 | `T38_SUN_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `YTD_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `YTD_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `YTD_PSP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `RET_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `YTD_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 221 | `YTD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 222 | `YTD_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 223 | `YTD_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 224 | `YTD_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 225 | `YTD_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `YTD_CHILD_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `REL_COMP_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `CR_HRS_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `YTD_PREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `YTD_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `YTD_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `YTD_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `VIS_DENT_1_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_2_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `VIS_DENT_3_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `TRANSFER_IN_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 237 | `TRANSFER_IN_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `FEHB_PC_PRE_TAX_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 239 | `ADMIN_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 240 | `MILITARY_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 241 | `LWOP_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 242 | `RESTOR_AL_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 243 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 244 | `OC_121S_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 245 | `OC_1211_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 246 | `OC_1111_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 247 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 248 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 249 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 250 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 251 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 252 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 253 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 254 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 255 | `CPP_HLTH_EMPLR_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 256 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 257 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `CPP_DCS_DEBT_AMT_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 261 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 262 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 263 | `CPP_OTHER_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 264 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 265 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 266 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 267 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 268 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 269 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 270 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 271 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 272 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 273 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 274 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 275 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 276 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 277 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 278 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 279 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 280 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 281 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 282 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 283 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 284 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 285 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 286 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 287 | `CPP_BASE_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 288 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 289 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 290 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 291 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 292 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 293 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 294 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 295 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 296 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 297 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 298 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 299 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 300 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 301 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 302 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 303 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 304 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 305 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 306 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 307 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 308 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 309 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 310 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 311 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 312 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 313 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 314 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 315 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 316 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 317 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 318 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 319 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 320 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 321 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 322 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 323 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 324 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 325 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 326 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 327 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 328 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 329 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 330 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 331 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 332 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 333 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 334 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 335 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 336 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 337 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 338 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 339 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 340 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 341 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 342 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 343 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 344 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 345 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 346 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 347 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 348 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 349 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 350 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 351 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 352 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 353 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 354 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 355 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 356 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 357 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 358 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 359 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 360 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 361 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 362 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 363 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 364 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 365 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 366 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 367 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 368 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 369 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 370 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 371 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 372 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 373 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 374 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 375 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 376 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 377 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 378 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 379 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 380 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 381 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 382 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 383 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 384 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 385 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 386 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 387 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 388 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 389 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 390 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 391 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 392 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 393 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 394 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 395 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 396 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 397 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 398 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 399 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 400 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 401 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 402 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 403 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 404 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 405 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 406 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 407 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 408 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 409 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 410 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 411 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 412 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 413 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 414 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 415 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 416 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 417 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 418 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 419 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 420 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 421 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 422 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 423 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 424 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 425 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 426 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 427 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 428 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 429 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 430 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 431 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 432 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 433 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 434 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 435 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 436 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 437 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 438 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 439 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 440 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 441 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 442 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 443 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 444 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 445 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 446 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 447 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 448 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 449 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 450 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 451 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 452 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 453 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 454 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 455 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 456 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 457 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 458 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 459 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 460 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 461 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 462 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 463 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 464 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 465 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 466 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 467 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 468 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 469 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 470 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 471 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 472 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 473 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 474 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 475 | `WORK_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 476 | `WORK_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 477 | `WORK_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 478 | `WORK_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 479 | `WORK_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 480 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 481 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 482 | `FED_RETIRE_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 483 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 484 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 485 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 486 | `COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 487 | `COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 488 | `COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 489 | `COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 490 | `OT_EARN_YTD_DOLL_VALUE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 491 | `REL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 492 | `REL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 493 | `REL_COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 494 | `REL_COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 495 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 496 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 497 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 498 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 499 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 500 | `DON_LV_HRS_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 501 | `DON_LV_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_GENERIC_SRC_TBL</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number(p,s) | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

### CPM_OIG

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |
| `CPM_NEWPAY_TBL` | Oracle | INFO_TARGET_DEV | 501 |

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_TBL</code> — 501 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LINE_TYPE` | varchar2 | 5 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `FIR_NAME_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `CODE_CONSL` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `FIR_NAME_3_11` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 8 | `MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `SURNAME_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 10 | `SURNAME_OTHER` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 11 | `SOC_SEC_NO` | number(p,s) | 11 | 0 | NOT A KEY | NULL |
| 12 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 13 | `OCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 14 | `JOB_LOC_CDE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 15 | `ST_CONT_LOC` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `CITY_LOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 17 | `CTY_CTRY_LOC` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 18 | `TK_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 19 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 20 | `CAN_FY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `CAN_AGCY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `CAN_AP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `CAN_AGCY_ACCT_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 24 | `ORG_CDE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 25 | `ORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `ORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `ORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `ORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `ORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `ORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `ORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `SPOC` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 37 | `SEX_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `VET_PREF_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `TENURE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 40 | `EHRP_EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 41 | `EHRP_EMP_REC_NO` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `PERM_TEMP_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `FT_PT_INTER_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 44 | `CITIZEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `TYPE_APPT_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `EOD_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 47 | `PHY_HNDCP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 48 | `CEILING_EN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 49 | `FUNC_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 50 | `SUPV_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 51 | `PAY_BASIS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `POS_SEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 53 | `CAR_SERV_DTE` | number(p,s) | 16 | 0 | NOT A KEY | NULL |
| 54 | `PROB_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 55 | `SPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 56 | `ABNOR_RATE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `FED_RETIRE_CDE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `TSPA_STATUS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 59 | `TSPA_VEST_PERIOD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 60 | `EFT_EMPL_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 61 | `EFT_EMPL_ACCT_NUMBER` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 62 | `FS_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `TSPA_STATUS_CODE_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `TSPA_SCD` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 65 | `OT_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 66 | `LOCAL_PCENT_RATE` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 67 | `CPP_LOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `AGCY_CDE_PER` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 69 | `SEP_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 70 | `SEP_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 71 | `PERS_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 72 | `ANNUAL_SAL` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 73 | `FLSA_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 74 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 75 | `CPP_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 76 | `DATE_BIRTH` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 77 | `EFT_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 78 | `EFT_CK_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 79 | `POSITION_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `POSITION_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 81 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 82 | `STEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `FEGLI_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `FEGLI_CDE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 85 | `TOT_FED_TAX_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 86 | `FED_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 87 | `HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 88 | `SEV_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `HLTH_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 90 | `HLTH_GOVT_SHARE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 91 | `UNION_IDENT_CDE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 92 | `UNION_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 93 | `PCA_BIWEEK_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 94 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 95 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 96 | `AN_LV_EARNED_CPP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 97 | `SICK_LV_ERN_CPP` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 98 | `COMP_LV_ERN_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 99 | `COMP_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 100 | `ADMIN_LV_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `LWOP_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 102 | `STAFFING_BIW_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 103 | `INCENT_TIME_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 104 | `PSP_BIWKLY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `REL_COMP_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 106 | `REL_COMP_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 107 | `CR_HRS_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 108 | `CR_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 109 | `FERS_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 110 | `AN_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 111 | `SICK_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 112 | `LV_CAT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 113 | `AN_LV_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 114 | `AN_LV_ERND_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 115 | `AN_LV_ADV_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 116 | `AN_LV_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 117 | `AN_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 118 | `AN_LV_MAX_COVER` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 119 | `AN_LV_USE_LOSE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 120 | `SICK_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 121 | `SICK_LV_ERN_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 122 | `SICK_LV_AD_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 123 | `SICK_LV_USD_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 124 | `SICK_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 125 | `COMP_LV_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 126 | `RESTOR_AL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `RESTOR_AL_BAL_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `RESTOR_AL_BAL_2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `RESTOR_AL_BAL_3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `PSI_START_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 131 | `REL_COMP_CURR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 132 | `CR_HRS_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 133 | `TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 136 | `TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `TVL_COMP_FORFEITED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `YTD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 139 | `YTD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `YTD_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `YTD_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `YTD_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `YTD_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `YTD_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `YTD_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `YTD_SEV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 147 | `YTD_CASH_AWARDS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `YTD_MP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `YTD_LSL_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `YTD_MISC_OTH_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 151 | `YTD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 152 | `YTD_NON_TAX_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 153 | `YTD_FED_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `YTD_TAXABLE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `YTD_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `YTD_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `YTD_CSR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 158 | `YTD_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `YTD_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `YTD_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 161 | `YTD_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `YTD_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `YTD_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 164 | `YTD_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `YTD_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `YTD_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 167 | `YTD_LEVY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 169 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 170 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 172 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 173 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 174 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 177 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 178 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 181 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 182 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 184 | `YTD_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `YTD_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `YTD_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `YTD_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `YTD_LI_REG_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `YTD_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `YTD_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `YTD_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `YTD_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `YTD_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `YTD_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `YTD_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `YTD_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `YTD_LAUNDRY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `YTD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 199 | `YTD_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 200 | `EIC_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `PCA_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `YTD_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 203 | `YTD_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `YTD_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `YTD_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 206 | `YTD_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `YTD_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `YTD_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 209 | `YTD_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `T38_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 211 | `T38_HOL_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `T38_ND_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `T38_ONCALL_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `T38_SAT_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 215 | `T38_SUN_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `YTD_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `YTD_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `YTD_PSP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `RET_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `YTD_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 221 | `YTD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 222 | `YTD_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 223 | `YTD_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 224 | `YTD_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 225 | `YTD_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `YTD_CHILD_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `REL_COMP_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `CR_HRS_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `YTD_PREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `YTD_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `YTD_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `YTD_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `VIS_DENT_1_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_2_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `VIS_DENT_3_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `TRANSFER_IN_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 237 | `TRANSFER_IN_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `FEHB_PC_PRE_TAX_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 239 | `ADMIN_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 240 | `MILITARY_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 241 | `LWOP_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 242 | `RESTOR_AL_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 243 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 244 | `OC_121S_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 245 | `OC_1211_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 246 | `OC_1111_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 247 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 248 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 249 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 250 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 251 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 252 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 253 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 254 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 255 | `CPP_HLTH_EMPLR_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 256 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 257 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `CPP_DCS_DEBT_AMT_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 261 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 262 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 263 | `CPP_OTHER_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 264 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 265 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 266 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 267 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 268 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 269 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 270 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 271 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 272 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 273 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 274 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 275 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 276 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 277 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 278 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 279 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 280 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 281 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 282 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 283 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 284 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 285 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 286 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 287 | `CPP_BASE_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 288 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 289 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 290 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 291 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 292 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 293 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 294 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 295 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 296 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 297 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 298 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 299 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 300 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 301 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 302 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 303 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 304 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 305 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 306 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 307 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 308 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 309 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 310 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 311 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 312 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 313 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 314 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 315 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 316 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 317 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 318 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 319 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 320 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 321 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 322 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 323 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 324 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 325 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 326 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 327 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 328 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 329 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 330 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 331 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 332 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 333 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 334 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 335 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 336 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 337 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 338 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 339 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 340 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 341 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 342 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 343 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 344 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 345 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 346 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 347 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 348 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 349 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 350 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 351 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 352 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 353 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 354 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 355 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 356 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 357 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 358 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 359 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 360 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 361 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 362 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 363 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 364 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 365 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 366 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 367 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 368 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 369 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 370 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 371 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 372 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 373 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 374 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 375 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 376 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 377 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 378 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 379 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 380 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 381 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 382 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 383 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 384 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 385 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 386 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 387 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 388 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 389 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 390 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 391 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 392 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 393 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 394 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 395 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 396 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 397 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 398 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 399 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 400 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 401 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 402 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 403 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 404 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 405 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 406 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 407 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 408 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 409 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 410 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 411 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 412 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 413 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 414 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 415 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 416 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 417 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 418 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 419 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 420 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 421 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 422 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 423 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 424 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 425 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 426 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 427 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 428 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 429 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 430 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 431 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 432 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 433 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 434 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 435 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 436 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 437 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 438 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 439 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 440 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 441 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 442 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 443 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 444 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 445 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 446 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 447 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 448 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 449 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 450 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 451 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 452 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 453 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 454 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 455 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 456 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 457 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 458 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 459 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 460 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 461 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 462 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 463 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 464 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 465 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 466 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 467 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 468 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 469 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 470 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 471 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 472 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 473 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 474 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 475 | `WORK_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 476 | `WORK_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 477 | `WORK_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 478 | `WORK_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 479 | `WORK_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 480 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 481 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 482 | `FED_RETIRE_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 483 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 484 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 485 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 486 | `COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 487 | `COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 488 | `COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 489 | `COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 490 | `OT_EARN_YTD_DOLL_VALUE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 491 | `REL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 492 | `REL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 493 | `REL_COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 494 | `REL_COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 495 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 496 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 497 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 498 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 499 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 500 | `DON_LV_HRS_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 501 | `DON_LV_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |

</details>

### EHRP2BIIS_UPDATE

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `NWK_NEW_EHRP_ACTIONS_TBL` | Oracle | NKNIGHT | 4 |
| `PS_GVT_JOB` | Oracle | EHRP | 246 |

<details><summary><code>NWK_NEW_EHRP_ACTIONS_TBL</code> — 4 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `EMPLID` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 2 | `EMPL_RCD` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 3 | `EFFDT` | date | 19 | 0 | NOT A KEY | NOTNULL |
| 4 | `EFFSEQ` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>PS_GVT_JOB</code> — 246 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `EMPLID` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 2 | `EMPL_RCD` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 3 | `EFFDT` | date | 19 | 0 | NOT A KEY | NOTNULL |
| 4 | `EFFSEQ` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 5 | `DEPTID` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 6 | `JOBCODE` | varchar2 | 6 | 0 | NOT A KEY | NOTNULL |
| 7 | `POSITION_NBR` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 8 | `POSITION_OVERRIDE` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 9 | `POSN_CHANGE_RECORD` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 10 | `EMPL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 11 | `ACTION` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 12 | `ACTION_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 13 | `ACTION_REASON` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 14 | `LOCATION` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 15 | `TAX_LOCATION_CD` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 16 | `JOB_ENTRY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 17 | `DEPT_ENTRY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 18 | `POSITION_ENTRY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 19 | `SHIFT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 20 | `REG_TEMP` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 21 | `FULL_PART_TIME` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 22 | `COMPANY` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 23 | `PAYGROUP` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 24 | `BAS_GROUP_ID` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 25 | `ELIG_CONFIG1` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 26 | `ELIG_CONFIG2` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 27 | `ELIG_CONFIG3` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 28 | `ELIG_CONFIG4` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 29 | `ELIG_CONFIG5` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 30 | `ELIG_CONFIG6` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 31 | `ELIG_CONFIG7` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 32 | `ELIG_CONFIG8` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 33 | `ELIG_CONFIG9` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 34 | `BEN_STATUS` | varchar2 | 4 | 0 | NOT A KEY | NOTNULL |
| 35 | `BAS_ACTION` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 36 | `COBRA_ACTION` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 37 | `EMPL_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 38 | `HOLIDAY_SCHEDULE` | varchar2 | 6 | 0 | NOT A KEY | NOTNULL |
| 39 | `STD_HOURS` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 40 | `STD_HRS_FREQUENCY` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 41 | `OFFICER_CD` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 42 | `EMPL_CLASS` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 43 | `SAL_ADMIN_PLAN` | varchar2 | 4 | 0 | NOT A KEY | NOTNULL |
| 44 | `GRADE` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 45 | `GRADE_ENTRY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 46 | `STEP` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 47 | `STEP_ENTRY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 48 | `GL_PAY_TYPE` | varchar2 | 6 | 0 | NOT A KEY | NOTNULL |
| 49 | `ACCT_CD` | varchar2 | 25 | 0 | NOT A KEY | NOTNULL |
| 50 | `EARNS_DIST_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 51 | `COMP_FREQUENCY` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 52 | `COMPRATE` | number(p,s) | 18 | 6 | NOT A KEY | NOTNULL |
| 53 | `CHANGE_AMT` | number(p,s) | 18 | 6 | NOT A KEY | NOTNULL |
| 54 | `CHANGE_PCT` | number(p,s) | 6 | 3 | NOT A KEY | NOTNULL |
| 55 | `ANNUAL_RT` | number(p,s) | 18 | 3 | NOT A KEY | NOTNULL |
| 56 | `MONTHLY_RT` | number(p,s) | 18 | 3 | NOT A KEY | NOTNULL |
| 57 | `DAILY_RT` | number(p,s) | 18 | 3 | NOT A KEY | NOTNULL |
| 58 | `HOURLY_RT` | number(p,s) | 18 | 6 | NOT A KEY | NOTNULL |
| 59 | `ANNL_BENEF_BASE_RT` | number(p,s) | 18 | 3 | NOT A KEY | NOTNULL |
| 60 | `SHIFT_RT` | number(p,s) | 18 | 6 | NOT A KEY | NOTNULL |
| 61 | `SHIFT_FACTOR` | number(p,s) | 4 | 3 | NOT A KEY | NOTNULL |
| 62 | `CURRENCY_CD` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 63 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 64 | `SETID_DEPT` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 65 | `SETID_JOBCODE` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 66 | `SETID_LOCATION` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 67 | `SETID_SALARY` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 68 | `REG_REGION` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 69 | `DIRECTLY_TIPPED` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 70 | `FLSA_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 71 | `EEO_CLASS` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 72 | `FUNCTION_CD` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 73 | `TARIFF_GER` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 74 | `TARIFF_AREA_GER` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 75 | `PERFORM_GROUP_GER` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 76 | `LABOR_TYPE_GER` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 77 | `SPK_COMM_ID_GER` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 78 | `HOURLY_RT_FRA` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 79 | `ACCDNT_CD_FRA` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 80 | `VALUE_1_FRA` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 81 | `VALUE_2_FRA` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 82 | `VALUE_3_FRA` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 83 | `VALUE_4_FRA` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 84 | `VALUE_5_FRA` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 85 | `CTG_RATE` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 86 | `PAID_HOURS` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 87 | `PAID_FTE` | number(p,s) | 7 | 6 | NOT A KEY | NOTNULL |
| 88 | `PAID_HRS_FREQUENCY` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 89 | `GVT_EFFDT` | date | 19 | 0 | NOT A KEY | NULL |
| 90 | `GVT_EFFDT_PROPOSED` | date | 19 | 0 | NOT A KEY | NULL |
| 91 | `GVT_TRANS_NBR` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 92 | `GVT_TRANS_NBR_SEQ` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 93 | `GVT_WIP_STATUS` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 94 | `GVT_STATUS_TYPE` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 95 | `GVT_NOA_CODE` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 96 | `GVT_LEG_AUTH_1` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 97 | `GVT_PAR_AUTH_D1` | varchar2 | 25 | 0 | NOT A KEY | NOTNULL |
| 98 | `GVT_PAR_AUTH_D1_2` | varchar2 | 25 | 0 | NOT A KEY | NOTNULL |
| 99 | `GVT_LEG_AUTH_2` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 100 | `GVT_PAR_AUTH_D2` | varchar2 | 25 | 0 | NOT A KEY | NOTNULL |
| 101 | `GVT_PAR_AUTH_D2_2` | varchar2 | 25 | 0 | NOT A KEY | NOTNULL |
| 102 | `GVT_PAR_NTE_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 103 | `GVT_WORK_SCHED` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 104 | `GVT_SUB_AGENCY` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 105 | `GVT_ELIG_FEHB` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 106 | `GVT_FEHB_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 107 | `GVT_PAY_RATE_DETER` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 108 | `GVT_STEP` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 109 | `GVT_RTND_PAY_PLAN` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 110 | `GVT_RTND_SAL_PLAN` | varchar2 | 4 | 0 | NOT A KEY | NOTNULL |
| 111 | `GVT_RTND_GRADE` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 112 | `GVT_RTND_STEP` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 113 | `GVT_RTND_GVT_STEP` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 114 | `GVT_PAY_BASIS` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 115 | `GVT_COMPRATE` | number(p,s) | 18 | 6 | NOT A KEY | NOTNULL |
| 116 | `GVT_LOCALITY_ADJ` | number(p,s) | 8 | 2 | NOT A KEY | NOTNULL |
| 117 | `GVT_BIWEEKLY_RT` | number(p,s) | 9 | 2 | NOT A KEY | NOTNULL |
| 118 | `GVT_DAILY_RT` | number(p,s) | 9 | 2 | NOT A KEY | NOTNULL |
| 119 | `GVT_HRLY_RT_NO_LOC` | number(p,s) | 18 | 6 | NOT A KEY | NOTNULL |
| 120 | `GVT_DLY_RT_NO_LOC` | number(p,s) | 9 | 2 | NOT A KEY | NOTNULL |
| 121 | `GVT_BW_RT_NO_LOC` | number(p,s) | 9 | 2 | NOT A KEY | NOTNULL |
| 122 | `GVT_MNLY_RT_NO_LOC` | number(p,s) | 18 | 3 | NOT A KEY | NOTNULL |
| 123 | `GVT_ANNL_RT_NO_LOC` | number(p,s) | 18 | 3 | NOT A KEY | NOTNULL |
| 124 | `GVT_XFER_FROM_AGCY` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 125 | `GVT_XFER_TO_AGCY` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 126 | `GVT_RETIRE_PLAN` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 127 | `GVT_ANN_IND` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 128 | `GVT_FEGLI` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 129 | `GVT_FEGLI_LIVING` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 130 | `GVT_LIVING_AMT` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 131 | `GVT_ANNUITY_OFFSET` | number(p,s) | 10 | 2 | NOT A KEY | NOTNULL |
| 132 | `GVT_CSRS_FROZN_SVC` | varchar2 | 4 | 0 | NOT A KEY | NOTNULL |
| 133 | `GVT_PREV_RET_COVRG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 134 | `GVT_FERS_COVERAGE` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 135 | `GVT_TYPE_OF_APPT` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 136 | `GVT_POI` | varchar2 | 4 | 0 | NOT A KEY | NOTNULL |
| 137 | `GVT_POSN_OCCUPIED` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 138 | `GVT_CONT_EMPLID` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 139 | `GVT_ROUTE_NEXT` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 140 | `GVT_CHANGE_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 141 | `GVT_TSP_UPD_IND` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 142 | `GVT_PI_UPD_IND` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 143 | `GVT_SF52_NBR` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 144 | `GVT_S113G_CEILING` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 145 | `GVT_LEO_POSITION` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 146 | `GVT_ANNUIT_COM_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 147 | `GVT_BASIC_LIFE_RED` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 148 | `GVT_DED_PRORT_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 149 | `GVT_FEGLI_BASC_PCT` | number(p,s) | 7 | 6 | NOT A KEY | NOTNULL |
| 150 | `GVT_FEGLI_OPT_PCT` | number(p,s) | 7 | 6 | NOT A KEY | NOTNULL |
| 151 | `GVT_FEHB_PCT` | number(p,s) | 7 | 6 | NOT A KEY | NOTNULL |
| 152 | `GVT_RETRO_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 153 | `GVT_RETRO_DED_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 154 | `GVT_RETRO_JOB_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 155 | `GVT_RETRO_BSE_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 156 | `GVT_OTH_PAY_CHG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 157 | `GVT_DETL_POSN_NBR` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 158 | `ANNL_BEN_BASE_OVRD` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 159 | `BENEFIT_PROGRAM` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 160 | `UPDATE_PAYROLL` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 161 | `GVT_PAY_PLAN` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 162 | `GVT_PAY_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 163 | `GVT_NID_CHANGE` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 164 | `UNION_FULL_PART` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 165 | `UNION_POS` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 166 | `MATRICULA_NBR` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 167 | `SOC_SEC_RISK_CODE` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 168 | `UNION_FEE_AMOUNT` | number(p,s) | 8 | 2 | NOT A KEY | NOTNULL |
| 169 | `UNION_FEE_START_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 170 | `UNION_FEE_END_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 171 | `EXEMPT_JOB_LBR` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 172 | `EXEMPT_HOURS_MONTH` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 173 | `WRKS_CNCL_FUNCTION` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 174 | `INTERCTR_WRKS_CNCL` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 175 | `CURRENCY_CD1` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 176 | `PAY_UNION_FEE` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 177 | `UNION_CD` | varchar2 | 3 | 0 | NOT A KEY | NOTNULL |
| 178 | `BARG_UNIT` | varchar2 | 4 | 0 | NOT A KEY | NOTNULL |
| 179 | `UNION_SENIORITY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 180 | `ENTRY_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 181 | `LABOR_AGREEMENT` | varchar2 | 6 | 0 | NOT A KEY | NOTNULL |
| 182 | `EMPL_CTG` | varchar2 | 6 | 0 | NOT A KEY | NOTNULL |
| 183 | `EMPL_CTG_L1` | varchar2 | 6 | 0 | NOT A KEY | NOTNULL |
| 184 | `EMPL_CTG_L2` | varchar2 | 6 | 0 | NOT A KEY | NOTNULL |
| 185 | `SETID_LBR_AGRMNT` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 186 | `WPP_STOP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 187 | `LABOR_FACILITY_ID` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 188 | `LBR_FAC_ENTRY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 189 | `LAYOFF_EXEMPT_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 190 | `LAYOFF_EXEMPT_RSN` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 191 | `GP_PAYGROUP` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 192 | `GP_DFLT_ELIG_GRP` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 193 | `GP_ELIG_GRP` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 194 | `GP_DFLT_CURRTTYP` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 195 | `CUR_RT_TYPE` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 196 | `GP_DFLT_EXRTDT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 197 | `GP_ASOF_DT_EXG_RT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 198 | `ADDS_TO_FTE_ACTUAL` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 199 | `CLASS_INDC` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 200 | `ENCUMB_OVERRIDE` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 201 | `FICA_STATUS_EE` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 202 | `FTE` | number(p,s) | 7 | 6 | NOT A KEY | NOTNULL |
| 203 | `PRORATE_CNT_AMT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 204 | `PAY_SYSTEM_FLG` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 205 | `BORDER_WALKER` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 206 | `LUMP_SUM_PAY` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 207 | `CONTRACT_NUM` | varchar2 | 25 | 0 | NOT A KEY | NOTNULL |
| 208 | `JOB_INDICATOR` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 209 | `WRKS_CNCL_ROLE_CHE` | varchar2 | 30 | 0 | NOT A KEY | NOTNULL |
| 210 | `BENEFIT_SYSTEM` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 211 | `WORK_DAY_HOURS` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 212 | `SUPERVISOR_ID` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 213 | `REPORTS_TO` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 214 | `ESTABID` | varchar2 | 12 | 0 | NOT A KEY | NOTNULL |
| 215 | `HE_NOA_EXT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 216 | `HE_AL_CARRYOVER` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 217 | `HE_AL_ACCRUAL` | number(p,s) | 5 | 2 | NOT A KEY | NOTNULL |
| 218 | `HE_AL_RED_CRED` | number(p,s) | 5 | 2 | NOT A KEY | NOTNULL |
| 219 | `HE_AL_TOTAL` | number(p,s) | 5 | 2 | NOT A KEY | NOTNULL |
| 220 | `HE_AL_BALANCE` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 221 | `HE_SL_CARRYOVER` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 222 | `HE_SL_ACCRUAL` | number(p,s) | 5 | 2 | NOT A KEY | NOTNULL |
| 223 | `HE_SL_RED_CRED` | number(p,s) | 5 | 2 | NOT A KEY | NOTNULL |
| 224 | `HE_SL_TOTAL` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 225 | `HE_SL_BALANCE` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 226 | `HE_RES_LASTYR` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 227 | `HE_RES_TWOYRS` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 228 | `HE_RES_THREEYRS` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 229 | `HE_RES_BALANCE` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 230 | `HE_LUMP_HRS` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 231 | `HE_AWOP_SEP` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 232 | `HE_AWOP_WIGI` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 233 | `HE_REG_MILITARY` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 234 | `HE_SPC_MILITARY` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 235 | `HE_FROZEN_SL` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 236 | `HE_TSPA_PR_YR` | number(p,s) | 6 | 2 | NOT A KEY | NOTNULL |
| 237 | `HE_TSPA_SUB_YR` | number(p,s) | 7 | 2 | NOT A KEY | NOTNULL |
| 238 | `HE_UNOFF_AL` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 239 | `HE_UNOFF_SL` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 240 | `HE_TLTR_NO` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |
| 241 | `HE_UDED_PAY_CD` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 242 | `HE_TSP_CANC_CD` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 243 | `HE_PP_UDED_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NOTNULL |
| 244 | `HE_EMP_UDED_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NOTNULL |
| 245 | `HE_GVT_UDED_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NOTNULL |
| 246 | `HE_NO_TSP_PAYPER` | number(p,s) | 38 | 0 | NOT A KEY | NOTNULL |

</details>

### FDA_Leave

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `HI_GENERIC_SRC_TBL` | Oracle | INFO_TARGET_DEV | 1 |
| `HI_PM_FDA_TATRAN_TBL` | Oracle | INFO_TARGET_DEV | 8 |
| `ERROR_TBL` | Oracle | INFO_TARGET_DEV | 8 |
| `CPM_CYCLE_TBL` | Oracle | INFO_TARGET_DEV | 5 |
| `HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | Flat File | INFO_TARGET_DEV | 7 |
| `HI_PM_FDA_TATRAN_FLAT` | Flat File | INFO_TARGET_DEV | 6 |
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |

<details><summary><code>HI_GENERIC_SRC_TBL</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number(p,s) | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_PM_FDA_TATRAN_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FDA_BATCH_ID` | number(p,s) | 19 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `FDA_TK_NO` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `FDA_EMP_ID` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `FDA_PP_YEAR` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `FDA_PP_NUM` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `FDA_REC_TYPE` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 7 | `FDA_SEQ` | number(p,s) | 19 | 0 | PRIMARY KEY | NOTNULL |
| 8 | `FDA_DATA` | varchar2 | 200 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>ERROR_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 8 | `ERROR_CODE` | varchar2 | 50 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_CYCLE_TBL</code> — 5 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 30 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 3 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_PM_FDA_TATRAN_FLAT_FILE_NAME</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FDA_TK_NO` | string | 5 | 0 | NOT A KEY | NULL |
| 2 | `FDA_EMP_ID` | string | 9 | 0 | NOT A KEY | NULL |
| 3 | `FDA_PP_YEAR` | string | 4 | 0 | NOT A KEY | NULL |
| 4 | `FDA_PP_NUM` | string | 2 | 0 | NOT A KEY | NULL |
| 5 | `FDA_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 6 | `FDA_DATA` | string | 118 | 0 | NOT A KEY | NULL |
| 7 | `CurrentlyProcessedFileName` | string | 256 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_PM_FDA_TATRAN_FLAT</code> — 6 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FDA_TK_NO` | string | 5 | 0 | NOT A KEY | NULL |
| 2 | `FDA_EMP_ID` | string | 9 | 0 | NOT A KEY | NULL |
| 3 | `FDA_PP_YEAR` | string | 4 | 0 | NOT A KEY | NULL |
| 4 | `FDA_PP_NUM` | string | 2 | 0 | NOT A KEY | NULL |
| 5 | `FDA_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 6 | `FDA_DATA` | string | 118 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

### LES

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `LES_EMP_DETAIL_LEAVE_TBL` | Oracle | INFO_TARGET_DEV | 15 |
| `LES_EMP_DETAIL_RECTYPE_T_TBL` | Oracle | INFO_TARGET_DEV | 8 |
| `LES_EMP_DETAIL_RECTYPE_M_TBL` | Oracle | INFO_TARGET_DEV | 6 |
| `LES_EMP_DETAIL_RECTYPE_D_TBL` | Oracle | INFO_TARGET_DEV | 13 |
| `LES_EMP_DETAIL_RECTYPE_U_TBL` | Oracle | INFO_TARGET_DEV | 11 |
| `LES_EMP_DETAIL_RECTYPE_L_TBL` | Oracle | INFO_TARGET_DEV | 15 |
| `LES_EMP_DETAIL_RECTYPE_R_TBL` | Oracle | INFO_TARGET_DEV | 14 |
| `LES_EMPLOYEE_DETAIL` | Flat File | — | 5 |
| `LES_EMP_DETAIL_RECTYPE_C_TBL` | Oracle | INFO_TARGET_DEV | 14 |
| `LES_NIH_EMPLOYEE_SUMMARY_TBL` | Oracle | INFO_TARGET_DEV | 4 |
| `ERROR_TBL` | Oracle | INFO_TARGET_DEV | 7 |
| `LES_PRIMARY_DATA_TBL` | Oracle | INFO_TARGET_DEV | 90 |
| `EMP_REC_TYPE_D` | VSAM | — | 11 |
| `PAY_PERIOD` | Oracle | INFO_TARGET_DEV | 10 |
| `EMP_REC_TYPE_2` | VSAM | — | 16 |
| `EMP_REC_TYPE_T` | VSAM | — | 6 |
| `LES_EMP_DETAIL_RECTYPE_4_TBL` | Oracle | INFO_TARGET_DEV | 17 |
| `LES_EMP_DETAIL_RECTYPE_2_TBL` | Oracle | INFO_TARGET_DEV | 17 |
| `LES_EMP_DETAIL_RECTYPE_1_TBL` | Oracle | INFO_TARGET_DEV | 21 |
| `LES_EMP_DETAIL_RECTYPE_3_TBL` | Oracle | INFO_TARGET_DEV | 21 |
| `LES_EMP_DETAIL_RECTYPE_6_TBL` | Oracle | INFO_TARGET_DEV | 8 |
| `LES_EMP_DETAIL_RECTYPE_5_TBL` | Oracle | INFO_TARGET_DEV | 18 |
| `EMP_REC_TYPE_3` | VSAM | — | 20 |
| `EMP_REC_TYPE_0` | VSAM | — | 11 |
| `EMP_REC_TYPE_5` | VSAM | — | 18 |
| `EMP_REC_TYPE_1` | VSAM | — | 20 |
| `EMP_REC_TYPE_4` | VSAM | — | 17 |
| `LES_HEADER_TBL` | Oracle | INFO_TARGET_DEV | 7 |
| `EMP_REC_TYPE_E` | VSAM | — | 9 |
| `EMP_REC_TYPE_R` | VSAM | — | 13 |
| `EMP_REC_TYPE_U` | VSAM | — | 10 |
| `EMP_REC_TYPE_L` | VSAM | — | 13 |
| `EMP_REC_TYPE_6` | VSAM | — | 7 |
| `EMP_REC_TYPE_M` | VSAM | — | 4 |
| `LES_EMP_DETAIL_TBL` | Oracle | INFO_TARGET_DEV | 5 |
| `EMP_REC_TYPE_C` | VSAM | — | 13 |

<details><summary><code>LES_EMP_DETAIL_LEAVE_TBL</code> — 15 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `LEAVE_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `LEAVE_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `LEAVE_PRIOR_YEAR_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `LEAVE_EARNED_CPP` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `LEAVE_EARNED_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 10 | `LEAVE_USED_CPP` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `LEAVE_USED_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `LEAVE_DONATED` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `LEAVE_CURR_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `LEAVE_USE_OR_LOSE_TERM_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 15 | `LEAVE_USE_OR_LOSE_TERM_BAL_HRS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_T_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `TIME_ATTEND_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `LEAVE_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `LEAVE_TAKEN_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `LEAVE_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_M_TBL</code> — 6 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `REMARK_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `REMARK_TEXT` | varchar2 | 90 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_D_TBL</code> — 13 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `DEDUCTION_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `DEDUCTION_1_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `DEDUCTION_1_CODE` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 8 | `DEDUCTION_1_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `DEDUCTION_1_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 10 | `DEDUCTION_2_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 11 | `DEDUCTION_2_CODE` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 12 | `DEDUCTION_2_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `DEDUCTION_2_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_U_TBL</code> — 11 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `EMPLOYER_CONTR_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `EMPLOYER_CONTR_1_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `EMPLOYER_CONTR_1_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `EMPLOYER_CONTR_1_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `EMPLOYER_CONTR_2_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 10 | `EMPLOYER_CONTR_2_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `EMPLOYER_CONTR_2_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_L_TBL</code> — 15 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `LEAVE_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `LEAVE_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `LEAVE_PRIOR_YEAR_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `LEAVE_EARNED_CPP` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `LEAVE_EARNED_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 10 | `LEAVE_USED_CPP` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `LEAVE_USED_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `LEAVE_DONATED` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `LEAVE_CURR_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `LEAVE_USE_OR_LOSE_TERM_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 15 | `LEAVE_USE_OR_LOSE_TERM_BAL_HRS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_R_TBL</code> — 14 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `RETRO_ACTIVE_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `RETRO_ACTIVE_EARN_NAME1` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `RETRO_ACTIVE_EARN_NAME1_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `RETRO_ACTIVE_EARN_NAME1_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `RETRO_ACTIVE_EARN_NAME2` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 10 | `RETRO_ACTIVE_EARN_NAME2_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `RETRO_ACTIVE_EARN_NAME2_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `RETRO_ACTIVE_EARN_NAME3` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 13 | `RETRO_ACTIVE_EARN_NAME3_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `RETRO_ACTIVE_EARN_NAME3_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMPLOYEE_DETAIL</code> — 5 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RECORD_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 2 | `SOCIAL_SECURITY_NUMBER` | string | 9 | 0 | NOT A KEY | NULL |
| 3 | `LES_NUMBER` | string | 7 | 0 | NOT A KEY | NULL |
| 4 | `LES_DELIVERY_INDICATOR` | string | 1 | 0 | NOT A KEY | NULL |
| 5 | `FILLER` | string | 96 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_C_TBL</code> — 14 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `CURR_EARN_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `CURR_EARN_NAME1` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `CURR_EARN_NAME1_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `CURR_EARN_NAME1_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `CURR_EARN_NAME2` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 10 | `CURR_EARN_NAME2_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `CURR_EARN_NAME2_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `CURR_EARN_NAME3` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 13 | `CURR_EARN_NAME3_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `CURR_EARN_NAME3_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_NIH_EMPLOYEE_SUMMARY_TBL</code> — 4 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 3 | `LES_NUMBER` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 4 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>ERROR_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_PRIMARY_DATA_TBL</code> — 90 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 6 | `HDR_LOC_ID` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 7 | `HDR_LOC_NAME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 8 | `SYSTEM_ID` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 9 | `TRANSMISSION_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 11 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 12 | `TK_NUM` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 13 | `LES_DELIVERY_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 15 | `EMPLOYEE_NAME` | varchar2 | 150 | 0 | NOT A KEY | NULL |
| 16 | `PAY_PLAN_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 17 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `STEP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 19 | `HRLY_RATE` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 20 | `BASE_OT_RATE` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 21 | `BASE_PAY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 22 | `LOCALITY_ADJ` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 23 | `ADJ_BASE_PAY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 24 | `LOCALITY_PERCENTAGE` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 25 | `FLSA_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `LV_SCD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 27 | `MIL_LV_CARRY` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 28 | `LV_YR_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 29 | `LAST_INCREASE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `NET_PAY_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 31 | `ALLOT1_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 32 | `ALLOT2_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 33 | `FEDERAL_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 34 | `FED_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `FED_EXCEPTIONS` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 36 | `FED_ADDNL_WITHHOLDING` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 37 | `STATE1_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 38 | `STATE1_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `STATE1_EXCEPTIONS` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 40 | `STATE1_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 41 | `STATE2_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 42 | `STATE2_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `STATE2_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 44 | `STATE2_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 45 | `LOCAL1_TAX` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 46 | `LOCAL1_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 47 | `LOCAL1_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 48 | `LOCAL1_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 49 | `LOCAL1_TAX_NAME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 50 | `LOCAL2_TAX` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 51 | `LOCAL2_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `LOCAL2_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 53 | `LOCAL2_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 54 | `LOCAL2_TAX_NAME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 55 | `CSRS` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 56 | `CSRS_CUM_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 57 | `BIWEEKLY_AMT` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 58 | `BIWEEKLY_ANNUITY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 59 | `MILITARY_DEPOSIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 60 | `MIL_DEPOSIT_PAID` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 61 | `MIL_DEPOSIT_2` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `MIL_DEPOSIT_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 63 | `GROSS_PAY_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 64 | `GROSS_PAY_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 65 | `TAXABLE_WAGE_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 66 | `TAXABLE_WAGE_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 67 | `NONTAXABLE_WAGE_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 68 | `NONTAXABLE_WAGE_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 69 | `TAX_DEFERRED_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 70 | `TAX_DEFERRED_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 71 | `DEDUCTION_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 72 | `DEDUCTION_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 73 | `ADV_ERND_INCOME_CREDIT_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 74 | `NET_PAY_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 75 | `NET_PAY_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 76 | `TSP_SAVINGS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 77 | `TSP_SAVINGS_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 78 | `TITLEG_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 79 | `TITLEG_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 80 | `TITLEF_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 81 | `TITLEF_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 82 | `TITLEC_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 83 | `TITLEC_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 84 | `ROTH_SAVINGS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 85 | `ROTH_SAVINGS_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 86 | `EARNINGS_FOR_CURR_TSP` | varchar2 | 35 | 0 | NOT A KEY | NULL |
| 87 | `EARNINGS_FOR_CURR_TSP_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 88 | `EARNINGS_FOR_YTD_TSP` | varchar2 | 35 | 0 | NOT A KEY | NULL |
| 89 | `EARNINGS_FOR_YTD_TSP_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 90 | `REMARK_TEXT` | varchar2 | 4000 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_D</code> — 11 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_LES_DEDUCTIONS` |  |  |  | — | — |
| 2 | `WS_DED_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_DED_NAME1` | string | 12 | 0 | NOT A KEY | NULL |
| 4 | `WS_DED_CODE1` | string | 7 | 0 | NOT A KEY | NULL |
| 5 | `WS_DED_AMT1` | number | 7 | 2 | NOT A KEY | NULL |
| 6 | `WS_DED_AMT_YTD1` | number | 9 | 2 | NOT A KEY | NULL |
| 7 | `WS_DED_NAME2` | string | 12 | 0 | NOT A KEY | NULL |
| 8 | `WS_DED_CODE2` | string | 7 | 0 | NOT A KEY | NULL |
| 9 | `WS_DED_AMT2` | number | 7 | 2 | NOT A KEY | NULL |
| 10 | `WS_DED_AMT_YTD2` | number | 9 | 2 | NOT A KEY | NULL |
| 11 | `WS_DED_FILLER` | string | 43 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_2</code> — 16 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RECORD_2` |  |  |  | — | — |
| 2 | `WS_LES_REC_TYPE2` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_LES_NETPAY_FINORG` | string | 27 | 0 | NOT A KEY | NULL |
| 4 | `WS_LES_ALLT1_FINORG` | string | 27 | 0 | NOT A KEY | NULL |
| 5 | `WS_LES_ALLT2_FINORG` | string | 27 | 0 | NOT A KEY | NULL |
| 6 | `WS_LES_FED_TIT` | string | 3 | 0 | NOT A KEY | NULL |
| 7 | `WS_LES_FED_MS` | string | 1 | 0 | NOT A KEY | NULL |
| 8 | `WS_LES_FED_ITW_XMP` | number | 2 | 0 | NOT A KEY | NULL |
| 9 | `WS_LES_FED_ADDTL` | number | 4 | 0 | NOT A KEY | NULL |
| 10 | `WS_LES_ST_TX1_TIT` | string | 3 | 0 | NOT A KEY | NULL |
| 11 | `WS_LES_ST_TX1_MS` | string | 1 | 0 | NOT A KEY | NULL |
| 12 | `WS_LES_ST_TX1_XMP` | string | 6 | 0 | NOT A KEY | NULL |
| 13 | `WS_LES_ST_TX1_ADDTL` | number | 4 | 0 | NOT A KEY | NULL |
| 14 | `WS_LES_ST_TX2_TIT` | string | 3 | 0 | NOT A KEY | NULL |
| 15 | `WS_LES_ST_TX2_MS` | string | 1 | 0 | NOT A KEY | NULL |
| 16 | `WS_LES_FILLER2` | string | 4 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_T</code> — 6 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_LES_TA` |  |  |  | — | — |
| 2 | `WS_TA_RECORD_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_TA_LV_NAME` | string | 12 | 0 | NOT A KEY | NULL |
| 4 | `WS_TA_LV_DATE_TAKEN` | string | 6 | 0 | NOT A KEY | NULL |
| 5 | `WS_TA_LV_HOURS` | number | 4 | 2 | NOT A KEY | NULL |
| 6 | `WS_TA_FILLER` | string | 91 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_4_TBL</code> — 17 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `MIL_DEPOSIT_PAID` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 6 | `MIL_DEPOSIT_2` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 7 | `MIL_DEPOSIT_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `GROSS_PAY_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `GROSS_PAY_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 10 | `TAXABLE_WAGE_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `TAXABLE_WAGE_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `NONTAXABLE_WAGE_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `NONTAXABLE_WAGE_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `TAX_DEFERRED_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 15 | `TAX_DEFERRED_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 16 | `DEDUCTION_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 17 | `DEDUCTION_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_2_TBL</code> — 17 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `NET_PAY_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 6 | `ALLOT1_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 7 | `ALLOT2_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 8 | `FEDERAL_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 9 | `FED_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 10 | `FED_EXCEPTIONS` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 11 | `FED_ADDNL_WITHHOLDING` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 12 | `STATE1_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 13 | `STATE1_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `STATE1_EXCEPTIONS` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 15 | `STATE1_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 16 | `STATE2_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 17 | `STATE2_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_1_TBL</code> — 21 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 6 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 7 | `EMPLOYEE_NAME` | varchar2 | 150 | 0 | NOT A KEY | NULL |
| 8 | `PAY_PLAN_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 9 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 10 | `STEP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 11 | `HRLY_RATE` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `BASE_OT_RATE` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `BASE_PAY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `LOCALITY_ADJ` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 15 | `ADJ_BASE_PAY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 16 | `LOCALITY_PERCENTAGE` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 17 | `FLSA_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 18 | `LV_SCD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 19 | `MIL_LV_CARRY` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 20 | `LV_YR_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 21 | `LAST_INCREASE_DTE` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_3_TBL</code> — 21 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `STATE2_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 6 | `STATE2_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `LOCAL1_TAX` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 8 | `LOCAL1_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `LOCAL1_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 10 | `LOCAL1_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 11 | `LOCAL1_TAX_NAME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 12 | `LOCAL2_TAX` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 13 | `LOCAL2_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `LOCAL2_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 15 | `LOCAL2_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 16 | `LOCAL2_TAX_NAME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 17 | `CSRS` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 18 | `CSRS_CUM_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 19 | `BIWEEKLY_AMT` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 20 | `BIWEEKLY_ANNUITY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 21 | `MILITARY_DEPOSIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_6_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `EARNINGS_FOR_CURR_TSP` | varchar2 | 35 | 0 | NOT A KEY | NULL |
| 6 | `EARNINGS_FOR_CURR_TSP_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 7 | `EARNINGS_FOR_YTD_TSP` | varchar2 | 35 | 0 | NOT A KEY | NULL |
| 8 | `EARNINGS_FOR_YTD_TSP_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_5_TBL</code> — 18 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `ADV_ERND_INCOME_CREDIT_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 6 | `ADV_ERND_INCOME_CREDIT_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 7 | `NET_PAY_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `NET_PAY_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `TSP_SAVINGS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 10 | `TSP_SAVINGS_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `TITLEG_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 12 | `TITLEG_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `TITLEF_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 14 | `TITLEF_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 15 | `TITLEC_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 16 | `TITLEC_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 17 | `ROTH_SAVINGS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 18 | `ROTH_SAVINGS_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_3</code> — 20 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RECORD_3` |  |  |  | — | — |
| 2 | `WS_LES_REC_TYPE3` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_LES_ST_TX2_XMP` | string | 6 | 0 | NOT A KEY | NULL |
| 4 | `WS_LES_ST_TX2_ADDTL` | number | 4 | 0 | NOT A KEY | NULL |
| 5 | `WS_LES_LC_TX1_TIT` | string | 6 | 0 | NOT A KEY | NULL |
| 6 | `WS_LES_LC_TX1_MS` | string | 1 | 0 | NOT A KEY | NULL |
| 7 | `WS_LES_LC_TX1_XMP` | string | 6 | 0 | NOT A KEY | NULL |
| 8 | `WS_LES_LC_TX1_ADDTL` | number | 4 | 0 | NOT A KEY | NULL |
| 9 | `WS_LES_LC_TX1_NME` | string | 15 | 0 | NOT A KEY | NULL |
| 10 | `WS_LES_LC_TX2_TIT` | string | 6 | 0 | NOT A KEY | NULL |
| 11 | `WS_LES_LC_TX2_MS` | string | 1 | 0 | NOT A KEY | NULL |
| 12 | `WS_LES_LC_TX2_XMP` | string | 6 | 0 | NOT A KEY | NULL |
| 13 | `WS_LES_LC_TX2_ADDTL` | number | 4 | 0 | NOT A KEY | NULL |
| 14 | `WS_LES_LC_TX2_NME` | string | 15 | 0 | NOT A KEY | NULL |
| 15 | `WS_LES_CSRS_TIT` | string | 5 | 0 | NOT A KEY | NULL |
| 16 | `WS_LES_CSRS_CUMM_AMT` | number | 9 | 2 | NOT A KEY | NULL |
| 17 | `WS_LES_BIWK_TIT` | string | 12 | 0 | NOT A KEY | NULL |
| 18 | `WS_LES_BIWK_ANNTY` | number | 6 | 2 | NOT A KEY | NULL |
| 19 | `WS_LES_MILDPS_TIT` | string | 5 | 0 | NOT A KEY | NULL |
| 20 | `WS_LES_FILLER3` | string | 2 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_0</code> — 11 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_LES_HEADER` |  |  |  | — | — |
| 2 | `RECORD_TYPE` | string | 1 | 0 | NOT A KEY | NULL |
| 3 | `PPD_END_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 4 | `HEADER_LOC_ID` | string | 3 | 0 | NOT A KEY | NULL |
| 5 | `HEADER_LOC_NAME` | string | 27 | 0 | NOT A KEY | NULL |
| 6 | `SYSTEM_ID` | string | 5 | 0 | NOT A KEY | NULL |
| 7 | `TRANSMISSION_CENTURY` | string | 2 | 0 | NOT A KEY | NULL |
| 8 | `TRANSMISSION_YEAR` | string | 2 | 0 | NOT A KEY | NULL |
| 9 | `TRANSMISSION_MONTH` | string | 2 | 0 | NOT A KEY | NULL |
| 10 | `TRANSMISSION_DAY` | string | 2 | 0 | NOT A KEY | NULL |
| 11 | `HEADER_FILLER` | string | 63 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_5</code> — 18 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RECORD_5` |  |  |  | — | — |
| 2 | `WS_LES_REC_TYPE5` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_LES_AEI_AMT` | number | 8 | 2 | NOT A KEY | NULL |
| 4 | `WS_LES_AEI_AMT_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 5 | `WS_LES_AEI_AMT_YTD_RDF` | string | 9 | 0 | NOT A KEY | NULL |
| 6 | `WS_LES_NET_PAY_AMT` | number | 8 | 2 | NOT A KEY | NULL |
| 7 | `WS_LES_NET_PAY_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 8 | `WS_LES_XVX7_TITLE` | string | 11 | 0 | NOT A KEY | NULL |
| 9 | `WS_LES_XVX7_PCT` | number | 3 | 0 | NOT A KEY | NULL |
| 10 | `WS_LES_GA_TIT` | string | 8 | 0 | NOT A KEY | NULL |
| 11 | `WS_LES_GA_PCT` | number | 3 | 0 | NOT A KEY | NULL |
| 12 | `WS_LES_FB_TIT` | string | 8 | 0 | NOT A KEY | NULL |
| 13 | `WS_LES_FB_PCT` | number | 3 | 0 | NOT A KEY | NULL |
| 14 | `WS_LES_CC_TIT` | string | 8 | 0 | NOT A KEY | NULL |
| 15 | `WS_LES_CC_PCT` | number | 3 | 0 | NOT A KEY | NULL |
| 16 | `WS_LES_ROTH_SV` | string | 11 | 0 | NOT A KEY | NULL |
| 17 | `WS_LES_ROTH_SV_PCT` | number | 3 | 0 | NOT A KEY | NULL |
| 18 | `WS_LES_FILLER5` | string | 18 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_1</code> — 20 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RECORD_1` |  |  |  | — | — |
| 2 | `WS_LES_REC_TYPE1` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_LES_PPD_END_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 4 | `WS_LES_PAY_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 5 | `WS_LES_EYE_NME` | string | 27 | 0 | NOT A KEY | NULL |
| 6 | `WS_LES_PAY_PLAN` | string | 3 | 0 | NOT A KEY | NULL |
| 7 | `WS_LES_PAY_GRADE` | string | 2 | 0 | NOT A KEY | NULL |
| 8 | `WS_LES_PAY_STEP` | string | 2 | 0 | NOT A KEY | NULL |
| 9 | `WS_LES_HRLY_RATE` | number | 5 | 2 | NOT A KEY | NULL |
| 10 | `WS_LES_BASIC_OT_RATE` | number | 5 | 2 | NOT A KEY | NULL |
| 11 | `WS_LES_BASIC_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 12 | `WS_LES_LOCAL_ADJ` | number | 8 | 2 | NOT A KEY | NULL |
| 13 | `WS_LES_ADJ_BASIC_PAY` | number | 9 | 2 | NOT A KEY | NULL |
| 14 | `WS_LES_LOCAL_PCT` | number | 4 | 2 | NOT A KEY | NULL |
| 15 | `WS_LES_FLSA` | string | 1 | 0 | NOT A KEY | NULL |
| 16 | `WS_LES_SCD_LEAVE_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 17 | `WS_LES_MAX_LV_CRY` | number | 4 | 0 | NOT A KEY | NULL |
| 18 | `WS_LES_LV_YR_END_DT` | string | 6 | 0 | NOT A KEY | NULL |
| 19 | `WS_LES_DATE_LST_INC` | string | 6 | 0 | NOT A KEY | NULL |
| 20 | `WS_LES_FILLER1` | string | 4 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_4</code> — 17 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RECORD_4` |  |  |  | — | — |
| 2 | `WS_LES_REC_TYPE4` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_LES_MILDPS_PD` | number | 8 | 2 | NOT A KEY | NULL |
| 4 | `WS_LES_MILDPS_TIT2` | string | 5 | 0 | NOT A KEY | NULL |
| 5 | `WS_LES_MILDPS_OWED` | number | 9 | 2 | NOT A KEY | NULL |
| 6 | `WS_LES_MILDPS_OWED_RDF` | string | 9 | 0 | NOT A KEY | NULL |
| 7 | `WS_LES_GRS_PAY_AMT` | number | 8 | 2 | NOT A KEY | NULL |
| 8 | `WS_LES_GRS_PAY_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 9 | `WS_LES_TAX_WGE_AMT` | number | 8 | 2 | NOT A KEY | NULL |
| 10 | `WS_LES_TAX_WGE_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 11 | `WS_LES_NTAX_WGE_AMT` | number | 8 | 2 | NOT A KEY | NULL |
| 12 | `WS_LES_NTAX_WGE_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 13 | `WS_LES_DEF_TAX_AMT` | number | 8 | 2 | NOT A KEY | NULL |
| 14 | `WS_LES_DEF_TAX_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 15 | `WS_LES_DED_TAX_AMT` | number | 8 | 2 | NOT A KEY | NULL |
| 16 | `WS_LES_DED_TAX_YTD` | number | 9 | 2 | NOT A KEY | NULL |
| 17 | `WS_LES_FILLER4` | string | 6 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_HEADER_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `HDR_LOC_ID` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 5 | `HDR_LOC_NAME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 6 | `SYSTEM_ID` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 7 | `TRANSMISSION_DTE` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_E</code> — 9 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_EMPLOYEE_LINE` |  |  |  | — | — |
| 2 | `WS_EMP_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_EMP_EYE_ID` |  |  |  | — | — |
| 4 | `WS_SSN3` | string | 3 | 0 | NOT A KEY | NULL |
| 5 | `WS_SSN2` | string | 2 | 0 | NOT A KEY | NULL |
| 6 | `WS_SSN4` | string | 4 | 0 | NOT A KEY | NULL |
| 7 | `WS_EMP_LES_NUM` | string | 7 | 0 | NOT A KEY | NULL |
| 8 | `WS_EMP_LES_DELIVERY_IDC` | string | 1 | 0 | NOT A KEY | NULL |
| 9 | `WS_EMP_FILLER` | string | 96 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_R</code> — 13 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_LES_RETRO_EARNINGS` |  |  |  | — | — |
| 2 | `WS_RETR_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_RETR_ERN_NAME1` | string | 12 | 0 | NOT A KEY | NULL |
| 4 | `WS_RETR_HRS_DAYS1` | number | 8 | 2 | NOT A KEY | NULL |
| 5 | `WS_RETR_HRS_DAYS1_RDF` | string | 8 | 0 | NOT A KEY | NULL |
| 6 | `WS_RETR_AMT1` | number | 9 | 2 | NOT A KEY | NULL |
| 7 | `WS_RETR_ERN_NAME2` | string | 12 | 0 | NOT A KEY | NULL |
| 8 | `WS_RETR_HRS_DAYS2` | number | 8 | 2 | NOT A KEY | NULL |
| 9 | `WS_RETR_AMT2` | number | 9 | 2 | NOT A KEY | NULL |
| 10 | `WS_RETR_ERN_NAME3` | string | 12 | 0 | NOT A KEY | NULL |
| 11 | `WS_RETR_HRS_DAYS3` | number | 8 | 2 | NOT A KEY | NULL |
| 12 | `WS_RETR_AMT3` | number | 9 | 2 | NOT A KEY | NULL |
| 13 | `WS_RETR_FILLER` | string | 26 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_U</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_LES_EMPLOYER_CONT` |  |  |  | — | — |
| 2 | `WS_EMPLR_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_EMPLR_CONT_NAME1` | string | 12 | 0 | NOT A KEY | NULL |
| 4 | `WS_EMPLR_CONT_AMT1` | number | 7 | 2 | NOT A KEY | NULL |
| 5 | `WS_EMPLR_CONT_AMT1_RDF` | string | 7 | 0 | NOT A KEY | NULL |
| 6 | `WS_EMPLR_CONT_AMT_YTD1` | number | 9 | 2 | NOT A KEY | NULL |
| 7 | `WS_EMPLR_CONT_NAME2` | string | 12 | 0 | NOT A KEY | NULL |
| 8 | `WS_EMPLR_CONT_AMT2` | number | 7 | 2 | NOT A KEY | NULL |
| 9 | `WS_EMPLR_CONT_AMT_YTD2` | number | 9 | 2 | NOT A KEY | NULL |
| 10 | `WS_EMPLR_CONT_FILLER` | string | 57 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_L</code> — 13 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_LES_LEAVE` |  |  |  | — | — |
| 2 | `WS_LV_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_LV_NAME` | string | 12 | 0 | NOT A KEY | NULL |
| 4 | `WS_LV_PRIOR_YR_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 5 | `WS_LV_PRIOR_YR_BAL_RDF` | string | 7 | 0 | NOT A KEY | NULL |
| 6 | `WS_LV_ACCR_PP` | number | 5 | 2 | NOT A KEY | NULL |
| 7 | `WS_LV_ACCR_YTD` | number | 6 | 2 | NOT A KEY | NULL |
| 8 | `WS_LV_USED_CURR_PP` | number | 6 | 2 | NOT A KEY | NULL |
| 9 | `WS_LV_USED_YTD` | number | 6 | 2 | NOT A KEY | NULL |
| 10 | `WS_LV_DONATE_RET` | number | 7 | 2 | NOT A KEY | NULL |
| 11 | `WS_LV_CURR_BAL` | number | 7 | 2 | NOT A KEY | NULL |
| 12 | `WS_LV_TERM_DATE` | string | 14 | 0 | NOT A KEY | NULL |
| 13 | `WS_LV_FILLER` | string | 43 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_6</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RECORD_6` |  |  |  | — | — |
| 2 | `WS_LES_REC_TYPE6` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_LES_VHVM_TITLE` | string | 34 | 0 | NOT A KEY | NULL |
| 4 | `WS_LES_VHVM_AMT` | number | 7 | 2 | NOT A KEY | NULL |
| 5 | `WS_LES_VHVM_TITLE_YTD` | string | 34 | 0 | NOT A KEY | NULL |
| 6 | `WS_LES_VHVM_AMT_YTD` | number | 8 | 2 | NOT A KEY | NULL |
| 7 | `WS_LES_FILLER6` | string | 30 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_M</code> — 4 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_LES_REMARKS` |  |  |  | — | — |
| 2 | `WS_RMK_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_RMK_MSG` | string | 90 | 0 | NOT A KEY | NULL |
| 4 | `WS_RMK_FILLER` | string | 23 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_TBL</code> — 5 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `LES_DELIVERY_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>EMP_REC_TYPE_C</code> — 13 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `WS_LES_CURRENT_EARNINGS` |  |  |  | — | — |
| 2 | `WS_CURR_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 3 | `WS_CURR_ERN_NAME1` | string | 12 | 0 | NOT A KEY | NULL |
| 4 | `WS_CURR_HRS_DAYS1` | number | 8 | 2 | NOT A KEY | NULL |
| 5 | `WS_CURR_HRS_DAYS1_RDF` | string | 8 | 0 | NOT A KEY | NULL |
| 6 | `WS_CURR_AMT1` | number | 9 | 2 | NOT A KEY | NULL |
| 7 | `WS_CURR_ERN_NAME2` | string | 12 | 0 | NOT A KEY | NULL |
| 8 | `WS_CURR_HRS_DAYS2` | number | 8 | 2 | NOT A KEY | NULL |
| 9 | `WS_CURR_AMT2` | number | 9 | 2 | NOT A KEY | NULL |
| 10 | `WS_CURR_ERN_NAME3` | string | 12 | 0 | NOT A KEY | NULL |
| 11 | `WS_CURR_HRS_DAYS3` | number | 8 | 2 | NOT A KEY | NULL |
| 12 | `WS_CURR_AMT3` | number | 9 | 2 | NOT A KEY | NULL |
| 13 | `WS_CURR_FILLER` | string | 26 | 0 | NOT A KEY | NULL |

</details>

### Pay_Calendar

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

### Pseudossn

| Source Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `PSEUDOSSN_FROM_SDA_TBL` | Oracle | INFO_TARGET_DEV | 63 |
| `PSEUDOSSN_FILE_TK_NUM` | Flat File | — | 67 |
| `PAY_PERIOD` | Oracle | HISTDBA | 10 |
| `PSEUDOSSN_TBL` | Oracle | INFO_TARGET_DEV | 63 |
| `PSEUDOSSN_FILE` | Flat File | — | 66 |

<details><summary><code>PSEUDOSSN_FROM_SDA_TBL</code> — 63 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 2 | `CAN_CD` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 3 | `PSEUDOSSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 5 | `EMPL_RCD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 6 | `APPT_NUM` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `EMP_FIRST_NAME` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 8 | `EMP_MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 9 | `EMP_LAST_NAME` | varchar2 | 16 | 0 | NOT A KEY | NOTNULL |
| 10 | `SEX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `VETERANS_PREFERENCE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `TENURE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `POSITION_NUM` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `US_CITIZENSHIP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 15 | `APPT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `HIRE_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 17 | `HANDICAP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `UNF_ALLOW_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 19 | `UNIF_ALLOW_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 20 | `UNIF_ALLOW_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 21 | `RSSSDP` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 22 | `CEIL_REPORTING_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 23 | `FUNCTNL_CLASSFCTN_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `EMP_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `MANAGER_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `POSITION_SENSITIVITY_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `CAREER_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 28 | `CAREER_CONV_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 29 | `PROBATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `ABNORMAL_RATE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `APPT_LIMIT_HRS` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 32 | `APPT_LIMIT_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 33 | `LAST_PAY_CHANGE` | date | 19 | 0 | NOT A KEY | NULL |
| 34 | `CHARITY_AREA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 35 | `CHARITY_EFF_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 36 | `CHARITY_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 37 | `LAST_NOA_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 38 | `QUARTERS_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 39 | `SUBSIST_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 40 | `PAY_BASIS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 41 | `WORK_SCHEDULE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `OCCUPATION_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 43 | `DUTY_STATION` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 44 | `JOB_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `REG_TEMP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `SEPERATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 47 | `PCA_CONTR_EFF_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 48 | `PCA_CONTR_EFF_END_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 49 | `MAX_ANNUAL_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 50 | `PCA_BIWEEKLY_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 51 | `PAY_PLAN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 52 | `APPT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 53 | `SPECIAL_PROGRAM_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 54 | `TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 55 | `EFFECTIVE_DATE` | date | 19 | 0 | NOT A KEY | NOTNULL |
| 56 | `EFFECTIVE_SEQ` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 57 | `PAY_TABL_NO` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 58 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 59 | `DEPTID` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 60 | `PCA_CONTR_LEN_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 61 | `TK_NUM` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NOTNULL |
| 63 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>PSEUDOSSN_FILE_TK_NUM</code> — 67 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 2 | `CAN_CD` | string | 8 | 0 | NOT A KEY | NULL |
| 3 | `PSEUDO_SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 4 | `EIN` | string | 8 | 0 | NOT A KEY | NULL |
| 5 | `EMP_REC_NO` | string | 2 | 0 | NOT A KEY | NULL |
| 6 | `LEGACY_APPT_NO` | string | 2 | 0 | NOT A KEY | NULL |
| 7 | `FIRST_NAME` | string | 11 | 0 | NOT A KEY | NULL |
| 8 | `MIDDLE_INIT` | string | 1 | 0 | NOT A KEY | NULL |
| 9 | `LAST_NAME` | string | 16 | 0 | NOT A KEY | NULL |
| 10 | `SEX` | string | 1 | 0 | NOT A KEY | NULL |
| 11 | `VET_PREF` | string | 1 | 0 | NOT A KEY | NULL |
| 12 | `TENURE_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 13 | `POSITION_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 14 | `CITIZENSHIP_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 15 | `APPT_TYPE_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 16 | `HIRE_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 17 | `HANDICAP_CODE` | string | 2 | 0 | NOT A KEY | NULL |
| 18 | `UNIF_ALLOW_CODE` | string | 3 | 0 | NOT A KEY | NULL |
| 19 | `UNIF_ALLOW_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 20 | `UNIF_ALLOW_AMT` | string | 6 | 0 | NOT A KEY | NULL |
| 21 | `RSSSDP` | string | 4 | 0 | NOT A KEY | NULL |
| 22 | `CEILING_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 23 | `FUNCTION_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 24 | `EMPLOYEE_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 25 | `MANAGER_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 26 | `POSITION_SENS_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 27 | `CAREER_START_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 28 | `CAREER_CONV_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 29 | `PROBATION_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 30 | `ABNORMAL_RATE_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 31 | `APPT_LIMIT_HRS` | string | 7 | 0 | NOT A KEY | NULL |
| 32 | `APPT_LIMIT_PAY` | string | 8 | 0 | NOT A KEY | NULL |
| 33 | `LAST_PAY_CHANGE` | string | 8 | 0 | NOT A KEY | NULL |
| 34 | `CHARITY_AREA_CODE` | string | 3 | 0 | NOT A KEY | NULL |
| 35 | `CHARITY_EFF_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 36 | `CHARITY_DED_AMT` | string | 6 | 0 | NOT A KEY | NULL |
| 37 | `LAST_NOA` | string | 4 | 0 | NOT A KEY | NULL |
| 38 | `FILLER_1` | string | 4 | 0 | NOT A KEY | NULL |
| 39 | `QUARTERS_DEDUCTION` | string | 8 | 0 | NOT A KEY | NULL |
| 40 | `SUBSIST_DEDUCTION` | string | 8 | 0 | NOT A KEY | NULL |
| 41 | `PAY_BASIS` | string | 2 | 0 | NOT A KEY | NULL |
| 42 | `WORK_SCHEDULE` | string | 1 | 0 | NOT A KEY | NULL |
| 43 | `OCCUPATION_CODE` | string | 4 | 0 | NOT A KEY | NULL |
| 44 | `FILLER_2` | string | 3 | 0 | NOT A KEY | NULL |
| 45 | `GEO_LOCATION` | string | 9 | 0 | NOT A KEY | NULL |
| 46 | `JOB_INDICATOR` | string | 1 | 0 | NOT A KEY | NULL |
| 47 | `REG_TEMP` | string | 1 | 0 | NOT A KEY | NULL |
| 48 | `SEPARATION_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 49 | `FILLER_3` | string | 1 | 0 | NOT A KEY | NULL |
| 50 | `PCA_CONTR_EFF_START_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 51 | `PCA_CONTR_EFF_END_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 52 | `MAX_ANNUAL_PAY` | string | 8 | 0 | NOT A KEY | NULL |
| 53 | `PCA_BIWEEKLY_AMOUNT` | string | 8 | 0 | NOT A KEY | NULL |
| 54 | `FILLER_4` | string | 33 | 0 | NOT A KEY | NULL |
| 55 | `PAY_PLAN_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 56 | `APP_LIMIT_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 57 | `SPO_CD` | string | 4 | 0 | NOT A KEY | NULL |
| 58 | `TERM_ID` | string | 2 | 0 | NOT A KEY | NULL |
| 59 | `EFFECTIVE_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 60 | `EFFECTIVE_SEQ` | string | 3 | 0 | NOT A KEY | NULL |
| 61 | `FILLER_5` | string | 9 | 0 | NOT A KEY | NULL |
| 62 | `PAY_TABL_NO` | string | 4 | 0 | NOT A KEY | NULL |
| 63 | `BUSINESS_UNIT` | string | 5 | 0 | NOT A KEY | NULL |
| 64 | `DEPTID` | string | 10 | 0 | NOT A KEY | NULL |
| 65 | `PCA_CONTR_YEAR` | string | 2 | 0 | NOT A KEY | NULL |
| 66 | `FILLER_6` | string | 150 | 0 | NOT A KEY | NULL |
| 67 | `TK_NUM` | string | 5 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `HOLIDAY_1` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `HOLIDAY_2` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PSEUDOSSN_TBL</code> — 63 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 2 | `CAN_CD` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 3 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 5 | `EMPL_RCD` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 6 | `APPT_NUM` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 7 | `EMP_FIRST_NAME` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 8 | `EMP_MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 9 | `EMP_LAST_NAME` | varchar2 | 16 | 0 | NOT A KEY | NOTNULL |
| 10 | `SEX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `VETERANS_PREFERENCE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `TENURE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `POSITION_NUM` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `US_CITIZENSHIP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 15 | `APPT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `HIRE_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 17 | `HANDICAP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `UNF_ALLOW_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 19 | `UNIF_ALLOW_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 20 | `UNIF_ALLOW_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 21 | `RSSSDP` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 22 | `CEIL_REPORTING_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 23 | `FUNCTNL_CLASSFCTN_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `EMP_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `MANAGER_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `POSITION_SENSITIVITY_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `CAREER_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 28 | `CAREER_CONV_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 29 | `PROBATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `ABNORMAL_RATE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `APPT_LIMIT_HRS` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 32 | `APPT_LIMIT_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 33 | `LAST_PAY_CHANGE` | date | 19 | 0 | NOT A KEY | NULL |
| 34 | `CHARITY_AREA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 35 | `CHARITY_EFF_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 36 | `CHARITY_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 37 | `LAST_NOA_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 38 | `QUARTERS_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 39 | `SUBSIST_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 40 | `PAY_BASIS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 41 | `WORK_SCHEDULE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `OCCUPATION_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 43 | `DUTY_STATION` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 44 | `JOB_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `REG_TEMP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `SEPERATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 47 | `PCA_CONTR_EFF_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 48 | `PCA_CONTR_EFF_END_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 49 | `MAX_ANNUAL_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 50 | `PCA_BIWEEKLY_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 51 | `PAY_PLAN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 52 | `APPT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 53 | `SPECIAL_PROGRAM_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 54 | `TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 55 | `EFFECTIVE_DATE` | date | 19 | 0 | NOT A KEY | NOTNULL |
| 56 | `EFFECTIVE_SEQ` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 57 | `PAY_TABL_NO` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 58 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 59 | `DEPTID` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 60 | `PCA_CONTR_LEN_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 61 | `TK_NUM` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NOTNULL |
| 63 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>PSEUDOSSN_FILE</code> — 66 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 2 | `CAN_CD` | string | 8 | 0 | NOT A KEY | NULL |
| 3 | `PSEUDO_SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 4 | `EIN` | string | 8 | 0 | NOT A KEY | NULL |
| 5 | `EMP_REC_NO` | string | 2 | 0 | NOT A KEY | NULL |
| 6 | `LEGACY_APPT_NO` | string | 2 | 0 | NOT A KEY | NULL |
| 7 | `FIRST_NAME` | string | 11 | 0 | NOT A KEY | NULL |
| 8 | `MIDDLE_INIT` | string | 1 | 0 | NOT A KEY | NULL |
| 9 | `LAST_NAME` | string | 16 | 0 | NOT A KEY | NULL |
| 10 | `SEX` | string | 1 | 0 | NOT A KEY | NULL |
| 11 | `VET_PREF` | string | 1 | 0 | NOT A KEY | NULL |
| 12 | `TENURE_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 13 | `POSITION_CD` | string | 1 | 0 | NOT A KEY | NULL |
| 14 | `CITIZENSHIP_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 15 | `APPT_TYPE_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 16 | `HIRE_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 17 | `HANDICAP_CODE` | string | 2 | 0 | NOT A KEY | NULL |
| 18 | `UNIF_ALLOW_CODE` | string | 3 | 0 | NOT A KEY | NULL |
| 19 | `UNIF_ALLOW_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 20 | `UNIF_ALLOW_AMT` | string | 6 | 0 | NOT A KEY | NULL |
| 21 | `RSSSDP` | string | 4 | 0 | NOT A KEY | NULL |
| 22 | `CEILING_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 23 | `FUNCTION_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 24 | `EMPLOYEE_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 25 | `MANAGER_STATUS` | string | 1 | 0 | NOT A KEY | NULL |
| 26 | `POSITION_SENS_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 27 | `CAREER_START_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 28 | `CAREER_CONV_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 29 | `PROBATION_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 30 | `ABNORMAL_RATE_CODE` | string | 1 | 0 | NOT A KEY | NULL |
| 31 | `APPT_LIMIT_HRS` | string | 7 | 0 | NOT A KEY | NULL |
| 32 | `APPT_LIMIT_PAY` | string | 8 | 0 | NOT A KEY | NULL |
| 33 | `LAST_PAY_CHANGE` | string | 8 | 0 | NOT A KEY | NULL |
| 34 | `CHARITY_AREA_CODE` | string | 3 | 0 | NOT A KEY | NULL |
| 35 | `CHARITY_EFF_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 36 | `CHARITY_DED_AMT` | string | 6 | 0 | NOT A KEY | NULL |
| 37 | `LAST_NOA` | string | 4 | 0 | NOT A KEY | NULL |
| 38 | `FILLER_1` | string | 4 | 0 | NOT A KEY | NULL |
| 39 | `QUARTERS_DEDUCTION` | string | 8 | 0 | NOT A KEY | NULL |
| 40 | `SUBSIST_DEDUCTION` | string | 8 | 0 | NOT A KEY | NULL |
| 41 | `PAY_BASIS` | string | 2 | 0 | NOT A KEY | NULL |
| 42 | `WORK_SCHEDULE` | string | 1 | 0 | NOT A KEY | NULL |
| 43 | `OCCUPATION_CODE` | string | 4 | 0 | NOT A KEY | NULL |
| 44 | `FILLER_2` | string | 3 | 0 | NOT A KEY | NULL |
| 45 | `GEO_LOCATION` | string | 9 | 0 | NOT A KEY | NULL |
| 46 | `JOB_INDICATOR` | string | 1 | 0 | NOT A KEY | NULL |
| 47 | `REG_TEMP` | string | 1 | 0 | NOT A KEY | NULL |
| 48 | `SEPARATION_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 49 | `FILLER_3` | string | 1 | 0 | NOT A KEY | NULL |
| 50 | `PCA_CONTR_EFF_START_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 51 | `PCA_CONTR_EFF_END_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 52 | `MAX_ANNUAL_PAY` | string | 8 | 0 | NOT A KEY | NULL |
| 53 | `PCA_BIWEEKLY_AMOUNT` | string | 8 | 0 | NOT A KEY | NULL |
| 54 | `FILLER_4` | string | 33 | 0 | NOT A KEY | NULL |
| 55 | `PAY_PLAN_CD` | string | 2 | 0 | NOT A KEY | NULL |
| 56 | `APP_LIMIT_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 57 | `SPO_CD` | string | 4 | 0 | NOT A KEY | NULL |
| 58 | `TERM_ID` | string | 2 | 0 | NOT A KEY | NULL |
| 59 | `EFFECTIVE_DATE` | string | 8 | 0 | NOT A KEY | NULL |
| 60 | `EFFECTIVE_SEQ` | string | 3 | 0 | NOT A KEY | NULL |
| 61 | `FILLER_5` | string | 9 | 0 | NOT A KEY | NULL |
| 62 | `PAY_TABL_NO` | string | 4 | 0 | NOT A KEY | NULL |
| 63 | `BUSINESS_UNIT` | string | 5 | 0 | NOT A KEY | NULL |
| 64 | `DEPTID` | string | 10 | 0 | NOT A KEY | NULL |
| 65 | `PCA_CONTR_YEAR` | string | 2 | 0 | NOT A KEY | NULL |
| 66 | `FILLER_6` | string | 150 | 0 | NOT A KEY | NULL |

</details>

---

## TARGET Definitions

### COMPTIME

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `COUNTER_TBL` | Oracle | — | 7 |
| `COMPTIME_MESSAGE_FILE` | Flat File | — | 2 |
| `COMP_TIME_DAILY_TBL` | Oracle | — | 15 |
| `COMP_TIME_DATE_FILE` | Flat File | — | 1 |

<details><summary><code>COUNTER_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RUN_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 2 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 3 | `COUNTER_DESCRIPTION` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 4 | `COUNTER_VALUE` | number | 15 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>COMPTIME_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 100 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 300 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>COMP_TIME_DAILY_TBL</code> — 15 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 3 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 4 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 5 | `NAME` | varchar2 | 30 | 0 | NOT A KEY | NULL |
| 6 | `CURRENT_ACCT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 7 | `CURRENT_ORG` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 8 | `FLSA_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `COMP_TIME_CUR_BAL` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 10 | `COMP_TIME_YEAR_EARNED` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 11 | `PP_END_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 12 | `DAILY_DATE_EARNED` | date | 19 | 0 | NOT A KEY | NULL |
| 13 | `COMP_TIME_RATE` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 14 | `COMP_TIME_HOURS` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 15 | `COMP_TIME_UNDEF` | number(p,s) | 6 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>COMP_TIME_DATE_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PAY_PERIOD` | string | 6 | 0 | NOT A KEY | NULL |

</details>

### CPM

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `CPM_PAY_PERIOD_DATE_FILE` | Flat File | — | 1 |
| `CPM_NEWPAY_STG_ALT_TBL` | Oracle | — | 46 |
| `CPM_YTD_HEADER_STG_TBL` | Oracle | — | 7 |
| `CPM_YTD_STATE_STG_TBL` | Oracle | — | 8 |
| `CPM_YTD_DETAIL_STG_TBL` | Oracle | — | 106 |
| `CPM_NEWPAY_STG_YTD_STATE_TBL` | Oracle | — | 19 |
| `CPM_MER_DETAIL_STG_TBL` | Oracle | — | 95 |
| `CPM_MER_HEADER_STG_TBL` | Oracle | — | 7 |
| `CPM_NEWPAY_STG_TYPE_1_2_TBL` | Oracle | — | 262 |
| `ERROR_TBL` | Oracle | — | 8 |
| `CPM_NEWPAY_STG_DETAIL_TBL` | Oracle | — | 22 |
| `CPM_MESSAGE_FILE` | Flat File | — | 2 |
| `COUNTER_TBL` | Oracle | — | 7 |
| `CPM_PM1_STG_TBL` | Oracle | — | 37 |
| `CPM_PM3_STG_TBL` | Oracle | — | 40 |
| `CPM_PM2_STG_TBL` | Oracle | — | 43 |
| `CPM_PMH_STG_TBL` | Oracle | — | 3 |
| `CPM_PAD_HEADER_STG_TBL` | Oracle | — | 8 |
| `CPM_PAD_DETAIL_STG_TBL` | Oracle | — | 150 |
| `GENERIC_TARGET_FILE` | Flat File | — | 1 |
| `CPM_NEWPAY_TBL` | Oracle | — | 499 |
| `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Oracle | — | 246 |
| `CPM_NEWPAY_STG_TYPE_3_TBL` | Oracle | — | 242 |

<details><summary><code>CPM_PAY_PERIOD_DATE_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PAY_PERIOD_TXT` | string | 6 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_ALT_TBL</code> — 46 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 5 | `ALT_1_INST_AC_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 6 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 7 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 8 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 9 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 10 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `ALT_2_INST_ACCT_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 12 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 13 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 14 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 16 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `ALT_4_INST_AC_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 18 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 19 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 20 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 21 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 22 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 23 | `ALT_5_INST_AC_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 24 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 25 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 26 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 27 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 28 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ALT_6_INST_AC_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 30 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 31 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 32 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 33 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 34 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `ALT_7_INST_AC_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 36 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 37 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 38 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 39 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 40 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 41 | `ALT_8_INST_AC_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 42 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 43 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 44 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 45 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 46 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_YTD_HEADER_STG_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `RECORD_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `DFAS_YTD_FILE_NAME` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 5 | `DFAS_YTD_DB_NAME` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 6 | `DFAS_YTD_PPEND_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 7 | `DFAS_YTD_DATE_OF_FILE` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_YTD_STATE_STG_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `RECORD_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `GEN_SEQ_ID` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `DYD_SSN_2` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `DYD_STATE_TAX_CODE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `DYD_STATE_TAX_DEDUC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 8 | `DYD_PAY_SUB_STATE_TAX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_YTD_DETAIL_STG_TBL</code> — 106 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `RECORD_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `DYD_SSN_1` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `DYD_NAME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 6 | `DYD_ORGANIZATION` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 7 | `DYD_ACTIVITY` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 8 | `DYD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 9 | `DYD_ADD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 10 | `DYD_OVERTIME_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 11 | `DYD_NIGHT_DIFF_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `DYD_SUN_PREM_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 13 | `DYD_HOL_PREM_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 14 | `DYD_POST_DIFF_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 15 | `DYD_FOREIGN_ALLOW` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 16 | `DYD_COLA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 17 | `DYD_UNIF_ALLOW` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 18 | `DYD_SEVER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 19 | `DYD_CASH_AWARDS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 20 | `DYD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 21 | `DYD_FEDERAL_TAX_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 22 | `DYD_PAY_SUB_FED_TAX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 23 | `DYD_CSRS_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 24 | `DYD_CSRS_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 25 | `DYD_PAY_SUB_CSRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 26 | `DYD_OASDI_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 27 | `DYD_OASDI_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 28 | `DYD_PAY_SUB_OASDI` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 29 | `DYD_MEDICARE_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 30 | `DYD_MEDICARE_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 31 | `DYD_PAY_SUB_MEDICARE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 32 | `DYD_FERS_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 33 | `DYD_FERS_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 34 | `DYD_PAY_SUB_FERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 35 | `DYD_FEHB_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 36 | `DYD_FEHB_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 37 | `DYD_BOND_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 38 | `DYD_FEGLI_REG` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 39 | `DYD_FEGLI_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 40 | `DYD_FEGLI_OPTA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 41 | `DYD_FEGLI_OPTB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 42 | `DYD_FEGLI_OPTC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 43 | `DYD_CHARITY_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 44 | `DYD_UNION_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 45 | `DYD_ALLOTMENTS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 46 | `DYD_QUARTERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 47 | `DYD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 48 | `DYD_CS_ALIMONY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 49 | `DYD_EIC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 50 | `DYD_PCA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 51 | `DYD_PAY_SUB_TSP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 52 | `DYD_TSP_BASIC_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 53 | `DYD_TSP_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 54 | `DYD_TSP_EMPL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 55 | `DYD_TSP_LOAN_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 56 | `DYD_STAFF_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 57 | `DYD_ON_CALL_TITLE5` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 58 | `DYD_ON_CALL_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 59 | `DYD_OVERTIME_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 60 | `DYD_HOLIDAY_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 61 | `DYD_TOUR_DIFF_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 62 | `DYD_SAT_PREM_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 63 | `DYD_SUN_PREM_TITLE38` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 64 | `DYD_LTC_PREM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 65 | `DYD_DEBT_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 66 | `DYD_PHY_SPEC_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 67 | `DYD_SEP_INCENTIVE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `DYD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 69 | `DYD_RECRUIT_BONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 70 | `DYD_RELOC_BONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 71 | `DYD_RETENT_ALLOW` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 72 | `DYD_CHILD_CARE_SUBSIDY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 73 | `DYD_REL_COMP_LS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 74 | `DYD_CR_HRS_LS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 75 | `DYD_PREPAY_FEHB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 76 | `DYD_FSA_HLTH` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 77 | `DYD_FSA_DC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 78 | `DYD_VISION` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 79 | `DYD_DENTAL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 80 | `DYD_VISION_DENTAL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 81 | `DYD_HEALTH_SAVINGS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 82 | `DYD_TSP_CATCHUP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 83 | `DYD_ENVIR_HAZ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 84 | `DYD_MILITARY_DEPOSIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 85 | `DYD_OTHER_RETIREMENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 86 | `DYD_TEA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 87 | `DYD_PAY_SUB_NAF_RET` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 88 | `DYD_PAY_SUB_OTHER_RET` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 89 | `DYD_RET_DED_SUB_PR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 90 | `DYD_FEHB_DED_SUB_PR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 91 | `DYD_COLA_DED_SUB_PR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 92 | `DYD_ACCUMULATIVE_CSRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 93 | `DYD_ACCUMULATIVE_FERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 94 | `DYD_OASDI_EARNINGS_TRANS_IN` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 95 | `DYD_OASDI_DEDUCT_TRANS_IN` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 96 | `DYD_PRETAX_FEHB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 97 | `DYD_ADMINISTRATIVE_LEAVE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 98 | `DYD_ANNUAL_LEAVE_EARNED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 99 | `DYD_ANNUAL_LEAVE_USED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 100 | `DYD_SICK_LEAVE_EARNED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 101 | `DYD_SICK_LEAVE_USED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 102 | `DYD_MILITARY_LEAVE_EARNED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 103 | `DYD_MILITARY_LEAVE_USED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 104 | `DYD_LWOP_AWOL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `DYD_RESTORED_LEAVE_EARNED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 106 | `DYD_RESTORED_LEAVE_USED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_YTD_STATE_TBL</code> — 19 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 5 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 7 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 8 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 9 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 10 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 11 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 13 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 14 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 16 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 17 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 18 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 19 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_MER_DETAIL_STG_TBL</code> — 95 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `MER_RECTYP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `MER_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `MER_EMP_ACTVTY` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 6 | `MER_ORG` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 7 | `MER_EMPTYPCD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 8 | `MER_ACTION_NATURE_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 9 | `MER_TEMP_PROM_NTE_DT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 10 | `MER_TEMP_DTL_NTE_DT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 11 | `MER_PAY_BASIS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 12 | `MER_PREM_PAY_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `MER_PREM_HRLY_RT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 14 | `MER_ANUITNT_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 15 | `MER_ANUITNT_DIFF_HRLY_RT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 16 | `MER_SPECL_PGM_IND` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 17 | `MER_COLA_HRLY_RT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 18 | `MER_PST_DIFF_NON_FRGN_HRLY_RT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 19 | `MER_MSTR_LV_HIST_EFF_DT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 20 | `MER_SERVICE_COMP_DT_LV` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 21 | `MER_DUTY_ENTRY_DT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 22 | `MER_SEP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `MER_SEP_DT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 24 | `MER_DT_LAST_INCR` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 25 | `MER_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 26 | `MER_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 27 | `MER_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 28 | `MER_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 29 | `MER_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 30 | `MER_FEDTX_WTHOLD_EXEMPTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 31 | `MER_FEDTX_MAR_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `MER_ANN_LV_ACCRUAL_RT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 33 | `MER_ANN_LV_ACCRD_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 34 | `MER_ADVNCD_ANN_LV_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 35 | `MER_ANN_LV_ENDBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 36 | `MER_ANN_LV_BEGBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 37 | `MER_ANN_LV_CEILING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 38 | `MER_ANN_LV_CRED_REDN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 39 | `MER_ANN_LV_FORFEIT_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 40 | `MER_ANN_LV_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 41 | `MER_ANN_LV_USED_PAY_PD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 42 | `MER_COMP_TIME_ENDBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 43 | `MER_COMP_TIME_BEGBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 44 | `MER_COMP_TIME_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 45 | `MER_COMP_TIME_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 46 | `MER_CRED_HRS_ENDBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 47 | `MER_CRED_HRS_BEGBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 48 | `MER_CRED_HRS_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 49 | `MER_CRED_HRS_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 50 | `MER_MIL_LV_ENDBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 51 | `MER_MIL_LV_BEGBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 52 | `MER_MIL_LV_USED_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 53 | `MER_NPAY_HRS_USED_PAY_PD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 54 | `MER_NPAY_HRS_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 55 | `MER_RELG_CMPTM_ENDBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 56 | `MER_RELG_CMPTM_BEGBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 57 | `MER_RELG_CMPTM_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 58 | `MER_RELG_CMPTM_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 59 | `MER_RSTRD_ANN_LV_ENDBAL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 60 | `MER_RSTRD_ANN_LV_ENDBAL_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 61 | `MER_RSTRD_ANN_LV_ENDBAL_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 62 | `MER_SICK_LV_ACCRUAL_RT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 63 | `MER_SICK_LV_ACCRUED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 64 | `MER_ADVNCD_SICK_LV_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 65 | `MER_SICK_LV_ENDBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 66 | `MER_SICK_LV_BEGBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 67 | `MER_SICK_LV_CRED_REDN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 68 | `MER_SICK_LV_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 69 | `MER_SICK_LV_USED_PAY_PD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 70 | `MER_ST_TAX_AUTH_1` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 71 | `MER_ST_TX_EXEMPTS_1` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 72 | `MER_ST_TAX_AUTH_2` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 73 | `MER_ST_TX_EXEMPTS_2` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 74 | `MER_OT_EARN_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 75 | `MER_TOFF_AWRD_BEG_YRGAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 76 | `MER_TOFF_AWRD_AUTHHRS_YTD` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 77 | `MER_TOFF_AWRD_USED_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 78 | `MER_TOFF_AWRD_FORF_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 79 | `MER_TOFF_AWRD_ENDBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 80 | `MER_FF_DIVISOR_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 81 | `MER_ALT_HRLY_RT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 82 | `MER_ALT_HRLY_RT_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 83 | `MER_ALT_ANUITNT_DIFF` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 84 | `MER_ALT_COLA_HRLY_RT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 85 | `MER_ALT_PSTDIFFNFHRLY_RT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 86 | `MER_TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 87 | `MER_TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 88 | `MER_TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `MER_TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 90 | `MER_TVL_COMP_TIME_FORF` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 91 | `MER_BRAC_ENDBAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 92 | `MER_EMER_LV_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 93 | `MER_FROZ_ANN_LV_USED_PAY_PD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 94 | `MER_FROZ_ANN_LV_USED_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 95 | `MER_FROZ_ANN_LV_ENDBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_MER_HEADER_STG_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `RECORD_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `RECORD_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `FILE_ID` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 6 | `PAYROLL_OFFICE_ID_CODE` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 7 | `REPORT_RECIPIENT` | varchar2 | 6 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_TYPE_1_2_TBL</code> — 262 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `FIR_NAME_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 5 | `CODE_CONSL` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `FIR_NAME_3_11` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 7 | `MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 8 | `SURNAME_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 9 | `SURNAME_OTHER` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 10 | `SOC_SEC_NO` | number(p,s) | 11 | 0 | NOT A KEY | NULL |
| 11 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 12 | `OCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 13 | `JOB_LOC_CDE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 14 | `ST_CONT_LOC` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 15 | `CITY_LOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 16 | `CTY_CTRY_LOC` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 17 | `TK_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 18 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 19 | `CAN_FY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 20 | `CAN_AGCY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `CAN_AP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 22 | `CAN_AGCY_ACCT_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 23 | `ORG_CDE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 24 | `ORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `ORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `ORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `ORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `ORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `ORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `ORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `SPOC` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 36 | `SEX_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 37 | `VET_PREF_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `TENURE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `EHRP_EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 40 | `EHRP_EMP_REC_NO` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 41 | `PERM_TEMP_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `FT_PT_INTER_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `CITIZEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 44 | `TYPE_APPT_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `EOD_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 46 | `PHY_HNDCP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 47 | `CEILING_EN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 48 | `FUNC_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 49 | `SUPV_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 50 | `PAY_BASIS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 51 | `POS_SEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `CAR_SERV_DTE` | number(p,s) | 16 | 0 | NOT A KEY | NULL |
| 53 | `PROB_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 54 | `SPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 55 | `ABNOR_RATE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 56 | `FED_RETIRE_CDE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `TSPA_STATUS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `TSPA_VEST_PERIOD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 59 | `EFT_EMPL_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 60 | `EFT_EMPL_ACCT_NUMBER` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 61 | `FS_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 62 | `TSPA_STATUS_CODE_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `TSPA_SCD` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `OT_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 65 | `LOCAL_PCENT_RATE` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 66 | `CPP_LOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 67 | `AGCY_CDE_PER` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 68 | `SEP_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 69 | `SEP_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 70 | `PERS_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 71 | `ANNUAL_SAL` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 72 | `FLSA_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 73 | `CPP_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 74 | `DATE_BIRTH` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 75 | `EFT_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 76 | `EFT_CK_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 77 | `EFT_ROUT_CK_ID` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 78 | `POSITION_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 79 | `POSITION_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 81 | `STEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 82 | `FEGLI_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `FEGLI_CDE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `TOT_FED_TAX_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 85 | `FED_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 86 | `HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 87 | `SEV_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 88 | `HLTH_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 89 | `HLTH_GOVT_SHARE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 90 | `UNION_IDENT_CDE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 91 | `UNION_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 92 | `PCA_BIWEEK_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 93 | `AN_LV_EARNED_CPP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 94 | `SICK_LV_ERN_CPP` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 95 | `COMP_LV_ERN_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 96 | `COMP_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 97 | `ADMIN_LV_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 98 | `LWOP_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 99 | `STAFFING_BIW_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 100 | `INCENT_TIME_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `PSP_BIWKLY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 102 | `REL_COMP_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 103 | `REL_COMP_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 104 | `CR_HRS_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 105 | `CR_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 106 | `FERS_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 107 | `AN_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 108 | `SICK_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 109 | `LV_CAT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 110 | `AN_LV_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 111 | `AN_LV_ERND_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 112 | `AN_LV_ADV_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 113 | `AN_LV_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 114 | `AN_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 115 | `AN_LV_MAX_COVER` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 116 | `AN_LV_USE_LOSE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 117 | `SICK_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 118 | `SICK_LV_ERN_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 119 | `SICK_LV_AD_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 120 | `SICK_LV_USD_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 121 | `SICK_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 122 | `COMP_LV_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 123 | `RESTOR_AL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 124 | `RESTOR_AL_BAL_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 125 | `RESTOR_AL_BAL_2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 126 | `RESTOR_AL_BAL_3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `PSI_START_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 128 | `REL_COMP_CURR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 129 | `CR_HRS_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 130 | `TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 131 | `TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 132 | `TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 133 | `TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `TVL_COMP_FORFEITED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `YTD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 136 | `YTD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `YTD_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `YTD_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 139 | `YTD_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `YTD_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `YTD_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `YTD_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `YTD_SEV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 144 | `YTD_CASH_AWARDS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `YTD_MP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `YTD_LSL_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 147 | `YTD_MISC_OTH_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 148 | `YTD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 149 | `YTD_NON_TAX_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 150 | `YTD_FED_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 151 | `YTD_TAXABLE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 152 | `YTD_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 153 | `YTD_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `YTD_CSR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `YTD_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `YTD_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `YTD_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 158 | `YTD_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `YTD_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `YTD_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 161 | `YTD_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `YTD_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `YTD_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 164 | `YTD_LEVY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 166 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 167 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 169 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 170 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 171 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 172 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 173 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 174 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 175 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 176 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 177 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 178 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 179 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 180 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 181 | `YTD_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 182 | `YTD_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `YTD_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 184 | `YTD_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `YTD_LI_REG_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `YTD_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `YTD_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `YTD_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `YTD_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `YTD_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `YTD_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `YTD_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `YTD_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `YTD_LAUNDRY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `YTD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 196 | `YTD_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `EIC_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `PCA_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 199 | `YTD_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 200 | `YTD_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `YTD_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `YTD_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 203 | `YTD_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `YTD_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `YTD_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 206 | `YTD_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `T38_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 208 | `T38_HOL_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 209 | `T38_ND_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 210 | `T38_ONCALL_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 211 | `T38_SAT_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `T38_SUN_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `YTD_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `YTD_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 215 | `YTD_PSP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `RET_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `YTD_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `YTD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `YTD_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `YTD_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 221 | `YTD_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 222 | `YTD_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 223 | `YTD_CHILD_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 224 | `REL_COMP_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 225 | `CR_HRS_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `YTD_PREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `YTD_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `YTD_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `YTD_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `VIS_DENT_1_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `VIS_DENT_2_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `VIS_DENT_3_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `TRANSFER_IN_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 234 | `TRANSFER_IN_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `FEHB_PC_PRE_TAX_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 236 | `ADMIN_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 237 | `MILITARY_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 238 | `LWOP_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 239 | `RESTOR_AL_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 240 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 241 | `OC_121S_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 242 | `OC_1211_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 243 | `OC_1111_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 244 | `WORK_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 245 | `WORK_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 246 | `WORK_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 247 | `WORK_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 248 | `WORK_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 249 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 250 | `FED_RETIRE_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 251 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 252 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 253 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 254 | `COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 255 | `COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 256 | `COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 257 | `COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `OT_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `REL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `REL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 261 | `REL_COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 262 | `REL_COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>ERROR_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 8 | `ERROR_CODE` | varchar2 | 50 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_DETAIL_TBL</code> — 22 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 5 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 7 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 8 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 9 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 10 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 11 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 12 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 13 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 15 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 18 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 19 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 20 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 21 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 22 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `COUNT_DESC` | string | 50 | 0 | NOT A KEY | NULL |
| 2 | `COUNT_VALUE` | bigint | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>COUNTER_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RUN_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 2 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 3 | `COUNTER_DESCRIPTION` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 4 | `COUNTER_VALUE` | number | 15 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PM1_STG_TBL</code> — 37 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PYF_REC_NO_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `PYF_EYE_ID_1` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_PAY_BLK_1` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 6 | `PYF_EMP_ACT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 7 | `PYF_ORG` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 8 | `PYF_EYE_NME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 9 | `PYF_PMT_MET_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 10 | `PYF_FIN_ORG_RTN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 11 | `PYF_GR_UNGR_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `PYF_DOB_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 13 | `PYF_EYE_AGE_CAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `PYF_GLI_CVG_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 15 | `PYF_MLT_APMT_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `PYF_MS_FED` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `PYF_FITW_ADD_PAY_PD` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 18 | `PYF_FITW_XMP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 19 | `PYF_EYE_TYP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 20 | `PYF_FLSA_XMP_STA` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `PYF_PAY_PN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 22 | `PYF_GR_CIV` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `PYF_PAY_RAT_STP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 24 | `PYF_SRY_BSE_ANL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 25 | `PYF_SRY_HR` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 26 | `PYF_ADR_STR_1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 27 | `PYF_ADR_STR_2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 28 | `PYF_ADR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 29 | `PYF_ADR_ST` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 30 | `PYF_ADR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 31 | `PYF_WALK_SEQ` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 32 | `PYF_CHK_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `PYF_FILLER_RT1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `PYF_SEC_DISB_OFC_RT1` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 35 | `PYF_HIS_PGRANGE_RT1` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 36 | `PYF_DISB_OFC_RT1` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 37 | `PYF_MPH_PGRANGE_RT1` | number(p,s) | 8 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PM3_STG_TBL</code> — 40 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PYF_REC_NO_PDT3` | varchar2 | 1 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PYF_EYE_ID_PDT3` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_GEN_SEQ_ID` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `PYF_PAY_BLK_PDT3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 7 | `PYF_PAY_TAC_TYP` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 8 | `PYF_DATE_EFF` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 9 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 10 | `PYF_OT_ENV_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `PYF_HRS_SCD_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `PYF_ACTUAL_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 13 | `PYF_PAY_RAT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 14 | `PYF_CASH_PMT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `PYF_ADJ_RSN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `PYF_ADJ_DATE_EFF` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 17 | `PYF_ADJ_SYS_GEN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 18 | `PYF_RSN_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 19 | `PFY_ID_BREAK_SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 20 | `PFY_ID_BREAK_CODE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 21 | `PFY_FILLER` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 22 | `PYF_DDU_PYE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 23 | `PYF_ITW_MS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `PYF_ITW_XMP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 25 | `PYF_ITW_ADD` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 26 | `PYF_ALLOW_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `PYF_OFFSET_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `PYF_USER_NME` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 29 | `PYF_ACC_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 30 | `PYF_ACC_TME` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 31 | `PYF_AWD_SEQ_NO` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 32 | `PYF_RETRO_TAXES_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `PYF_RETRO_RETIREMENT_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `PYF_RETRO_OTH_DONE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `PYF_FILLER_PDT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `PYF_FILLER_RT3` | varchar2 | 55 | 0 | NOT A KEY | NULL |
| 37 | `PYF_SEC_DISB_OFC_RT3` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 38 | `PYF_HIS_PGRANGE_RT3` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 39 | `PYF_DISB_OFC_RT3` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 40 | `PYF_MPH_PGRANGE_RT3` | number(p,s) | 8 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PM2_STG_TBL</code> — 43 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PYF_REC_NO_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 4 | `PYF_EYE_ID_2` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_PAY_BLK_2` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 6 | `PYF_AGY_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `PYF_SON` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 8 | `PYF_ACTG_ACT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 9 | `PYF_MAJOR_CLAIMANT` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 10 | `PYF_FIN_ORG_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 11 | `PYF_FIN_ORG_ACCT_TYP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `PYF_TSP_SVC_CMP_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 13 | `PYF_TSP_VEST_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `PYF_TSP_STA_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 15 | `PYF_TSP_STA_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `PYF_TSP_ELG_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 17 | `PYF_RET_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 18 | `PYF_EYE_STA_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 19 | `PYF_SEP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 20 | `PYF_LOC_ADJ` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 21 | `PYF_BSC_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 22 | `PYF_BSC_OT_RAT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 23 | `PYF_LOC_PAY_PCT` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 24 | `PYF_SVC_CMP_DATE_LV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 25 | `PYF_MIL_DEP_OWED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 26 | `PYF_MIL_DEP_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 27 | `PYF_DY_ENT_DATE` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 28 | `PYF_TPY_POS_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `PYF_BWKLY_SCD_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 30 | `PYF_PAY_PN_ID` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `PYF_TAX_STA_FED` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `PYF_EMP_STAT_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `PYF_FILLER_PAY` | varchar2 | 14 | 0 | NOT A KEY | NULL |
| 34 | `PYF_SEP_CD_8` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 35 | `PYF_SEP_DATE_8` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 36 | `PYF_PRIOR_EYE_ID_8` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 37 | `PYF_PRIOR_DOB_DATE_8` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 38 | `PYF_TSP_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `PYF_FILLER_RT2` | varchar2 | 14 | 0 | NOT A KEY | NULL |
| 40 | `PYF_SEC_DISB_OFC_RT2` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 41 | `PYF_HIS_PGRANGE_RT2` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 42 | `PYF_DISB_OFC_RT2` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 43 | `PYF_MPH_PGRANGE_RT2` | number(p,s) | 8 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PMH_STG_TBL</code> — 3 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PYF_REC_PPE_DATE` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PAD_HEADER_STG_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PAD_RECORD_TYPE` | varchar | 1 | 0 | NOT A KEY | NULL |
| 4 | `PAD_PAYROLL_OFFICE_ID_CODE` | varchar | 6 | 0 | NOT A KEY | NULL |
| 5 | `PAD_FILE_ID` | varchar | 8 | 0 | NOT A KEY | NULL |
| 6 | `PAD_PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 7 | `PAD_DISBURSING_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `PAD_QTR_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_PAD_DETAIL_STG_TBL</code> — 150 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PAD_SERVING_AGENCY` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 4 | `PAD_CCPO_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 5 | `PAD_SOC_SEC_NO` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `PAD_RESP_CTR_COST_CTR` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 7 | `PAD_REGULAR_EARNINGS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 8 | `PAD_OVERTIME_EARNINGS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 9 | `PAD_HOLIDAY_PREMIUM_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 10 | `PAD_STNDBY_UNCO_AVAIL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 11 | `PAD_SUNDAY_PREMIUM_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `PAD_NIGHT_DIFFERENTIAL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 13 | `PAD_LUMP_SUM_LEAVE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 14 | `PAD_HAZARDOUS_DUTY_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 15 | `PAD_ENVIRONMENTAL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 16 | `PAD_AWARD_AMOUNT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 17 | `PAD_ANNUAL_LVE_ENDING_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 18 | `PAD_SICK_LVE_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 19 | `PAD_SICK_LVE_ENDING_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 20 | `PAD_EMPLR_CONTR_FEGLI` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 21 | `PAD_EMPLR_CONTR_FEHBA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 22 | `PAD_EMPLR_CONTR_CSRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 23 | `PAD_EMPLR_CONTR_FERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 24 | `PAD_EMPLR_CONTR_TSP_M` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 25 | `PAD_EMPLR_CONTR_TSP_C` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 26 | `PAD_EMPLR_CONTR_TSP_F` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 27 | `PAD_EMPLR_CONTR_FERS_1PERC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 28 | `PAD_EMPLR_CONTR_MEDIC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 29 | `PAD_PAY_PERIOD_END_DATE` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 30 | `PAD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 31 | `PAD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 32 | `PAD_ACTIVITY` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 33 | `PAD_ORGANIZATION` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 34 | `FILLER1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `PAD_REGULAR_HOURS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 36 | `PAD_OVERTIME_HOURS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 37 | `PAD_NIGHT_DIFF_HOURS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 38 | `PAD_ENVR_HAZARD_HOURS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 39 | `PAD_HOLIDAY_PREMIUM_HOURS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 40 | `PAD_STNBY_UNC_AVAIL_HOURS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 41 | `PAD_SUNDAY_PREMIUM_HOURS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 42 | `PAD_ADMIN_LVE_HOURS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 43 | `PAD_SICK_LEAVE_ACCRUED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 44 | `PAD_COMP_TIME_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 45 | `PAD_COMP_TIME_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 46 | `PAD_COMP_TIME_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 47 | `PAD_RELIG_COMP_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 48 | `PAD_RELIG_COMP_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 49 | `PAD_RELIG_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 50 | `PAD_CREDIT_HOURS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 51 | `PAD_CREDIT_HOURS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 52 | `PAD_CREDIT_HOURS_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 53 | `FILLER0` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 54 | `PAD_COLA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 55 | `PAD_REEMP_ANN_OFFSET_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 56 | `PAD_RECRUITMENT_INCENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 57 | `PAD_INTEREST_AMOUNT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 58 | `PAD_TROPICAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 59 | `PAD_BENEFIT_ALLOWANCE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 60 | `PAD_PHYSICIANS_ALLOWANCE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 61 | `PAD_REMOTE_SITE_ALLOWANCE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 62 | `PAD_SEVERANCE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 63 | `PAD_DANGER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 64 | `PAD_EXTRACURR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 65 | `PAD_EXTRA_DUTY_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 66 | `PAD_TRANSFER_ALLOWANCE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 67 | `PAD_EDUC_TRAV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `PAD_TIME_OFF_USED_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 69 | `PAD_TIME_OFF_END_BAL` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 70 | `PAD_AGENCY_CODE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 71 | `PAD_ACCOUNTING_ACTIVITY` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 72 | `PAD_EMPLOYEE_NAME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 73 | `PAD_EMPLOYEE_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 74 | `PAD_PAYROLL_OFFICE_ID` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 75 | `PAD_APPROPRIATION` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 76 | `PAD_US_CODE_IDC` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 77 | `PAD_ASSIGNED_JON_CC_PC` | varchar2 | 18 | 0 | NOT A KEY | NULL |
| 78 | `PAD_FISCAL_YEAR` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 79 | `PAD_PROGRAM_YEAR` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `PAD_FUND_CODE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 81 | `PAD_MILITARY_LVE_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 82 | `PAD_MILITARY_LVE_EARNED_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 83 | `PAD_ANNUAL_LVE_EARNED_PP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 84 | `PAD_PP_NON_PAY_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 85 | `PAD_PP_ANNUAL_LVE_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 86 | `PAD_ANNUAL_LVE_FORFEIT_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 87 | `PAD_SHORE_LVE_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 88 | `PAD_HOME_LVE_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `PAD_LAW_ENFORCE_LVE_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 90 | `PAD_DONATED_LVE_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 91 | `PAD_DONATED_LVE_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 92 | `PAD_TIME_OFF_OLDEST_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 93 | `PAD_TIME_OFF_OLDEST_DATE` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 94 | `PAD_COMP_OLDEST_UNUSED_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 95 | `PAD_COMP_OLDEST_UNUSED_DATE` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 96 | `PAD_COMP_OLDEST_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 97 | `PAD_SEPARATION_INCENTIVE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 98 | `PAD_SUPERVISOR_DIFF_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 99 | `PAD_RECURRING_ALLOWANCES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 100 | `PAD_ONE_TIME_BONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 101 | `PAD_PP_NAF_RETIREMENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 102 | `PAD_PP_401K` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 103 | `PAD_STATE_EMPL_RETIREMENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 104 | `PAD_PROGRAM_ELEM_CODE` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 105 | `PAD_FEGLI_BASIC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 106 | `PAD_FEGLI_OPTIONAL` | number(p,s) | 12 | 2 | NOT A KEY | NULL |
| 107 | `PAD_FEHB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 108 | `PAD_CSRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 109 | `PAD_FERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 110 | `PAD_NON_PAY_HRS_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 111 | `PAD_ANNUAL_LVE_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 112 | `PAD_SICK_LVE_FERS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 113 | `PAD_GROSS_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 114 | `PAD_ADDRESS_STREET_1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 115 | `PAD_ADDRESS_STREET_2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 116 | `PAD_ADDRESS_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 117 | `PAD_ADDRESS_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 118 | `PAD_ADDRESS_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 119 | `PAD_EMPL_ORG_CODE_1` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 120 | `PAD_EMPL_ORG_DEDUCT_AMT_1` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 121 | `PAD_REMARKS_IDC_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 122 | `PAD_EMPL_ORG_CODE_2` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 123 | `PAD_EMPL_ORG_DEDUCT_AMT_2` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 124 | `PAD_REMARKS_IDC_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 125 | `PAD_EMPL_ORG_CODE_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 126 | `PAD_EMPL_ORG_DEDUCT_AMT_3` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 127 | `PAD_REMARKS_IDC_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 128 | `PAD_EMPL_ORG_CODE_4` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 129 | `PAD_EMPL_ORG_DEDUCT_AMT_4` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 130 | `PAD_REMARKS_IDC_4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 131 | `PAD_EMPL_ORG_CODE_5` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 132 | `PAD_EMPL_ORG_DEDUCT_AMT_5` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 133 | `PAD_REMARKS_IDC_5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 134 | `PAD_EMPL_ORG_CODE_6` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 135 | `PAD_EMPL_ORG_DEDUCT_AMT_6` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 136 | `PAD_REMARKS_IDC_6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 137 | `PAD_MILITARY_LVE_USED_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 138 | `PAD_MMD_DDS_SPEC_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 139 | `PAD_RECRUIT_INCENTIVE_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 140 | `PAD_RELOCAT_INCENTIVE_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 141 | `PAD_RETENTN_INCENTIVE_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 142 | `PAD_COMPTIME_TRAVEL_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 143 | `PAD_COMPTIME_TRAVEL_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 144 | `PAD_COMPTIME_TRAVEL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `PAD_BRAC_RESTORED_BEGBAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 146 | `PAD_BRAC_RESTORED_ADDED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 147 | `PAD_BRAC_RESTORED_USED_PAYPD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 148 | `PAD_BRAC_RESTORED_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 149 | `PAD_BRAC_RESTORED_PAID_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 150 | `PAD_BRAC_RESTORED_ENDBAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>GENERIC_TARGET_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_TBL</code> — 499 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LINE_TYPE` | varchar2 | 5 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `FIR_NAME_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `CODE_CONSL` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `FIR_NAME_3_11` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 8 | `MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `SURNAME_3` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 10 | `SURNAME_OTHER` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 11 | `SOC_SEC_NO` | number(p,s) | 11 | 0 | NOT A KEY | NULL |
| 12 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 13 | `OCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 14 | `JOB_LOC_CDE` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 15 | `ST_CONT_LOC` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `CITY_LOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 17 | `CTY_CTRY_LOC` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 18 | `TK_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 19 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 20 | `CAN_FY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `CAN_AGCY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `CAN_AP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `CAN_AGCY_ACCT_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 24 | `ORG_CDE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 25 | `ORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `ORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `ORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `ORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `ORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `ORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `ORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `ORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `SPOC` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 37 | `SEX_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `VET_PREF_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `TENURE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 40 | `EHRP_EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 41 | `EHRP_EMP_REC_NO` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `PERM_TEMP_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `FT_PT_INTER_POS_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 44 | `CITIZEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `TYPE_APPT_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `EOD_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 47 | `PHY_HNDCP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 48 | `CEILING_EN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 49 | `FUNC_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 50 | `SUPV_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 51 | `PAY_BASIS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `POS_SEN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 53 | `CAR_SERV_DTE` | number(p,s) | 16 | 0 | NOT A KEY | NULL |
| 54 | `PROB_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 55 | `SPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 56 | `ABNOR_RATE_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `FED_RETIRE_CDE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `TSPA_STATUS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 59 | `TSPA_VEST_PERIOD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 60 | `EFT_EMPL_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 61 | `EFT_EMPL_ACCT_NUMBER` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 62 | `FS_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `TSPA_STATUS_CODE_DTE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `TSPA_SCD` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 65 | `OT_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 66 | `LOCAL_PCENT_RATE` | number(p,s) | 5 | 4 | NOT A KEY | NULL |
| 67 | `CPP_LOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 68 | `AGCY_CDE_PER` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 69 | `SEP_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 70 | `SEP_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 71 | `PERS_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 72 | `ANNUAL_SAL` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 73 | `FLSA_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 74 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 75 | `CPP_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 76 | `DATE_BIRTH` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 77 | `EFT_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 78 | `EFT_CK_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 79 | `POSITION_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 80 | `POSITION_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 81 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 82 | `STEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `FEGLI_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `FEGLI_CDE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 85 | `TOT_FED_TAX_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 86 | `FED_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 87 | `HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 88 | `SEV_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `HLTH_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 90 | `HLTH_GOVT_SHARE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 91 | `UNION_IDENT_CDE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 92 | `UNION_DED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 93 | `PCA_BIWEEK_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 94 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 95 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 96 | `AN_LV_EARNED_CPP` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 97 | `SICK_LV_ERN_CPP` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 98 | `COMP_LV_ERN_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 99 | `COMP_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 100 | `ADMIN_LV_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `LWOP_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 102 | `STAFFING_BIW_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 103 | `INCENT_TIME_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 104 | `PSP_BIWKLY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `REL_COMP_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 106 | `REL_COMP_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 107 | `CR_HRS_ERND_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 108 | `CR_HRS_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 109 | `FERS_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 110 | `AN_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 111 | `SICK_LV_CR_RED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 112 | `LV_CAT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 113 | `AN_LV_USED_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 114 | `AN_LV_ERND_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 115 | `AN_LV_ADV_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 116 | `AN_LV_USED_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 117 | `AN_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 118 | `AN_LV_MAX_COVER` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 119 | `AN_LV_USE_LOSE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 120 | `SICK_LV_USD_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 121 | `SICK_LV_ERN_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 122 | `SICK_LV_AD_CBAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 123 | `SICK_LV_USD_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 124 | `SICK_LV_CUR_BAL` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 125 | `COMP_LV_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 126 | `RESTOR_AL_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `RESTOR_AL_BAL_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `RESTOR_AL_BAL_2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `RESTOR_AL_BAL_3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `PSI_START_DATE` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 131 | `REL_COMP_CURR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 132 | `CR_HRS_CUR_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 133 | `TVL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `TVL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `TVL_COMP_EARN_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 136 | `TVL_COMP_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `TVL_COMP_FORFEITED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `YTD_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 139 | `YTD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `YTD_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `YTD_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `YTD_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `YTD_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `YTD_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `YTD_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `YTD_SEV_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 147 | `YTD_CASH_AWARDS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `YTD_MP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `YTD_LSL_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `YTD_MISC_OTH_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 151 | `YTD_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 152 | `YTD_NON_TAX_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 153 | `YTD_FED_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `YTD_TAXABLE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `YTD_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `YTD_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `YTD_CSR_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 158 | `YTD_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `YTD_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `YTD_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 161 | `YTD_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `YTD_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `YTD_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 164 | `YTD_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `YTD_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `YTD_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 167 | `YTD_LEVY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `YTD_STATE_1` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 169 | `YTD_ST_TX_1_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 170 | `YTD_ST_TX_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `YTD_ST_TX_1_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 172 | `YTD_STATE_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 173 | `YTD_ST_TX_2_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 174 | `YTD_ST_TX_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `YTD_ST_TX_2_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `YTD_STATE_3` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 177 | `YTD_ST_TX_3_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 178 | `YTD_ST_TX_3_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `YTD_ST_TX_3_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `YTD_STATE_4` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 181 | `YTD_ST_TX_4_CDE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 182 | `YTD_ST_TX_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `YTD_ST_TX_4_GRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 184 | `YTD_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `YTD_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `YTD_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `YTD_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `YTD_LI_REG_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `YTD_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `YTD_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `YTD_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `YTD_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `YTD_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `YTD_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `YTD_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `YTD_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `YTD_LAUNDRY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `YTD_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 199 | `YTD_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 200 | `EIC_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `PCA_YTD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `YTD_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 203 | `YTD_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `YTD_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `YTD_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 206 | `YTD_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `YTD_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `YTD_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 209 | `YTD_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `T38_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 211 | `T38_HOL_OT_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `T38_ND_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `T38_ONCALL_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `T38_SAT_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 215 | `T38_SUN_DIF_PAY_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `YTD_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `YTD_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `YTD_PSP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `RET_BAL_FWD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `YTD_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 221 | `YTD_LSL_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 222 | `YTD_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 223 | `YTD_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 224 | `YTD_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 225 | `YTD_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `YTD_CHILD_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `REL_COMP_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `CR_HRS_LS_PAY_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `YTD_PREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `YTD_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `YTD_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `YTD_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `VIS_DENT_1_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_2_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `VIS_DENT_3_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `TRANSFER_IN_FICA_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 237 | `TRANSFER_IN_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `FEHB_PC_PRE_TAX_YTD` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 239 | `ADMIN_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 240 | `MILITARY_LV_YTD` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 241 | `LWOP_YTD` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 242 | `RESTOR_AL_USED_YTD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 243 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 244 | `OC_121S_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 245 | `OC_1211_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 246 | `OC_1111_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 247 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 248 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 249 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 250 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 251 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 252 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 253 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 254 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 255 | `CPP_HLTH_EMPLR_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 256 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 257 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `CPP_DCS_DEBT_AMT_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 261 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 262 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 263 | `CPP_OTHER_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 264 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 265 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 266 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 267 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 268 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 269 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 270 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 271 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 272 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 273 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 274 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 275 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 276 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 277 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 278 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 279 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 280 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 281 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 282 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 283 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 284 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 285 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 286 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 287 | `CPP_BASE_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 288 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 289 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 290 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 291 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 292 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 293 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 294 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 295 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 296 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 297 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 298 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 299 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 300 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 301 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 302 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 303 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 304 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 305 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 306 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 307 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 308 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 309 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 310 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 311 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 312 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 313 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 314 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 315 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 316 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 317 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 318 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 319 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 320 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 321 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 322 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 323 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 324 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 325 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 326 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 327 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 328 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 329 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 330 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 331 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 332 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 333 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 334 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 335 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 336 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 337 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 338 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 339 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 340 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 341 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 342 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 343 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 344 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 345 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 346 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 347 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 348 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 349 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 350 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 351 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 352 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 353 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 354 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 355 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 356 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 357 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 358 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 359 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 360 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 361 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 362 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 363 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 364 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 365 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 366 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 367 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 368 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 369 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 370 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 371 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 372 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 373 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 374 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 375 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 376 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 377 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 378 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 379 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 380 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 381 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 382 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 383 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 384 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 385 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 386 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 387 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 388 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 389 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 390 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 391 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 392 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 393 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 394 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 395 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 396 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 397 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 398 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 399 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 400 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 401 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 402 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 403 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 404 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 405 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 406 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 407 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 408 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 409 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 410 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 411 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 412 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 413 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 414 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 415 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 416 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 417 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 418 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 419 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 420 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 421 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 422 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 423 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 424 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 425 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 426 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 427 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 428 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 429 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 430 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 431 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 432 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 433 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 434 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 435 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 436 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 437 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 438 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 439 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 440 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 441 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 442 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 443 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 444 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 445 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 446 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 447 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 448 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 449 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 450 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 451 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 452 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 453 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 454 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 455 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 456 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 457 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 458 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 459 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 460 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 461 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 462 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 463 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 464 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 465 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 466 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 467 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 468 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 469 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 470 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 471 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 472 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 473 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 474 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 475 | `WORK_ADDR_STREET1` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 476 | `WORK_ADDR_STREET2` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 477 | `WORK_ADDR_CITY` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 478 | `WORK_ADDR_STATE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 479 | `WORK_ADDR_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 480 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 481 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 482 | `FED_RETIRE_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 483 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 484 | `PP_YEAR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 485 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 486 | `COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 487 | `COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 488 | `COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 489 | `COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 490 | `OT_EARN_YTD_DOLL_VALUE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 491 | `REL_COMP_BEGIN_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 492 | `REL_COMP_END_BAL` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 493 | `REL_COMP_EARN_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 494 | `REL_COMP_USED_YTD_HRS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 495 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 496 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 497 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 498 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 499 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_TYPE_3_FDR_TBL</code> — 246 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LINE_TYPE` | varchar2 | 5 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PYF_PAY_TAC_TYP` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 6 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 8 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 9 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 10 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 11 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 14 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `CPP_HLTH_EMPLR_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 16 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 18 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 19 | `CPP_DCS_DEBT_AMT_AFPS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 20 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 21 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 22 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 23 | `CPP_OTHER_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 24 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 25 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 26 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 27 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 28 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 29 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 31 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 32 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 33 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 34 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 35 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 36 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 37 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 39 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 40 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 41 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 42 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 43 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 44 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 45 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 46 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 47 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 48 | `CPP_BASE_PAY_AFPS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 49 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 50 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 51 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 52 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 53 | `REEMPLED` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 54 | `HRLY_RATE_UA` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 55 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 56 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 57 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 58 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 59 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 60 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 61 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 62 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 63 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 64 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 65 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 66 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 67 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 68 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 69 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 70 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 71 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 72 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 73 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 74 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 75 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 76 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 77 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 78 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 79 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 80 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 81 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 82 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 83 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 84 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 85 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 86 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 87 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 88 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 89 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 90 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 91 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 92 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 93 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 94 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 95 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 96 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 97 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 98 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 99 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 100 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 101 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 102 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 103 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 104 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 106 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 107 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 108 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 109 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 110 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 111 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 112 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 113 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 114 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 115 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 116 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 117 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 118 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 119 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 120 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 121 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 122 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 123 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 124 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 125 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 126 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 131 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 132 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 133 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 135 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 136 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 137 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 138 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 139 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 142 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 147 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 148 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 151 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 152 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 153 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 154 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 155 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 158 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 159 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 160 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 161 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 164 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 167 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 169 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 170 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 172 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 173 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 174 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 176 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 177 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 178 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 181 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 182 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 183 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 184 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 185 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 186 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 187 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 188 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 191 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 192 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 199 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 200 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 201 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 202 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 203 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 206 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 207 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 209 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 210 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 211 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 212 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 213 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 214 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 215 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 218 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 219 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 220 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 221 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 222 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 223 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 224 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 225 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 228 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 229 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 231 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 233 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 235 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 237 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 239 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 240 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 241 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 242 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 243 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 244 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 245 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 246 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NEWPAY_STG_TYPE_3_TBL</code> — 242 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `DFAS_PSEUDO_SSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PYF_PAY_TAC_TYP_LINE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 5 | `PYF_PAY_TAC_TYP` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 6 | `PYF_PAY_DET_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `MP_POOL_DES` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 8 | `ADJ_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 9 | `CPP_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 10 | `ADJ_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 11 | `ADJ_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 12 | `CPP_REF_DED_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `CPP_REF_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 14 | `CPP_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 15 | `ADJ_REFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `ADJ_REFUND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 17 | `CPP_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 18 | `DCS_NBR_DEBTS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 19 | `ADJ_DCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 20 | `CPP_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 21 | `ADJ_HLTH_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 22 | `OC_1217_TOT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 23 | `FED_OPT_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 24 | `CPP_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 25 | `ADJ_FED_WITH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 26 | `ST_TAX_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `ST_TAX_EXEMP` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 28 | `ST_TAX_OPT_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 29 | `ST_TAX_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 30 | `CPP_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 31 | `ADJ_ST_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 32 | `CITY_ST_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 33 | `CITY_ID_CDE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 34 | `CITY_MAR_STAT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `CITY_EXEMP` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 36 | `CPP_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 37 | `ADJ_CITY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 38 | `CPP_LUMPSUM_LVPY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 39 | `ADJ_LUMP_SUM` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 40 | `RESTOR_AL_PAID_CPP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 41 | `RESTOR_AL_PAID_ADJ` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 42 | `BASE_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 43 | `REG_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 44 | `CPP_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 45 | `ADJ_BASE_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 46 | `CPP_CASH_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 47 | `ADJ_CAS_AWARD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 48 | `RPT_CDE` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 49 | `REEMPLED` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 50 | `HRLY_RATE_UA` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 51 | `REEMP_ANN_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `REEMP_ANU_HR_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 53 | `ALT_1_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 54 | `ALT_1_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 55 | `CPP_ALT_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 56 | `ALT_1_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 57 | `ALT_1_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `ALT_2_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 59 | `ALT_2_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 60 | `CPP_ALT_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 61 | `ALT_2_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 62 | `ALT_2_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 63 | `ALT_4_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 64 | `ALT_4_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 65 | `CPP_ALT_4_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 66 | `ALT_4_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 67 | `ALT_4_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 68 | `ALT_5_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 69 | `ALT_5_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 70 | `CPP_ALT_5_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 71 | `ALT_5_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 72 | `ALT_5_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 73 | `ALT_6_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 74 | `ALT_6_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 75 | `CPP_ALT_6_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 76 | `ALT_6_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 77 | `ALT_6_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 78 | `ALT_7_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 79 | `ALT_7_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 80 | `CPP_ALT_7_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 81 | `ALT_7_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 82 | `ALT_7_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 83 | `ALT_8_ROUTE_ID` | number(p,s) | 8 | 0 | NOT A KEY | NULL |
| 84 | `ALT_8_ROUTE_DIGIT` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 85 | `CPP_ALT_8_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 86 | `ALT_8_EE_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 87 | `ALT_8_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 88 | `CPP_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 89 | `ADJ_LTC_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 90 | `CPP_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 91 | `ADJ_PSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 92 | `HLTH_ENROL_CDE_1_2` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 93 | `HLTH_ENROL_CDE_3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 94 | `CPP_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 95 | `ADJ_HLTH_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 96 | `COMP_HRS_PAID` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 97 | `COMP_TIME_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 98 | `CPP_STAFFING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 99 | `CPP_COUNTY_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 100 | `CPP_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 101 | `ADJ_TEA_GVT_TV_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 102 | `CPP_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 103 | `ADJ_TEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 104 | `CPP_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `ADJ_FSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 106 | `CPP_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 107 | `ADJ_FSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 108 | `CPP_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 109 | `ADJ_TSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 110 | `CPP_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 111 | `ADJ_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 112 | `HRS_OT_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 113 | `HRS_OT_PL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 114 | `CPP_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 115 | `ADJ_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 116 | `HRS_ND_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 117 | `CPP_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 118 | `ADJ_SD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 119 | `CPP_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 120 | `ADJ_HOL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 121 | `ADJ_OTHER_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 122 | `CPP_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 123 | `ADJ_PD_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 124 | `CPP_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 125 | `ADJ_COLA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 126 | `CPP_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 127 | `ADJ_UNIF_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 128 | `CPP_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `ADJ_SEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `CPP_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 131 | `ADJ_PAY_NS_FWIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 132 | `CPP_PAY_S_FEDTX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 133 | `CPP_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 134 | `ADJ_CSR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 135 | `CPP_CSR_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 136 | `ADJ_CSR_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 137 | `CPP_PAY_S_CSR` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 138 | `CPP_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 139 | `ADJ_FICA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `CPP_FICA_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 141 | `ADJ_FICA_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 142 | `CPP_PAY_S_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 143 | `ADJ_FICA_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 144 | `CPP_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `ADJ_MEDC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `CPP_MEDC_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 147 | `ADJ_MEDC_EMPL_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `CPP_PAY_S_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 149 | `ADJ_MEDC_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 150 | `CPP_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 151 | `ADJ_FERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 152 | `CPP_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 153 | `ADJ_FERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `CPP_FERS_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 155 | `ADJ_FERS_WAGES` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 156 | `CPP_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `ADJ_BOND_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 158 | `CPP_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `ADJ_LI_REG_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `CPP_LI_EMPLR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 161 | `CPP_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `ADJ_LI_OPT_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `CPP_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 164 | `ADJ_FEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 165 | `CPP_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 166 | `ADJ_FEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 167 | `CPP_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 168 | `ADJ_CHAR_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 169 | `CPP_UNION_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 170 | `ADJ_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 171 | `CPP_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 172 | `ADJ_QUARTERS_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 173 | `CPP_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 174 | `ADJ_SUBSIST_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `CPP_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `ADJ_SLRP` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 177 | `CPP_NET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 178 | `CPP_NET_ALT_DED` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 179 | `CPP_CSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 180 | `CSA_RECIPIENT_NAME` | varchar2 | 22 | 0 | NOT A KEY | NULL |
| 181 | `CSA_RECIPIENT_ACCT_NO` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 182 | `EIC_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 183 | `EIC_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 184 | `PCA_CPP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 185 | `PCA_ADJ_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `CPP_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 187 | `ADJ_TSPA_PAY_SUB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 188 | `CPP_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `ADJ_TSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 190 | `CPP_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `ADJ_TSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 192 | `CPP_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `ADJ_TSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `HRS_ND_2` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 195 | `HRS_ND_3` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 196 | `HRS_SD_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 197 | `HRS_HOL_1` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 198 | `CPP_INST_AGY_PAID` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 199 | `CPP_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 200 | `CPP_T38_ONCALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 201 | `CPP_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 202 | `T38_ONCALL_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 203 | `ADJ_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `T38_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 205 | `T38_HOL_OT_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 206 | `T38_ND_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 207 | `T38_SAT_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 208 | `T38_SUN_DIF_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 209 | `CPP_UND_DED_G_PRYR_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `CPP_SEP_INCENT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 211 | `CPP_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 212 | `ADJ_RECRUIT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 213 | `CPP_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 214 | `ADJ_RELOC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 215 | `CPP_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 216 | `ADJ_RETENT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 217 | `SUSP_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 218 | `REL_COMP_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 219 | `REL_COMP_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 220 | `REL_COMP_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 221 | `CR_HRS_LS_PAY_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 222 | `CR_HRS_LS_PAY_ADJ` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 223 | `CR_HRS_LS_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 224 | `CPP_TEA_GVT_PK_CONT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 225 | `CPP_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `ADJ_LOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 227 | `HRS_HAZARD_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `CPP_ST_TAX_GROSS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 229 | `FURLO_HRS_CPP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 230 | `VIS_DENT_1_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 231 | `VIS_DENT_1_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `VIS_DENT_2_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 233 | `VIS_DENT_2_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `VIS_DENT_3_CDE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 235 | `VIS_DENT_3_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `CPP_HEALTH_SAVINGS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 237 | `MANUAL_PAYMENTS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 238 | `COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 239 | `COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 240 | `COMP_PAID_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 241 | `TRAVEL_COMP_HRS_ERND_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 242 | `TRAVEL_COMP_HRS_USED_CPP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |

</details>

### CPM_AFPS

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `HI_AFPS_FEEDER_TBL` | Oracle | — | 283 |
| `HI_GROSS_EXP_TBL` | Oracle | — | 12 |
| `CPM_AFPS_MESSAGE_COUNTS_FILE` | Flat File | — | 2 |
| `CPM_AFPS_MESSAGE_FILE` | Flat File | — | 2 |
| `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` | Flat File | — | 2 |
| `AFPS_COUNTER_TBL` | Oracle | — | 7 |
| `GENERIC_TARGET_FILE` | Flat File | — | 1 |
| `CPM_AFPS_PAY_PERIOD_FILE` | Flat File | — | 1 |
| `CPM_AFPS_CROSSFOOT_FILE` | Flat File | — | 2 |
| `CPM_CYCLE_TBL` | Oracle | — | 5 |
| `CPM_AFPS_PAY_PERIOD_CAL_FILE` | Flat File | — | 1 |
| `feeder_FEEDER_RECORD` | PWX_SEQ_NRDB2 | — | 275 |
| `ERROR_TBL` | Oracle | — | 8 |

<details><summary><code>HI_AFPS_FEEDER_TBL</code> — 283 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FFEEDER_SORT` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 2 | `FPAYROLL_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 3 | `FPAY_PERIOD_CODE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 4 | `FFISCAL_YEAR` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 5 | `FAGY` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `FACCT_PT` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `FSERIAL` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 8 | `FINVALID_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `FSOC_SEC_NO` | number(p,s) | 9 | 0 | NOT A KEY | NULL |
| 10 | `FTIME_KEEPER_NO` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 11 | `FFIRST_INT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `FMIDDLE_INT` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `FLST` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 14 | `FLST_FILL` | varchar2 | 13 | 0 | NOT A KEY | NULL |
| 15 | `FPP1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `FPP2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `FGRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `FSTEP` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 19 | `FHOURLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 20 | `FPERM_TEMP_POS_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 21 | `FPART_FULL_TIME_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `FSTATE_TAX_CODE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 23 | `FFED_TAX_CODE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 24 | `FSEPARATION_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `FBASE_HOURS_TOUR` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 26 | `FFEHBA_CODE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 27 | `FFEGLI_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 28 | `FORG_P01` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `FORG_P2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 30 | `FORG_P3` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `FORG_P4` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 32 | `FORG_P5` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `FORG_P6` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 34 | `FORG_P7` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `FORG_P8` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `FORG_P9` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 37 | `FORG_PX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 38 | `FORG_P11` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `FAPPROPRIATION_CODE` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 40 | `FENT_ON_DUTY_DATE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 41 | `FFED_SER_ENT_DATE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 42 | `FPER_STP_INC_DATE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 43 | `FLWOP_HOURS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 44 | `FAWOL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 45 | `FAPPOINT_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `FSEP_DATE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 47 | `FPAY_ADJ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 48 | `FNON_TAXABLE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 49 | `FST_EXEMPS` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 50 | `FP123` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 51 | `FSPOC` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 52 | `FHOME_FY` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 53 | `FHOME_CAN` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 54 | `FANN_HRS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 55 | `FSICK_HRS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 56 | `FCOMP_HRS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 57 | `FANN_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 58 | `FSICK_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 59 | `FCOMP_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 60 | `FANN_HRS_BALANCE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 61 | `FSICK_HRS_BALAN` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 62 | `FCOMP_HRS_BALAN` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 63 | `FANN_LV_FORF_CURR_PP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 64 | `FCOMP_FORF_CURR_PP` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 65 | `FMILITARY_LEAVE_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 66 | `FCOURT_LEAVE_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 67 | `FOTHER_LEAVE_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 68 | `FLEAVE_CEILING` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 69 | `FLEAVE_CATEGORY` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 70 | `FHOLIDAY_LEAVE_HRS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 71 | `FBASE_HOURS_WORKED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 72 | `FBASE_PAY_AMOUNT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 73 | `FOT_HOURS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 74 | `FOLD_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 75 | `FND_HOURS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 76 | `FND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 77 | `FHOL_PREM_HRS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 78 | `FHOL_PREM_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 79 | `FSUN_HOURS` | number(p,s) | 3 | 1 | NOT A KEY | NULL |
| 80 | `FSUN_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 81 | `FLSLP_HOURS` | number(p,s) | 5 | 1 | NOT A KEY | NULL |
| 82 | `FLSLP_PAY_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 83 | `FICENT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 84 | `FPOST_DIFF_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 85 | `FCITY_TAX` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 86 | `FSEV_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 87 | `FEMPL_AWDS_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 88 | `FUNIF_ALLOW_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 89 | `FCOLA_ALLOW_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 90 | `FYOC_ADVANCE_REPAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 91 | `FOTHER_BEN_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 92 | `FOTHER_PAY_AB` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 93 | `FTRAINEE_ALLOW` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 94 | `FNET_GROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 95 | `FFEDERAL_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 96 | `FOPT_FED_TAX_DED` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 97 | `FSTATE_TAX_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 98 | `FFEGLI_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 99 | `FOPT_FEGLI_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 100 | `FBOND_PURCH_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 101 | `FBOND_BALAN_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 102 | `FBOND_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 103 | `FFICA_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 104 | `FCSRA_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 105 | `FUNION_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 106 | `FCHARITY_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 107 | `FFEHBA_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 108 | `FLEVY_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 109 | `FQTRS_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 110 | `FSUBST_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 111 | `FLAUNDRY_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 112 | `FREFUND_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 113 | `FOTHER_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 114 | `FALLOTMENT1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 115 | `FALLOTMENT2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 116 | `FNET_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 117 | `FCSRA_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 118 | `FFICA_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 119 | `FFEGLI_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 120 | `FFEHBA_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 121 | `FGROSS_EXPEND` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 122 | `FNET_EXPEND` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 123 | `FOTH_NONTAX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 124 | `FOTH_TAXABLE` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 125 | `FJOB_LOC` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 126 | `FCITY_CODE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 127 | `FAPPT_CODE` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 128 | `FEARNED_INCOME_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 129 | `FOT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 130 | `FPCA_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 131 | `FANNUITY_GROSS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 132 | `FMERIT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 133 | `FSES_CASH_AWD_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 134 | `FANNUITY_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 135 | `FTENURE_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 136 | `FNATURE_OF_ACTION` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 137 | `FCEILING_ID` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 138 | `FMEDICARE` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 139 | `FMILITARY_COLA` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 140 | `FGROSS_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 141 | `FRETIREMENT_CODE_OLD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 142 | `FSUBOBJ_GM_BONUSES` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 143 | `FFERS_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 144 | `FFERS_AGY_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 145 | `FTSPG_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 146 | `FTSPG_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 147 | `FTSPG_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `FTSPG_UND_DED_EMP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 149 | `FTSPG_UND_DED_GVT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 150 | `FTSPG_PRADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 151 | `FLTC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 152 | `FFSAHC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 153 | `FFSADC_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `FTSP_OVER50` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 155 | `FTSPF_UND_DED_EMP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 156 | `FTSPF_UND_DED_GVT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 157 | `FTSPC_GBADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 158 | `FTSPC_EADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `FTSPC_GMADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 160 | `FTSPC_PRADIST` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 161 | `FTSPC_UND_DED_EMP` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 162 | `FTSPC_UND_DED_GVT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 163 | `FTRVL_SAV_AWD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 164 | `FEFT_ROUTE_ID` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 165 | `FEFT_EMP_ACCT_NUM` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 166 | `FEFT_EMP_ACCT_TYPE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 167 | `FADRS_1` | varchar2 | 25 | 0 | NOT A KEY | NULL |
| 168 | `FADRS_2` | varchar2 | 25 | 0 | NOT A KEY | NULL |
| 169 | `FADRS_3` | varchar2 | 25 | 0 | NOT A KEY | NULL |
| 170 | `FADRS_ZIP` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 171 | `FADMIN_UNC_OT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 172 | `FFEGLI_OPTA` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 173 | `FFEGLI_OPTB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 174 | `FFEGLI_OPTC` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 175 | `FALLOTMENT4` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 176 | `FLOAN_1_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 177 | `FLOAN_2_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 178 | `FLOAN_OWED_TO_AGENCY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `FPAY_SUB_CSRS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 180 | `FPAY_SUB_FERS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 181 | `FCOUNTY_TAX` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 182 | `FCOUNTY_TAX_CDE` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 183 | `FCITY_OP_TAX` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 184 | `FCITY_OP_TAX_CDE` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 185 | `FSTAND_BY_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 186 | `FSTAND_BY_PAY_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 187 | `FADJ_ST_TAX_CD1` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 188 | `FADJ_ST_TAX_DD1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 189 | `FADJ_ST_TAX_CD2` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 190 | `FADJ_ST_TAX_DD2` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 191 | `FADJ_ST_TAX_CD3` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 192 | `FADJ_ST_TAX_DD3` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 193 | `FADJ_ST_TAX_CD4` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 194 | `FADJ_ST_TAX_DD4` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `FREFUND_CDE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 196 | `FCSA_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 197 | `FINSTPDAGCY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 198 | `FUNION_CODE` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 199 | `FCHARITY_CODE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 200 | `FCONTROL_NO` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 201 | `FLOCAL_DIFF_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `FMEDC_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 203 | `FPAY_SUB_FEDTAX` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 204 | `FPAY_SUB_FICA` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 205 | `FPAY_SUB_MEDC` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 206 | `FRECRUITBONUS_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 207 | `FRELOCBONUS_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 208 | `FRETENTALLOW_OLD` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 209 | `FSTAFFINGDIFF` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 210 | `FSUPVSRDIFF` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 211 | `FSP_PROG` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 212 | `FBAYLR_REG_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 213 | `FBAYLR_BASE_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 214 | `FON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 215 | `FON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 216 | `FNON_BAYLR_REG_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 217 | `FNON_BAYLR_BASE_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 218 | `FNON_BAYLR_BASE_HRLY_RTE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 219 | `FT38_PREM_HRLY_RATE` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 220 | `FT38_REG_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 221 | `FT38_BASE_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 222 | `FT38_OT_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 223 | `FT38_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 224 | `FT38_HOL_OT_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 225 | `FT38_HOL_OT_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 226 | `FT38_ND_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 227 | `FT38_ND_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 228 | `FT38_ON_CALL_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 229 | `FT38_ON_CALL_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 230 | `FT38_SAT_DIF_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 231 | `FT38_SAT_DIF_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 232 | `FT38_SUN_DIF_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 233 | `FT38_SUN_DIF_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `FMTOLDFUNDTAX` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 235 | `FADJCNTY_DED_1` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 236 | `FADJCNTY_CDE_1` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 237 | `FSEP_INCENT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 238 | `FADMIN_FEE_PCENT` | number(p,s) | 2 | 2 | NOT A KEY | NULL |
| 239 | `FANNUAL_SALARY` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 240 | `FNATL_UNION_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 241 | `FNATL_UNION_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 242 | `FCONTROL_NO_B` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 243 | `FDCS_DEBT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 244 | `FDCS_ADMIN_REFUND_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 245 | `FDCS_REFUND_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 246 | `FPSP_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 247 | `FFBPARKING` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 248 | `FLSLP_PAY` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 249 | `FSPO_TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 250 | `FNO_CHARGE_NET` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 251 | `FFEGLI_CODE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 252 | `FOCCUP_CDE` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 253 | `FRECRUITBONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 254 | `FRELOCBONUS` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 255 | `FRETENTALLOW` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 256 | `FTEA_EMP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 257 | `FTEA_EMPLR_TV_CONTR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 258 | `FTEA_EMPLR_PK_CONTR` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 259 | `FTEA_CASH_OUT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 260 | `FCHILD_SUP_SUB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 261 | `FSUSP_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 262 | `FFURLO_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 263 | `FREL_COMP_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 264 | `FREL_COMP_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 265 | `FREL_COMP_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 266 | `FREL_COMP_LS_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 267 | `FCR_HRS_EARNED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 268 | `FCR_HRS_USED` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 269 | `FCR_HRS_BAL` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 270 | `FCR_HRS_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 271 | `FCR_HRS_LS_PAY` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 272 | `FPREPD_HB` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 273 | `FLOCAL_DIFF` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 274 | `FILLER_1` | varchar2 | 134 | 0 | NOT A KEY | NULL |
| 275 | `FPSEUDO_SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 276 | `FOBJ_CLASS_1217` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 277 | `FOBJ_CLASS_121S` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 278 | `FOBJ_CLASS_1211` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 279 | `FOBJ_CLASS_1111` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 280 | `FILLER0` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 281 | `FED_RETIRE_1` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 282 | `FED_RETIRE_2` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 283 | `FEMPLOYEE_ID` | varchar2 | 11 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_GROSS_EXP_TBL</code> — 12 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 3 | `EMPL_ID` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 4 | `CAN` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 5 | `TK_NO` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 6 | `CHECK_TOT_ADD` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 7 | `CHECK_TOT_SUBTRACT` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 8 | `TEST_NET` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 9 | `FEARNED_INCOME_PAY` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 10 | `TEST_NET_TOT` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 11 | `FNET_PAY` | number(p,s) | 11 | 2 | NOT A KEY | NULL |
| 12 | `DIFF` | number(p,s) | 11 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_AFPS_MESSAGE_COUNTS_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `COUNT_DESCRIPTION` | string | 50 | 0 | NOT A KEY | NULL |
| 2 | `COUNT_VALUE` | bigint | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_AFPS_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 500 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 500 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_AFPS_MESSAGE_COUNTS_TOT_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `COUNT_DESCRIPTION` | string | 50 | 0 | NOT A KEY | NULL |
| 2 | `COUNT_VALUE` | number | 19 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>AFPS_COUNTER_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 3 | `RUN_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 5 | `COUNTER_DESCRIPTION` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 6 | `COUNTER_VALUE` | number(p,s) | 19 | 2 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>GENERIC_TARGET_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_AFPS_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_AFPS_CROSSFOOT_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 90 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 200 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_CYCLE_TBL</code> — 5 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 30 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 3 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_AFPS_PAY_PERIOD_CAL_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>feeder_FEEDER_RECORD</code> — 275 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FPAYROLL_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 2 | `FPAY_PERIOD_CODE` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 3 | `FFISCAL_YEAR` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 4 | `FAGY` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 5 | `FACCT_PT` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 6 | `FSERIAL` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 7 | `FINVALID_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 8 | `FSOC_SEC_NO` | UZONED | 9 | 0 | NOT A KEY | NOTNULL |
| 9 | `FTIME_KEEPER_NO` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 10 | `FFIRST_INT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 11 | `FMIDDLE_INT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 12 | `FLST` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 13 | `FLST_FILL` | CHAR | 13 | 0 | NOT A KEY | NOTNULL |
| 14 | `FPP1` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 15 | `FPP2` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 16 | `FGRADE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 17 | `FSTEP` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 18 | `FHOURLY_RATE` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 19 | `FPERM_TEMP_POS_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 20 | `FPART_FULL_TIME_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 21 | `FSTATE_TAX_CODE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 22 | `FFED_TAX_CODE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 23 | `FSEPARATION_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 24 | `FBASE_HOURS_TOUR` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 25 | `FFEHBA_CODE` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 26 | `FFEGLI_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 27 | `FORG_P01` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 28 | `FORG_P2` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 29 | `FORG_P3` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 30 | `FORG_P4` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 31 | `FORG_P5` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 32 | `FORG_P6` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 33 | `FORG_P7` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 34 | `FORG_P8` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 35 | `FORG_P9` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 36 | `FORG_PX` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 37 | `FORG_P11` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 38 | `FAPPROPRIATION_CODE` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 39 | `FENT_ON_DUTY_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 40 | `FFED_SER_ENT_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 41 | `FPER_STP_INC_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 42 | `FLWOP_HOURS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 43 | `FAWOL_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 44 | `FAPPOINT_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 45 | `FSEP_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 46 | `FPAY_ADJ` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 47 | `FNON_TAXABLE` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 48 | `FST_EXEMPS` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 49 | `FP123` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 50 | `FSPOC` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 51 | `FHOME_FY` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 52 | `FHOME_CAN` | CHAR | 7 | 0 | NOT A KEY | NOTNULL |
| 53 | `FANN_HRS_EARNED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 54 | `FSICK_HRS_EARNED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 55 | `FCOMP_HRS_EARNED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 56 | `FANN_HRS_USED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 57 | `FSICK_HRS_USED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 58 | `FCOMP_HRS_USED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 59 | `FANN_HRS_BALANCE` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 60 | `FSICK_HRS_BALAN` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 61 | `FCOMP_HRS_BALAN` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 62 | `FANN_LV_FORF_CURR_PP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 63 | `FCOMP_FORF_CURR_PP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 64 | `FMILITARY_LEAVE_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 65 | `FCOURT_LEAVE_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 66 | `FOTHER_LEAVE_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 67 | `FLEAVE_CEILING` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 68 | `FLEAVE_CATEGORY` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 69 | `FHOLIDAY_LEAVE_HRS` | ZONED | 3 | 1 | NOT A KEY | NOTNULL |
| 70 | `FBASE_HOURS_WORKED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 71 | `FBASE_PAY_AMOUNT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 72 | `FOT_HOURS` | ZONED | 3 | 1 | NOT A KEY | NOTNULL |
| 73 | `FOLD_OT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 74 | `FND_HOURS` | ZONED | 3 | 1 | NOT A KEY | NOTNULL |
| 75 | `FND_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 76 | `FHOL_PREM_HRS` | ZONED | 3 | 1 | NOT A KEY | NOTNULL |
| 77 | `FHOL_PREM_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 78 | `FSUN_HOURS` | ZONED | 3 | 1 | NOT A KEY | NOTNULL |
| 79 | `FSUN_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 80 | `FLSLP_HOURS` | ZONED | 5 | 1 | NOT A KEY | NOTNULL |
| 81 | `FLSLP_HOURS_FILLER_01` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 82 | `FICENT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 83 | `FPOST_DIFF_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 84 | `FCITY_TAX` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 85 | `FSEV_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 86 | `FEMPL_AWDS_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 87 | `FUNIF_ALLOW_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 88 | `FCOLA_ALLOW_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 89 | `FYOC_ADVANCE_REPAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 90 | `FOTHER_BEN_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 91 | `FOTHER_PAY_AB` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 92 | `FTRAINEE_ALLOW` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 93 | `FNET_GROSS_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 94 | `FFEDERAL_TAX_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 95 | `FOPT_FED_TAX_DED` | ZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 96 | `FSTATE_TAX_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 97 | `FFEGLI_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 98 | `FOPT_FEGLI_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 99 | `FBOND_PURCH_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 100 | `FBOND_BALAN_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 101 | `FBOND_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 102 | `FFICA_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 103 | `FCSRA_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 104 | `FUNION_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 105 | `FCHARITY_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 106 | `FFEHBA_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 107 | `FLEVY_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 108 | `FQTRS_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 109 | `FSUBST_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 110 | `FLAUNDRY_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 111 | `FREFUND_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 112 | `FOTHER_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 113 | `FALLOTMENT1` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 114 | `FALLOTMENT2` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 115 | `FNET_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 116 | `FCSRA_CONTR_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 117 | `FFICA_CONTR_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 118 | `FFEGLI_CONTR_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 119 | `FFEHBA_CONTR_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 120 | `FGROSS_EXPEND` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 121 | `FNET_EXPEND` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 122 | `FOTH_NONTAX` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 123 | `FOTH_TAXABLE` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 124 | `FJOB_LOC` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 125 | `FCITY_CODE` | ZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 126 | `FAPPT_CODE` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 127 | `FEARNED_INCOME_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 128 | `FOT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 129 | `FPCA_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 130 | `FANNUITY_GROSS` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 131 | `FMERIT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 132 | `FSES_CASH_AWD_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 133 | `FANNUITY_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 134 | `FTENURE_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 135 | `FNATURE_OF_ACTION` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 136 | `FCEILING_ID` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 137 | `FMEDICARE` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 138 | `FMILITARY_COLA` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 139 | `FGROSS_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 140 | `FRETIREMENT_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 141 | `FSUBOBJ_GM_BONUSES` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 142 | `FFERS_EMP_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 143 | `FFERS_AGY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 144 | `FTSPG_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 145 | `FTSPG_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 146 | `FTSPG_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 147 | `FTSPG_UND_DED_EMP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 148 | `FTSPG_UND_DED_GVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 149 | `FTSPG_PRADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 150 | `FLTC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 151 | `FFSAHC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 152 | `FFSADC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 153 | `FTSP_OVER50` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 154 | `FTSPF_UND_DED_EMP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 155 | `FTSPF_UND_DED_GVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 156 | `FTSPC_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 157 | `FTSPC_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 158 | `FTSPC_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 159 | `FTSPC_PRADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 160 | `FTSPC_UND_DED_EMP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 161 | `FTSPC_UND_DED_GVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 162 | `FTRVL_SAV_AWD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 163 | `FEFT_ROUTE_ID` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 164 | `FEFT_EMP_ACCT_NUM` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 165 | `FEFT_EMP_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 166 | `FADRS_1` | CHAR | 25 | 0 | NOT A KEY | NOTNULL |
| 167 | `FADRS_2` | CHAR | 25 | 0 | NOT A KEY | NOTNULL |
| 168 | `FADRS_3` | CHAR | 25 | 0 | NOT A KEY | NOTNULL |
| 169 | `FADRS_ZIP` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 170 | `FADMIN_UNC_OT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 171 | `FFEGLI_OPTA` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 172 | `FFEGLI_OPTB` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 173 | `FFEGLI_OPTC` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 174 | `FALLOTMENT4` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 175 | `FLOAN_1_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 176 | `FLOAN_2_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 177 | `FLOAN_OWED_TO_AGENCY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 178 | `FPAY_SUB_CSRS` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 179 | `FPAY_SUB_FERS` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 180 | `FCOUNTY_TAX` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 181 | `FCOUNTY_TAX_CDE` | CHAR | 5 | 0 | NOT A KEY | NOTNULL |
| 182 | `FCITY_OP_TAX` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 183 | `FCITY_OP_TAX_CDE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 184 | `FSTAND_BY_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 185 | `FSTAND_BY_PAY_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 186 | `FADJ_ST_TAX_CD1` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 187 | `FADJ_ST_TAX_DD1` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 188 | `FADJ_ST_TAX_CD2` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 189 | `FADJ_ST_TAX_DD2` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 190 | `FADJ_ST_TAX_CD3` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 191 | `FADJ_ST_TAX_DD3` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 192 | `FADJ_ST_TAX_CD4` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 193 | `FADJ_ST_TAX_DD4` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 194 | `FREFUND_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 195 | `FCSA_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 196 | `FINSTPDAGCY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 197 | `FUNION_CODE` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 198 | `FCHARITY_CODE` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 199 | `FCONTROL_NO` | CHAR | 6 | 0 | NOT A KEY | NOTNULL |
| 200 | `FLOCAL_DIFF_OLD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 201 | `FMEDC_CONTR_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 202 | `FPAY_SUB_FEDTAX` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 203 | `FPAY_SUB_FICA` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 204 | `FPAY_SUB_MEDC` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 205 | `FRECRUITBONUS_OLD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 206 | `FRELOCBONUS_OLD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 207 | `FRETENTALLOW_OLD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 208 | `FSTAFFINGDIFF` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 209 | `FSUPVSRDIFF` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 210 | `FSP_PROG` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 211 | `FBAYLR_REG_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 212 | `FBAYLR_BASE_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 213 | `FON_CALL_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 214 | `FON_CALL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 215 | `FNON_BAYLR_REG_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 216 | `FNON_BAYLR_BASE_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 217 | `FNON_BAYLR_BASE_HRLY_RTE` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 218 | `FT38_PREM_HRLY_RATE` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 219 | `FT38_REG_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 220 | `FT38_BASE_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 221 | `FT38_OT_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 222 | `FT38_OT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 223 | `FT38_HOL_OT_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 224 | `FT38_HOL_OT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 225 | `FT38_ND_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 226 | `FT38_ND_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 227 | `FT38_ON_CALL_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 228 | `FT38_ON_CALL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 229 | `FT38_SAT_DIF_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 230 | `FT38_SAT_DIF_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 231 | `FT38_SUN_DIF_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 232 | `FT38_SUN_DIF_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 233 | `FMTOLDFUNDTAX` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 234 | `FADJCNTY_DED_1` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 235 | `FADJCNTY_CDE_1` | CHAR | 5 | 0 | NOT A KEY | NOTNULL |
| 236 | `FSEP_INCENT_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 237 | `FADMIN_FEE_PCENT` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 238 | `FANNUAL_SALARY` | ZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 239 | `FNATL_UNION_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 240 | `FNATL_UNION_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 241 | `FCONTROL_NO_B` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 242 | `FDCS_DEBT_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 243 | `FDCS_ADMIN_REFUND_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 244 | `FDCS_REFUND_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 245 | `FPSP_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 246 | `FFBPARKING` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 247 | `FLSLP_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 248 | `FSPO_TERM_ID` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 249 | `FNO_CHARGE_NET` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 250 | `FFEGLI_CODE_2` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 251 | `FOCCUP_CDE` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 252 | `FRECRUITBONUS` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 253 | `FRELOCBONUS` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 254 | `FRETENTALLOW` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 255 | `FTEA_EMP_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 256 | `FTEA_EMPLR_TV_CONTR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 257 | `FTEA_EMPLR_PK_CONTR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 258 | `FTEA_CASH_OUT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 259 | `FCHILD_SUP_SUB` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 260 | `FSUSP_HRS_USED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 261 | `FFURLO_HRS_USED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 262 | `FREL_COMP_EARNED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 263 | `FREL_COMP_USED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 264 | `FREL_COMP_BAL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 265 | `FREL_COMP_LS_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 266 | `FCR_HRS_EARNED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 267 | `FCR_HRS_USED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 268 | `FCR_HRS_BAL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 269 | `FCR_HRS_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 270 | `FCR_HRS_LS_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 271 | `FPREPD_HB` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 272 | `FLOCAL_DIFF` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 273 | `FEMPLOYEE_ID` | CHAR | 11 | 0 | NOT A KEY | NOTNULL |
| 274 | `FPSEUDO_SSN` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 275 | `FILLER_02` | CHAR | 147 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>ERROR_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 8 | `ERROR_CODE` | varchar2 | 50 | 0 | NOT A KEY | NULL |

</details>

### CPM_CDC

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `cdchdr_WS_CDC_HDR` | PWX_SEQ_NRDB2 | — | 15 |
| `GENERIC_TARGET_FILE` | Flat File | — | 1 |
| `CPM_CDC_PAY_PERIOD_FILE` | Flat File | — | 1 |
| `cdcskel_WS_PAY_OUT_REC` | PWX_SEQ_NRDB2 | — | 736 |
| `CPM_CDC_CPM_PAY_PERIOD_FILE` | Flat File | — | 1 |
| `CPM_CDC_MESSAGE_FILE` | Flat File | — | 2 |

<details><summary><code>cdchdr_WS_CDC_HDR</code> — 15 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `HDR_FNAME` | CHAR | 18 | 0 | NOT A KEY | NOTNULL |
| 2 | `HDR_LNAME` | CHAR | 16 | 0 | NOT A KEY | NOTNULL |
| 3 | `HDR_PP_NUMBER` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 4 | `HDR_LVII_NUMBER` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 5 | `LVIISITE_2` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 6 | `LVIISITE_3` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 7 | `LVIISITE_4` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 8 | `LVIISITE_5` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 9 | `LVIISITE_6` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 10 | `LVIISITE_7` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 11 | `LVIISITE_8` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 12 | `LVIISITE_9` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 13 | `LVIISITE_10` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 14 | `TAPE_NUMBER` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 15 | `FILLER_1` | CHAR | 2800 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>GENERIC_TARGET_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_CDC_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>cdcskel_WS_PAY_OUT_REC</code> — 736 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FIR_NAME_1` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 2 | `CODE_CONSL` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 3 | `FILLER_1` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `MID_INIT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 5 | `SURNAME_3` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 6 | `SURNAME_OTHER` | CHAR | 13 | 0 | NOT A KEY | NOTNULL |
| 7 | `SOC_SEC_NO` | UZONED | 11 | 0 | NOT A KEY | NOTNULL |
| 8 | `NOTHING` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 9 | `OCCUP_CDE` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 10 | `JOB_LOC_CDE` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 11 | `TK_NO` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 12 | `CAN` | CHAR | 8 | 0 | NOT A KEY | NOTNULL |
| 13 | `ORG_CDE` | CHAR | 11 | 0 | NOT A KEY | NOTNULL |
| 14 | `SPOC` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 15 | `SEX_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 16 | `VET_PREF_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 17 | `TENURE_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 18 | `FIL_POS_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 19 | `PERM_TEMP_POS_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 20 | `FT_PT_INTER_POS_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 21 | `CITIZEN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 22 | `TYPE_APPT_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 23 | `AGCY_CDE_PER` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 24 | `DATE_BIRTH` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 25 | `FS_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 26 | `PERS_NOA` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 27 | `EOD_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 28 | `N_ACT_CDE_SEP` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 29 | `SEP_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 30 | `N_ACT_CDE_EOD` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 31 | `PERS_EFF_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 32 | `SEP_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 33 | `PSI_START_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 34 | `DAY_90_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 35 | `NINTY_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 36 | `TITLEX` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 37 | `PHY_HNDCP` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 38 | `HLTH_BNFTS_CAR_CTL` | CHAR | 8 | 0 | NOT A KEY | NOTNULL |
| 39 | `UNIF_ALLOW_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 40 | `ANN_UNIF_PYMT_DTE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 41 | `ANN_UNIF_ALLOW` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 42 | `ANN_UNIF_ALLOW_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 43 | `OTHER_LIM_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 44 | `OTHER_LIM_HOURS` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 45 | `DESIG_AGENT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 46 | `PREMIUM_PAY` | UZONED | 3 | 3 | NOT A KEY | NOTNULL |
| 47 | `RSSDP` | UZONED | 3 | 3 | NOT A KEY | NOTNULL |
| 48 | `CEILING_EN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 49 | `FUNC_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 50 | `SUPV_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 51 | `PAY_BASIS` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 52 | `POS_SEN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 53 | `CAR_SERV_DTE` | UZONED | 13 | 0 | NOT A KEY | NOTNULL |
| 54 | `PROB_DTE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 55 | `PERS_LEGAL_AUTH` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 56 | `APPRTN_POS_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 57 | `SPO_TERM_ID` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 58 | `PAY_PLAN` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 59 | `GRADE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 60 | `STEP` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 61 | `ABNOR_RATE_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 62 | `SAVED_RATE_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 63 | `APPT_LIM_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 64 | `APPT_LIM_HRS` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 65 | `APPT_LIM_HRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 66 | `APPT_LIM_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 67 | `APPT_LIM_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 68 | `DATE_LAST_PAY_CHG` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 69 | `BASE_HRS` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 70 | `ANNUAL_SAL` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 71 | `ANNUAL_SAL_PAPER` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 72 | `HRLY_RATE` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 73 | `HRLY_RATE_PAPER` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 74 | `OT_RATE` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 75 | `WSB_NSD2_RATE` | UZONED | 3 | 2 | NOT A KEY | NOTNULL |
| 76 | `WSB_NSD3_RATE` | UZONED | 3 | 2 | NOT A KEY | NOTNULL |
| 77 | `PD_PCT` | UZONED | 5 | 5 | NOT A KEY | NOTNULL |
| 78 | `COLA_PCT` | UZONED | 5 | 5 | NOT A KEY | NOTNULL |
| 79 | `UNIF_ALLOW` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 80 | `OTHER_TAX_PAY_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 81 | `OTHER_TAX_PAY_AMT` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 82 | `OTHER_TAX_PAY_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 83 | `OTHER_NON_TAX_PAY_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 84 | `OTH_N_TAX_PAY_AMT` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 85 | `OTH_N_TAX_PAY_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 86 | `SEV_PAY_TOT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 87 | `SEV_PAY_TOT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 88 | `SEV_PAY_AMT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 89 | `SEV_PAY_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 90 | `SEV_EFF_DAT` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 91 | `SEV_EFF_DAT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 92 | `LUMP_SUM_PAID_HOURS` | UZONED | 5 | 1 | NOT A KEY | NOTNULL |
| 93 | `FED_RETIRE_1` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 94 | `FED_RETIRE_2` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 95 | `EMPTY1` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 96 | `MP_POOL_DES` | CHAR | 5 | 0 | NOT A KEY | NOTNULL |
| 97 | `MP_HRLY_RATE` | UZONED | 4 | 2 | NOT A KEY | NOTNULL |
| 98 | `MP_HRLY_RATE_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 99 | `LEVY_FLAG` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 100 | `MEDC_NONRES_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 101 | `FED_RETIRE_CDE_OLD` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 102 | `REFUND_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 103 | `REFUND_AMT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 104 | `REFUND_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 105 | `REFUND_TOTAL` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 106 | `REFUND_TOTAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 107 | `REFUND_CURRENT_BAL` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 108 | `REFUND_CURRENT_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 109 | `LEVY_TOT_AMT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 110 | `LEVY_TOT_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 111 | `EFF_DATE_LEVY_DED` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 112 | `LEVY_PP_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 113 | `LEVY_PP_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 114 | `TOT_FED_TAX_EXEMP` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 115 | `ADDL_FED_TAX_EXEM` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 116 | `FED_TAX_MAR_STAT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 117 | `FED_OPT_TAX_DED` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 118 | `FED_W4A_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 119 | `ST_NON_RES_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 120 | `ST_TAX_MAR_STAT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 121 | `ST_TAX_EXEMP` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 122 | `ST_TAX_OPT_DED` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 123 | `ST_TAX_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 124 | `CITY_TAX_CDE` | CHAR | 6 | 0 | NOT A KEY | NOTNULL |
| 125 | `CITY_TAX_PER` | UZONED | 5 | 4 | NOT A KEY | NOTNULL |
| 126 | `CITY_TAX_PER_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 127 | `CITY_MAR_STAT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 128 | `CITY_EXEMP` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 129 | `CITY_RES_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 130 | `OCC_PRIV_TAX_CDE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 131 | `OCC_PRIV_TAX_AMT` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 132 | `OCC_PRIV_TAX_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 133 | `HLTH_ENROL_CDE` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 134 | `EFF_DATE_HLTH_NACT` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 135 | `HLTH_DED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 136 | `HLTH_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 137 | `HLTH_GOVT_SHARE` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 138 | `HLTH_GOVT_SHARE_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 139 | `FEGLI_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 140 | `EFF_DATE_FEGLI_REG` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 141 | `EFF_DATE_FEGLI_OPT` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 142 | `CHAR_AREA_CDE` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 143 | `EFF_DATE_CHAR` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 144 | `CHAR_DED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 145 | `CHAR_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 146 | `UNION_IDENT_CDE` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 147 | `EFF_DATE_UN_N_ACT` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 148 | `UNION_DED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 149 | `UNION_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 150 | `QUARTERS_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 151 | `QUARTERS_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 152 | `SUBSIST_DED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 153 | `SUBSIST_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 154 | `LAUNDRY_DED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 155 | `LAUNDRY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 156 | `FERS_CONV_DTE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 157 | `FERS_FROZEN_SICK_LV` | UZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 158 | `FERS_BAL_FWD` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 159 | `FERS_BAL_FWD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 160 | `TSPA_STATUS_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 161 | `TSPA_STATUS_CODE_DTE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 162 | `TSPA_SCD` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 163 | `TSPA_VEST_PERIOD` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 164 | `FILLER00` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 165 | `TSPA_EAMT_DED` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 166 | `TSPA_EAMT_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 167 | `TSPA_PRBAL` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 168 | `TSPA_PRBAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 169 | `TSPA_PRAMT_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 170 | `TSPA_PRAMT_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 171 | `TSPG_ERDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 172 | `TSPG_ERDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 173 | `TSPG_PRDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 174 | `TSPG_PRDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 175 | `TSPG_GRDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 176 | `TSPG_GRDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 177 | `TSPG_INIT_1_PCT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 178 | `TSPG_INIT_1_PCT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 179 | `TSPG_1_PCT_ADJ` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 180 | `TSPG_1_PCT_ADJ_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 181 | `TSPG_1_PCT_ADJ_CUM` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 182 | `TSPG_1_PCT_ADJ_CUM_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 183 | `TSPF_ERDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 184 | `TSPF_ERDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 185 | `TSPF_PRDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 186 | `TSPF_PRDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 187 | `TSPF_GRDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 188 | `TSPF_GRDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 189 | `TSPC_ERDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 190 | `TSPC_ERDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 191 | `TSPC_PRDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 192 | `TSPC_PRDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 193 | `TSPC_GRDIST` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 194 | `TSPC_GRDIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 195 | `ALT_1_INST_AC_NO` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 196 | `ALT_1_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 197 | `ALT_1_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 198 | `ALT_1_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 199 | `EFF_DATE_ALT_1_N_ACT` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 200 | `ALT_1_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 201 | `ALT_1_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 202 | `ALT_2_INST_ACCT_NO` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 203 | `ALT_2_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 204 | `ALT_2_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 205 | `ALT_2_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 206 | `EFF_DATE_ALT_2_N_ACT` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 207 | `ALT_2_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 208 | `ALT_2_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 209 | `EFT_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 210 | `EMPTY2` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 211 | `EFT_EMPL_ACCT_NUMBER` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 212 | `EFT_EMPL_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 213 | `EFT_EFF_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 214 | `CSA_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 215 | `CSA_PERCENT_DED` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 216 | `CSA_PERCENT_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 217 | `CSA_STD_AMOUNT_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 218 | `CSA_STD_AMOUNT_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 219 | `CSA_EFF_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 220 | `CSA_RECIPIENT_NAME` | CHAR | 22 | 0 | NOT A KEY | NOTNULL |
| 221 | `CSA_RECIPIENT_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 222 | `CSA_RECIPIENT_INST_NO` | CHAR | 12 | 0 | NOT A KEY | NOTNULL |
| 223 | `CSA_BACK_LIMIT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 224 | `CSA_BACK_LIMIT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 225 | `CSA_BACK_BIWEEK_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 226 | `CSA_BACK_BIWEEK_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 227 | `PCA_CONTRACT_LGTH` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 228 | `PCA_EFF_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 229 | `PCA_NTE_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 230 | `PCA_MAX_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 231 | `PCA_MAX_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 232 | `PCA_BIWEEK_AMT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 233 | `PCA_BIWEEK_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 234 | `PCA_CONTR_TO_DATE` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 235 | `PCA_CONTR_TO_DATE_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 236 | `REEMP_ANN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 237 | `REEMP_ANU_HR_RTE` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 238 | `REEMP_ANU_HR_RTE_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 239 | `EIC_STATUS_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 240 | `ERR_FLAG` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 241 | `FLSA_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 242 | `RPT_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 243 | `RET_BAL_FWD_OLD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 244 | `RET_BAL_FWD_OLD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 245 | `CPP_NO` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 246 | `CPP_BASE_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 247 | `CPP_BASE_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 248 | `CPP_OT_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 249 | `CPP_OT_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 250 | `CPP_ND_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 251 | `CPP_ND_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 252 | `CPP_SD_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 253 | `CPP_SD_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 254 | `CPP_HOL_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 255 | `CPP_HOL_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 256 | `CPP_PD_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 257 | `CPP_PD_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 258 | `CPP_COLA_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 259 | `CPP_COLA_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 260 | `CPP_UNIF_ALLOW` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 261 | `CPP_UNIF_ALLOW_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 262 | `CPP_SEV_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 263 | `CPP_SEV_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 264 | `CPP_CASH_AWARD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 265 | `CPP_CASH_AWARD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 266 | `CPP_MP_CASH_AWARD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 267 | `CPP_MP_CASH_AWARD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 268 | `CPP_LUMPSUM_LVPY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 269 | `CPP_LUMPSUM_LVPY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 270 | `CPP_OTHER_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 271 | `CPP_OTHER_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 272 | `CPP_GROSS_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 273 | `CPP_GROSS_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 274 | `CPP_PAY_NS_FWIT` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 275 | `CPP_PAY_NS_FWIT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 276 | `CPP_FED_WITH_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 277 | `CPP_FED_WITH_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 278 | `CPP_PAY_S_FEDTX` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 279 | `CPP_PAY_S_FEDTX_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 280 | `CPP_CSR_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 281 | `CPP_CSR_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 282 | `CPP_CSR_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 283 | `CPP_CSR_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 284 | `CPP_PAY_S_CSR` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 285 | `CPP_PAY_S_CSR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 286 | `CPP_FICA_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 287 | `CPP_FICA_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 288 | `CPP_FICA_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 289 | `CPP_FICA_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 290 | `CPP_PAY_S_FICA` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 291 | `CPP_PAY_S_FICA_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 292 | `CPP_MEDC_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 293 | `CPP_MEDC_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 294 | `CPP_MEDC_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 295 | `CPP_MEDC_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 296 | `CPP_PAY_S_MEDC` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 297 | `CPP_PAY_S_MEDC_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 298 | `CPP_FERS_EMP_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 299 | `CPP_FERS_EMP_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 300 | `CPP_FERS_AGY_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 301 | `CPP_FERS_AGY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 302 | `CPP_FERS_PAY_SUB` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 303 | `CPP_FERS_PAY_SUB_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 304 | `CPP_LEVY_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 305 | `CPP_LEVY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 306 | `CPP_ST_TAX_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 307 | `CPP_ST_TAX_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 308 | `CPP_CITY_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 309 | `CPP_CITY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 310 | `CPP_HLTH_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 311 | `CPP_HLTH_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 312 | `CPP_HLTH_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 313 | `CPP_HLTH_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 314 | `CPP_BOND_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 315 | `CPP_BOND_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 316 | `CPP_LI_REG_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 317 | `CPP_LI_REG_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 318 | `CPP_LI_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 319 | `CPP_LI_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 320 | `CPP_LI_OPT_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 321 | `CPP_LI_OPT_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 322 | `CPP_FEGLI_OPTB` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 323 | `CPP_FEGLI_OPTB_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 324 | `CPP_FEGLI_OPTC` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 325 | `CPP_FEGLI_OPTC_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 326 | `CPP_CHAR_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 327 | `CPP_CHAR_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 328 | `CPP_UNION_1_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 329 | `CPP_UNION_1_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 330 | `CPP_ALT_1_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 331 | `CPP_ALT_1_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 332 | `CPP_ALT_2_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 333 | `CPP_ALT_2_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 334 | `CPP_NET_ALT_DED` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 335 | `CPP_NET_ALT_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 336 | `CPP_REF_DED_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 337 | `CPP_REF_DED_AMT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 338 | `CPP_REF_DED_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 339 | `CPP_QUARTERS_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 340 | `CPP_QUARTERS_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 341 | `CPP_SUBSIST_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 342 | `CPP_SUBSIST_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 343 | `CPP_LAUNDRY_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 344 | `CPP_LAUNDRY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 345 | `CPP_NET_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 346 | `CPP_NET_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 347 | `CPP_CSA_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 348 | `CPP_CSA_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 349 | `EIC_CPP_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 350 | `EIC_CPP_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 351 | `PCA_CPP_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 352 | `PCA_CPP_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 353 | `CPP_TSPA_PAY_SUB` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 354 | `CPP_TSPA_PAY_SUB_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 355 | `CPP_TSPG_GBADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 356 | `CPP_TSPG_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 357 | `CPP_TSPG_EADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 358 | `CPP_TSPG_EADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 359 | `CPP_TSPG_GMADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 360 | `CPP_TSPG_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 361 | `CPP_TSPG_PRADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 362 | `CPP_TSPG_PRADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 363 | `CPP_TSPF_GBADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 364 | `CPP_TSPF_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 365 | `CPP_TSPF_EADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 366 | `CPP_TSPF_EADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 367 | `CPP_TSPF_GMADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 368 | `CPP_TSPF_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 369 | `CPP_TSPF_PRADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 370 | `CPP_TSPF_PRADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 371 | `CPP_TSPC_GBADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 372 | `CPP_TSPC_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 373 | `CPP_TSPC_EADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 374 | `CPP_TSPC_EADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 375 | `CPP_TSPC_GMADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 376 | `CPP_TSPC_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 377 | `CPP_TSPC_PRADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 378 | `CPP_TSPC_PRADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 379 | `YTD_BASE_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 380 | `YTD_BASE_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 381 | `YTD_OT_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 382 | `YTD_OT_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 383 | `YTD_ND_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 384 | `YTD_ND_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 385 | `YTD_SD_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 386 | `YTD_SD_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 387 | `YTD_HOL_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 388 | `YTD_HOL_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 389 | `YTD_PD_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 390 | `YTD_PD_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 391 | `YTD_COLA_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 392 | `YTD_COLA_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 393 | `YTD_UNIF_ALLOW` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 394 | `YTD_UNIF_ALLOW_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 395 | `YTD_SEV_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 396 | `YTD_SEV_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 397 | `YTD_CASH_AWARDS` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 398 | `YTD_CASH_AWARDS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 399 | `YTD_MP_CASH_AWARD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 400 | `YTD_MP_CASH_AWARD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 401 | `YTD_LSL_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 402 | `YTD_LSL_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 403 | `YTD_MISC_OTH_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 404 | `YTD_MISC_OTH_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 405 | `YTD_GROSS_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 406 | `YTD_GROSS_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 407 | `YTD_NON_TAX_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 408 | `YTD_NON_TAX_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 409 | `YTD_FED_TAX_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 410 | `YTD_FED_TAX_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 411 | `YTD_TAXABLE_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 412 | `YTD_TAXABLE_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 413 | `YTD_CSR_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 414 | `YTD_CSR_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 415 | `YTD_CSR_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 416 | `YTD_CSR_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 417 | `YTD_CSR_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 418 | `YTD_CSR_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 419 | `YTD_FICA_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 420 | `YTD_FICA_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 421 | `YTD_FICA_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 422 | `YTD_FICA_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 423 | `YTD_FICA_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 424 | `YTD_FICA_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 425 | `YTD_MEDC_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 426 | `YTD_MEDC_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 427 | `YTD_MEDC_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 428 | `YTD_MEDC_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 429 | `YTD_PAY_S_MEDC` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 430 | `YTD_PAY_S_MEDC_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 431 | `YTD_FERS_EMP_DED` | UZONED | 15 | 2 | NOT A KEY | NOTNULL |
| 432 | `YTD_FERS_EMP_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 433 | `YTD_FERS_AGY_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 434 | `YTD_FERS_AGY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 435 | `YTD_FERS_PAY_SUB` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 436 | `YTD_FERS_PAY_SUB_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 437 | `YTD_LEVY_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 438 | `YTD_LEVY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 439 | `YTD_ST_TX_1_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 440 | `YTD_ST_TX_1_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 441 | `YTD_ST_TX_1_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 442 | `YTD_ST_TX_1_GRS` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 443 | `YTD_ST_TX_1_GRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 444 | `YTD_ST_TX_2_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 445 | `YTD_ST_TX_2_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 446 | `YTD_ST_TX_2_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 447 | `YTD_ST_TX_2_GRS` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 448 | `YTD_ST_TX_2_GRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 449 | `YTD_ST_TX_3_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 450 | `YTD_ST_TX_3_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 451 | `YTD_ST_TX_3_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 452 | `YTD_ST_TX_3_GRS` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 453 | `YTD_ST_TX_3_GRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 454 | `YTD_ST_TX_4_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 455 | `YTD_ST_TX_4_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 456 | `YTD_ST_TX_4_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 457 | `YTD_ST_TX_4_GRS` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 458 | `YTD_ST_TX_4_GRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 459 | `YTD_ST_TX_SUM` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 460 | `YTD_ST_TX_SUM_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 461 | `YTD_CITY_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 462 | `YTD_CITY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 463 | `YTD_CITY_TAX1_GROSS` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 464 | `YTD_CITY_TAX1_GROSS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 465 | `YTD_CITY_TAX2_GROSS` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 466 | `YTD_CITY_TAX2_GROSS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 467 | `YTD_CITY_TX_2_CDE` | CHAR | 6 | 0 | NOT A KEY | NOTNULL |
| 468 | `YTD_CITY_TX_2_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 469 | `YTD_CITY_TX_2_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 470 | `YTD_SUM_CITY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 471 | `YTD_SUM_CITY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 472 | `YTD_HLTH_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 473 | `YTD_HLTH_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 474 | `YTD_HLTH_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 475 | `YTD_HLTH_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 476 | `YTD_BOND_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 477 | `YTD_BOND_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 478 | `YTD_LI_REG_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 479 | `YTD_LI_REG_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 480 | `YTD_LI_REG_EMPLR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 481 | `YTD_LI_REG_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 482 | `YTD_LI_OPT_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 483 | `YTD_LI_OPT_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 484 | `YTD_FEGLI_OPTB` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 485 | `YTD_FEGLI_OPTB_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 486 | `YTD_FEGLI_OPTC` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 487 | `YTD_FEGLI_OPTC_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 488 | `YTD_CHAR_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 489 | `YTD_CHAR_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 490 | `YTD_UNION_1_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 491 | `YTD_UNION_1_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 492 | `YTD_ALT_1_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 493 | `YTD_ALT_1_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 494 | `YTD_ALT_2_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 495 | `YTD_ALT_2_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 496 | `YTD_ALT_3_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 497 | `YTD_ALT_3_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 498 | `YTD_REF_1_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 499 | `YTD_REF_1_AMT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 500 | `YTD_REF_1_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 501 | `YTD_REF_2_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 502 | `YTD_REF_2_AMT` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 503 | `YTD_REF_2_AMT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 504 | `YTD_QUARTERS_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 505 | `YTD_QUARTERS_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 506 | `YTD_SUBSIST_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 507 | `YTD_SUBSIST_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 508 | `YTD_LAUNDRY_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 509 | `YTD_LAUNDRY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 510 | `YTD_NET_PAY` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 511 | `YTD_NET_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 512 | `YTD_CSA_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 513 | `YTD_CSA_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 514 | `EIC_YTD_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 515 | `EIC_YTD_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 516 | `PCA_YTD_PAY` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 517 | `PCA_YTD_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 518 | `YTD_TSPA_PAY_SUB` | UZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 519 | `YTD_TSPA_PAY_SUB_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 520 | `YTD_TSPG_GBADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 521 | `YTD_TSPG_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 522 | `YTD_TSPG_EADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 523 | `YTD_TSPG_EADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 524 | `YTD_TSPG_GMADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 525 | `YTD_TSPG_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 526 | `YTD_TSPG_PRADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 527 | `YTD_TSPG_PRADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 528 | `YTD_TSPF_GBADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 529 | `YTD_TSPF_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 530 | `YTD_TSPF_EADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 531 | `YTD_TSPF_EADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 532 | `YTD_TSPF_GMADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 533 | `YTD_TSPF_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 534 | `YTD_TSPF_PRADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 535 | `YTD_TSPF_PRADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 536 | `YTD_TSPC_GBADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 537 | `YTD_TSPC_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 538 | `YTD_TSPC_EADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 539 | `YTD_TSPC_EADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 540 | `YTD_TSPC_GMADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 541 | `YTD_TSPC_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 542 | `YTD_TSPC_PRADIST` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 543 | `YTD_TSPC_PRADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 544 | `ADJ_NO` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 545 | `UNCOM_TOUR_AN_LV_FACT` | UZONED | 3 | 2 | NOT A KEY | NOTNULL |
| 546 | `UNCOM_TOUR_SICK_LVFACT` | UZONED | 3 | 2 | NOT A KEY | NOTNULL |
| 547 | `AN_LV_CR_RED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 548 | `SICK_LV_CR_RED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 549 | `LV_CAT_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 550 | `T_IN_SICK_HRS` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 551 | `T_IN_SICK_HRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 552 | `T_IN_ANN_HRS` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 553 | `T_IN_ANN_HRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 554 | `ANN_LV_VALUE_OLD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 555 | `ANN_LV_VALUE_OLD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 556 | `SICK_LV_VALUE_OLD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 557 | `SICK_LV_VALUE_OLD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 558 | `COMP_LV_VALUE` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 559 | `COMP_LV_VALUE_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 560 | `AN_LV_EARNED_CPP` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 561 | `AN_LV_EARNED_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 562 | `AN_LV_USED_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 563 | `AN_LV_USED_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 564 | `AN_LV_PRYR_BAL` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 565 | `AN_LV_PRYR_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 566 | `AN_LV_ERND_YTD` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 567 | `AN_LV_ERND_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 568 | `AN_LV_ADV_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 569 | `AN_LV_ADV_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 570 | `AN_LV_ADV_CBAL` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 571 | `AN_LV_ADV_CBAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 572 | `AN_LV_USED_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 573 | `AN_LV_USED_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 574 | `AN_LV_CUR_BAL` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 575 | `AN_LV_CUR_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 576 | `AN_LV_MAX_COVER` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 577 | `AN_LV_MAX_COVER_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 578 | `AN_LV_USE_LOSE` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 579 | `AN_LV_USE_LOSE_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 580 | `AN_LV_PTHRS_WK` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 581 | `AN_LV_PTHRS_WK_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 582 | `SICK_LV_ERN_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 583 | `SICK_LV_ERN_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 584 | `SICK_LV_USD_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 585 | `SICK_LV_USD_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 586 | `SICK_LV_PRYR_BL` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 587 | `SICK_LV_PRYR_BL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 588 | `SICK_LV_ERN_YTD` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 589 | `SICK_LV_ERN_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 590 | `SICK_LV_ADV_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 591 | `SICK_LV_ADV_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 592 | `SICK_LV_AD_CBAL` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 593 | `SICK_LV_AD_CBAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 594 | `SICK_LV_USD_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 595 | `SICK_LV_USD_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 596 | `SICK_LV_CUR_BAL` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 597 | `SICK_LV_CUR_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 598 | `SICK_LV_PTHR_WK` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 599 | `SICK_LV_PTHR_WK_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 600 | `COMP_LV_ERN_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 601 | `COMP_LV_ERN_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 602 | `COMP_LV_USD_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 603 | `COMP_LV_USD_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 604 | `COMP_LV_1` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 605 | `COMP_LV_1_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 606 | `COMP_LV_2` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 607 | `COMP_LV_2_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 608 | `COMP_LV_3` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 609 | `COMP_LV_3_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 610 | `COMP_LV_4` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 611 | `COMP_LV_4_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 612 | `COMP_LV_5` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 613 | `COMP_LV_5_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 614 | `COMP_LV_6` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 615 | `COMP_LV_6_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 616 | `COMP_LV_7` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 617 | `COMP_LV_7_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 618 | `COMP_LV_8` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 619 | `COMP_LV_8_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 620 | `COMP_LV_CUR_BAL` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 621 | `COMP_LV_CUR_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 622 | `ADMIN_LV_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 623 | `ADMIN_LV_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 624 | `ADMIN_LV_YTD` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 625 | `ADMIN_LV_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 626 | `MILITARY_LV_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 627 | `MILITARY_LV_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 628 | `MILITARY_LV_YTD` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 629 | `MILITARY_LV_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 630 | `COURT_LV_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 631 | `COURT_LV_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 632 | `COURT_LV_YTD` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 633 | `COURT_LV_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 634 | `LWOP_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 635 | `LWOP_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 636 | `LWOP_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 637 | `LWOP_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 638 | `AWOL_CPP` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 639 | `AWOL_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 640 | `AWOL_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 641 | `AWOL_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 642 | `LWOP_LR` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 643 | `LWOP_LR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 644 | `OTHER_LV_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 645 | `OTHER_LV_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 646 | `OTHER_LV_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 647 | `OTHER_LV_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 648 | `LWOP_AWOP_LSPSI` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 649 | `LWOP_AWOP_LSPSI_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 650 | `COMP_TIME_FOR_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 651 | `COMP_TIME_FOR_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 652 | `TA_RECD_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 653 | `REG_HRS_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 654 | `REG_HRS_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 655 | `REG_HRS_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 656 | `REG_HRS_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 657 | `HRS_OT_1` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 658 | `HRS_OT_1_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 659 | `HRS_OT_2` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 660 | `HRS_OT_2_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 661 | `HRS_OT_3` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 662 | `HRS_OT_3_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 663 | `HRS_OT_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 664 | `HRS_OT_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 665 | `HRS_ND_1` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 666 | `HRS_ND_1_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 667 | `HRS_ND_2` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 668 | `HRS_ND_2_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 669 | `HRS_ND_3` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 670 | `HRS_ND_3_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 671 | `HRS_ND_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 672 | `HRS_ND_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 673 | `HRS_SD_1` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 674 | `HRS_SD_1_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 675 | `HRS_SD_2` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 676 | `HRS_SD_2_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 677 | `HRS_SD_3` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 678 | `HRS_SD_3_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 679 | `HRS_SD_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 680 | `HRS_SD_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 681 | `HRS_HOL_1` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 682 | `HRS_HOL_1_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 683 | `HRS_HOL_2` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 684 | `HRS_HOL_2_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 685 | `HRS_HOL_3` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 686 | `HRS_HOL_3_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 687 | `HRS_HOL_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 688 | `HRS_HOL_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 689 | `HRS_OTHER_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 690 | `HRS_OTHER_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 691 | `HRS_OTHER_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 692 | `HRS_OTHER_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 693 | `DAYS_INTER_CPP` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 694 | `DAYS_INTER_YTD` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 695 | `DAYS_INTER_CBAL` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 696 | `SPEC_REG_HRS` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 697 | `SPEC_REG_HRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 698 | `HRS_OT_PL` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 699 | `HRS_OT_PL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 700 | `HRS_OT_SPEC` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 701 | `HRS_OT_SPEC_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 702 | `BOND_NOTE_TOT_PUR_PR` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 703 | `BOND_NOTE_TOT_PUR_PR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 704 | `BOND_NOTE_TOT_DED` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 705 | `BOND_NOTE_TOT_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 706 | `BOND_NOTE_BAL` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 707 | `BOND_NOTE_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 708 | `REL_COMP_ERND_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 709 | `REL_COMP_ERND_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 710 | `REL_COMP_USED_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 711 | `REL_COMP_USED_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 712 | `REL_COMP_CURR_BAL` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 713 | `REL_COMP_CURR_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 714 | `CR_HRS_ERND_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 715 | `CR_HRS_ERND_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 716 | `CR_HRS_USED_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 717 | `CR_HRS_USED_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 718 | `CR_HRS_CUR_BAL` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 719 | `CR_HRS_CUR_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 720 | `MIL_LV_ELIG_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 721 | `HOME_LV_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 722 | `HOME_LV_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 723 | `HOME_LV_YTD` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 724 | `HOME_LV_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 725 | `RESTOR_AL_USED_CPP` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 726 | `RESTOR_AL_USED_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 727 | `RESTOR_AL_USED_YTD` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 728 | `RESTOR_AL_USED_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 729 | `RESTOR_AL_BALANCE` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 730 | `RESTOR_AL_BALANCE_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 731 | `RESTOR_AL_BAL_1` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 732 | `RESTOR_AL_BAL_1_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 733 | `RESTOR_AL_BAL_2` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 734 | `RESTOR_AL_BAL_2_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 735 | `RESTOR_AL_BAL_3` | UZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 736 | `RESTOR_AL_BAL_3_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>CPM_CDC_CPM_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_CDC_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 100 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 300 | 0 | NOT A KEY | NULL |

</details>

### CPM_NIH

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `CPM_NIH_MESSAGE_FILE` | Flat File | — | 2 |
| `nihhdr_WS_NIH_HDR` | PWX_SEQ_NRDB2 | — | 18 |
| `nihtest_NIH_PAYROLL_MASTER` | PWX_SEQ_NRDB2 | — | 534 |
| `CPM_NIH_CPM_PAY_PERIOD_FILE` | Flat File | — | 1 |
| `GENERIC_TARGET_FILE` | Flat File | — | 1 |
| `CPM_NIH_PAY_PERIOD_FILE` | Flat File | — | 1 |

<details><summary><code>CPM_NIH_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 100 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 300 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>nihhdr_WS_NIH_HDR</code> — 18 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `HDR_SOC_SEC` | UZONED | 11 | 0 | NOT A KEY | NOTNULL |
| 2 | `HDR_FNAME` | CHAR | 11 | 0 | NOT A KEY | NOTNULL |
| 3 | `HDR_INITIAL` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 4 | `HDR_LNAME` | CHAR | 16 | 0 | NOT A KEY | NOTNULL |
| 5 | `HDR_PP_NUMBER` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 6 | `HDR_LVII_NUMBER` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 7 | `LVIISITE_1` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 8 | `LVIISITE_2` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 9 | `LVIISITE_3` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 10 | `LVIISITE_4` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 11 | `LVIISITE_5` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 12 | `LVIISITE_6` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 13 | `LVIISITE_7` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 14 | `LVIISITE_8` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 15 | `LVIISITE_9` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 16 | `LVIISITE_10` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 17 | `TAPE_NUMBER` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 18 | `FILLER_1` | CHAR | 4037 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>nihtest_NIH_PAYROLL_MASTER</code> — 534 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SOC_SEC_NO` | UZONED | 11 | 0 | NOT A KEY | NOTNULL |
| 2 | `FIR_NAME_1` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 3 | `CODE_CONSL` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 4 | `FILLER_1` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 5 | `MID_INIT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 6 | `SURNAME_3` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 7 | `SURNAME_OTHER` | CHAR | 13 | 0 | NOT A KEY | NOTNULL |
| 8 | `ST_CONT_LOC` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 9 | `CITY_LOC` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 10 | `CTY_CTRY_LOC` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 11 | `CAN_FY` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 12 | `CAN_AGCY` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 13 | `CAN_AP` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 14 | `CAN_AGCY_ACCT_CDE` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 15 | `ORG_CDE` | CHAR | 11 | 0 | NOT A KEY | NOTNULL |
| 16 | `SEX_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 17 | `VET_PREF_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 18 | `TENURE_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 19 | `PERM_TEMP_POS_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 20 | `FT_PT_INTER_POS_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 21 | `CITIZEN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 22 | `TYPE_APPT_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 23 | `PERS_NOA` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 24 | `SEP_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 25 | `CEILING_EN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 26 | `FUNC_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 27 | `PAY_BASIS` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 28 | `SPO_TERM_ID` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 29 | `POSITION_1` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 30 | `POSITION_2` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 31 | `GRADE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 32 | `STEP` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 33 | `ABNOR_RATE_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 34 | `FED_RETIRE_CDE_OLD` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 35 | `ST_TAX_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 36 | `CITY_ST_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 37 | `CITY_ID_CDE` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 38 | `HLTH_ENROL_CDE` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 39 | `UNION_IDENT_CDE` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 40 | `TSPA_STATUS_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 41 | `ALT_1_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 42 | `ALT_1_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 43 | `ALT_2_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 44 | `ALT_2_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 45 | `EFT_CODE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 46 | `EFT_EMPL_ACCT_NUMBER` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 47 | `EFT_EMPL_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 48 | `CSA_RECIPIENT_NAME` | CHAR | 22 | 0 | NOT A KEY | NOTNULL |
| 49 | `CSA_RECIPIENT_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 50 | `REEMP_ANN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 51 | `FLSA_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 52 | `CPP_REF_DED_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 53 | `ADJ_REFUND_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 54 | `ALT_4_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 55 | `ALT_4_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 56 | `ST_CNTY_TAX_CODE` | CHAR | 5 | 0 | NOT A KEY | NOTNULL |
| 57 | `PSP_CONTRACT_LGTH` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 58 | `FEGLI_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 59 | `FEGLI_CDE_2` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 60 | `FEHB_PC_PRE_TAX_IND` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 61 | `ALT_5_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 62 | `ALT_6_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 63 | `ALT_7_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 64 | `ALT_8_ACCT_TYPE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 65 | `ALT_5_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 66 | `ALT_6_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 67 | `ALT_7_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 68 | `ALT_8_EE_ACCT_NO` | CHAR | 17 | 0 | NOT A KEY | NOTNULL |
| 69 | `VIS_DENTAL_1_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 70 | `VIS_DENTAL_2_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 71 | `VIS_DENTAL_3_CDE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 72 | `AGCY_CDE_PER` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 73 | `PHY_HNDCP` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 74 | `SUPV_CDE` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 75 | `POS_SEN_CDE` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 76 | `TOT_FED_TAX_EXEMP` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 77 | `ADDL_FED_TAX_EXEM` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 78 | `FED_TAX_MAR_STAT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 79 | `ST_TAX_MAR_STAT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 80 | `CITY_MAR_STAT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 81 | `CITY_EXEMP` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 82 | `TSPA_VEST_PERIOD` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 83 | `ALT_1_ROUTE_ID` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 84 | `ALT_1_ROUTE_DIGIT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 85 | `ALT_2_ROUTE_ID` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 86 | `ALT_2_ROUTE_DIGIT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 87 | `EFT_ROUTE_ID` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 88 | `EFT_CK_DIGIT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 89 | `EIC_STATUS_CODE` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 90 | `RPT_CDE` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 91 | `CPP_NO` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 92 | `YTD_ST_TX_1_CDE` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 93 | `YTD_ST_TX_2_CDE` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 94 | `YTD_ST_TX_3_CDE` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 95 | `YTD_ST_TX_4_CDE` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 96 | `ADJ_NO` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 97 | `LV_CAT_CDE` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 98 | `DAYS_INTER_CPP` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 99 | `DAYS_INTER_YTD` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 100 | `DAYS_INTER_CBAL` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 101 | `ALT_4_ROUTE_ID` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 102 | `ALT_4_ROUTE_DIGIT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 103 | `ALT_5_ROUTE_ID` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 104 | `ALT_5_ROUTE_DIGIT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 105 | `ALT_6_ROUTE_ID` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 106 | `ALT_6_ROUTE_DIGIT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 107 | `ALT_7_ROUTE_ID` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 108 | `ALT_7_ROUTE_DIGIT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 109 | `ALT_8_ROUTE_ID` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 110 | `ALT_8_ROUTE_DIGIT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 111 | `OCCUP_CDE` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 112 | `TK_NO` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 113 | `SPOC` | UZONED | 4 | 0 | NOT A KEY | NOTNULL |
| 114 | `DATE_BIRTH` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 115 | `FS_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 116 | `EOD_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 117 | `SEP_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 118 | `PSI_START_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 119 | `PREMIUM_PAY` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 120 | `CAR_SERV_DTE` | UZONED | 12 | 0 | NOT A KEY | NOTNULL |
| 121 | `PROB_DTE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 122 | `BASE_HRS` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 123 | `ANNUAL_SAL` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 124 | `HRLY_RATE` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 125 | `OT_RATE` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 126 | `SEV_PAY_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 127 | `FED_OPT_TAX_DED` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 128 | `ST_TAX_EXEMP` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 129 | `ST_TAX_OPT_DED` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 130 | `HLTH_DED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 131 | `HLTH_GOVT_SHARE` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 132 | `UNION_DED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 133 | `FERS_BAL_FWD` | UZONED | 8 | 2 | NOT A KEY | NOTNULL |
| 134 | `TSPA_STATUS_CODE_DTE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 135 | `TSPA_SCD` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 136 | `PCA_BIWEEK_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 137 | `REEMP_ANU_HR_RTE` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 138 | `CPP_BASE_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 139 | `CPP_OT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 140 | `CPP_ND_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 141 | `CPP_SD_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 142 | `CPP_HOL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 143 | `CPP_PD_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 144 | `CPP_COLA_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 145 | `CPP_UNIF_ALLOW` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 146 | `CPP_SEV_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 147 | `CPP_CASH_AWARD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 148 | `CPP_OTHER_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 149 | `CPP_GROSS_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 150 | `CPP_PAY_NS_FWIT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 151 | `CPP_FED_WITH_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 152 | `CPP_PAY_S_FEDTX` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 153 | `CPP_CSR_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 154 | `CPP_CSR_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 155 | `CPP_PAY_S_CSR` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 156 | `CPP_FICA_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 157 | `CPP_FICA_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 158 | `CPP_PAY_S_FICA` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 159 | `CPP_MEDC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 160 | `CPP_MEDC_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 161 | `CPP_PAY_S_MEDC` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 162 | `CPP_FERS_EMP_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 163 | `CPP_FERS_AGY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 164 | `CPP_FERS_PAY_SUB` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 165 | `CPP_LEVY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 166 | `CPP_ST_TAX_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 167 | `CPP_CITY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 168 | `CPP_HLTH_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 169 | `CPP_HLTH_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 170 | `CPP_BOND_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 171 | `CPP_LI_REG_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 172 | `CPP_LI_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 173 | `CPP_LI_OPT_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 174 | `CPP_FEGLI_OPTB` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 175 | `CPP_FEGLI_OPTC` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 176 | `CPP_CHAR_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 177 | `CPP_UNION_1_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 178 | `CPP_ALT_1_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 179 | `CPP_ALT_2_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 180 | `CPP_NET_ALT_DED` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 181 | `CPP_REF_DED_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 182 | `CPP_QUARTERS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 183 | `CPP_SUBSIST_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 184 | `CPP_NET_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 185 | `CPP_CSA_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 186 | `EIC_CPP_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 187 | `PCA_CPP_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 188 | `CPP_TSPA_PAY_SUB` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 189 | `CPP_TSPG_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 190 | `CPP_TSPG_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 191 | `CPP_TSPG_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 192 | `CPP_TSPF_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 193 | `CPP_TSPF_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 194 | `CPP_TSPF_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 195 | `CPP_TSPC_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 196 | `CPP_TSPC_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 197 | `CPP_TSPC_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 198 | `YTD_BASE_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 199 | `YTD_OT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 200 | `YTD_ND_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 201 | `YTD_SD_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 202 | `YTD_HOL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 203 | `YTD_PD_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 204 | `YTD_COLA_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 205 | `YTD_UNIF_ALLOW` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 206 | `YTD_SEV_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 207 | `YTD_CASH_AWARDS` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 208 | `YTD_MISC_OTH_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 209 | `YTD_GROSS_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 210 | `YTD_NON_TAX_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 211 | `YTD_FED_TAX_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 212 | `YTD_TAXABLE_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 213 | `YTD_CSR_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 214 | `YTD_CSR_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 215 | `YTD_CSR_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 216 | `YTD_FICA_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 217 | `YTD_FICA_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 218 | `YTD_FICA_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 219 | `YTD_MEDC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 220 | `YTD_MEDC_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 221 | `YTD_PAY_S_MEDC` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 222 | `YTD_FERS_EMP_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 223 | `YTD_FERS_AGY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 224 | `YTD_FERS_PAY_SUB` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 225 | `YTD_ST_TX_1_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 226 | `YTD_ST_TX_1_GRS` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 227 | `YTD_ST_TX_2_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 228 | `YTD_ST_TX_2_GRS` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 229 | `YTD_ST_TX_3_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 230 | `YTD_ST_TX_3_GRS` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 231 | `YTD_ST_TX_4_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 232 | `YTD_ST_TX_4_GRS` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 233 | `YTD_CITY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 234 | `YTD_HLTH_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 235 | `YTD_HLTH_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 236 | `YTD_BOND_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 237 | `YTD_LI_REG_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 238 | `YTD_LI_REG_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 239 | `YTD_LI_OPT_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 240 | `YTD_FEGLI_OPTB` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 241 | `YTD_FEGLI_OPTC` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 242 | `YTD_CHAR_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 243 | `YTD_ALT_1_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 244 | `YTD_QUARTERS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 245 | `YTD_NET_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 246 | `YTD_CSA_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 247 | `EIC_YTD_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 248 | `PCA_YTD_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 249 | `YTD_TSPA_PAY_SUB` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 250 | `YTD_TSPG_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 251 | `YTD_TSPG_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 252 | `YTD_TSPG_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 253 | `YTD_TSPF_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 254 | `YTD_TSPF_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 255 | `YTD_TSPF_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 256 | `YTD_TSPC_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 257 | `YTD_TSPC_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 258 | `YTD_TSPC_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 259 | `ADJ_BASE_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 260 | `ADJ_OT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 261 | `ADJ_ND_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 262 | `ADJ_SD_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 263 | `ADJ_HOL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 264 | `ADJ_PD_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 265 | `ADJ_COLA_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 266 | `ADJ_UNIF_ALLOW` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 267 | `ADJ_SEV_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 268 | `ADJ_CAS_AWARD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 269 | `ADJ_OTHER_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 270 | `ADJ_GROSS_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 271 | `ADJ_PAY_NS_FWIT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 272 | `ADJ_FED_WITH_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 273 | `ADJ_CSR_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 274 | `ADJ_CSR_WAGES` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 275 | `ADJ_CSR_EMPL_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 276 | `ADJ_FICA_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 277 | `ADJ_FICA_WAGES` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 278 | `ADJ_FICA_EMPL_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 279 | `ADJ_MEDC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 280 | `ADJ_MEDC_WAGES` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 281 | `ADJ_MEDC_EMPL_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 282 | `ADJ_FERS_EMP_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 283 | `ADJ_FERS_AGY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 284 | `ADJ_FERS_WAGES` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 285 | `ADJ_ST_TAX_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 286 | `ADJ_ST_TAX_DD2` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 287 | `ADJ_CITY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 288 | `ADJ_HLTH_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 289 | `ADJ_HLTH_EMPLR` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 290 | `ADJ_BOND_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 291 | `ADJ_LI_REG_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 292 | `ADJ_LI_OPT_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 293 | `ADJ_FEGLI_OPTB` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 294 | `ADJ_FEGLI_OPTC` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 295 | `ADJ_CHAR_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 296 | `ADJ_UNION_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 297 | `ADJ_REFUND_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 298 | `ADJ_QUARTERS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 299 | `ADJ_SUBSIST_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 300 | `ADJ_LAUNDRY_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 301 | `ADJ_NET_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 302 | `EIC_ADJ_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 303 | `PCA_ADJ_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 304 | `ADJ_TSPA_PAY_SUB` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 305 | `ADJ_TSPG_GBADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 306 | `ADJ_TSPG_EADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 307 | `ADJ_TSPG_GMADIST` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 308 | `UNCOM_TOUR_AN_LV_FACT` | UZONED | 3 | 2 | NOT A KEY | NOTNULL |
| 309 | `UNCOM_TOUR_SICK_LVFACT` | UZONED | 3 | 2 | NOT A KEY | NOTNULL |
| 310 | `AN_LV_CR_RED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 311 | `SICK_LV_CR_RED` | UZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 312 | `AN_LV_EARNED_CPP` | ZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 313 | `AN_LV_USED_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 314 | `AN_LV_PRYR_BAL` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 315 | `AN_LV_ERND_YTD` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 316 | `AN_LV_ADV_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 317 | `AN_LV_ADV_CBAL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 318 | `AN_LV_USED_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 319 | `AN_LV_CUR_BAL` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 320 | `AN_LV_MAX_COVER` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 321 | `AN_LV_USE_LOSE` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 322 | `AN_LV_PTHRS_WK` | ZONED | 4 | 2 | NOT A KEY | NOTNULL |
| 323 | `SICK_LV_ERN_CPP` | ZONED | 4 | 2 | NOT A KEY | NOTNULL |
| 324 | `SICK_LV_USD_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 325 | `SICK_LV_PRYR_BL` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 326 | `SICK_LV_ERN_YTD` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 327 | `SICK_LV_ADV_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 328 | `SICK_LV_AD_CBAL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 329 | `SICK_LV_USD_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 330 | `SICK_LV_CUR_BAL` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 331 | `SICK_LV_PTHR_WK` | ZONED | 4 | 2 | NOT A KEY | NOTNULL |
| 332 | `COMP_LV_ERN_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 333 | `COMP_LV_USD_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 334 | `COMP_LV_CUR_BAL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 335 | `ADMIN_LV_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 336 | `ADMIN_LV_YTD` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 337 | `MILITARY_LV_YTD` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 338 | `COURT_LV_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 339 | `COURT_LV_YTD` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 340 | `LWOP_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 341 | `LWOP_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 342 | `AWOL_CPP` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 343 | `AWOL_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 344 | `LWOP_AWOP_LSPSI` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 345 | `COMP_TIME_FOR_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 346 | `REG_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 347 | `REG_HRS_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 348 | `HRS_OT_1` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 349 | `HRS_OT_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 350 | `HRS_ND_1` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 351 | `HRS_ND_2` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 352 | `HRS_ND_3` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 353 | `HRS_ND_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 354 | `HRS_SD_1` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 355 | `HRS_SD_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 356 | `HRS_HOL_1` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 357 | `HRS_HOL_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 358 | `HRS_OTHER_CPP` | ZONED | 4 | 2 | NOT A KEY | NOTNULL |
| 359 | `HRS_OTHER_YTD` | ZONED | 6 | 2 | NOT A KEY | NOTNULL |
| 360 | `HRS_OT_PL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 361 | `STAFFING_BIW_AMT` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 362 | `CPP_STAFFING` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 363 | `YTD_STAFFING` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 364 | `TRANSFER_IN_FICA_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 365 | `COMP_HRS_PAID` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 366 | `COMP_TIME_HRLY_RATE` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 367 | `CPP_ALT_4_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 368 | `CPP_LOAN_1_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 369 | `YTD_LOAN_1_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 370 | `ADJ_LOAN_1_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 371 | `CPP_COUNTY_TAX_GROSS` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 372 | `CPP_ST_TAX_GROSS` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 373 | `TRANSFER_IN_FICA_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 374 | `CPP_INST_AGY_PAID` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 375 | `CPP_ON_CALL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 376 | `YTD_ON_CALL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 377 | `ADJ_ON_CALL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 378 | `CPP_ON_CALL_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 379 | `YTD_ON_CALL_HRS` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 380 | `CPP_LOCAL_DIFF` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 381 | `INCENT_TIME_EARNED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 382 | `INCENT_TIME_USED` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 383 | `INCENT_TIME_CUR_BAL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 384 | `BAYLR_REG_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 385 | `BAYLR_REG_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 386 | `CPP_BAYLR_BP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 387 | `YTD_BAYLR_BP` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 388 | `NON_BAYLR_REG_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 389 | `NON_BAYLR_REG_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 390 | `CPP_NON_BAYLR_BP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 391 | `YTD_NON_BAYLR_BP` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 392 | `T38_OT_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 393 | `T38_HOL_OT_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 394 | `T38_ND_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 395 | `T38_ONCALL_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 396 | `T38_SAT_DIF_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 397 | `T38_SUN_DIF_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 398 | `T38_OT_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 399 | `T38_HOL_OT_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 400 | `T38_ND_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 401 | `T38_ONCALL_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 402 | `T38_SAT_DIF_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 403 | `T38_SUN_DIF_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 404 | `CPP_T38_OT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 405 | `CPP_T38_HOL_OT_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 406 | `CPP_T38_ND_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 407 | `CPP_T38_ONCALL_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 408 | `CPP_T38_SAT_DIF_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 409 | `CPP_T38_SUN_DIF_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 410 | `T38_OT_PAY_YTD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 411 | `T38_HOL_OT_PAY_YTD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 412 | `T38_ND_PAY_YTD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 413 | `T38_ONCALL_PAY_YTD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 414 | `T38_SAT_DIF_PAY_YTD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 415 | `T38_SUN_DIF_PAY_YTD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 416 | `DCS_NBR_DEBTS` | ZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 417 | `CPP_DCS_DEBT_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 418 | `YTD_DCS_DEBT_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 419 | `ADJ_DCS_DEBT_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 420 | `HRS_HAZARD_CPP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 421 | `RET_BAL_FWD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 422 | `ANN_LV_VALUE` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 423 | `SICK_LV_VALUE` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 424 | `T38_REG_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 425 | `T38_REG_HRS_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 426 | `T38_BP_CPP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 427 | `T38_BP_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 428 | `LOCAL_PCENT_RATE` | ZONED | 5 | 4 | NOT A KEY | NOTNULL |
| 429 | `CPP_SEP_INCENT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 430 | `YTD_SEP_INCENT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 431 | `PSP_START_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 432 | `PSP_NTE_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 433 | `PSP_YRLY_PAY` | ZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 434 | `PSP_NTE_CONTRACT_AMT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 435 | `PSP_CONTR_TO_DATE` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 436 | `PSP_CONTR_YTD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 437 | `PSP_LGTH_SVC_INC_AMT` | ZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 438 | `PSP_LGNTH_SVC_CHNG_DATE` | UZONED | 6 | 0 | NOT A KEY | NOTNULL |
| 439 | `PSP_BIWKLY_AMT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 440 | `CPP_PSP_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 441 | `YTD_PSP_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 442 | `ADJ_PSP_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 443 | `CPP_PSP_CSRS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 444 | `YTD_PSP_CSRS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 445 | `ADJ_PSP_CSRS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 446 | `CPP_PSP_CSRS_GOVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 447 | `YTD_PSP_CSRS_GOVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 448 | `ADJ_PSP_CSRS_GOVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 449 | `CPP_PSP_CSRS_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 450 | `YTD_PSP_CSRS_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 451 | `ADJ_PSP_CSRS_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 452 | `PSP_CSRS_BAL_FWRD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 453 | `CPP_PSP_FERS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 454 | `YTD_PSP_FERS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 455 | `ADJ_PSP_FERS_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 456 | `CPP_PSP_FERS_GOVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 457 | `YTD_PSP_FERS_GOVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 458 | `ADJ_PSP_FERS_GOVT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 459 | `CPP_PSP_FERS_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 460 | `YTD_PSP_FERS_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 461 | `ADJ_PSP_FERS_PAY` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 462 | `RESTOR_AL_USED_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 463 | `RESTOR_AL_USED_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 464 | `RESTOR_AL_BALANCE` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 465 | `RESTOR_AL_BAL_1` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 466 | `RESTOR_AL_BAL_2` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 467 | `RESTOR_AL_BAL_3` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 468 | `RESTOR_AL_PAID_CPP` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 469 | `RESTOR_AL_PAID_ADJ` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 470 | `CPP_LUMPSUM_LVPY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 471 | `YTD_LSL_PAY` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 472 | `ADJ_LUMP_SUM` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 473 | `CPP_RECRUIT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 474 | `YTD_RECRUIT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 475 | `ADJ_RECRUIT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 476 | `CPP_RELOC` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 477 | `YTD_RELOC` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 478 | `ADJ_RELOC` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 479 | `CPP_RETENT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 480 | `YTD_RETENT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 481 | `ADJ_RETENT` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 482 | `CPP_TEA_EMP_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 483 | `YTD_TEA_EMP_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 484 | `ADJ_TEA_EMP_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 485 | `CPP_TEA_GVT_TV_CONT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 486 | `ADJ_TEA_GVT_TV_CONT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 487 | `CPP_TEA_GVT_PK_CONT` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 488 | `FEHB_PC_PRE_TAX_YTD` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 489 | `YTD_CHILD_SUB` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 490 | `SUSP_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 491 | `FURLO_HRS_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 492 | `REL_COMP_ERND_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 493 | `REL_COMP_USED_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 494 | `REL_COMP_CURR_BAL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 495 | `REL_COMP_LS_PAY_CPP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 496 | `REL_COMP_LS_PAY_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 497 | `REL_COMP_LS_PAY_ADJ` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 498 | `REL_COMP_LS_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 499 | `CR_HRS_ERND_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 500 | `CR_HRS_USED_CPP` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 501 | `CR_HRS_CUR_BAL` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 502 | `CR_HRS_LS_PAY_CPP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 503 | `CR_HRS_LS_PAY_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 504 | `CR_HRS_LS_PAY_ADJ` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 505 | `CR_HRS_LS_HRS` | ZONED | 5 | 2 | NOT A KEY | NOTNULL |
| 506 | `YTD_PREPD_HB` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 507 | `CPP_LTC_DED` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 508 | `YTD_LTC_DED` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 509 | `ADJ_LTC_DED` | ZONED | 9 | 2 | NOT A KEY | NOTNULL |
| 510 | `CPP_FSAHC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 511 | `YTD_FSAHC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 512 | `ADJ_FSAHC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 513 | `CPP_FSADC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 514 | `YTD_FSADC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 515 | `ADJ_FSADC_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 516 | `CPP_TSP_OVER50` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 517 | `ADJ_TSP_OVER50` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 518 | `YTD_TSP_OVER50` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 519 | `CPP_ALT_5_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 520 | `CPP_ALT_6_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 521 | `CPP_ALT_7_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 522 | `CPP_ALT_8_DED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 523 | `TVL_COMP_BEGIN_BAL` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 524 | `TVL_COMP_END_BAL` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 525 | `TVL_COMP_USED_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 526 | `TVL_COMP_FORFEITED` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 527 | `VIS_DENT_1_CPP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 528 | `VIS_DENT_1_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 529 | `VIS_DENT_2_CPP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 530 | `VIS_DENT_2_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 531 | `VIS_DENT_3_CPP` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 532 | `VIS_DENT_3_YTD` | ZONED | 7 | 2 | NOT A KEY | NOTNULL |
| 533 | `FED_RETIRE_1` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 534 | `FED_RETIRE_2` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>CPM_NIH_CPM_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>GENERIC_TARGET_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_NIH_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

### CPM_OIG

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `CPM_OIG_MESSAGE_FILE` | Flat File | — | 2 |
| `CPM_OIG_PAY_PERIOD_FILE` | Flat File | — | 1 |
| `CPM_OIG_CPM_PAY_PERIOD_FILE` | Flat File | — | 1 |
| `oigsgndec_SKPAYROLL_MASTER` | PWX_SEQ_NRDB2 | — | 287 |

<details><summary><code>CPM_OIG_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 100 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 300 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_OIG_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_OIG_CPM_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>oigsgndec_SKPAYROLL_MASTER</code> — 287 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SKFIR_NAME_1` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 2 | `SKCODE_CONSL` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 3 | `SKFIR_NAME_3_11` | CHAR | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `SKMID_INIT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 5 | `SKSURNAME_3` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 6 | `SKSURNAME_OTHER` | CHAR | 13 | 0 | NOT A KEY | NOTNULL |
| 7 | `SKSOC_SEC_NO` | UZONED | 11 | 0 | NOT A KEY | NOTNULL |
| 8 | `SKOCCUP_CDE` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 9 | `SKST_CONT_LOC` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 10 | `SKCITY_LOC` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 11 | `SKCTY_CTRY_LOC` | CHAR | 3 | 0 | NOT A KEY | NOTNULL |
| 12 | `SKTK_NO` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 13 | `SKCAN_FY` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 14 | `SKCAN_AGCY` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 15 | `SKCAN_AP` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 16 | `SKCAN_AGCY_ACCT_CDE` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 17 | `SKORG_CDE` | CHAR | 11 | 0 | NOT A KEY | NOTNULL |
| 18 | `SKVET_PREF_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 19 | `SKTENURE_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 20 | `SKPERM_TEMP_POS_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 21 | `SKFT_PT_INTER_POS_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 22 | `SKCITIZEN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 23 | `SKTYPE_APPT_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 24 | `SKDATE_BIRTH` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 25 | `SKFS_DATE` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 26 | `SKEOD_DATE` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 27 | `SKSEP_DATE` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 28 | `SKPERS_NOA` | CHAR | 4 | 0 | NOT A KEY | NOTNULL |
| 29 | `SKPERS_EFF_DATE` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 30 | `SKPSI_START_DATE` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 31 | `SKRSSDP_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 32 | `SKRSSDP` | UZONED | 3 | 3 | NOT A KEY | NOTNULL |
| 33 | `SKCEILING_EN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 34 | `SKSUPV_CDE` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 35 | `SKPAY_BASIS` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 36 | `SKPROB_DTE` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 37 | `SKPOSITION_1` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 38 | `SKPOSITION_2` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 39 | `SKGRADE` | CHAR | 2 | 0 | NOT A KEY | NOTNULL |
| 40 | `SKSTEP` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 41 | `SKBASE_HRS` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 42 | `SKANNUAL_SAL` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 43 | `SKANNUAL_SAL_PAPER` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 44 | `SKHRLY_RATE_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 45 | `SKHRLY_RATE_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 46 | `SKHRLY_RATE_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 47 | `SKHRLY_RATE_PAPER_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 48 | `SKHRLY_RATE_PAPER_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 49 | `SKHRLY_RATE_PAPER_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 50 | `SKOT_RATE_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 51 | `SKOT_RATE_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 52 | `SKOT_RATE_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 53 | `SKCOLA_PCT_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 54 | `SKCOLA_PCT` | UZONED | 5 | 5 | NOT A KEY | NOTNULL |
| 55 | `SKOT_RATE_HOLD_1_2_3` | UZONED | 12 | 0 | NOT A KEY | NOTNULL |
| 56 | `SKREEMP_ANN_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 57 | `SKCPP_NO` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 58 | `SKCPP_OT_PAY_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 59 | `SKCPP_OT_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 60 | `SKCPP_OT_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 61 | `SKCPP_OT_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 62 | `SKCPP_HOL_PAY_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 63 | `SKCPP_HOL_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 64 | `SKCPP_HOL_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 65 | `SKCPP_HOL_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 66 | `SKCPP_COLA_PAY_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 67 | `SKCPP_COLA_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 68 | `SKCPP_COLA_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 69 | `SKCPP_COLA_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 70 | `SKCPP_SEV_PAY_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 71 | `SKCPP_SEV_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 72 | `SKCPP_SEV_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 73 | `SKCPP_SEV_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 74 | `SKCPP_CASH_AWARD_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 75 | `SKCPP_CASH_AWARD_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 76 | `SKCPP_CASH_AWARD_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 77 | `SKCPP_CASH_AWARD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 78 | `SKCPP_MP_CASH_AWARD_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 79 | `SKCPP_MP_CASH_AWARD_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 80 | `SKCPP_MP_CASH_AWARD_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 81 | `SKCPP_MP_CASH_AWARD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 82 | `SKCPP_LUMPSUM_LVPY_INT` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 83 | `SKCPP_LUMPSUM_LVPY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 84 | `SKCPP_LUMPSUM_LVPY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 85 | `SKCPP_LUMPSUM_LVPY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 86 | `SKCPP_GROSS_PAY_INT` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 87 | `SKCPP_GROSS_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 88 | `SKCPP_GROSS_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 89 | `SKCPP_GROSS_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 90 | `SKCPP_CSR_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 91 | `SKCPP_CSR_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 92 | `SKCPP_CSR_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 93 | `SKCPP_CSR_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 94 | `SKCPP_FICA_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 95 | `SKCPP_FICA_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 96 | `SKCPP_FICA_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 97 | `SKCPP_FICA_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 98 | `SKCPP_MEDC_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 99 | `SKCPP_MEDC_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 100 | `SKCPP_MEDC_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 101 | `SKCPP_MEDC_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 102 | `SKCPP_FERS_AGY_DED_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 103 | `SKCPP_FERS_AGY_DED_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 104 | `SKCPP_FERS_AGY_DED_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 105 | `SKCPP_FERS_AGY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 106 | `SKCPP_HLTH_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 107 | `SKCPP_HLTH_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 108 | `SKCPP_HLTH_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 109 | `SKCPP_HLTH_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 110 | `SKCPP_LI_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 111 | `SKCPP_LI_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 112 | `SKCPP_LI_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 113 | `SKCPP_LI_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 114 | `SKCPP_TSPG_GBADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 115 | `SKCPP_TSPG_GBADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 116 | `SKCPP_TSPG_GBADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 117 | `SKCPP_TSPG_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 118 | `SKCPP_TSPG_GMADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 119 | `SKCPP_TSPG_GMADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 120 | `SKCPP_TSPG_GMADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 121 | `SKCPP_TSPG_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 122 | `SKCPP_TSPF_GBADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 123 | `SKCPP_TSPF_GBADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 124 | `SKCPP_TSPF_GBADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 125 | `SKCPP_TSPF_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 126 | `SKCPP_TSPF_GMADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 127 | `SKCPP_TSPF_GMADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 128 | `SKCPP_TSPF_GMADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 129 | `SKCPP_TSPF_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 130 | `SKCPP_TSPC_GBADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 131 | `SKCPP_TSPC_GBADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 132 | `SKCPP_TSPC_GBADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 133 | `SKCPP_TSPC_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 134 | `SKCPP_TSPC_GMADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 135 | `SKCPP_TSPC_GMADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 136 | `SKCPP_TSPC_GMADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 137 | `SKCPP_TSPC_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 138 | `SKYTD_OT_PAY_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 139 | `SKYTD_OT_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 140 | `SKYTD_OT_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 141 | `SKYTD_OT_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 142 | `SKYTD_CASH_AWARDS_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 143 | `SKYTD_CASH_AWARDS_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 144 | `SKYTD_CASH_AWARDS_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 145 | `SKYTD_CASH_AWARDS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 146 | `SKYTD_MP_CASH_AWARD_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 147 | `SKYTD_MP_CASH_AWARD_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 148 | `SKYTD_MP_CASH_AWARD_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 149 | `SKYTD_MP_CASH_AWARD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 150 | `SKYTD_LSL_PAY_INT` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 151 | `SKYTD_LSL_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 152 | `SKYTD_LSL_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 153 | `SKYTD_LSL_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 154 | `SKYTD_GROSS_PAY_INT` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 155 | `SKYTD_GROSS_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 156 | `SKYTD_GROSS_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 157 | `SKYTD_GROSS_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 158 | `SKYTD_CSR_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 159 | `SKYTD_CSR_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 160 | `SKYTD_CSR_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 161 | `SKYTD_CSR_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 162 | `SKYTD_FICA_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 163 | `SKYTD_FICA_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 164 | `SKYTD_FICA_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 165 | `SKYTD_FICA_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 166 | `SKYTD_MEDC_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 167 | `SKYTD_MEDC_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 168 | `SKYTD_MEDC_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 169 | `SKYTD_MEDC_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 170 | `SKYTD_FERS_AGY_DED_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 171 | `SKYTD_FERS_AGY_DED_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 172 | `SKYTD_FERS_AGY_DED_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 173 | `SKYTD_FERS_AGY_DED_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 174 | `SKYTD_HLTH_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 175 | `SKYTD_HLTH_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 176 | `SKYTD_HLTH_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 177 | `SKYTD_HLTH_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 178 | `SKYTD_LI_REG_EMPLR_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 179 | `SKYTD_LI_REG_EMPLR_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 180 | `SKYTD_LI_REG_EMPLR_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 181 | `SKYTD_LI_REG_EMPLR_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 182 | `SKYTD_TSPG_GBADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 183 | `SKYTD_TSPG_GBADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 184 | `SKYTD_TSPG_GBADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 185 | `SKYTD_TSPG_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 186 | `SKYTD_TSPG_GMADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 187 | `SKYTD_TSPG_GMADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 188 | `SKYTD_TSPG_GMADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 189 | `SKYTD_TSPG_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 190 | `SKYTD_TSPF_GBADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 191 | `SKYTD_TSPF_GBADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 192 | `SKYTD_TSPF_GBADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 193 | `SKYTD_TSPF_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 194 | `SKYTD_TSPF_GMADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 195 | `SKYTD_TSPF_GMADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 196 | `SKYTD_TSPF_GMADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 197 | `SKYTD_TSPF_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 198 | `SKYTD_TSPC_GBADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 199 | `SKYTD_TSPC_GBADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 200 | `SKYTD_TSPC_GBADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 201 | `SKYTD_TSPC_GBADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 202 | `SKYTD_TSPC_GMADIST_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 203 | `SKYTD_TSPC_GMADIST_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 204 | `SKYTD_TSPC_GMADIST_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 205 | `SKYTD_TSPC_GMADIST_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 206 | `SKADJ_OT_PAY_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 207 | `SKADJ_OT_PAY_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 208 | `SKADJ_OT_PAY_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 209 | `SKADJ_OT_PAY_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 210 | `SKAN_LV_CUR_BAL_INT` | UZONED | 4 | 0 | NOT A KEY | NOTNULL |
| 211 | `SKAN_LV_CUR_BAL_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 212 | `SKAN_LV_CUR_BAL_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 213 | `SKAN_LV_CUR_BAL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 214 | `SKLWOP_CPP_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 215 | `SKLWOP_CPP_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 216 | `SKLWOP_CPP_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 217 | `SKLWOP_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 218 | `SKLWOP_YTD_INT` | UZONED | 4 | 0 | NOT A KEY | NOTNULL |
| 219 | `SKLWOP_YTD_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 220 | `SKLWOP_YTD_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 221 | `SKLWOP_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 222 | `SKAWOL_CPP_INT` | UZONED | 4 | 0 | NOT A KEY | NOTNULL |
| 223 | `SKAWOL_CPP_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 224 | `SKAWOL_CPP_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 225 | `SKAWOL_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 226 | `SKTA_RECD_CDE` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 227 | `SKREG_HRS_CPP_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 228 | `SKREG_HRS_CPP_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 229 | `SKREG_HRS_CPP_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 230 | `SKREG_HRS_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 231 | `SKREG_HRS_YTD_INT` | UZONED | 4 | 0 | NOT A KEY | NOTNULL |
| 232 | `SKREG_HRS_YTD_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 233 | `SKREG_HRS_YTD_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 234 | `SKREG_HRS_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 235 | `SKHRS_OT_1_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 236 | `SKHRS_OT_1_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 237 | `SKHRS_OT_1_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 238 | `SKHRS_OT_1_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 239 | `SKHRS_OT_YTD_INT` | UZONED | 4 | 0 | NOT A KEY | NOTNULL |
| 240 | `SKHRS_OT_YTD_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 241 | `SKHRS_OT_YTD_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 242 | `SKHRS_OT_YTD_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 243 | `SKHRS_OTHER_CPP_INT` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 244 | `SKHRS_OTHER_CPP_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 245 | `SKHRS_OTHER_CPP_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 246 | `SKHRS_OTHER_CPP_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 247 | `SKDAYS_INTER_CPP` | UZONED | 2 | 0 | NOT A KEY | NOTNULL |
| 248 | `SKSPEC_REG_HRS_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 249 | `SKSPEC_REG_HRS_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 250 | `SKSPEC_REG_HRS_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 251 | `SKSPEC_REG_HRS_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 252 | `SKHRS_OT_PL_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 253 | `SKHRS_OT_PL_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 254 | `SKHRS_OT_PL_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 255 | `SKHRS_OT_PL_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 256 | `SKHRS_OT_SPEC_INT` | UZONED | 3 | 0 | NOT A KEY | NOTNULL |
| 257 | `SKHRS_OT_SPEC_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 258 | `SKHRS_OT_SPEC_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 259 | `SKHRS_OT_SPEC_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 260 | `SKCPP_TSPG_UND_DED_GVT_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 261 | `SKCPP_TSPG_UND_DED_GVT_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 262 | `SKCPP_TSPG_UND_DED_GVT_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 263 | `SKCPP_TSPG_UND_DED_GVT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 264 | `SKCPP_TSPF_UND_DED_GVT_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 265 | `SKCPP_TSPF_UND_DED_GVT_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 266 | `SKCPP_TSPF_UND_DED_GVT_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 267 | `SKCPP_TSPF_UND_DED_GVT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 268 | `SKCPP_TSPC_UND_DED_GVT_INT` | UZONED | 5 | 0 | NOT A KEY | NOTNULL |
| 269 | `SKCPP_TSPC_UND_DED_GVT_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 270 | `SKCPP_TSPC_UND_DED_GVT_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 271 | `SKCPP_TSPC_UND_DED_GVT_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 272 | `SKLOCAL_PCENT_RATE_INT` | UZONED | 1 | 0 | NOT A KEY | NOTNULL |
| 273 | `SKLOCAL_PCENT_RATE_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 274 | `SKLOCAL_PCENT_RATE_DEC` | UZONED | 4 | 4 | NOT A KEY | NOTNULL |
| 275 | `SKLOCAL_PCENT_RATE_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 276 | `SKCPP_LOCAL_DIFF_INT` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 277 | `SKCPP_LOCAL_DIFF_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 278 | `SKCPP_LOCAL_DIFF_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 279 | `SKCPP_LOCAL_DIFF_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 280 | `SKYTD_LOCAL_DIFF_INT` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 281 | `SKYTD_LOCAL_DIFF_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 282 | `SKYTD_LOCAL_DIFF_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |
| 283 | `SKYTD_LOCAL_DIFF_SIGN` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 284 | `SKFERS_CONV_DTE` | UZONED | 8 | 0 | NOT A KEY | NOTNULL |
| 285 | `SKFERS_BAL_FWD_INT` | UZONED | 7 | 0 | NOT A KEY | NOTNULL |
| 286 | `SKFERS_BAL_FWD_PT` | CHAR | 1 | 0 | NOT A KEY | NOTNULL |
| 287 | `SKFERS_BAL_FWD_DEC` | UZONED | 2 | 2 | NOT A KEY | NOTNULL |

</details>

### EHRP2BIIS_UPDATE

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `EHRP_RECS_TRACKING_TBL` | Oracle | — | 10 |
| `NWK_ACTION_PRIMARY_TBL` | Oracle | — | 260 |
| `NWK_ACTION_SECONDARY_TBL` | Oracle | — | 209 |

<details><summary><code>EHRP_RECS_TRACKING_TBL</code> — 10 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 2 | `EMPL_RCD` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 3 | `EFFDT` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `EFFSEQ` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 5 | `EVENT_SUBMITTED_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 6 | `GVT_WIP_STATUS` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 7 | `NOA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 8 | `NOA_SUFFIX_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `BIIS_EVENT_ID` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |
| 10 | `LOAD_DATE` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>NWK_ACTION_PRIMARY_TBL</code> — 260 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `EVENT_ID` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |
| 2 | `AGCY_ASSIGN_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 3 | `AGCY_SUBELEMENT_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 4 | `AGCY_SUBELEMENT_PRIOR_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 5 | `ANN_LV_45DAY_CEIL_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 6 | `ANN_LV_CATGRY_CD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 7 | `ANN_LV_CRDT_REDUCTN_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 8 | `ANN_LV_CUR_BAL_HRS` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 9 | `ANN_LV_LUMP_SUM_PAID_HRS` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 10 | `ANN_LV_PRIOR_YEAR_BAL_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 11 | `ANN_LV_RESTORED_BAL_LV_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 12 | `ANN_LV_RESTORED_BAL1_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 13 | `ANN_LV_RESTORED_BAL2_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 14 | `ANN_LV_RESTORED_BAL3_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 15 | `ANN_LV_TRANFR_IN_BAL_HRS` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 16 | `ANN_LV_YTD_ACCRD_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 17 | `ANN_LV_YTD_USED_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 18 | `ANN_SALARY_RATE_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 19 | `ANNUITANT_IND_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 20 | `APPOINTING_OFFICE_CHANGE_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 21 | `APPT_LMT_NTE_90DAY_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 22 | `APPT_LMT_NTE_90DAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 23 | `APPT_LMT_NTE_HRS` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 24 | `APPT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 25 | `APPT_STATUS_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `APPT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 27 | `AUO_PAY_PCT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 28 | `AUO_PAY_PRIOR_PCT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 29 | `AUTHENTICATION_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `AVAILABILITY_PAY_PCT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 31 | `AWOP_WGI_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 32 | `AWOP_YTD_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 33 | `BARGAINING_UNIT_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 34 | `BASE_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 35 | `BIRTH_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 36 | `CAN_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 37 | `CAN_NEW_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 38 | `CAREER_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 39 | `CASH_AWARD_AMT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 40 | `CASH_AWARD_BNFT_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 41 | `CEIL_REPORTING_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `CHRTY_AREA_CD` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 43 | `CHRTY_DED_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 44 | `CITY_TAX_CD` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 45 | `CITY_TAX_DED_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 46 | `CITY_TAX_DED_PCT` | number(p,s) | 6 | 3 | NOT A KEY | NULL |
| 47 | `CITY_TAX_MARTL_STATUS_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 48 | `CITY_TAX_RESID_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 49 | `CITY_TAX_TOT_EXEMPT_COUNT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 50 | `CNTY_TAX_CD` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 51 | `CNTY_TAX_DED_PCT` | number(p,s) | 6 | 3 | NOT A KEY | NULL |
| 52 | `CNTY_TAX_MARTL_STATUS_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 53 | `CNTY_TAX_RESID_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 54 | `CNTY_TAX_TOT_EXEMPT_COUNT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 55 | `COMPETITIVE_LEVEL_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 56 | `COMPUTER_POSITION_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 57 | `CORR_CANCL_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 58 | `CORR_CANCL_LEGAL_AUTH_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 59 | `CORR_CANCL_LEGAL_AUTH_TXT` | varchar2 | 250 | 0 | NOT A KEY | NULL |
| 60 | `CORR_CANCL_LEGAL_AUTH2_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 61 | `CORR_CANCL_LEGAL_AUTH2_TXT` | varchar2 | 250 | 0 | NOT A KEY | NULL |
| 62 | `CORR_CANCL_NOA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 63 | `CORR_CANCL_NOA_SUFFIX_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 64 | `CRDTBL_MIL_SRVC_PERIOD` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 65 | `DETAIL_TIMEKEEPER_NUM` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 66 | `DUTY_STATION_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 67 | `DUTY_STATION_PRIOR_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 68 | `EDUCATION_ALLOWC_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 69 | `EDUCATION_LEVEL_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 70 | `EMP_EOD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 71 | `EMP_FIRST_NAME` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 72 | `EMP_GRADE_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 73 | `EMP_LAST_NAME` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 74 | `EMP_MID_INIT` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 75 | `EMP_PREV_FIRST_NAME` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 76 | `EMP_PREV_LAST_NAME` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 77 | `EMP_PREV_MID_INIT` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 78 | `EMP_RESID_CITY_ST_NAME` | varchar2 | 60 | 0 | NOT A KEY | NULL |
| 79 | `EMP_RESID_GEOGPHCL_LOC_CD` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 80 | `EMP_RESID_POSTAL_CD` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 81 | `EMP_RESID_STREET_NAME` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 82 | `EVENT_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 83 | `EVENT_SUBMITTED_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 84 | `FED_TAX_EIC_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 85 | `FED_TAX_EXEMPT_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 86 | `FED_TAX_MARTL_STATUS_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 87 | `FED_TAX_MEDICARE_NON_RESID_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 88 | `FED_TAX_OPT_DED_AMT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 89 | `FED_TAX_TOT_EXEMPT_COUNT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 90 | `FEGLI_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 91 | `FEGLI_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 92 | `FEGLI_LIVING_BNFT_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 93 | `FEGLI_LIVING_BNFT_REMAIN_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 94 | `FEHB_DED_AMT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 95 | `FEHB_GOVT_CONTB_AMT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 96 | `FEHB_PLAN_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 97 | `FEHB_PREV_PLAN_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 98 | `FERS_CONV_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 99 | `FERS_COV_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 100 | `FERS_DISABILITY_SSA_BNFT_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 101 | `FERS_SSA_BNFT_AMT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 102 | `FILLING_POSITION_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 103 | `FLSA_CATGRY_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 104 | `FRINGE_BNFT_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 105 | `FROZEN_SERVICE_PERIOD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 106 | `FUNCTNL_CLASSFCTN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 107 | `FUNCTNL_CLASSFCTN_PRIOR_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 108 | `GRADE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 109 | `GRADE_PRIOR_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 110 | `HANDICAP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 111 | `HRLY_RATE_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 112 | `INDIAN_PREFERENCE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 113 | `INSTRUCTIONAL_PROGRAM_CD` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 114 | `LEGAL_AUTH_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 115 | `LEGAL_AUTH_TXT` | varchar2 | 250 | 0 | NOT A KEY | NULL |
| 116 | `LEGAL_AUTH2_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 117 | `LEGAL_AUTH2_TXT` | varchar2 | 250 | 0 | NOT A KEY | NULL |
| 118 | `LOCALITY_PAY_AMT` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 119 | `LOCALITY_PAY_PCT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 120 | `LOCALITY_PAY_PRIOR_AMT` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 121 | `LV_REDUCTN_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 122 | `LV_SCD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 123 | `LWOP_AWOP_WGI_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 124 | `MEDICAL_OFFICER_IND_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 125 | `MEDICAL_OFFICER_IND_PRIOR_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 126 | `MSA_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 127 | `NATL_UNION_DUES_BWKLY_DED_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 128 | `NATL_UNION_DUES_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 129 | `NATL_UNION_DUES_HRLY_RATE_AMT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 130 | `NOA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 131 | `NOA_SUFFIX_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 132 | `OATH_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 133 | `OCCUPATION_CD` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 134 | `OCCUPATION_PRIOR_CD` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 135 | `OCCUPATIONAL_CATGRY_CD` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 136 | `ORGTNL_COMPONENT_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 137 | `ORGTNL_COMPONENT_PRIOR_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 138 | `OT_RATE_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 139 | `PAY_BASIS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 140 | `PAY_BASIS_PRIOR_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 141 | `PAY_PLAN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 142 | `PAY_PLAN_PRIOR_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 143 | `PCA_CATGRY_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 144 | `PCA_CONTRACT_LENGTH_YRS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 145 | `PCA_CONTRACT_NTE_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 146 | `PCA_CONTRACT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 147 | `PERMANENT_TEMP_POSITION_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 148 | `PERSONNEL_OFFICE_ID_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 149 | `PERSONNEL_OFFICE_ID_DIFFRNT_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 150 | `POSITION_CHANGE_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 151 | `POSITION_NUM` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 152 | `POSITION_OCCUPIED_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 153 | `POSITION_PRIOR_NUM` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 154 | `POSITION_SENSITIVITY_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 155 | `POSITION_TITLE_NAME` | varchar2 | 32 | 0 | NOT A KEY | NULL |
| 156 | `POSITION_TITLE_PRIOR_NAME` | varchar2 | 32 | 0 | NOT A KEY | NULL |
| 157 | `PRD_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 158 | `PRD_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 159 | `PRD_PRIOR_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 160 | `PREV_RETMT_COV_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 161 | `PROB_TRIAL_PERIOD_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 162 | `PSP_CONTRACT_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 163 | `PSP_CONTRACT_LENGTH_YRS` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 164 | `PSP_CONTRACT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 165 | `PSP_LENGTH_SRVC_INCREASE_AMT` | number(p,s) | 7 | 0 | NOT A KEY | NULL |
| 166 | `PSP_LENGTH_SRVC_CHANGE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 167 | `PSP_TOT_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 168 | `QUARTERS_DED_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 169 | `RACE_NATL_ORIGIN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 170 | `RATING_RECORD_PATTERN_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 171 | `REEMP_ANNUITANT_HRLY_RATE_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 172 | `REEMP_ANNUITANT_MONTHLY_AMT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 173 | `REGION_OPDIV_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 174 | `RETMT_PLAN_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 175 | `SCHLD_ANN_SALARY_AMT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 176 | `SCHLD_ANN_SALARY_PRIOR_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 177 | `SCHLD_HRLY_RATE_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 178 | `SES_POSITION_LEAVING_REASON_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 179 | `SES_SABBATICAL_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 180 | `SEVERANCE_PAY_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 181 | `SEVERANCE_PAY_FINAL_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 182 | `SEVERANCE_PAY_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 183 | `SEVERANCE_PAY_TOT_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 184 | `SEVERANCE_PAY_WEEKS_COUNT` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 185 | `SEX_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 186 | `SICK_LV_CRDT_REDUCTN_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 187 | `SICK_LV_CUR_BAL_HRS` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 188 | `SICK_LV_FERS_ELECT_BAL_HRS` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 189 | `SICK_LV_PRIOR_YEAR_BAL_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 190 | `SICK_LV_TRANFR_IN_BAL_HRS` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 191 | `SICK_LV_YTD_ACCRD_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 192 | `SICK_LV_YTD_USED_HRS` | number(p,s) | 6 | 2 | NOT A KEY | NULL |
| 193 | `SPECIAL_PAY_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 194 | `SPECIAL_PAY_REASON_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 195 | `SPECIAL_PROGRAM_CD` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 196 | `SSN` | varchar2 | 20 | 0 | NOT A KEY | NULL |
| 197 | `ST_TAX_CD` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 198 | `ST_TAX_MARTL_STATUS_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 199 | `ST_TAX_NON_RESID_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 200 | `ST_TAX_OPT_DED_AMT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 201 | `ST_TAX_TOT_EXEMPT_COUNT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 202 | `STEP_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 203 | `STEP_PRIOR_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 204 | `SUPERVSRY_MGRL_PROB_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 205 | `SUPERVSRY_STATUS_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 206 | `SUSPENSION_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 207 | `TEMP_PROMTN_EXP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 208 | `TENURE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 209 | `TERMINAL_SITE_CD` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 210 | `TERMINAL_SITE_DIFFRNT_CD` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 211 | `TIMEKEEPER_NUM` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 212 | `TSTG_DESIGNTD_POSITION_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 213 | `TSTG_DESIGNTD_POSITION_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 214 | `UNION_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 215 | `UNION_DED_AMT` | number(p,s) | 14 | 4 | NOT A KEY | NULL |
| 216 | `UNION_DED_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 217 | `US_CITIZENSHIP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 218 | `VETERANS_PREFERENCE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 219 | `VETERANS_STATUS_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 220 | `VLNTRY_SEP_INCENTIVE_PYMT_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 221 | `WAGE_BOARD_SHIFT2_AMT` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 222 | `WAGE_BOARD_SHIFT3_AMT` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 223 | `WGI_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 224 | `WGI_STATUS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 225 | `WORK_SCHEDULE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 226 | `WORK_SCHEDULE_CHANGE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 227 | `WORK_SCHEDULE_PRIOR_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 228 | `YEAR_DEGREE_ATTAINED_DTE` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 229 | `AS_OF_DAY` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 230 | `LOAD_ID` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 231 | `HB_PRETAX_CODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 232 | `HB_PRETAX_PP_DED` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 233 | `HB_PRETAX_TOTAL_PREPAID` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 234 | `EMP_ID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 235 | `LOAD_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 236 | `NEW_SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 237 | `OLD_SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 238 | `EFFSEQ` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 239 | `EMPL_REC_NO` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 240 | `EHRP_TYPE_ACTION` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 241 | `EHRP_ACTION_REASON` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 242 | `GVT_WIP_STATUS` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 243 | `GVT_STATUS_TYPE` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 244 | `EHRP_POSITION_NUMBER` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 245 | `EHRP_POSITION_PRIOR_NUMBER` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 246 | `CORR_CANCL_EFFSEQ` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 247 | `TITLE42_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 248 | `TITLE38_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 249 | `OPDIV` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 250 | `OPDIV_PRIOR` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 251 | `SETID` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 252 | `CURR_APPT_AUTH1_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 253 | `CURR_APPT_AUTH2_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 254 | `LEO_POSITION_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 255 | `TEMP_GVT_EFFDT` | date | 19 | 0 | NOT A KEY | NULL |
| 256 | `REPORTS_TO` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 257 | `POSITION_ENTRY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 258 | `WGI_DUE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 259 | `EHRP_CHANGED_WIP_STATUS_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 260 | `BIIS_CHANGED_WIP_STATUS_DT` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>NWK_ACTION_SECONDARY_TBL</code> — 209 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `EVENT_ID` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |
| 2 | `ADTNL_OPT_LIFE_INS_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 3 | `ALLOT_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 4 | `ALLOT_DED_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 5 | `ALLOT_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 6 | `ALLOT_EMP_ACCT_NUM` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 7 | `ALLOT_EMP_ACCT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 8 | `ALLOT_FINCL_INSTN_CITY_ST_NAME` | varchar2 | 60 | 0 | NOT A KEY | NULL |
| 9 | `ALLOT_FINCL_INSTN_NAME` | varchar2 | 43 | 0 | NOT A KEY | NULL |
| 10 | `ALLOT_FINCL_INSTN_NUM` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 11 | `ALLOT_FINCL_INSTN_POSTAL_CD` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 12 | `ALLOT_FINCL_INSTN_STREET_NAME` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 13 | `BOND_COBEN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 14 | `BOND_COBEN_NAME` | varchar2 | 120 | 0 | NOT A KEY | NULL |
| 15 | `BOND_COBEN_SSN` | varchar2 | 20 | 0 | NOT A KEY | NULL |
| 16 | `BOND_DENOM_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 17 | `BOND_INSCRIPTION_NUM` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 18 | `BOND_NOTE_TOT_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 19 | `BOND_OWNER_CITY_NAME` | varchar2 | 30 | 0 | NOT A KEY | NULL |
| 20 | `BOND_OWNER_NAME` | varchar2 | 120 | 0 | NOT A KEY | NULL |
| 21 | `BOND_OWNER_POSTAL_CD` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 22 | `BOND_OWNER_SSN` | varchar2 | 20 | 0 | NOT A KEY | NULL |
| 23 | `BOND_OWNER_ST_NAME` | varchar2 | 30 | 0 | NOT A KEY | NULL |
| 24 | `BOND_OWNER_STREET_NAME` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 25 | `BOND_REFUND_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `BUYOUT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 27 | `BUYOUT_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 28 | `CLAIM_TYPE_CD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 29 | `COLA_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 30 | `COURT_ORDER_APPLCTN_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `CSA_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 32 | `CSA_DED_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 33 | `CSA_DED_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 34 | `CSA_RECIPIENT_NAME` | varchar2 | 120 | 0 | NOT A KEY | NULL |
| 35 | `CSRS_ADMIN_FEE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 36 | `ENVIRN_DIF_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 37 | `FAMILY_LIFE_INS_CD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 38 | `FORGN_LANG_AWARD_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 39 | `FORGN_LANG_AWARD_SEP_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 40 | `FORGN_POST_ALLOWC_TOT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 41 | `FORGN_POST_DIF_PAY_PCT` | number(p,s) | 6 | 3 | NOT A KEY | NULL |
| 42 | `FURLOUGH_EXP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 43 | `HAZARD_DUTY_DIF_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 44 | `INDVDL_GROUP_AWARD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 45 | `LAUNDRY_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 46 | `LIFE_INS_AMT` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 47 | `LIFE_INS_REDUCTN_CD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 48 | `LIVING_QUARTERS_ALLOWC_TOT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 49 | `LWOP_EXP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 50 | `LWP_EXP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 51 | `MERIT_PAY_AGGREGATE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `MERIT_PAY_CERTIFICATE_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 53 | `MERIT_PAY_CRITICAL_ELEMENT_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 54 | `MERIT_PAY_GRADE_CD` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 55 | `MERIT_PAY_HRLY_RATE_AMT` | number(p,s) | 4 | 2 | NOT A KEY | NULL |
| 56 | `MERIT_PAY_INCREASE_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 57 | `MERIT_PAY_PAID_OUT_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 58 | `MERIT_PAY_PERF_PLAN_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 59 | `MERIT_PAY_PERF_PLAN_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 60 | `MERIT_PAY_PERF_SCORE_NUM` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 61 | `MERIT_PAY_POOL_DESIGNATOR_CD` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `MERIT_PAY_PRD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 63 | `MERIT_PAY_SALARY_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 64 | `MERIT_PAY_SCALE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 65 | `MERIT_PAY_STEP_CD` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 66 | `MIL_LV_CUR_FY_HRS` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 67 | `MIL_LV_EMERG_CUR_FY_HRS` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 68 | `MIL_RETIRED_PAY_RECPNT_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 69 | `MIL_RETIRED_PAY_WAIVER_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 70 | `MIL_RETMT_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 71 | `MIL_RETMT_OFFSET_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 72 | `MIL_RETMT_TOT_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 73 | `MIL_SRVC_ACHVD_RANK_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 74 | `MIL_SRVC_BRANCH_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 75 | `MIL_SRVC_BRANCH_COMPONENT_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 76 | `NON_BAYLOR_BASE_HRLY_RATE_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 77 | `NON_FORGN_POST_DIF_PAY_PCT` | number(p,s) | 6 | 3 | NOT A KEY | NULL |
| 78 | `NON_GOVT_RETMT_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 79 | `OTHER_PAY_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 80 | `OWCP_CUR_RECEIPT_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 81 | `PAY_TABLE_NUM` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 82 | `PERF_END1_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 83 | `PERF_END2_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 84 | `PERF_RATING_RECORD_LEVEL_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 85 | `POST56_MIL_SRVC_DEPST_PAID_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 86 | `PREMIUM_PAY_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 87 | `RECRUITMENT_BONUS_AMT` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 88 | `RECRUITMENT_EXP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 89 | `REG_SCHLD_STANDBY_DUTY_PAY_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 90 | `RELOCATION_BONUS_AMT` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 91 | `RELOCATION_EXP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 92 | `RETENTION_BONUS_BWKLY_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 93 | `RETENTION_BONUS_TOT_AMT` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 94 | `RETMT_REFUND_RECEIVED_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 95 | `RETMT_SCD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 96 | `RETMT_SURVIVOR_ELECT_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 97 | `RETMT_TAX_WITH_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 98 | `RETND1_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 99 | `RETND1_EXP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 100 | `RETND1_GRADE_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 101 | `RETND1_MEDICAL_OFFICER_IND_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 102 | `RETND1_OCCUPATION_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 103 | `RETND1_ORGTNL_COMPONENT_CD` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 104 | `RETND1_PAY_PLAN_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 105 | `RETND1_STEP_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 106 | `RETND2_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 107 | `RETND2_EXP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 108 | `RETND2_GRADE_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 109 | `RETND2_MEDICAL_OFFICER_IND_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 110 | `RETND2_OCCUPATION_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 111 | `RETND2_ORGTNL_COMPONENT_CD` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 112 | `RETND2_PAY_PLAN_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 113 | `RETND2_STEP_CD` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 114 | `RIF_RELEASE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 115 | `RIF_SCD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 116 | `RIF_VETERANS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 117 | `SAVE_RATE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 118 | `SBRS_ADTNL_BWKLY_DED_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 119 | `SBRS_ADTNL_BWKLY_REDUCTN_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 120 | `SBRS_BWKLY_DED_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 121 | `SBRS_BWKLY_REDUCTN_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 122 | `SBRS_CONTRACT_NUM` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 123 | `SBRS_EMP_DED_PCT` | number(p,s) | 3 | 3 | NOT A KEY | NULL |
| 124 | `SBRS_EMP_OTHER_BWKLY_DED_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 125 | `SBRS_EMP_OTHER_DED_PCT` | number(p,s) | 3 | 3 | NOT A KEY | NULL |
| 126 | `SBRS_EMP_REDUCTN_PCT` | number(p,s) | 3 | 3 | NOT A KEY | NULL |
| 127 | `SBRS_EMPLYR_OTHER_DED_PCT` | number(p,s) | 3 | 3 | NOT A KEY | NULL |
| 128 | `SBRS_EMPLYR_TIAA_CREF_DED_PCT` | number(p,s) | 3 | 3 | NOT A KEY | NULL |
| 129 | `SBRS_INSTN_CITY_NAME` | varchar2 | 23 | 0 | NOT A KEY | NULL |
| 130 | `SBRS_INSTN_NAME` | varchar2 | 30 | 0 | NOT A KEY | NULL |
| 131 | `SBRS_INSTN_POSTAL_CD` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 132 | `SBRS_INSTN_ST_NAME` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 133 | `SBRS_INSTN_STREET1_NAME` | varchar2 | 25 | 0 | NOT A KEY | NULL |
| 134 | `SBRS_INSTN_STREET2_NAME` | varchar2 | 25 | 0 | NOT A KEY | NULL |
| 135 | `SBRS_SRA_BWKLY_REDUCTN_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 136 | `SBRS_SRA_REDUCTN_PCT` | number(p,s) | 3 | 3 | NOT A KEY | NULL |
| 137 | `SEP_ACCT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 138 | `SEP_EMP_ACCT_NUM` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 139 | `SEP_EMP_CITY_NAME` | varchar2 | 30 | 0 | NOT A KEY | NULL |
| 140 | `SEP_EMP_POSTAL_CD` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 141 | `SEP_EMP_ST_NAME` | varchar2 | 30 | 0 | NOT A KEY | NULL |
| 142 | `SEP_EMP_STREET_NAME` | varchar2 | 40 | 0 | NOT A KEY | NULL |
| 143 | `SEP_FED_TAX_MARTL_STATUS_CD` | varchar2 | 17 | 0 | NOT A KEY | NULL |
| 144 | `SEP_FED_TAX_TOT_EXEMPT_COUNT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 145 | `SEP_FEHB_PLAN_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 146 | `SEP_FINCL_INSTN_NUM` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 147 | `SEP_MAINT_ALLOWC_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 148 | `SEP_REASON_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 149 | `STAFFING_DIF_BWKLY_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 150 | `STAFFING_DIF_TOT_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 151 | `STANDBY_PAY_PCT` | number(p,s) | 6 | 3 | NOT A KEY | NULL |
| 152 | `STD_OPT_LIFE_INS_CD` | number(p,s) | 1 | 0 | NOT A KEY | NULL |
| 153 | `SUBSISTENCE_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 154 | `SUPERVSRY_DIF_BWKLY_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 155 | `SUPERVSRY_DIF_TOT_AMT` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 156 | `T38_PREM_HRLY_RATE_AMT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 157 | `TIAA_CERTIFICATE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 158 | `TIME_OFF_AWARD_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 159 | `TIME_OFF_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 160 | `TIME_OFF_FORFEITED_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 161 | `TIME_OFF_FORFEITED_TOT_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 162 | `TIME_OFF_GRANTED_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 163 | `TIME_OFF_GRANTED_TOT_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 164 | `TIME_OFF_USED_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 165 | `TIME_OFF_USED_TOT_HRS` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 166 | `TSP_ADJMT_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 167 | `TSP_ADJMT_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 168 | `TSP_ADJMT_STOP_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 169 | `TSP_EMP_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 170 | `TSP_EMP_DED_RATE_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 171 | `TSP_EMP_PP_UND_DED_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 172 | `TSP_EMP_PP_UND_DED_PYMT_COUNT` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 173 | `TSP_EMP_PREV_GOVT_CONTB_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 174 | `TSP_EMP_UND_DED_OUTSTNDG_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 175 | `TSP_GOVT_UND_DED_OUTSTNDG_AMT` | number(p,s) | 9 | 2 | NOT A KEY | NULL |
| 176 | `TSP_LOAN_PYMT_COUNT` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 177 | `TSP_PAY_SUBJ_YTD_AMT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 178 | `TSP_PP_ADJMT_DED_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 179 | `TSP_SCD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 180 | `TSP_STATUS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 181 | `TSP_STATUS_CHANGE_EFF_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 182 | `TSP_UND_DED_DELAY_OPTION_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 183 | `TSP_UND_DED_LTR_NUM` | number(p,s) | 6 | 0 | NOT A KEY | NULL |
| 184 | `TSP_UND_DED_OPTION_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 185 | `TSP_UND_DED_STOP_OPTION_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 186 | `TSP_VESTING_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 187 | `TSPC_EMP_DIST_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 188 | `TSPC_GOVT_DIST_PCT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 189 | `TSPF_EMP_DIST_PCT` | number(p,s) | 15 | 4 | NOT A KEY | NULL |
| 190 | `TSPF_GOVT_DIST_PCT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 191 | `TSPG_EMP_DIST_PCT` | number(p,s) | 8 | 2 | NOT A KEY | NULL |
| 192 | `TSPG_GOVT_DIST_PCT` | number(p,s) | 5 | 2 | NOT A KEY | NULL |
| 193 | `UNIF_ALLOWC_ANN_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 194 | `UNIF_ALLOWC_HRLY_RATE_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 195 | `UNIF_ALLOWC_PP_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 196 | `TSPA_HARDSHIP_STOP` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 197 | `TSPA_HARDSHIP_NOA` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 198 | `TEA_CHOICE_OPTION` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 199 | `TEA_TRANSPORT_MODE` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 200 | `TEA_PAYMENT_OPTION` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 201 | `TEA_EMPLOYER_CONTR_AMT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 202 | `TEA_EMPLOYEE_DEDUCT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 203 | `TEA_CASH_OUT` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 204 | `TEA_PRIOR_YR_HHS` | number(p,s) | 7 | 2 | NOT A KEY | NULL |
| 205 | `TEA_COM_CHOICE_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 206 | `LWOP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 207 | `RETENTION_BONUS_END_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 208 | `LEO_SCD_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 209 | `PAYGROUP` | varchar2 | 3 | 0 | NOT A KEY | NULL |

</details>

### FDA_Leave

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `ERROR_TBL` | Oracle | — | 8 |
| `HI_PM_FDA_TATRAN_FLAT` | Flat File | — | 6 |
| `CPM_FDA_CPM_PAY_PERIOD_FILE` | Flat File | — | 1 |
| `GENERIC_TARGET_FILE` | Flat File | — | 1 |
| `FDA_EXTRACT_MESSAGE_FILE` | Flat File | — | 2 |
| `COUNTER_TBL` | Oracle | — | 7 |
| `CPM_CYCLE_TBL` | Oracle | — | 5 |
| `HI_PM_FDA_TATRAN_TBL` | Oracle | — | 8 |
| `CPM_FDA_PAY_PERIOD_FILE` | Flat File | — | 1 |

<details><summary><code>ERROR_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 8 | `ERROR_CODE` | varchar2 | 50 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_PM_FDA_TATRAN_FLAT</code> — 6 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FDA_TK_NO` | string | 5 | 0 | NOT A KEY | NULL |
| 2 | `FDA_EMP_ID` | string | 9 | 0 | NOT A KEY | NULL |
| 3 | `FDA_PP_YEAR` | string | 4 | 0 | NOT A KEY | NULL |
| 4 | `FDA_PP_NUM` | string | 2 | 0 | NOT A KEY | NULL |
| 5 | `FDA_REC_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 6 | `FDA_DATA` | string | 114 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_FDA_CPM_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>GENERIC_TARGET_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `ID` | number | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>FDA_EXTRACT_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `COUNT_DESC` | string | 50 | 0 | NOT A KEY | NULL |
| 2 | `COUNT_VALUE` | number | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>COUNTER_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RUN_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 2 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 3 | `COUNTER_DESCRIPTION` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 4 | `COUNTER_VALUE` | number | 15 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_CYCLE_TBL</code> — 5 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 30 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 3 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_PM_FDA_TATRAN_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `FDA_BATCH_ID` | number(p,s) | 19 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `FDA_TK_NO` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `FDA_EMP_ID` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `FDA_PP_YEAR` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `FDA_PP_NUM` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `FDA_REC_TYPE` | varchar2 | 10 | 0 | PRIMARY KEY | NOTNULL |
| 7 | `FDA_SEQ` | number(p,s) | 19 | 0 | PRIMARY KEY | NOTNULL |
| 8 | `FDA_DATA` | varchar2 | 200 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>CPM_FDA_PAY_PERIOD_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `CPM_PAY_PERIOD` | string | 10 | 0 | NOT A KEY | NULL |

</details>

### LES

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `LESL` | Oracle | — | 22 |
| `LEST` | Oracle | — | 16 |
| `LESM` | Oracle | — | 14 |
| `LESD` | Oracle | — | 21 |
| `LESS` | Oracle | — | 91 |
| `LESU` | Oracle | — | 19 |
| `LESC` | Oracle | — | 22 |
| `LESR` | Oracle | — | 22 |
| `LES_HEADER_FILE` | Flat File | — | 3 |
| `LES_TOTALS_FILE` | Flat File | — | 2 |
| `LES_EMP_DETAIL_LEAVE_TBL` | Oracle | — | 15 |
| `LES_EMP_DETAIL_RETRO_EARN_TBL` | Oracle | — | 8 |
| `LES_NIH_EMPLOYEE_DETAIL` | Flat File | — | 5 |
| `LES_NIH_EMPLOYEE_SUMMARY_TBL` | Oracle | — | 4 |
| `LES_EMP_DETAIL_CURR_EARN_TBL` | Oracle | — | 8 |
| `COUNTER_TBL` | Oracle | — | 7 |
| `LES_MESSAGE_FILE` | Flat File | — | 2 |
| `LES_EMP_DETAIL_RECTYPE_D_TBL` | Oracle | — | 13 |
| `LES_PAY_PERIOD_DATE_FILE` | Flat File | — | 1 |
| `LES_EMP_DETAIL_RECTYPE_2_TBL` | Oracle | — | 17 |
| `LES_EMP_DETAIL_RECTYPE_T_TBL` | Oracle | — | 8 |
| `LES_PRIMARY_DATA_TBL` | Oracle | — | 90 |
| `LES_EMP_DETAIL_RECTYPE_3_TBL` | Oracle | — | 21 |
| `LES_HEADER_TBL` | Oracle | — | 7 |
| `LES_EMP_DETAIL_RECTYPE_5_TBL` | Oracle | — | 18 |
| `LES_EMP_DETAIL_RECTYPE_1_TBL` | Oracle | — | 21 |
| `LES_EMP_DETAIL_RECTYPE_4_TBL` | Oracle | — | 17 |
| `ERROR_TBL` | Oracle | — | 7 |
| `LES_EMP_DETAIL_TBL` | Oracle | — | 5 |
| `LES_EMP_DETAIL_RECTYPE_R_TBL` | Oracle | — | 14 |
| `LES_EMP_DETAIL_RECTYPE_U_TBL` | Oracle | — | 11 |
| `LES_EMP_DETAIL_RECTYPE_L_TBL` | Oracle | — | 15 |
| `LES_EMP_DETAIL_RECTYPE_6_TBL` | Oracle | — | 8 |
| `LES_EMP_DETAIL_RECTYPE_M_TBL` | Oracle | — | 6 |
| `LES_EMP_DETAIL_RECTYPE_C_TBL` | Oracle | — | 14 |

<details><summary><code>LESL</code> — 22 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `LESL_KEY` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `MASTER_ID` | number | 15 | 0 | NOT A KEY | NULL |
| 3 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `PYR` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 5 | `PPN` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 6 | `SEQ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `LV_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 8 | `LV_PRIOR_YR_BAL` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 9 | `LV_ACCR_PP` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 10 | `LV_ACCR_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 11 | `LV_USED_CURR_PP` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 12 | `LV_USED_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 13 | `LV_DONATE_RET` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 14 | `LV_CURR_BAL` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 15 | `LV_TERM_DATE` | varchar2 | 14 | 0 | NOT A KEY | NULL |
| 16 | `MAN` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `LOAD_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |
| 18 | `CREATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 19 | `CREATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 20 | `UPDATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 21 | `UPDATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 22 | `NEW_SEQ_NBR` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>LEST</code> — 16 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `LEST_KEY` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `MASTER_ID` | number | 15 | 0 | NOT A KEY | NULL |
| 3 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `PYR` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 5 | `PPN` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 6 | `SEQ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `MAN` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 8 | `LEAVE_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 9 | `LEAVE_DATE_TAKEN` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `LEAVE_HOURS` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 11 | `LOAD_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |
| 12 | `CREATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 13 | `CREATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 14 | `UPDATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 15 | `UPDATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 16 | `NEW_SEQ_NBR` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>LESM</code> — 14 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `LESM_KEY` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `MASTER_ID` | number | 15 | 0 | NOT A KEY | NULL |
| 3 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `PYR` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 5 | `PPN` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 6 | `SEQ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `RMK_MSG` | varchar2 | 90 | 0 | NOT A KEY | NULL |
| 8 | `MAN` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `LOAD_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |
| 10 | `CREATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 11 | `CREATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 12 | `UPDATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 13 | `UPDATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 14 | `NEW_SEQ_NBR` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>LESD</code> — 21 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `LESD_KEY` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `MASTER_ID` | number | 15 | 0 | NOT A KEY | NULL |
| 3 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `PYR` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 5 | `PPN` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 6 | `SEQ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `DED_NAME1` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 8 | `DED_CODE1` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 9 | `DED_AMT1` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 10 | `DED_AMT_YTD1` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 11 | `DED_NAME2` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 12 | `DED_CODE2` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 13 | `DED_AMT2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 14 | `DED_AMT_YTD2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 15 | `MAN` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 16 | `LOAD_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |
| 17 | `CREATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 18 | `CREATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 19 | `UPDATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 20 | `UPDATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 21 | `NEW_SEQ_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>LESS</code> — 91 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `LESS_KEY` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `MASTER_ID` | number | 15 | 0 | NOT A KEY | NULL |
| 3 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `PYR` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 5 | `PPN` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 6 | `TKN` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 7 | `PPD_END_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `PAY_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 9 | `EYE_NME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 10 | `PAY_PLAN` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 11 | `PAY_GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 12 | `PAY_STEP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 13 | `HRLY_RATE` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 14 | `BASIC_OT_RATE` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 15 | `BASIC_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 16 | `LOCAL_ADJ` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 17 | `ADJ_BASIC_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 18 | `LOCAL_PCT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 19 | `FLSA` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 20 | `SCD_LEAVE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 21 | `MAX_LV_CRY` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 22 | `LV_YR_END_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 23 | `DATE_LST_INC` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 24 | `NETPAY_FINORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 25 | `ALLT1_FINORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 26 | `ALLT2_FINORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 27 | `FED_TIT` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 28 | `FED_MS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 29 | `FED_ITW_XMP` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 30 | `FED_ADDTL` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 31 | `ST_TX1_TIT` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 32 | `ST_TX1_MS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 33 | `ST_TX1_XMP` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 34 | `ST_TX1_ADDTL` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 35 | `ST_TX2_TIT` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 36 | `ST_TX2_MS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 37 | `ST_TX2_XMP` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 38 | `ST_TX2_ADDTL` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 39 | `LC_TX1_TIT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 40 | `LC_TX1_MS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 41 | `LC_TX1_XMP` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 42 | `LC_TX1_ADDTL` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 43 | `LC_TX1_NME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 44 | `LC_TX2_TIT` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 45 | `LC_TX2_MS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `LC_TX2_XMP` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 47 | `LC_TX2_ADDTL` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 48 | `LC_TX2_NME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 49 | `CSRS_TIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 50 | `CSRS_CUMM_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 51 | `BIWK_TIT` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 52 | `BIWK_ANNTY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 53 | `MILDPS_TIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 54 | `MILDPS_PD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 55 | `MILDPS_TIT2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 56 | `MILDPS_OWED` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 57 | `GRS_PAY_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 58 | `GRS_PAY_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 59 | `TAX_WGE_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 60 | `TAX_WGE_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 61 | `NTAX_WGE_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 62 | `NTAX_WGE_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 63 | `DEF_TAX_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 64 | `DEF_TAX_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 65 | `DED_TAX_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 66 | `DED_TAX_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 67 | `AEI_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 68 | `AEI_AMT_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 69 | `NET_PAY_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 70 | `NET_PAY_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 71 | `XVX7_TITLE` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 72 | `XVX7_PCT` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 73 | `GA_TIT` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 74 | `GA_PCT` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 75 | `FB_TIT` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 76 | `FB_PCT` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 77 | `CC_TIT` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 78 | `CC_PCT` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 79 | `VHVM_TITLE` | varchar2 | 34 | 0 | NOT A KEY | NULL |
| 80 | `VHVM_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 81 | `VHVM_TITLE_YTD` | varchar2 | 34 | 0 | NOT A KEY | NULL |
| 82 | `VHVM_AMT_YTD` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 83 | `MAN` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 84 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 85 | `ROTH_SAVING` | varchar2 | 11 | 0 | NOT A KEY | NULL |
| 86 | `ROTH_PCT` | number(p,s) | 10 | 0 | NOT A KEY | NULL |
| 87 | `LOAD_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |
| 88 | `CREATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 89 | `CREATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 90 | `UPDATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 91 | `UPDATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LESU</code> — 19 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `LESU_KEY` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `MASTER_ID` | number | 15 | 0 | NOT A KEY | NULL |
| 3 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `PYR` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 5 | `PPN` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 6 | `BEN_NAME1` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `BEN_AMT1` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 8 | `BEN_AMT_YTD1` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 9 | `BEN_NAME2` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 10 | `BEN_AMT2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 11 | `BEN_AMT_YTD2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 12 | `SEQ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `MAN` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `LOAD_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |
| 15 | `CREATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 16 | `CREATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 17 | `UPDATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 18 | `UPDATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 19 | `NEW_SEQ_NBR` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>LESC</code> — 22 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `LESC_KEY` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `MASTER_ID` | number | 15 | 0 | NOT A KEY | NULL |
| 3 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `PYR` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 5 | `PPN` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 6 | `SEQ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `CURR_ERN_NAME1` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 8 | `CURR_HRS_DAYS1` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 9 | `CURR_AMT1` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 10 | `CURR_ERN_NAME2` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 11 | `CURR_HRS_DAYS2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 12 | `CURR_AMT2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 13 | `CURR_ERN_NAME3` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 14 | `CURR_HRS_DAYS3` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 15 | `CURR_AMT3` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 16 | `MAN` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `LOAD_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |
| 18 | `CREATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 19 | `CREATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 20 | `UPDATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 21 | `UPDATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 22 | `NEW_SEQ_NBR` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>LESR</code> — 22 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `LESR_KEY` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `MASTER_ID` | number | 15 | 0 | NOT A KEY | NULL |
| 3 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `PYR` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 5 | `PPN` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 6 | `SEQ` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 7 | `RETR_ERN_NAME1` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 8 | `RETR_HRS_DAYS1` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 9 | `RETR_AMT1` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 10 | `RETR_ERN_NAME2` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 11 | `RETR_HRS_DAYS2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 12 | `RETR_AMT2` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 13 | `RETR_ERN_NAME3` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 14 | `RETR_HRS_DAYS3` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 15 | `RETR_AMT3` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 16 | `MAN` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 17 | `LOAD_NBR` | number | 15 | 0 | NOT A KEY | NOTNULL |
| 18 | `CREATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 19 | `CREATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 20 | `UPDATE_DT` | date | 19 | 0 | NOT A KEY | NULL |
| 21 | `UPDATE_BY` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 22 | `NEW_SEQ_NBR` | number(p,s) | 10 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>LES_HEADER_FILE</code> — 3 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_YEAR_NUM` | string | 6 | 0 | NOT A KEY | NULL |
| 2 | `INPUT_FILE_NUMBER` | string | 6 | 0 | NOT A KEY | NULL |
| 3 | `INPUT_PP_END_DATE` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_TOTALS_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `INPUT_FILE_NUMBER` | string | 6 | 0 | NOT A KEY | NULL |
| 2 | `INPUT_FILE_TOTAL` | string | 10 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_LEAVE_TBL</code> — 15 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `LEAVE_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `LEAVE_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `LEAVE_PRIOR_YEAR_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `LEAVE_EARNED_CPP` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `LEAVE_EARNED_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 10 | `LEAVE_USED_CPP` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `LEAVE_USED_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `LEAVE_DONATED` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `LEAVE_CURR_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `LEAVE_USE_OR_LOSE_TERM_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 15 | `LEAVE_USE_OR_LOSE_TERM_BAL_HRS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RETRO_EARN_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `RETRO_ACTIVE_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `RETRO_ACTIVE_EARN_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `RETRO_ACTIVE_EARN_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `RETRO_ACTIVE_EARN_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_NIH_EMPLOYEE_DETAIL</code> — 5 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RECORD_TYPE` | string | 2 | 0 | NOT A KEY | NULL |
| 2 | `SSN` | string | 9 | 0 | NOT A KEY | NULL |
| 3 | `LES_NUMBER` | string | 7 | 0 | NOT A KEY | NULL |
| 4 | `LES_DELIVERY_INDICATOR` | string | 1 | 0 | NOT A KEY | NULL |
| 5 | `FILLER` | string | 96 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_NIH_EMPLOYEE_SUMMARY_TBL</code> — 4 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 2 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 3 | `LES_NUMBER` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 4 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_CURR_EARN_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `CURR_EARN_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `CURR_EARN_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `CURR_EARN_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `CURR_EARN_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>COUNTER_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RUN_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 2 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 3 | `COUNTER_DESCRIPTION` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 4 | `COUNTER_VALUE` | number | 15 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 100 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 300 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_D_TBL</code> — 13 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `DEDUCTION_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `DEDUCTION_1_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `DEDUCTION_1_CODE` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 8 | `DEDUCTION_1_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `DEDUCTION_1_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 10 | `DEDUCTION_2_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 11 | `DEDUCTION_2_CODE` | varchar2 | 7 | 0 | NOT A KEY | NULL |
| 12 | `DEDUCTION_2_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `DEDUCTION_2_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_PAY_PERIOD_DATE_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PAY_PERIOD_TXT` | string | 6 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_2_TBL</code> — 17 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `NET_PAY_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 6 | `ALLOT1_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 7 | `ALLOT2_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 8 | `FEDERAL_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 9 | `FED_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 10 | `FED_EXCEPTIONS` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 11 | `FED_ADDNL_WITHHOLDING` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 12 | `STATE1_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 13 | `STATE1_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `STATE1_EXCEPTIONS` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 15 | `STATE1_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 16 | `STATE2_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 17 | `STATE2_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_T_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `TIME_ATTEND_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `LEAVE_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `LEAVE_TAKEN_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `LEAVE_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_PRIMARY_DATA_TBL</code> — 90 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 6 | `HDR_LOC_ID` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 7 | `HDR_LOC_NAME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 8 | `SYSTEM_ID` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 9 | `TRANSMISSION_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 10 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 11 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 12 | `TK_NUM` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 13 | `LES_DELIVERY_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 15 | `EMPLOYEE_NAME` | varchar2 | 150 | 0 | NOT A KEY | NULL |
| 16 | `PAY_PLAN_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 17 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `STEP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 19 | `HRLY_RATE` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 20 | `BASE_OT_RATE` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 21 | `BASE_PAY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 22 | `LOCALITY_ADJ` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 23 | `ADJ_BASE_PAY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 24 | `LOCALITY_PERCENTAGE` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 25 | `FLSA_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `LV_SCD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 27 | `MIL_LV_CARRY` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 28 | `LV_YR_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 29 | `LAST_INCREASE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `NET_PAY_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 31 | `ALLOT1_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 32 | `ALLOT2_FINANCIAL_ORG` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 33 | `FEDERAL_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 34 | `FED_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 35 | `FED_EXCEPTIONS` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 36 | `FED_ADDNL_WITHHOLDING` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 37 | `STATE1_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 38 | `STATE1_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 39 | `STATE1_EXCEPTIONS` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 40 | `STATE1_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 41 | `STATE2_TAX` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 42 | `STATE2_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 43 | `STATE2_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 44 | `STATE2_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 45 | `LOCAL1_TAX` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 46 | `LOCAL1_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 47 | `LOCAL1_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 48 | `LOCAL1_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 49 | `LOCAL1_TAX_NAME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 50 | `LOCAL2_TAX` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 51 | `LOCAL2_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 52 | `LOCAL2_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 53 | `LOCAL2_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 54 | `LOCAL2_TAX_NAME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 55 | `CSRS` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 56 | `CSRS_CUM_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 57 | `BIWEEKLY_AMT` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 58 | `BIWEEKLY_ANNUITY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 59 | `MILITARY_DEPOSIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 60 | `MIL_DEPOSIT_PAID` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 61 | `MIL_DEPOSIT_2` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `MIL_DEPOSIT_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 63 | `GROSS_PAY_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 64 | `GROSS_PAY_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 65 | `TAXABLE_WAGE_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 66 | `TAXABLE_WAGE_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 67 | `NONTAXABLE_WAGE_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 68 | `NONTAXABLE_WAGE_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 69 | `TAX_DEFERRED_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 70 | `TAX_DEFERRED_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 71 | `DEDUCTION_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 72 | `DEDUCTION_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 73 | `ADV_ERND_INCOME_CREDIT_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 74 | `NET_PAY_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 75 | `NET_PAY_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 76 | `TSP_SAVINGS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 77 | `TSP_SAVINGS_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 78 | `TITLEG_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 79 | `TITLEG_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 80 | `TITLEF_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 81 | `TITLEF_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 82 | `TITLEC_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 83 | `TITLEC_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 84 | `ROTH_SAVINGS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 85 | `ROTH_SAVINGS_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 86 | `EARNINGS_FOR_CURR_TSP` | varchar2 | 35 | 0 | NOT A KEY | NULL |
| 87 | `EARNINGS_FOR_CURR_TSP_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 88 | `EARNINGS_FOR_YTD_TSP` | varchar2 | 35 | 0 | NOT A KEY | NULL |
| 89 | `EARNINGS_FOR_YTD_TSP_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 90 | `REMARK_TEXT` | varchar2 | 4000 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_3_TBL</code> — 21 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `STATE2_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 6 | `STATE2_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `LOCAL1_TAX` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 8 | `LOCAL1_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 9 | `LOCAL1_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 10 | `LOCAL1_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 11 | `LOCAL1_TAX_NAME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 12 | `LOCAL2_TAX` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 13 | `LOCAL2_MARITAL_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `LOCAL2_EXCEPTIONS` | varchar2 | 6 | 0 | NOT A KEY | NULL |
| 15 | `LOCAL2_ADDNL_AMOUNT` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 16 | `LOCAL2_TAX_NAME` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 17 | `CSRS` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 18 | `CSRS_CUM_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 19 | `BIWEEKLY_AMT` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 20 | `BIWEEKLY_ANNUITY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 21 | `MILITARY_DEPOSIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_HEADER_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `HDR_LOC_ID` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 5 | `HDR_LOC_NAME` | varchar2 | 27 | 0 | NOT A KEY | NULL |
| 6 | `SYSTEM_ID` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 7 | `TRANSMISSION_DTE` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_5_TBL</code> — 18 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `ADV_ERND_INCOME_CREDIT_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 6 | `ADV_ERND_INCOME_CREDIT_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 7 | `NET_PAY_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `NET_PAY_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `TSP_SAVINGS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 10 | `TSP_SAVINGS_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `TITLEG_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 12 | `TITLEG_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `TITLEF_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 14 | `TITLEF_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 15 | `TITLEC_FUND` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 16 | `TITLEC_FUND_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 17 | `ROTH_SAVINGS` | varchar2 | 15 | 0 | NOT A KEY | NULL |
| 18 | `ROTH_SAVINGS_PCT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_1_TBL</code> — 21 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 6 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 7 | `EMPLOYEE_NAME` | varchar2 | 150 | 0 | NOT A KEY | NULL |
| 8 | `PAY_PLAN_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 9 | `GRADE` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 10 | `STEP` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 11 | `HRLY_RATE` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `BASE_OT_RATE` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `BASE_PAY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `LOCALITY_ADJ` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 15 | `ADJ_BASE_PAY` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 16 | `LOCALITY_PERCENTAGE` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 17 | `FLSA_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 18 | `LV_SCD_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 19 | `MIL_LV_CARRY` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 20 | `LV_YR_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 21 | `LAST_INCREASE_DTE` | date | 19 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_4_TBL</code> — 17 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `MIL_DEPOSIT_PAID` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 6 | `MIL_DEPOSIT_2` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 7 | `MIL_DEPOSIT_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `GROSS_PAY_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `GROSS_PAY_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 10 | `TAXABLE_WAGE_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `TAXABLE_WAGE_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `NONTAXABLE_WAGE_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `NONTAXABLE_WAGE_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `TAX_DEFERRED_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 15 | `TAX_DEFERRED_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 16 | `DEDUCTION_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 17 | `DEDUCTION_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>ERROR_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_TBL</code> — 5 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `LES_DELIVERY_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_R_TBL</code> — 14 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `RETRO_ACTIVE_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `RETRO_ACTIVE_EARN_NAME1` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `RETRO_ACTIVE_EARN_NAME1_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `RETRO_ACTIVE_EARN_NAME1_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `RETRO_ACTIVE_EARN_NAME2` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 10 | `RETRO_ACTIVE_EARN_NAME2_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `RETRO_ACTIVE_EARN_NAME2_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `RETRO_ACTIVE_EARN_NAME3` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 13 | `RETRO_ACTIVE_EARN_NAME3_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `RETRO_ACTIVE_EARN_NAME3_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_U_TBL</code> — 11 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `EMPLOYER_CONTR_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `EMPLOYER_CONTR_1_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `EMPLOYER_CONTR_1_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `EMPLOYER_CONTR_1_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `EMPLOYER_CONTR_2_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 10 | `EMPLOYER_CONTR_2_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `EMPLOYER_CONTR_2_AMT_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_L_TBL</code> — 15 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `LEAVE_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `LEAVE_NAME` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `LEAVE_PRIOR_YEAR_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `LEAVE_EARNED_CPP` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `LEAVE_EARNED_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 10 | `LEAVE_USED_CPP` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `LEAVE_USED_YTD` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `LEAVE_DONATED` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 13 | `LEAVE_CURR_BAL` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `LEAVE_USE_OR_LOSE_TERM_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 15 | `LEAVE_USE_OR_LOSE_TERM_BAL_HRS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_6_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `EARNINGS_FOR_CURR_TSP` | varchar2 | 35 | 0 | NOT A KEY | NULL |
| 6 | `EARNINGS_FOR_CURR_TSP_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 7 | `EARNINGS_FOR_YTD_TSP` | varchar2 | 35 | 0 | NOT A KEY | NULL |
| 8 | `EARNINGS_FOR_YTD_TSP_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_M_TBL</code> — 6 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `REMARK_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `REMARK_TEXT` | varchar2 | 90 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>LES_EMP_DETAIL_RECTYPE_C_TBL</code> — 14 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_END_YEAR` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_NUM` | number(p,s) | 10 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `LES_NUMBER` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 5 | `CURR_EARN_ID` | number | 15 | 0 | PRIMARY KEY | NOTNULL |
| 6 | `CURR_EARN_NAME1` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 7 | `CURR_EARN_NAME1_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 8 | `CURR_EARN_NAME1_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 9 | `CURR_EARN_NAME2` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 10 | `CURR_EARN_NAME2_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 11 | `CURR_EARN_NAME2_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 12 | `CURR_EARN_NAME3` | varchar2 | 12 | 0 | NOT A KEY | NULL |
| 13 | `CURR_EARN_NAME3_HOURS` | number(p,s) | 15 | 2 | NOT A KEY | NULL |
| 14 | `CURR_EARN_NAME3_AMT` | number(p,s) | 15 | 2 | NOT A KEY | NULL |

</details>

### Pay_Calendar

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `PAY_PERIOD_VERIFY_FILE` | Flat File | — | 1 |
| `PAY_PERIOD_MESSAGE_FILE` | Flat File | — | 2 |
| `PAY_PERIOD` | Oracle | — | 8 |

<details><summary><code>PAY_PERIOD_VERIFY_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 100 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 100 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 300 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PAY_PERIOD</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PP_NUM` | number(p,s) | 2 | 0 | PRIMARY KEY | NOTNULL |
| 2 | `PP_END_YEAR` | number(p,s) | 4 | 0 | PRIMARY KEY | NOTNULL |
| 3 | `PP_START_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 4 | `PP_END_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `LV_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 6 | `LV_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 7 | `PAY_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 8 | `CURR_PP_FLAG` | varchar2 | 1 | 0 | NOT A KEY | NULL |

</details>

### Pseudossn

| Target Name | Database Type | Owner | Fields |
|---|---|---|---:|
| `PSEUDOSSN_FROM_SDA_TBL` | Oracle | — | 63 |
| `PAY_PERIOD_DATE_FILE` | Flat File | — | 1 |
| `HI_ARCH_PSEUDOSSN_TBL` | Oracle | — | 63 |
| `ERROR_TBL` | Oracle | — | 8 |
| `PSEUDOSSN_TBL` | Oracle | — | 63 |
| `PSEUDO_RECORD_COUNT` | Oracle | — | 3 |
| `COUNTER_TBL` | Oracle | — | 7 |
| `PSEUDOSSN_MESSAGE_FILE` | Flat File | — | 2 |
| `PSEUDO_HDR_DATE_FILE` | Flat File | — | 1 |

<details><summary><code>PSEUDOSSN_FROM_SDA_TBL</code> — 63 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 2 | `CAN_CD` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 3 | `PSEUDOSSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 5 | `EMPL_RCD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 6 | `APPT_NUM` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `EMP_FIRST_NAME` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 8 | `EMP_MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 9 | `EMP_LAST_NAME` | varchar2 | 16 | 0 | NOT A KEY | NOTNULL |
| 10 | `SEX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `VETERANS_PREFERENCE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `TENURE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `POSITION_NUM` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `US_CITIZENSHIP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 15 | `APPT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `HIRE_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 17 | `HANDICAP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `UNF_ALLOW_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 19 | `UNIF_ALLOW_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 20 | `UNIF_ALLOW_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 21 | `RSSSDP` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 22 | `CEIL_REPORTING_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 23 | `FUNCTNL_CLASSFCTN_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `EMP_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `MANAGER_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `POSITION_SENSITIVITY_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `CAREER_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 28 | `CAREER_CONV_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 29 | `PROBATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `ABNORMAL_RATE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `APPT_LIMIT_HRS` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 32 | `APPT_LIMIT_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 33 | `LAST_PAY_CHANGE` | date | 19 | 0 | NOT A KEY | NULL |
| 34 | `CHARITY_AREA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 35 | `CHARITY_EFF_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 36 | `CHARITY_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 37 | `LAST_NOA_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 38 | `QUARTERS_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 39 | `SUBSIST_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 40 | `PAY_BASIS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 41 | `WORK_SCHEDULE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `OCCUPATION_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 43 | `DUTY_STATION` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 44 | `JOB_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `REG_TEMP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `SEPERATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 47 | `PCA_CONTR_EFF_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 48 | `PCA_CONTR_EFF_END_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 49 | `MAX_ANNUAL_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 50 | `PCA_BIWEEKLY_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 51 | `PAY_PLAN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 52 | `APPT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 53 | `SPECIAL_PROGRAM_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 54 | `TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 55 | `EFFECTIVE_DATE` | date | 19 | 0 | NOT A KEY | NOTNULL |
| 56 | `EFFECTIVE_SEQ` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 57 | `PAY_TABL_NO` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 58 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 59 | `DEPTID` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 60 | `PCA_CONTR_LEN_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 61 | `TK_NUM` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NOTNULL |
| 63 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>PAY_PERIOD_DATE_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PAY_PERIOD` | string | 6 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>HI_ARCH_PSEUDOSSN_TBL</code> — 63 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 2 | `CAN_CD` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 3 | `PSEUDOSSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 4 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 5 | `EMPL_RCD` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 6 | `APPT_NUM` | varchar2 | 2 | 0 | NOT A KEY | NOTNULL |
| 7 | `EMP_FIRST_NAME` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 8 | `EMP_MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 9 | `EMP_LAST_NAME` | varchar2 | 16 | 0 | NOT A KEY | NOTNULL |
| 10 | `SEX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `VETERANS_PREFERENCE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `TENURE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `POSITION_NUM` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `US_CITIZENSHIP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 15 | `APPT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `HIRE_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 17 | `HANDICAP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `UNF_ALLOW_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 19 | `UNIF_ALLOW_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 20 | `UNIF_ALLOW_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 21 | `RSSSDP` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 22 | `CEIL_REPORTING_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 23 | `FUNCTNL_CLASSFCTN_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `EMP_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `MANAGER_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `POSITION_SENSITIVITY_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `CAREER_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 28 | `CAREER_CONV_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 29 | `PROBATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `ABNORMAL_RATE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `APPT_LIMIT_HRS` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 32 | `APPT_LIMIT_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 33 | `LAST_PAY_CHANGE` | date | 19 | 0 | NOT A KEY | NULL |
| 34 | `CHARITY_AREA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 35 | `CHARITY_EFF_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 36 | `CHARITY_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 37 | `LAST_NOA_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 38 | `QUARTERS_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 39 | `SUBSIST_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 40 | `PAY_BASIS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 41 | `WORK_SCHEDULE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `OCCUPATION_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 43 | `DUTY_STATION` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 44 | `JOB_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `REG_TEMP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `SEPERATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 47 | `PCA_CONTR_EFF_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 48 | `PCA_CONTR_EFF_END_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 49 | `MAX_ANNUAL_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 50 | `PCA_BIWEEKLY_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 51 | `PAY_PLAN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 52 | `APPT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 53 | `SPECIAL_PROGRAM_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 54 | `TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 55 | `EFFECTIVE_DATE` | date | 19 | 0 | NOT A KEY | NOTNULL |
| 56 | `EFFECTIVE_SEQ` | number(p,s) | 5 | 0 | NOT A KEY | NOTNULL |
| 57 | `PAY_TABL_NO` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 58 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NOTNULL |
| 59 | `DEPTID` | varchar2 | 10 | 0 | NOT A KEY | NOTNULL |
| 60 | `PCA_CONTR_LEN_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 61 | `TK_NUM` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NOTNULL |
| 63 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>ERROR_TBL</code> — 8 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 2 | `ERROR_MESSAGE` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 3 | `SOURCE_KEY` | varchar2 | 50 | 0 | NOT A KEY | NULL |
| 4 | `ERROR_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 3 | 0 | NOT A KEY | NULL |
| 8 | `ERROR_CODE` | varchar2 | 50 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PSEUDOSSN_TBL</code> — 63 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SSN` | varchar2 | 9 | 0 | NOT A KEY | NOTNULL |
| 2 | `CAN_CD` | varchar2 | 8 | 0 | NOT A KEY | NOTNULL |
| 3 | `PSEUDOSSN` | varchar2 | 9 | 0 | PRIMARY KEY | NOTNULL |
| 4 | `EMPLID` | varchar2 | 8 | 0 | NOT A KEY | NULL |
| 5 | `EMPL_RCD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 6 | `APPT_NUM` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 7 | `EMP_FIRST_NAME` | varchar2 | 11 | 0 | NOT A KEY | NOTNULL |
| 8 | `EMP_MID_INIT` | varchar2 | 1 | 0 | NOT A KEY | NOTNULL |
| 9 | `EMP_LAST_NAME` | varchar2 | 16 | 0 | NOT A KEY | NOTNULL |
| 10 | `SEX` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 11 | `VETERANS_PREFERENCE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 12 | `TENURE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 13 | `POSITION_NUM` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 14 | `US_CITIZENSHIP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 15 | `APPT_TYPE_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 16 | `HIRE_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 17 | `HANDICAP_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 18 | `UNF_ALLOW_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 19 | `UNIF_ALLOW_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 20 | `UNIF_ALLOW_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 21 | `RSSSDP` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 22 | `CEIL_REPORTING_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 23 | `FUNCTNL_CLASSFCTN_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 24 | `EMP_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 25 | `MANAGER_STATUS` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 26 | `POSITION_SENSITIVITY_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 27 | `CAREER_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 28 | `CAREER_CONV_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 29 | `PROBATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 30 | `ABNORMAL_RATE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 31 | `APPT_LIMIT_HRS` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 32 | `APPT_LIMIT_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 33 | `LAST_PAY_CHANGE` | date | 19 | 0 | NOT A KEY | NULL |
| 34 | `CHARITY_AREA_CD` | varchar2 | 3 | 0 | NOT A KEY | NULL |
| 35 | `CHARITY_EFF_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 36 | `CHARITY_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 37 | `LAST_NOA_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 38 | `QUARTERS_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 39 | `SUBSIST_DED_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 40 | `PAY_BASIS_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 41 | `WORK_SCHEDULE_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 42 | `OCCUPATION_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 43 | `DUTY_STATION` | varchar2 | 9 | 0 | NOT A KEY | NULL |
| 44 | `JOB_IND` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 45 | `REG_TEMP_CD` | varchar2 | 1 | 0 | NOT A KEY | NULL |
| 46 | `SEPERATION_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 47 | `PCA_CONTR_EFF_START_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 48 | `PCA_CONTR_EFF_END_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 49 | `MAX_ANNUAL_PAY` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 50 | `PCA_BIWEEKLY_AMT` | number(p,s) | 10 | 2 | NOT A KEY | NULL |
| 51 | `PAY_PLAN_CD` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 52 | `APPT_NTE_DTE` | date | 19 | 0 | NOT A KEY | NULL |
| 53 | `SPECIAL_PROGRAM_CD` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 54 | `TERM_ID` | varchar2 | 2 | 0 | NOT A KEY | NULL |
| 55 | `EFFECTIVE_DATE` | date | 19 | 0 | NOT A KEY | NOTNULL |
| 56 | `EFFECTIVE_SEQ` | number(p,s) | 5 | 0 | NOT A KEY | NULL |
| 57 | `PAY_TABL_NO` | varchar2 | 4 | 0 | NOT A KEY | NULL |
| 58 | `BUSINESS_UNIT` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 59 | `DEPTID` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 60 | `PCA_CONTR_LEN_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 61 | `TK_NUM` | varchar2 | 5 | 0 | NOT A KEY | NULL |
| 62 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NOTNULL |
| 63 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NOTNULL |

</details>

<details><summary><code>PSEUDO_RECORD_COUNT</code> — 3 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `TRAILER_RECORD_COUNT` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 2 | `DETAIL_RECORD_COUNT` | varchar2 | 10 | 0 | NOT A KEY | NULL |
| 3 | `MESSAGE` | varchar2 | 30 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>COUNTER_TBL</code> — 7 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `RUN_DATE` | date | 19 | 0 | NOT A KEY | NULL |
| 2 | `PROCESS_NAME` | varchar2 | 100 | 0 | NOT A KEY | NULL |
| 3 | `COUNTER_DESCRIPTION` | varchar2 | 200 | 0 | NOT A KEY | NULL |
| 4 | `COUNTER_VALUE` | number | 15 | 0 | NOT A KEY | NULL |
| 5 | `PP_END_YEAR` | number(p,s) | 4 | 0 | NOT A KEY | NULL |
| 6 | `PP_NUM` | number(p,s) | 2 | 0 | NOT A KEY | NULL |
| 7 | `CYCLE_ID` | number(p,s) | 1 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PSEUDOSSN_MESSAGE_FILE</code> — 2 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `SUBJECT` | string | 100 | 0 | NOT A KEY | NULL |
| 2 | `MESSAGE` | string | 300 | 0 | NOT A KEY | NULL |

</details>

<details><summary><code>PSEUDO_HDR_DATE_FILE</code> — 1 fields</summary>

| # | Field Name | Datatype | Precision | Scale | Key | Nullable |
|---:|---|---|---:|---:|---|---|
| 1 | `PSEUDO_DATE` | string | 10 | 0 | NOT A KEY | NULL |

</details>

---

## MAPPING Definitions

### COMPTIME

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_COMPTIME_Build_Message_Counters` | 10 | 38 | 13 |
| `m_COMPTIME_Load_COMP_TIME_DAILY_TBL` | 6 | 83 | 8 |
| `m_COMPTIME_Current_Pay_Period` | 3 | 15 | 5 |

<details><summary><code>m_COMPTIME_Build_Message_Counters</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Build_Message` | Expression |
| `fil_Detail` | Filter |
| `exp_Initial` | Expression |
| `agg_ALL_RECORDS` | Aggregator |
| `exp_Detail_Count` | Expression |
| `exp_Counters` | Expression |
| `exp_Final` | Expression |
| `SQ_U0287D01` | Source Qualifier |
| `lkp_PAY_PERIOD` | Lookup Procedure |
| `exp_Final_Message` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `COUNTER_TBL` | TARGET | `COUNTER_TBL` |
| `COMPTIME_MESSAGE_FILE` | TARGET | `COMPTIME_MESSAGE_FILE` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `fil_Detail` | TRANSFORMATION | `fil_Detail` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `agg_ALL_RECORDS` | TRANSFORMATION | `agg_ALL_RECORDS` |
| `exp_Detail_Count` | TRANSFORMATION | `exp_Detail_Count` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `U0287D01` | SOURCE | `U0287D01` |
| `SQ_U0287D01` | TRANSFORMATION | `SQ_U0287D01` |
| `lkp_PAY_PERIOD` | TRANSFORMATION | `lkp_PAY_PERIOD` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |

</details>

<details><summary><code>m_COMPTIME_Load_COMP_TIME_DAILY_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_U0287D01` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Final` | Expression |
| `lkp_PAY_PERIOD` | Lookup Procedure |
| `exp_Convert` | Expression |
| `fil_Valid_Records` | Filter |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `COMP_TIME_DAILY_TBL` | TARGET | `COMP_TIME_DAILY_TBL` |
| `U0287D01` | SOURCE | `U0287D01` |
| `SQ_U0287D01` | TRANSFORMATION | `SQ_U0287D01` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_PAY_PERIOD` | TRANSFORMATION | `lkp_PAY_PERIOD` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_Valid_Records` | TRANSFORMATION | `fil_Valid_Records` |

</details>

<details><summary><code>m_COMPTIME_Current_Pay_Period</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Build_Pay_Period` | Expression |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `COMP_TIME_DATE_FILE` | TARGET | `COMP_TIME_DATE_FILE` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Build_Pay_Period` | TRANSFORMATION | `exp_Build_Pay_Period` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

### CPM

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_CPM_Current_Pay_Period` | 3 | 15 | 5 |
| `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | 12 | 284 | 16 |
| `m_CPM_Load_CPM_YTD_Staging_Tables` | 10 | 615 | 14 |
| `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | 6 | 87 | 9 |
| `m_CPM_Load_CPM_MER_Staging_Tables` | 9 | 541 | 12 |
| `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | 18 | 1436 | 30 |
| `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | 5 | 125 | 7 |
| `m_CPM_Build_Message_Counters` | 26 | 768 | 32 |
| `m_CPM_Load_CPM_PMR_Staging_Tables` | 11 | 592 | 16 |
| `m_CPM_Load_CPM_PAD_Staging_Tables` | 9 | 805 | 12 |
| `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL` | 4 | 1985 | 7 |
| `m_Generic_Mapping` | 1 | 2 | 3 |
| `m_CPM_Load_FDR_CPM_NEWPAY_TBL` | 5 | 2007 | 8 |
| `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | 10 | 805 | 24 |
| `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL` | 8 | 1230 | 10 |

<details><summary><code>m_CPM_Current_Pay_Period</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Build_Pay_Period` | Expression |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_PAY_PERIOD_DATE_FILE` | TARGET | `CPM_PAY_PERIOD_DATE_FILE` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Build_Pay_Period` | TRANSFORMATION | `exp_Build_Pay_Period` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_Error_Message` | Filter |
| `fil_Bad_Records` | Filter |
| `nrm_Errors` | Normalizer |
| `exp_Final_Errors` | Expression |
| `SQ_CPM_PM3_STG_TBL` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Final` | Expression |
| `exp_Determine_Allotments` | Expression |
| `agg_Allotments` | Aggregator |
| `exp_Convert` | Expression |
| `exp_Stage_Converted_Fields` | Expression |
| `lkp_PSEUDOSSN_TBL` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `ERROR_TBL` | TARGET | `ERROR_TBL` |
| `CPM_NEWPAY_STG_ALT_TBL` | TARGET | `CPM_NEWPAY_STG_ALT_TBL` |
| `fil_Error_Message` | TRANSFORMATION | `fil_Error_Message` |
| `fil_Bad_Records` | TRANSFORMATION | `fil_Bad_Records` |
| `nrm_Errors` | TRANSFORMATION | `nrm_Errors` |
| `exp_Final_Errors` | TRANSFORMATION | `exp_Final_Errors` |
| `SQ_CPM_PM3_STG_TBL` | TRANSFORMATION | `SQ_CPM_PM3_STG_TBL` |
| `CPM_PM3_STG_TBL` | SOURCE | `CPM_PM3_STG_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Determine_Allotments` | TRANSFORMATION | `exp_Determine_Allotments` |
| `agg_Allotments` | TRANSFORMATION | `agg_Allotments` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `mplt_Convert_Num_To_Prec7` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `exp_Stage_Converted_Fields` | TRANSFORMATION | `exp_Stage_Converted_Fields` |
| `lkp_PSEUDOSSN_TBL` | TRANSFORMATION | `lkp_PSEUDOSSN_TBL` |

</details>

<details><summary><code>m_CPM_Load_CPM_YTD_Staging_Tables</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final_YTD_Detail` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| `exp_Convert` | Expression |
| `exp_Final_YTD_Header` | Expression |
| `exp_Verify_Header_Date` | Expression |
| `Norm_YTD_FILE` | Normalizer |
| `rtr_YTD_Records` | Router |
| `exp_Initial` | Expression |
| `exp_Final_YTD_State` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_YTD_DETAIL_STG_TBL` | TARGET | `CPM_YTD_DETAIL_STG_TBL` |
| `CPM_YTD_HEADER_STG_TBL` | TARGET | `CPM_YTD_HEADER_STG_TBL` |
| `CPM_YTD_STATE_STG_TBL` | TARGET | `CPM_YTD_STATE_STG_TBL` |
| `exp_Final_YTD_Detail` | TRANSFORMATION | `exp_Final_YTD_Detail` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `lkp_Pay_Period_Record_Date` | TRANSFORMATION | `lkp_Pay_Period_Record_Date` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `exp_Final_YTD_Header` | TRANSFORMATION | `exp_Final_YTD_Header` |
| `exp_Verify_Header_Date` | TRANSFORMATION | `exp_Verify_Header_Date` |
| `YTD_FILE` | SOURCE | `YTD_FILE` |
| `Norm_YTD_FILE` | TRANSFORMATION | `Norm_YTD_FILE` |
| `rtr_YTD_Records` | TRANSFORMATION | `rtr_YTD_Records` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final_YTD_State` | TRANSFORMATION | `exp_Final_YTD_State` |

</details>

<details><summary><code>m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Initial` | Expression |
| `exp_Final` | Expression |
| `exp_Determine_YTD_States` | Expression |
| `agg_YTD_State` | Aggregator |
| `SQ_CPM_YTD_STATE_STG_TBL` | Source Qualifier |
| `exp_Stage_Converted_Fields` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NEWPAY_STG_YTD_STATE_TBL` | TARGET | `CPM_NEWPAY_STG_YTD_STATE_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Determine_YTD_States` | TRANSFORMATION | `exp_Determine_YTD_States` |
| `agg_YTD_State` | TRANSFORMATION | `agg_YTD_State` |
| `CPM_YTD_STATE_STG_TBL` | SOURCE | `CPM_YTD_STATE_STG_TBL` |
| `SQ_CPM_YTD_STATE_STG_TBL` | TRANSFORMATION | `SQ_CPM_YTD_STATE_STG_TBL` |
| `mplt_Convert_Num_To_Prec7` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `exp_Stage_Converted_Fields` | TRANSFORMATION | `exp_Stage_Converted_Fields` |

</details>

<details><summary><code>m_CPM_Load_CPM_MER_Staging_Tables</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final_MER_Detail` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| `exp_Final_MER_Header` | Expression |
| `exp_Convert` | Expression |
| `exp_Verify_Header_Date` | Expression |
| `exp_Initial` | Expression |
| `rtr_MER_Records` | Router |
| `Norm_MER_FILE` | Normalizer |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_MER_DETAIL_STG_TBL` | TARGET | `CPM_MER_DETAIL_STG_TBL` |
| `CPM_MER_HEADER_STG_TBL` | TARGET | `CPM_MER_HEADER_STG_TBL` |
| `exp_Final_MER_Detail` | TRANSFORMATION | `exp_Final_MER_Detail` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `lkp_Pay_Period_Record_Date` | TRANSFORMATION | `lkp_Pay_Period_Record_Date` |
| `exp_Final_MER_Header` | TRANSFORMATION | `exp_Final_MER_Header` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `exp_Verify_Header_Date` | TRANSFORMATION | `exp_Verify_Header_Date` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `rtr_MER_Records` | TRANSFORMATION | `rtr_MER_Records` |
| `MER_FILE` | SOURCE | `MER_FILE` |
| `Norm_MER_FILE` | TRANSFORMATION | `Norm_MER_FILE` |

</details>

<details><summary><code>m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_Bad_Records` | Filter |
| `SQ_CPM_YTD_DETAIL_STG_TBL` | Source Qualifier |
| `SQ_CPM_PM1_STG_TBL` | Source Qualifier |
| `exp_Convert_TYPE_1_PAD_MER` | Expression |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `fil_Error_Message` | Filter |
| `exp_Convert_YTD` | Expression |
| `lkp_CPM_MER_DETAIL_STG_TBL` | Lookup Procedure |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | Lookup Procedure |
| `lkp_CPM_NEWPAY_STG_YTD_STATE_TBL` | Lookup Procedure |
| `exp_Determine_Errors` | Expression |
| `nrm_Errors` | Normalizer |
| `exp_Final_Errors` | Expression |
| `jnr_CPM_YTD` | Joiner |
| `exp_Initial_YTD` | Expression |
| `exp_Stage_PAD_MER_Converted_Fields` | Expression |
| `exp_Stg_YTD_Converted_Fields` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NEWPAY_STG_TYPE_1_2_TBL` | TARGET | `CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| `ERROR_TBL` | TARGET | `ERROR_TBL` |
| `fil_Bad_Records` | TRANSFORMATION | `fil_Bad_Records` |
| `CPM_YTD_DETAIL_STG_TBL` | SOURCE | `CPM_YTD_DETAIL_STG_TBL` |
| `SQ_CPM_YTD_DETAIL_STG_TBL` | TRANSFORMATION | `SQ_CPM_YTD_DETAIL_STG_TBL` |
| `SQ_CPM_PM1_STG_TBL` | TRANSFORMATION | `SQ_CPM_PM1_STG_TBL` |
| `exp_Convert_TYPE_1_PAD_MER` | TRANSFORMATION | `exp_Convert_TYPE_1_PAD_MER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `fil_Error_Message` | TRANSFORMATION | `fil_Error_Message` |
| `PSEUDOSSN_TBL` | SOURCE | `PSEUDOSSN_TBL` |
| `exp_Convert_YTD` | TRANSFORMATION | `exp_Convert_YTD` |
| `lkp_CPM_MER_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_MER_DETAIL_STG_TBL` |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_PAD_DETAIL_STG_TBL` |
| `CPM_PM1_STG_TBL` | SOURCE | `CPM_PM1_STG_TBL` |
| `CPM_PM2_STG_TBL` | SOURCE | `CPM_PM2_STG_TBL` |
| `lkp_CPM_NEWPAY_STG_YTD_STATE_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_STG_YTD_STATE_TBL` |
| `exp_Determine_Errors` | TRANSFORMATION | `exp_Determine_Errors` |
| `nrm_Errors` | TRANSFORMATION | `nrm_Errors` |
| `exp_Final_Errors` | TRANSFORMATION | `exp_Final_Errors` |
| `jnr_CPM_YTD` | TRANSFORMATION | `jnr_CPM_YTD` |
| `exp_Initial_YTD` | TRANSFORMATION | `exp_Initial_YTD` |
| `mplt_Convert_Num_To_Prec7` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `exp_Stage_PAD_MER_Converted_Fields` | TRANSFORMATION | `exp_Stage_PAD_MER_Converted_Fields` |
| `mplt_Convert_Num_To_Prec71` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `exp_Stg_YTD_Converted_Fields` | TRANSFORMATION | `exp_Stg_YTD_Converted_Fields` |
| `mplt_Convert_Num_To_Prec72` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec73` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec74` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec75` | MAPPLET | `mplt_Convert_Num_To_Prec7` |

</details>

<details><summary><code>m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Format_Fields` | Expression |
| `SQ_CPM_PM3_STG_TBL` | Source Qualifier |
| `agg_PYF_EYE_ID_PP_NUM` | Aggregator |
| `exp_Initial` | Expression |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NEWPAY_STG_DETAIL_TBL` | TARGET | `CPM_NEWPAY_STG_DETAIL_TBL` |
| `exp_Format_Fields` | TRANSFORMATION | `exp_Format_Fields` |
| `SQ_CPM_PM3_STG_TBL` | TRANSFORMATION | `SQ_CPM_PM3_STG_TBL` |
| `CPM_PM3_STG_TBL` | SOURCE | `CPM_PM3_STG_TBL` |
| `agg_PYF_EYE_ID_PP_NUM` | TRANSFORMATION | `agg_PYF_EYE_ID_PP_NUM` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_CPM_Build_Message_Counters</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `nrm_Counters_Message` | Normalizer |
| `exp_Final_Message` | Expression |
| `exp_Build_Message` | Expression |
| `lkp_PSEUDOSSN_TBL` | Lookup Procedure |
| `lkp_CPM_MER_DETAIL_STG_TBL` | Lookup Procedure |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | Lookup Procedure |
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `SQ_ERROR_TBL` | Source Qualifier |
| `exp_Initial_Input` | Expression |
| `exp_Initial_CPM` | Expression |
| `exp_Initial_Errors` | Expression |
| `jnr_Inputs_CPM` | Joiner |
| `agg_Count_Inputs` | Aggregator |
| `agg_Count_CPM` | Aggregator |
| `exp_Stage_CPM` | Expression |
| `agg_Count_Errors` | Aggregator |
| `jnr_Inputs_CPM_Errors` | Joiner |
| `nrm_Counters` | Normalizer |
| `exp_Counters` | Expression |
| `exp_Final_Counters` | Expression |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | Lookup Procedure |
| `Norm_PAYMASTER_THREE` | Normalizer |
| `SQ_CPM_NEWPAY_TBL1` | Source Qualifier |
| `exp_Initial_Multiple_Pay_Lines` | Expression |
| `jnr_Inputs_CPM_Errors_Pay_Lines` | Joiner |
| `agg_Multiple_Pay_Lines` | Aggregator |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `COUNTER_TBL` | TARGET | `COUNTER_TBL` |
| `CPM_MESSAGE_FILE` | TARGET | `CPM_MESSAGE_FILE` |
| `nrm_Counters_Message` | TRANSFORMATION | `nrm_Counters_Message` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `lkp_PSEUDOSSN_TBL` | TRANSFORMATION | `lkp_PSEUDOSSN_TBL` |
| `lkp_CPM_MER_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_MER_DETAIL_STG_TBL` |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_PAD_DETAIL_STG_TBL` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `ERROR_TBL` | SOURCE | `ERROR_TBL` |
| `SQ_ERROR_TBL` | TRANSFORMATION | `SQ_ERROR_TBL` |
| `exp_Initial_Input` | TRANSFORMATION | `exp_Initial_Input` |
| `exp_Initial_CPM` | TRANSFORMATION | `exp_Initial_CPM` |
| `exp_Initial_Errors` | TRANSFORMATION | `exp_Initial_Errors` |
| `jnr_Inputs_CPM` | TRANSFORMATION | `jnr_Inputs_CPM` |
| `agg_Count_Inputs` | TRANSFORMATION | `agg_Count_Inputs` |
| `agg_Count_CPM` | TRANSFORMATION | `agg_Count_CPM` |
| `exp_Stage_CPM` | TRANSFORMATION | `exp_Stage_CPM` |
| `agg_Count_Errors` | TRANSFORMATION | `agg_Count_Errors` |
| `jnr_Inputs_CPM_Errors` | TRANSFORMATION | `jnr_Inputs_CPM_Errors` |
| `nrm_Counters` | TRANSFORMATION | `nrm_Counters` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |
| `exp_Final_Counters` | TRANSFORMATION | `exp_Final_Counters` |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_YTD_DETAIL_STG_TBL` |
| `PAYMASTER_THREE` | SOURCE | `PAYMASTER_THREE` |
| `Norm_PAYMASTER_THREE` | TRANSFORMATION | `Norm_PAYMASTER_THREE` |
| `CPM_NEWPAY_TBL1` | SOURCE | `CPM_NEWPAY_TBL` |
| `SQ_CPM_NEWPAY_TBL1` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL1` |
| `exp_Initial_Multiple_Pay_Lines` | TRANSFORMATION | `exp_Initial_Multiple_Pay_Lines` |
| `jnr_Inputs_CPM_Errors_Pay_Lines` | TRANSFORMATION | `jnr_Inputs_CPM_Errors_Pay_Lines` |
| `agg_Multiple_Pay_Lines` | TRANSFORMATION | `agg_Multiple_Pay_Lines` |

</details>

<details><summary><code>m_CPM_Load_CPM_PMR_Staging_Tables</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final_Paymaster_3` | Expression |
| `exp_Final_Paymaster_2` | Expression |
| `exp_Final_Paymaster_1` | Expression |
| `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| `exp_Initial` | Expression |
| `exp_Stage` | Expression |
| `exp_Final_Paymaster_Header` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `Norm_PAYMASTER_FILE` | Normalizer |
| `exp_Determine_Record_Type` | Expression |
| `rtr_Paymaster_Records` | Router |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_PM1_STG_TBL` | TARGET | `CPM_PM1_STG_TBL` |
| `CPM_PMH_STG_TBL` | TARGET | `CPM_PMH_STG_TBL` |
| `CPM_PM2_STG_TBL` | TARGET | `CPM_PM2_STG_TBL` |
| `CPM_PM3_STG_TBL` | TARGET | `CPM_PM3_STG_TBL` |
| `exp_Final_Paymaster_3` | TRANSFORMATION | `exp_Final_Paymaster_3` |
| `exp_Final_Paymaster_2` | TRANSFORMATION | `exp_Final_Paymaster_2` |
| `exp_Final_Paymaster_1` | TRANSFORMATION | `exp_Final_Paymaster_1` |
| `lkp_Pay_Period_Record_Date` | TRANSFORMATION | `lkp_Pay_Period_Record_Date` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Stage` | TRANSFORMATION | `exp_Stage` |
| `exp_Final_Paymaster_Header` | TRANSFORMATION | `exp_Final_Paymaster_Header` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAYMASTER_FILE` | SOURCE | `PAYMASTER_FILE` |
| `Norm_PAYMASTER_FILE` | TRANSFORMATION | `Norm_PAYMASTER_FILE` |
| `exp_Determine_Record_Type` | TRANSFORMATION | `exp_Determine_Record_Type` |
| `rtr_Paymaster_Records` | TRANSFORMATION | `rtr_Paymaster_Records` |

</details>

<details><summary><code>m_CPM_Load_CPM_PAD_Staging_Tables</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final_PAD_Detail` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| `exp_Final_PAD_Header` | Expression |
| `exp_Convert` | Expression |
| `exp_Verify_Header_Date` | Expression |
| `Norm_PAD_FILE` | Normalizer |
| `exp_Determine_Record_Type` | Expression |
| `rtr_PAD_Records` | Router |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_PAD_DETAIL_STG_TBL` | TARGET | `CPM_PAD_DETAIL_STG_TBL` |
| `CPM_PAD_HEADER_STG_TBL` | TARGET | `CPM_PAD_HEADER_STG_TBL` |
| `exp_Final_PAD_Detail` | TRANSFORMATION | `exp_Final_PAD_Detail` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `lkp_Pay_Period_Record_Date` | TRANSFORMATION | `lkp_Pay_Period_Record_Date` |
| `exp_Final_PAD_Header` | TRANSFORMATION | `exp_Final_PAD_Header` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `exp_Verify_Header_Date` | TRANSFORMATION | `exp_Verify_Header_Date` |
| `PAD_FILE` | SOURCE | `PAD_FILE` |
| `Norm_PAD_FILE` | TRANSFORMATION | `Norm_PAD_FILE` |
| `exp_Determine_Record_Type` | TRANSFORMATION | `exp_Determine_Record_Type` |
| `rtr_PAD_Records` | TRANSFORMATION | `rtr_PAD_Records` |

</details>

<details><summary><code>m_CPM_Load_PMR_To_CPM_NEWPAY_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Initial` | Expression |
| `exp_Final` | Expression |
| `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Source Qualifier |
| `exp_Convert` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NEWPAY_TBL` | TARGET | `CPM_NEWPAY_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `CPM_NEWPAY_STG_TYPE_1_2_TBL` | SOURCE | `CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| `CPM_NEWPAY_STG_TYPE_3_TBL` | SOURCE | `CPM_NEWPAY_STG_TYPE_3_TBL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |

</details>

<details><summary><code>m_Generic_Mapping</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `GENERIC_TARGET_FILE` | TARGET | `GENERIC_TARGET_FILE` |
| `HI_GENERIC_SRC_TBL` | SOURCE | `HI_GENERIC_SRC_TBL` |
| `SQ_HI_GENERIC_SRC_TBL` | TRANSFORMATION | `SQ_HI_GENERIC_SRC_TBL` |

</details>

<details><summary><code>m_CPM_Load_FDR_CPM_NEWPAY_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Initial` | Expression |
| `exp_Final` | Expression |
| `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Source Qualifier |
| `exp_Convert` | Expression |
| `lkp_REG_REEMPLED` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NEWPAY_TBL` | TARGET | `CPM_NEWPAY_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `CPM_NEWPAY_STG_TYPE_1_2_TBL` | SOURCE | `CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | SOURCE | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |
| `lkp_REG_REEMPLED` | TRANSFORMATION | `lkp_REG_REEMPLED` |

</details>

<details><summary><code>m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Initial` | Expression |
| `agg_PYF_EYE_ID_PP_NUM` | Aggregator |
| `exp_Final` | Expression |
| `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Lookup Procedure |
| `SQ_CPM_PM3_STG_TBL` | Source Qualifier |
| `exp_Format_Fields` | Expression |
| `lkp_CPM_NEWPAY_STG_ALT_TBL` | Lookup Procedure |
| `exp_GEN_SEQ_NUMBER` | Expression |
| `exp_Double_T38_SUN_DIF_HRS_CPP` | Expression |
| `exp_Set_REEMP_ANN_CDE` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | TARGET | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `agg_PYF_EYE_ID_PP_NUM` | TRANSFORMATION | `agg_PYF_EYE_ID_PP_NUM` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| `CPM_PM3_STG_TBL` | SOURCE | `CPM_PM3_STG_TBL` |
| `SQ_CPM_PM3_STG_TBL` | TRANSFORMATION | `SQ_CPM_PM3_STG_TBL` |
| `exp_Format_Fields` | TRANSFORMATION | `exp_Format_Fields` |
| `lkp_CPM_NEWPAY_STG_ALT_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_STG_ALT_TBL` |
| `exp_GEN_SEQ_NUMBER` | TRANSFORMATION | `exp_GEN_SEQ_NUMBER` |
| `mplt_Convert_Num_To_Prec7` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec71` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec72` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec73` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec74` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec75` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec76` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec77` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec78` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec79` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec711` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `mplt_Convert_Num_To_Prec710` | MAPPLET | `mplt_Convert_Num_To_Prec7` |
| `exp_Double_T38_SUN_DIF_HRS_CPP` | TRANSFORMATION | `exp_Double_T38_SUN_DIF_HRS_CPP` |
| `exp_Set_REEMP_ANN_CDE` | TRANSFORMATION | `exp_Set_REEMP_ANN_CDE` |

</details>

<details><summary><code>m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Initial` | Expression |
| `agg_PYF_EYE_ID_PP_NUM` | Aggregator |
| `exp_Final` | Expression |
| `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Lookup Procedure |
| `exp_Format_Fields` | Expression |
| `lkp_CPM_NEWPAY_STG_ALT_TBL` | Lookup Procedure |
| `SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Source Qualifier |
| `lkp_CPM_NEWPAY_STG_DETAIL_TBL` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NEWPAY_STG_TYPE_3_TBL` | TARGET | `CPM_NEWPAY_STG_TYPE_3_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `agg_PYF_EYE_ID_PP_NUM` | TRANSFORMATION | `agg_PYF_EYE_ID_PP_NUM` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| `exp_Format_Fields` | TRANSFORMATION | `exp_Format_Fields` |
| `lkp_CPM_NEWPAY_STG_ALT_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_STG_ALT_TBL` |
| `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | SOURCE | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |
| `SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |
| `lkp_CPM_NEWPAY_STG_DETAIL_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_STG_DETAIL_TBL` |

</details>

### CPM_AFPS

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_CPM_AFPS_0100_Data_Seperate` | 5 | 1519 | 8 |
| `m_CPM_AFPS_0300_Gross_Exp_Report` | 2 | 377 | 4 |
| `m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend` | 5 | 384 | 7 |
| `m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts` | 10 | 426 | 13 |
| `m_CPM_AFPS_0800_Build_Message_Counters` | 12 | 832 | 16 |
| `m_CPM_AFPS_0900_Build_Message` | 3 | 17 | 5 |
| `m_CPM_AFPS_0760_Concatenate_Crossfoot_Files` | 1 | 2 | 3 |
| `m_CPM_AFPS_1000_Send_Report` | 1 | 2 | 3 |
| `m_CPM_AFPS_0500_Crossfoot_Message_Header` | 4 | 16 | 6 |
| `m_CPM_AFPS_0820_Build_Message_Totals` | 11 | 832 | 15 |
| `m_CPM_AFPS_0860_Concatenate_Counts_Files` | 1 | 2 | 3 |
| `m_CPM_AFPS_0025_Set_Pay_Calendar` | 8 | 38 | 10 |
| `m_CPM_AFPS_0600_Crossfoot_Message_Details` | 4 | 24 | 6 |
| `m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL` | 5 | 31 | 7 |
| `m_CPM_AFPS_0010_Set_CPM_Calendar` | 9 | 36 | 11 |
| `m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT` | 1 | 556 | 3 |
| `m_CPM_AFPS_0400_Crossfoot_Errors` | 6 | 76 | 10 |

<details><summary><code>m_CPM_AFPS_0100_Data_Seperate</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Format_AFPS_Feeder` | Expression |
| `srt_Sort_By_Payment_Type` | Sorter |
| `exp_Convert_Calc_Fields` | Expression |
| `exp_Format_Text_Fields` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `HI_AFPS_FEEDER_TBL` | TARGET | `HI_AFPS_FEEDER_TBL` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `exp_Format_AFPS_Feeder` | TRANSFORMATION | `exp_Format_AFPS_Feeder` |
| `srt_Sort_By_Payment_Type` | TRANSFORMATION | `srt_Sort_By_Payment_Type` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `exp_Convert_Calc_Fields` | TRANSFORMATION | `exp_Convert_Calc_Fields` |
| `exp_Format_Text_Fields` | TRANSFORMATION | `exp_Format_Text_Fields` |

</details>

<details><summary><code>m_CPM_AFPS_0300_Gross_Exp_Report</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Compute_Main` | Expression |
| `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `HI_GROSS_EXP_TBL` | TARGET | `HI_GROSS_EXP_TBL` |
| `exp_Compute_Main` | TRANSFORMATION | `exp_Compute_Main` |
| `HI_AFPS_FEEDER_TBL` | SOURCE | `HI_AFPS_FEEDER_TBL` |
| `SQ_HI_AFPS_FEEDER_TBL` | TRANSFORMATION | `SQ_HI_AFPS_FEEDER_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final_Message` | Expression |
| `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |
| `exp_Initial_Feeder` | Expression |
| `agg_Gross_Expenditures` | Aggregator |
| `exp_Counters` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` | TARGET | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `HI_AFPS_FEEDER_TBL` | SOURCE | `HI_AFPS_FEEDER_TBL` |
| `SQ_HI_AFPS_FEEDER_TBL` | TRANSFORMATION | `SQ_HI_AFPS_FEEDER_TBL` |
| `exp_Initial_Feeder` | TRANSFORMATION | `exp_Initial_Feeder` |
| `agg_Gross_Expenditures` | TRANSFORMATION | `agg_Gross_Expenditures` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |

</details>

<details><summary><code>m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_ERROR_TBL` | Source Qualifier |
| `exp_Final_Message` | Expression |
| `exp_Initial_Crossfoot_Errors` | Expression |
| `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |
| `exp_Initial_Feeder` | Expression |
| `agg_Gross_Expenditures` | Aggregator |
| `agg_Crossfoot_Errors` | Aggregator |
| `jnr_Feeder_Crossfoot` | Joiner |
| `nrm_Counters` | Normalizer |
| `exp_Counters` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_AFPS_MESSAGE_COUNTS_FILE` | TARGET | `CPM_AFPS_MESSAGE_COUNTS_FILE` |
| `SQ_ERROR_TBL` | TRANSFORMATION | `SQ_ERROR_TBL` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `exp_Initial_Crossfoot_Errors` | TRANSFORMATION | `exp_Initial_Crossfoot_Errors` |
| `HI_AFPS_FEEDER_TBL` | SOURCE | `HI_AFPS_FEEDER_TBL` |
| `SQ_HI_AFPS_FEEDER_TBL` | TRANSFORMATION | `SQ_HI_AFPS_FEEDER_TBL` |
| `exp_Initial_Feeder` | TRANSFORMATION | `exp_Initial_Feeder` |
| `agg_Gross_Expenditures` | TRANSFORMATION | `agg_Gross_Expenditures` |
| `agg_Crossfoot_Errors` | TRANSFORMATION | `agg_Crossfoot_Errors` |
| `jnr_Feeder_Crossfoot` | TRANSFORMATION | `jnr_Feeder_Crossfoot` |
| `nrm_Counters` | TRANSFORMATION | `nrm_Counters` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |
| `ERROR_TBL` | SOURCE | `ERROR_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_0800_Build_Message_Counters</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Initial_Feeder` | Expression |
| `agg_Feeder` | Aggregator |
| `nrm_Counters_Message` | Normalizer |
| `exp_Final_Message` | Expression |
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Initial_CPM` | Expression |
| `jnr_Inputs_CPM` | Joiner |
| `agg_Count_CPM` | Aggregator |
| `nrm_Counters` | Normalizer |
| `exp_Counters` | Expression |
| `exp_Final_Counters` | Expression |
| `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `AFPS_COUNTER_TBL` | TARGET | `AFPS_COUNTER_TBL` |
| `CPM_AFPS_MESSAGE_COUNTS_FILE` | TARGET | `CPM_AFPS_MESSAGE_COUNTS_FILE` |
| `exp_Initial_Feeder` | TRANSFORMATION | `exp_Initial_Feeder` |
| `agg_Feeder` | TRANSFORMATION | `agg_Feeder` |
| `nrm_Counters_Message` | TRANSFORMATION | `nrm_Counters_Message` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `exp_Initial_CPM` | TRANSFORMATION | `exp_Initial_CPM` |
| `jnr_Inputs_CPM` | TRANSFORMATION | `jnr_Inputs_CPM` |
| `agg_Count_CPM` | TRANSFORMATION | `agg_Count_CPM` |
| `nrm_Counters` | TRANSFORMATION | `nrm_Counters` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |
| `exp_Final_Counters` | TRANSFORMATION | `exp_Final_Counters` |
| `HI_AFPS_FEEDER_TBL` | SOURCE | `HI_AFPS_FEEDER_TBL` |
| `SQ_HI_AFPS_FEEDER_TBL` | TRANSFORMATION | `SQ_HI_AFPS_FEEDER_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_0900_Build_Message</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_AFPS_MESSAGE_FILE` | TARGET | `CPM_AFPS_MESSAGE_FILE` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |

</details>

<details><summary><code>m_CPM_AFPS_0760_Concatenate_Crossfoot_Files</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `GENERIC_TARGET_FILE` | TARGET | `GENERIC_TARGET_FILE` |
| `HI_GENERIC_SRC_TBL` | SOURCE | `HI_GENERIC_SRC_TBL` |
| `SQ_HI_GENERIC_SRC_TBL` | TRANSFORMATION | `SQ_HI_GENERIC_SRC_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_1000_Send_Report</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `GENERIC_TARGET_FILE` | TARGET | `GENERIC_TARGET_FILE` |
| `HI_GENERIC_SRC_TBL` | SOURCE | `HI_GENERIC_SRC_TBL` |
| `SQ_HI_GENERIC_SRC_TBL` | TRANSFORMATION | `SQ_HI_GENERIC_SRC_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_0500_Crossfoot_Message_Header</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Build_Message` | Expression |
| `exp_Final_Message` | Expression |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_AFPS_MESSAGE_FILE` | TARGET | `CPM_AFPS_MESSAGE_FILE` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |

</details>

<details><summary><code>m_CPM_AFPS_0820_Build_Message_Totals</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |
| `exp_Initial_Feeder` | Expression |
| `agg_Feeder` | Aggregator |
| `exp_Final_Message` | Expression |
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Initial_CPM` | Expression |
| `jnr_Inputs_CPM` | Joiner |
| `agg_Count_CPM` | Aggregator |
| `nrm_Counters` | Normalizer |
| `exp_Counters` | Expression |
| `exp_Final_Counters` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` | TARGET | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` |
| `AFPS_COUNTER_TBL` | TARGET | `AFPS_COUNTER_TBL` |
| `HI_AFPS_FEEDER_TBL` | SOURCE | `HI_AFPS_FEEDER_TBL` |
| `SQ_HI_AFPS_FEEDER_TBL` | TRANSFORMATION | `SQ_HI_AFPS_FEEDER_TBL` |
| `exp_Initial_Feeder` | TRANSFORMATION | `exp_Initial_Feeder` |
| `agg_Feeder` | TRANSFORMATION | `agg_Feeder` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `exp_Initial_CPM` | TRANSFORMATION | `exp_Initial_CPM` |
| `jnr_Inputs_CPM` | TRANSFORMATION | `jnr_Inputs_CPM` |
| `agg_Count_CPM` | TRANSFORMATION | `agg_Count_CPM` |
| `nrm_Counters` | TRANSFORMATION | `nrm_Counters` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |
| `exp_Final_Counters` | TRANSFORMATION | `exp_Final_Counters` |

</details>

<details><summary><code>m_CPM_AFPS_0860_Concatenate_Counts_Files</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `GENERIC_TARGET_FILE` | TARGET | `GENERIC_TARGET_FILE` |
| `HI_GENERIC_SRC_TBL` | SOURCE | `HI_GENERIC_SRC_TBL` |
| `SQ_HI_GENERIC_SRC_TBL` | TRANSFORMATION | `SQ_HI_GENERIC_SRC_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_0025_Set_Pay_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Validate_Parameters` | Expression |
| `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_AFPS_PAY_PERIOD_FILE` | TARGET | `CPM_AFPS_PAY_PERIOD_FILE` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |
| `lkp_CPM_NEWPAY_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_0600_Crossfoot_Message_Details</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final_Message` | Expression |
| `exp_Initial` | Expression |
| `exp_Convert` | Expression |
| `SQ_ERROR_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_AFPS_CROSSFOOT_FILE` | TARGET | `CPM_AFPS_CROSSFOOT_FILE` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `ERROR_TBL` | SOURCE | `ERROR_TBL` |
| `SQ_ERROR_TBL` | TRANSFORMATION | `SQ_ERROR_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `upd_DFAS_HEADER_TABLE` | Update Strategy |
| `SQ_CPM_CYCLE_TBL` | Source Qualifier |
| `exp_Increment_Cycle_ID` | Expression |
| `exp_Format_Lookup_Current_PAY_PERIOD` | Expression |
| `lkp_PAY_PERIOD` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_CYCLE_TBL` | TARGET | `CPM_CYCLE_TBL` |
| `upd_DFAS_HEADER_TABLE` | TRANSFORMATION | `upd_DFAS_HEADER_TABLE` |
| `CPM_CYCLE_TBL1` | SOURCE | `CPM_CYCLE_TBL` |
| `SQ_CPM_CYCLE_TBL` | TRANSFORMATION | `SQ_CPM_CYCLE_TBL` |
| `exp_Increment_Cycle_ID` | TRANSFORMATION | `exp_Increment_Cycle_ID` |
| `exp_Format_Lookup_Current_PAY_PERIOD` | TRANSFORMATION | `exp_Format_Lookup_Current_PAY_PERIOD` |
| `lkp_PAY_PERIOD` | TRANSFORMATION | `lkp_PAY_PERIOD` |

</details>

<details><summary><code>m_CPM_AFPS_0010_Set_CPM_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Validate_Parameters` | Expression |
| `exp_Stage_Parameters` | Expression |
| `exp_PP_YEAR_NUM` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_AFPS_PAY_PERIOD_CAL_FILE` | TARGET | `CPM_AFPS_PAY_PERIOD_CAL_FILE` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |
| `exp_Stage_Parameters` | TRANSFORMATION | `exp_Stage_Parameters` |
| `exp_PP_YEAR_NUM` | TRANSFORMATION | `exp_PP_YEAR_NUM` |

</details>

<details><summary><code>m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `feeder_FEEDER_RECORD` | TARGET | `feeder_FEEDER_RECORD` |
| `SQ_HI_AFPS_FEEDER_TBL` | TRANSFORMATION | `SQ_HI_AFPS_FEEDER_TBL` |
| `HI_AFPS_FEEDER_TBL` | SOURCE | `HI_AFPS_FEEDER_TBL` |

</details>

<details><summary><code>m_CPM_AFPS_0400_Crossfoot_Errors</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_GROSS_EXP_TBL` | Source Qualifier |
| `exp_Format_Message` | Expression |
| `exp_Join_Tables` | Expression |
| `lkp_CPM3` | Lookup Procedure |
| `SQ_HI_GROSS_EXP_TBL1` | Source Qualifier |
| `jnr_Check_For_Records_Not_In_CPM3` | Joiner |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `ERROR_TBL` | TARGET | `ERROR_TBL` |
| `HI_GROSS_EXP_TBL` | SOURCE | `HI_GROSS_EXP_TBL` |
| `SQ_HI_GROSS_EXP_TBL` | TRANSFORMATION | `SQ_HI_GROSS_EXP_TBL` |
| `exp_Format_Message` | TRANSFORMATION | `exp_Format_Message` |
| `CPM_PM3_STG_TBL` | SOURCE | `CPM_PM3_STG_TBL` |
| `exp_Join_Tables` | TRANSFORMATION | `exp_Join_Tables` |
| `lkp_CPM3` | TRANSFORMATION | `lkp_CPM3` |
| `HI_GROSS_EXP_TBL1` | SOURCE | `HI_GROSS_EXP_TBL` |
| `SQ_HI_GROSS_EXP_TBL1` | TRANSFORMATION | `SQ_HI_GROSS_EXP_TBL1` |
| `jnr_Check_For_Records_Not_In_CPM3` | TRANSFORMATION | `jnr_Check_For_Records_Not_In_CPM3` |

</details>

### CPM_CDC

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_CPM_CDC_Load_CPM_CDC_Header_File` | 3 | 41 | 5 |
| `m_CPM_CDC_Concatenate_Files` | 1 | 2 | 3 |
| `m_CPM_CDC_Set_Pay_Calendar` | 8 | 37 | 10 |
| `m_CPM_CDC_Load_CPM_CDC_Data_File` | 5 | 2091 | 7 |
| `m_CPM_CDC_Set_CPM_Calendar` | 7 | 34 | 9 |
| `m_CPM_CDC_Build_Message` | 6 | 480 | 8 |

<details><summary><code>m_CPM_CDC_Load_CPM_CDC_Header_File</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `SQ_PAY_PERIOD` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `cdchdr_WS_CDC_HDR` | TARGET | `cdchdr_WS_CDC_HDR` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |

</details>

<details><summary><code>m_CPM_CDC_Concatenate_Files</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `GENERIC_TARGET_FILE` | TARGET | `GENERIC_TARGET_FILE` |
| `HI_GENERIC_SRC_TBL` | SOURCE | `HI_GENERIC_SRC_TBL` |
| `SQ_HI_GENERIC_SRC_TBL` | TRANSFORMATION | `SQ_HI_GENERIC_SRC_TBL` |

</details>

<details><summary><code>m_CPM_CDC_Set_Pay_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Validate_Parameters` | Expression |
| `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_CDC_PAY_PERIOD_FILE` | TARGET | `CPM_CDC_PAY_PERIOD_FILE` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |
| `lkp_CPM_NEWPAY_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_TBL` |

</details>

<details><summary><code>m_CPM_CDC_Load_CPM_CDC_Data_File</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Set_Defaults` | Expression |
| `exp_Init` | Expression |
| `exp_Final` | Expression |
| `exp_Convert` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `cdcskel_WS_PAY_OUT_REC` | TARGET | `cdcskel_WS_PAY_OUT_REC` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `exp_Set_Defaults` | TRANSFORMATION | `exp_Set_Defaults` |
| `exp_Init` | TRANSFORMATION | `exp_Init` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |

</details>

<details><summary><code>m_CPM_CDC_Set_CPM_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Final` | Expression |
| `exp_Validate_Parameters` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_CDC_CPM_PAY_PERIOD_FILE` | TARGET | `CPM_CDC_CPM_PAY_PERIOD_FILE` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |

</details>

<details><summary><code>m_CPM_CDC_Build_Message</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Build_Message` | Expression |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `agg_Count_CPM_CDC` | Aggregator |
| `lkp_Pay_Period_Total` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_CDC_MESSAGE_FILE` | TARGET | `CPM_CDC_MESSAGE_FILE` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `agg_Count_CPM_CDC` | TRANSFORMATION | `agg_Count_CPM_CDC` |
| `lkp_Pay_Period_Total` | TRANSFORMATION | `lkp_Pay_Period_Total` |

</details>

### CPM_NIH

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_CPM_NIH_Build_Message` | 6 | 480 | 8 |
| `m_CPM_NIH_Load_CPM_NIH_Header_File` | 3 | 42 | 5 |
| `m_CPM_NIH_Load_CPM_NIH_Data_File` | 5 | 1971 | 7 |
| `m_CPM_NIH_Set_CPM_Calendar` | 7 | 34 | 9 |
| `m_CPM_NIH_Concatenate_Files` | 1 | 2 | 3 |
| `m_CPM_NIH_Set_Pay_Calendar` | 8 | 37 | 10 |

<details><summary><code>m_CPM_NIH_Build_Message</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_Pay_Period_Total` | Lookup Procedure |
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Build_Message` | Expression |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `agg_Count_CPM_NIH` | Aggregator |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NIH_MESSAGE_FILE` | TARGET | `CPM_NIH_MESSAGE_FILE` |
| `lkp_Pay_Period_Total` | TRANSFORMATION | `lkp_Pay_Period_Total` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `agg_Count_CPM_NIH` | TRANSFORMATION | `agg_Count_CPM_NIH` |

</details>

<details><summary><code>m_CPM_NIH_Load_CPM_NIH_Header_File</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `nihhdr_WS_NIH_HDR` | TARGET | `nihhdr_WS_NIH_HDR` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |

</details>

<details><summary><code>m_CPM_NIH_Load_CPM_NIH_Data_File</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Set_Defaults` | Expression |
| `exp_Init` | Expression |
| `exp_Final` | Expression |
| `exp_Convert` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `nihtest_NIH_PAYROLL_MASTER` | TARGET | `nihtest_NIH_PAYROLL_MASTER` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `exp_Set_Defaults` | TRANSFORMATION | `exp_Set_Defaults` |
| `exp_Init` | TRANSFORMATION | `exp_Init` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |

</details>

<details><summary><code>m_CPM_NIH_Set_CPM_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Validate_Parameters` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NIH_CPM_PAY_PERIOD_FILE` | TARGET | `CPM_NIH_CPM_PAY_PERIOD_FILE` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |

</details>

<details><summary><code>m_CPM_NIH_Concatenate_Files</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `GENERIC_TARGET_FILE` | TARGET | `GENERIC_TARGET_FILE` |
| `HI_GENERIC_SRC_TBL` | SOURCE | `HI_GENERIC_SRC_TBL` |
| `SQ_HI_GENERIC_SRC_TBL` | TRANSFORMATION | `SQ_HI_GENERIC_SRC_TBL` |

</details>

<details><summary><code>m_CPM_NIH_Set_Pay_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Validate_Parameters` | Expression |
| `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_NIH_PAY_PERIOD_FILE` | TARGET | `CPM_NIH_PAY_PERIOD_FILE` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |
| `lkp_CPM_NEWPAY_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_TBL` |

</details>

### CPM_OIG

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_CPM_OIG_Build_Message` | 5 | 478 | 7 |
| `m_CPM_OIG_Set_Pay_Calendar` | 9 | 37 | 11 |
| `m_CPM_OIG_Set_CPM_Calendar` | 7 | 34 | 9 |
| `m_CPM_OIG_Load_CPM_OIG_File` | 6 | 1429 | 8 |

<details><summary><code>m_CPM_OIG_Build_Message</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Build_Message` | Expression |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `agg_Count_CPM_OIG` | Aggregator |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_OIG_MESSAGE_FILE` | TARGET | `CPM_OIG_MESSAGE_FILE` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `agg_Count_CPM_OIG` | TRANSFORMATION | `agg_Count_CPM_OIG` |

</details>

<details><summary><code>m_CPM_OIG_Set_Pay_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Validate_Parameters` | Expression |
| `exp_Set_Current_Pay_Period_Param` | Expression |
| `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_OIG_PAY_PERIOD_FILE` | TARGET | `CPM_OIG_PAY_PERIOD_FILE` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |
| `exp_Set_Current_Pay_Period_Param` | TRANSFORMATION | `exp_Set_Current_Pay_Period_Param` |
| `lkp_CPM_NEWPAY_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_TBL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |

</details>

<details><summary><code>m_CPM_OIG_Set_CPM_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Validate_Parameters` | Expression |
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_OIG_CPM_PAY_PERIOD_FILE` | TARGET | `CPM_OIG_CPM_PAY_PERIOD_FILE` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |

</details>

<details><summary><code>m_CPM_OIG_Load_CPM_OIG_File</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| `exp_Set_Defaults` | Expression |
| `exp_Init` | Expression |
| `exp_Final` | Expression |
| `UPDTRANS` | Update Strategy |
| `exp_Convert` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `oigsgndec_SKPAYROLL_MASTER` | TARGET | `oigsgndec_SKPAYROLL_MASTER` |
| `CPM_NEWPAY_TBL` | SOURCE | `CPM_NEWPAY_TBL` |
| `SQ_CPM_NEWPAY_TBL` | TRANSFORMATION | `SQ_CPM_NEWPAY_TBL` |
| `exp_Set_Defaults` | TRANSFORMATION | `exp_Set_Defaults` |
| `exp_Init` | TRANSFORMATION | `exp_Init` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `UPDTRANS` | TRANSFORMATION | `UPDTRANS` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |

</details>

### EHRP2BIIS_UPDATE

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_EHRP2BIIS_UPDATE` | 13 | 589 | 18 |

<details><summary><code>m_EHRP2BIIS_UPDATE</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_GET_EFFDT_YEAR` | Expression |
| `lkp_OLD_SEQUENCE_NUMBER` | Lookup Procedure |
| `SQ_PS_GVT_JOB` | Source Qualifier |
| `lkp_PS_GVT_EMPLOYMENT` | Lookup Procedure |
| `lkp_PS_GVT_PERS_NID` | Lookup Procedure |
| `exp_MAIN2BIIS` | Expression |
| `lkp_PS_GVT_AWD_DATA` | Lookup Procedure |
| `lkp_PS_GVT_EE_DATA_TRK` | Lookup Procedure |
| `lkp_PS_HE_FILL_POS` | Lookup Procedure |
| `lkp_PS_GVT_CITIZENSHIP` | Lookup Procedure |
| `lkp_PS_GVT_PERS_DATA` | Lookup Procedure |
| `exp_PERS_DATA` | Expression |
| `lkp_PS_JPM_JP_ITEMS` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `NWK_ACTION_SECONDARY_TBL` | TARGET | `NWK_ACTION_SECONDARY_TBL` |
| `NWK_ACTION_PRIMARY_TBL` | TARGET | `NWK_ACTION_PRIMARY_TBL` |
| `EHRP_RECS_TRACKING_TBL` | TARGET | `EHRP_RECS_TRACKING_TBL` |
| `exp_GET_EFFDT_YEAR` | TRANSFORMATION | `exp_GET_EFFDT_YEAR` |
| `lkp_OLD_SEQUENCE_NUMBER` | TRANSFORMATION | `lkp_OLD_SEQUENCE_NUMBER` |
| `PS_GVT_JOB` | SOURCE | `PS_GVT_JOB` |
| `SQ_PS_GVT_JOB` | TRANSFORMATION | `SQ_PS_GVT_JOB` |
| `lkp_PS_GVT_EMPLOYMENT` | TRANSFORMATION | `lkp_PS_GVT_EMPLOYMENT` |
| `lkp_PS_GVT_PERS_NID` | TRANSFORMATION | `lkp_PS_GVT_PERS_NID` |
| `exp_MAIN2BIIS` | TRANSFORMATION | `exp_MAIN2BIIS` |
| `lkp_PS_GVT_AWD_DATA` | TRANSFORMATION | `lkp_PS_GVT_AWD_DATA` |
| `lkp_PS_GVT_EE_DATA_TRK` | TRANSFORMATION | `lkp_PS_GVT_EE_DATA_TRK` |
| `lkp_PS_HE_FILL_POS` | TRANSFORMATION | `lkp_PS_HE_FILL_POS` |
| `lkp_PS_GVT_CITIZENSHIP` | TRANSFORMATION | `lkp_PS_GVT_CITIZENSHIP` |
| `lkp_PS_GVT_PERS_DATA` | TRANSFORMATION | `lkp_PS_GVT_PERS_DATA` |
| `exp_PERS_DATA` | TRANSFORMATION | `exp_PERS_DATA` |
| `NWK_NEW_EHRP_ACTIONS_TBL` | SOURCE | `NWK_NEW_EHRP_ACTIONS_TBL` |
| `lkp_PS_JPM_JP_ITEMS` | TRANSFORMATION | `lkp_PS_JPM_JP_ITEMS` |

</details>

### FDA_Leave

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_0150_PM_FDA_Error_Counter` | 15 | 89 | 20 |
| `m_0300_PM_FDA_Create_Output_File` | 2 | 20 | 4 |
| `m_0020_PM_FDA_Set_CPM_Calendar` | 7 | 33 | 9 |
| `m_1100_PM_FDA_Send_Email` | 1 | 2 | 3 |
| `m_0200_PM_FDA_Create_Insert_200_Rows` | 11 | 303 | 13 |
| `m_0500_PM_FDA_IO_Counter` | 19 | 113 | 24 |
| `m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA` | 5 | 31 | 7 |
| `m_0010_PM_FDA_Verify_File` | 11 | 28 | 13 |
| `m_0100_PM_FDA_Load_TATRAN_To_DB` | 4 | 34 | 6 |
| `m_0025_PM_FDA_Set_Pay_Calendar` | 9 | 42 | 11 |

<details><summary><code>m_0150_PM_FDA_Error_Counter</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Format_YTD` | Expression |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | Lookup Procedure |
| `SQ_HI_PM_FDA_TATRAN_TBL11` | Source Qualifier |
| `exp_Format_Get_Current_PP11` | Expression |
| `lkp_PAY_PERIOD11` | Lookup Procedure |
| `exp_Format_PAD` | Expression |
| `fil_Errors_PAD` | Filter |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | Lookup Procedure |
| `fil_Errors_MER` | Filter |
| `lkp_CPM_MER_DETAIL_STG_TBL` | Lookup Procedure |
| `exp_Format_MER` | Expression |
| `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |
| `exp_Format_CPM` | Expression |
| `fil_Errors_CPM` | Filter |
| `fil_Errors_YTD` | Filter |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `ERROR_TBL_CPM` | TARGET | `ERROR_TBL` |
| `ERROR_TBL_MER` | TARGET | `ERROR_TBL` |
| `ERROR_TBL_YTD` | TARGET | `ERROR_TBL` |
| `ERROR_TBL_PAD` | TARGET | `ERROR_TBL` |
| `exp_Format_YTD` | TRANSFORMATION | `exp_Format_YTD` |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_YTD_DETAIL_STG_TBL` |
| `HI_PM_FDA_TATRAN_TBL11` | SOURCE | `HI_PM_FDA_TATRAN_TBL` |
| `SQ_HI_PM_FDA_TATRAN_TBL11` | TRANSFORMATION | `SQ_HI_PM_FDA_TATRAN_TBL11` |
| `exp_Format_Get_Current_PP11` | TRANSFORMATION | `exp_Format_Get_Current_PP11` |
| `lkp_PAY_PERIOD11` | TRANSFORMATION | `lkp_PAY_PERIOD11` |
| `exp_Format_PAD` | TRANSFORMATION | `exp_Format_PAD` |
| `fil_Errors_PAD` | TRANSFORMATION | `fil_Errors_PAD` |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_PAD_DETAIL_STG_TBL` |
| `fil_Errors_MER` | TRANSFORMATION | `fil_Errors_MER` |
| `lkp_CPM_MER_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_MER_DETAIL_STG_TBL` |
| `exp_Format_MER` | TRANSFORMATION | `exp_Format_MER` |
| `lkp_CPM_NEWPAY_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_TBL` |
| `exp_Format_CPM` | TRANSFORMATION | `exp_Format_CPM` |
| `fil_Errors_CPM` | TRANSFORMATION | `fil_Errors_CPM` |
| `fil_Errors_YTD` | TRANSFORMATION | `fil_Errors_YTD` |

</details>

<details><summary><code>m_0300_PM_FDA_Create_Output_File</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_PM_FDA_TATRAN_TBL` | Source Qualifier |
| `exp_Convert_Minutes_REPLACESTR` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `HI_PM_FDA_TATRAN_FLAT` | TARGET | `HI_PM_FDA_TATRAN_FLAT` |
| `HI_PM_FDA_TATRAN_TBL` | SOURCE | `HI_PM_FDA_TATRAN_TBL` |
| `SQ_HI_PM_FDA_TATRAN_TBL` | TRANSFORMATION | `SQ_HI_PM_FDA_TATRAN_TBL` |
| `exp_Convert_Minutes_REPLACESTR` | TRANSFORMATION | `exp_Convert_Minutes_REPLACESTR` |

</details>

<details><summary><code>m_0020_PM_FDA_Set_CPM_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Validate_Parameters` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_FDA_CPM_PAY_PERIOD_FILE` | TARGET | `CPM_FDA_CPM_PAY_PERIOD_FILE` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |

</details>

<details><summary><code>m_1100_PM_FDA_Send_Email</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `GENERIC_TARGET_FILE` | TARGET | `GENERIC_TARGET_FILE` |
| `HI_GENERIC_SRC_TBL` | SOURCE | `HI_GENERIC_SRC_TBL` |
| `SQ_HI_GENERIC_SRC_TBL` | TRANSFORMATION | `SQ_HI_GENERIC_SRC_TBL` |

</details>

<details><summary><code>m_0200_PM_FDA_Create_Insert_200_Rows</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_HI_PM_FDA_TATRAN_TBL` | Source Qualifier |
| `exp_Format_200_Records` | Expression |
| `nrm_Normalize_200_Records` | Normalizer |
| `lkp_CPM_MER_DETAIL_STG_TBL` | Lookup Procedure |
| `exp_Set_PP` | Expression |
| `lkp_PAY_PERIOD` | Lookup Procedure |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | Lookup Procedure |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | Lookup Procedure |
| `fil_Filter_Out_NULL` | Filter |
| `lkp_PSEUDOSSN` | Lookup Procedure |
| `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `HI_PM_FDA_TATRAN_TBL1` | TARGET | `HI_PM_FDA_TATRAN_TBL` |
| `HI_PM_FDA_TATRAN_TBL` | SOURCE | `HI_PM_FDA_TATRAN_TBL` |
| `SQ_HI_PM_FDA_TATRAN_TBL` | TRANSFORMATION | `SQ_HI_PM_FDA_TATRAN_TBL` |
| `exp_Format_200_Records` | TRANSFORMATION | `exp_Format_200_Records` |
| `nrm_Normalize_200_Records` | TRANSFORMATION | `nrm_Normalize_200_Records` |
| `lkp_CPM_MER_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_MER_DETAIL_STG_TBL` |
| `exp_Set_PP` | TRANSFORMATION | `exp_Set_PP` |
| `lkp_PAY_PERIOD` | TRANSFORMATION | `lkp_PAY_PERIOD` |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_PAD_DETAIL_STG_TBL` |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | TRANSFORMATION | `lkp_CPM_YTD_DETAIL_STG_TBL` |
| `fil_Filter_Out_NULL` | TRANSFORMATION | `fil_Filter_Out_NULL` |
| `lkp_PSEUDOSSN` | TRANSFORMATION | `lkp_PSEUDOSSN` |
| `lkp_CPM_NEWPAY_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_TBL` |

</details>

<details><summary><code>m_0500_PM_FDA_IO_Counter</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `nrm_Counters_Message` | Normalizer |
| `exp_Counters1` | Expression |
| `SQ_HI_PM_FDA_TATRAN_TBL` | Source Qualifier |
| `fil_Leave_Records` | Filter |
| `agg_All_Leave_Recs` | Aggregator |
| `exp_Leave_Rec_Count` | Expression |
| `lkp_Curr_Pay_Period` | Lookup Procedure |
| `exp_Counters` | Expression |
| `lkp_Count_HI_PM_FDA_TATRAN_TBL_READ` | Lookup Procedure |
| `nrm_Counters` | Normalizer |
| `exp_Final_Rec_Insert` | Expression |
| `exp_Build_Message` | Expression |
| `exp_Final_Message` | Expression |
| `lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL` | Lookup Procedure |
| `agg_Error_Records` | Aggregator |
| `exp_Error_Count` | Expression |
| `jnr_All_Counts` | Joiner |
| `SQ_ERROR_TBL` | Source Qualifier |
| `exp_Initial_Error` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `COUNTER_TBL` | TARGET | `COUNTER_TBL` |
| `FDA_EXTRACT_MESSAGE_FILE` | TARGET | `FDA_EXTRACT_MESSAGE_FILE` |
| `nrm_Counters_Message` | TRANSFORMATION | `nrm_Counters_Message` |
| `exp_Counters1` | TRANSFORMATION | `exp_Counters1` |
| `HI_PM_FDA_TATRAN_TBL` | SOURCE | `HI_PM_FDA_TATRAN_TBL` |
| `SQ_HI_PM_FDA_TATRAN_TBL` | TRANSFORMATION | `SQ_HI_PM_FDA_TATRAN_TBL` |
| `fil_Leave_Records` | TRANSFORMATION | `fil_Leave_Records` |
| `agg_All_Leave_Recs` | TRANSFORMATION | `agg_All_Leave_Recs` |
| `exp_Leave_Rec_Count` | TRANSFORMATION | `exp_Leave_Rec_Count` |
| `lkp_Curr_Pay_Period` | TRANSFORMATION | `lkp_Curr_Pay_Period` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |
| `lkp_Count_HI_PM_FDA_TATRAN_TBL_READ` | TRANSFORMATION | `lkp_Count_HI_PM_FDA_TATRAN_TBL_READ` |
| `nrm_Counters` | TRANSFORMATION | `nrm_Counters` |
| `exp_Final_Rec_Insert` | TRANSFORMATION | `exp_Final_Rec_Insert` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL` | TRANSFORMATION | `lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL` |
| `agg_Error_Records` | TRANSFORMATION | `agg_Error_Records` |
| `exp_Error_Count` | TRANSFORMATION | `exp_Error_Count` |
| `jnr_All_Counts` | TRANSFORMATION | `jnr_All_Counts` |
| `ERROR_TBL` | SOURCE | `ERROR_TBL` |
| `SQ_ERROR_TBL` | TRANSFORMATION | `SQ_ERROR_TBL` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `exp_Initial_Error` | TRANSFORMATION | `exp_Initial_Error` |

</details>

<details><summary><code>m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Increment_Cycle_ID` | Expression |
| `exp_Format_Lookup_Current_PAY_PERIOD` | Expression |
| `lkp_PAY_PERIOD` | Lookup Procedure |
| `upd_DFAS_HEADER_TABLE` | Update Strategy |
| `SQ_CPM_CYCLE_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_CYCLE_TBL` | TARGET | `CPM_CYCLE_TBL` |
| `exp_Increment_Cycle_ID` | TRANSFORMATION | `exp_Increment_Cycle_ID` |
| `exp_Format_Lookup_Current_PAY_PERIOD` | TRANSFORMATION | `exp_Format_Lookup_Current_PAY_PERIOD` |
| `lkp_PAY_PERIOD` | TRANSFORMATION | `lkp_PAY_PERIOD` |
| `upd_DFAS_HEADER_TABLE` | TRANSFORMATION | `upd_DFAS_HEADER_TABLE` |
| `CPM_CYCLE_TBL1` | SOURCE | `CPM_CYCLE_TBL` |
| `SQ_CPM_CYCLE_TBL` | TRANSFORMATION | `SQ_CPM_CYCLE_TBL` |

</details>

<details><summary><code>m_0010_PM_FDA_Verify_File</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `exp_Initial` | Expression |
| `exp_Validate_Parameters` | Expression |
| `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |
| `SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | Source Qualifier |
| `agg_Count_Number_of_Files` | Aggregator |
| `EXPTRANS` | Expression |
| `srt_Distinct_File_Names` | Sorter |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_FDA_PAY_PERIOD_FILE` | TARGET | `CPM_FDA_PAY_PERIOD_FILE` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |
| `lkp_CPM_NEWPAY_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_TBL` |
| `HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | SOURCE | `HI_PM_FDA_TATRAN_FLAT_FILE_NAME` |
| `SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | TRANSFORMATION | `SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME` |
| `agg_Count_Number_of_Files` | TRANSFORMATION | `agg_Count_Number_of_Files` |
| `EXPTRANS` | TRANSFORMATION | `EXPTRANS` |
| `srt_Distinct_File_Names` | TRANSFORMATION | `srt_Distinct_File_Names` |

</details>

<details><summary><code>m_0100_PM_FDA_Load_TATRAN_To_DB</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Add_FDA_SEQ` | Expression |
| `SQ_HI_PM_FDA_TATRAN_FLAT` | Source Qualifier |
| `fil_Filter_Out_01_99` | Filter |
| `srt_Sort_By_BATCH_SEQ` | Sorter |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `HI_PM_FDA_TATRAN_TBL` | TARGET | `HI_PM_FDA_TATRAN_TBL` |
| `exp_Add_FDA_SEQ` | TRANSFORMATION | `exp_Add_FDA_SEQ` |
| `HI_PM_FDA_TATRAN_FLAT` | SOURCE | `HI_PM_FDA_TATRAN_FLAT` |
| `SQ_HI_PM_FDA_TATRAN_FLAT` | TRANSFORMATION | `SQ_HI_PM_FDA_TATRAN_FLAT` |
| `fil_Filter_Out_01_99` | TRANSFORMATION | `fil_Filter_Out_01_99` |
| `srt_Sort_By_BATCH_SEQ` | TRANSFORMATION | `srt_Sort_By_BATCH_SEQ` |

</details>

<details><summary><code>m_0025_PM_FDA_Set_Pay_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Validate_Parameters` | Expression |
| `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |
| `exp_Stage_Parameters` | Expression |
| `exp_Final` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Set_Parameters` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `CPM_FDA_PAY_PERIOD_FILE` | TARGET | `CPM_FDA_PAY_PERIOD_FILE` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Validate_Parameters` | TRANSFORMATION | `exp_Validate_Parameters` |
| `lkp_CPM_NEWPAY_TBL` | TRANSFORMATION | `lkp_CPM_NEWPAY_TBL` |
| `exp_Stage_Parameters` | TRANSFORMATION | `exp_Stage_Parameters` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Set_Parameters` | TRANSFORMATION | `exp_Set_Parameters` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |

</details>

### LES

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_LESRPT_Load_LESL` | 4 | 64 | 6 |
| `m_LESRPT_Load_LEST` | 5 | 37 | 7 |
| `m_LESRPT_Load_LESM` | 4 | 29 | 6 |
| `m_LESRPT_Load_LESD` | 5 | 56 | 7 |
| `m_LESRPT_Load_LESS` | 4 | 324 | 6 |
| `m_LESRPT_Load_LESU` | 5 | 48 | 7 |
| `m_LESRPT_Load_LESC` | 5 | 60 | 7 |
| `m_LESRPT_Load_LESR` | 5 | 60 | 7 |
| `m_LES_Verify_Header` | 8 | 48 | 10 |
| `m_LES_Verify_Record_Count` | 7 | 34 | 9 |
| `m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL` | 3 | 60 | 5 |
| `m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL` | 6 | 71 | 8 |
| `m_LES_NIH_FILE` | 10 | 50 | 13 |
| `m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL` | 6 | 71 | 8 |
| `m_LES_Build_Message_Counters` | 28 | 201 | 34 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL` | 7 | 85 | 10 |
| `m_LES_Current_Pay_Period` | 3 | 15 | 5 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL` | 7 | 118 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL` | 7 | 49 | 10 |
| `m_LES_Load_LES_PRIMARY_DATA_TBL` | 6 | 456 | 15 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL` | 7 | 144 | 10 |
| `m_LES_Load_LES_HEADER_TBL` | 7 | 59 | 9 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL` | 7 | 126 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL` | 7 | 145 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL` | 7 | 119 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_TBL` | 12 | 78 | 16 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL` | 7 | 95 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL` | 7 | 73 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL` | 7 | 100 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL` | 7 | 53 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL` | 7 | 35 | 10 |
| `m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL` | 7 | 95 | 10 |

<details><summary><code>m_LESRPT_Load_LESL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_EMP_DETAIL_LEAVE_TBL` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Final` | Expression |
| `lkp_LESL_KEY` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LESL` | TARGET | `LESL` |
| `LES_EMP_DETAIL_LEAVE_TBL` | SOURCE | `LES_EMP_DETAIL_LEAVE_TBL` |
| `SQ_LES_EMP_DETAIL_LEAVE_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_LEAVE_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_LESL_KEY` | TRANSFORMATION | `lkp_LESL_KEY` |

</details>

<details><summary><code>m_LESRPT_Load_LEST</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SEQTRANS` | Sequence |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `SQ_LES_EMP_DETAIL_RECTYPE_T_TBL` | Source Qualifier |
| `lkp_LEST_KEY` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LEST` | TARGET | `LEST` |
| `SEQTRANS` | TRANSFORMATION | `SEQTRANS` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `LES_EMP_DETAIL_RECTYPE_T_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_T_TBL` |
| `SQ_LES_EMP_DETAIL_RECTYPE_T_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_T_TBL` |
| `lkp_LEST_KEY` | TRANSFORMATION | `lkp_LEST_KEY` |

</details>

<details><summary><code>m_LESRPT_Load_LESM</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_EMP_DETAIL_RECTYPE_M_TBL` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Final` | Expression |
| `lkp_LESM_KEY` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LESM` | TARGET | `LESM` |
| `LES_EMP_DETAIL_RECTYPE_M_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_M_TBL` |
| `SQ_LES_EMP_DETAIL_RECTYPE_M_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_M_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_LESM_KEY` | TRANSFORMATION | `lkp_LESM_KEY` |

</details>

<details><summary><code>m_LESRPT_Load_LESD</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_EMP_DETAIL_RECTYPE_D_TBL` | Source Qualifier |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `SEQTRANS` | Sequence |
| `lkp_MAX_LESD_KEY` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LESD` | TARGET | `LESD` |
| `LES_EMP_DETAIL_RECTYPE_D_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_D_TBL` |
| `SQ_LES_EMP_DETAIL_RECTYPE_D_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_D_TBL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `SEQTRANS` | TRANSFORMATION | `SEQTRANS` |
| `lkp_MAX_LESD_KEY` | TRANSFORMATION | `lkp_MAX_LESD_KEY` |

</details>

<details><summary><code>m_LESRPT_Load_LESS</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_PRIMARY_DATA_TBL` | Source Qualifier |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `lkp_MAX_LESS_KEY` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LESS` | TARGET | `LESS` |
| `LES_PRIMARY_DATA_TBL` | SOURCE | `LES_PRIMARY_DATA_TBL` |
| `SQ_LES_PRIMARY_DATA_TBL` | TRANSFORMATION | `SQ_LES_PRIMARY_DATA_TBL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `lkp_MAX_LESS_KEY` | TRANSFORMATION | `lkp_MAX_LESS_KEY` |

</details>

<details><summary><code>m_LESRPT_Load_LESU</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_EMP_DETAIL_RECTYPE_U_TBL` | Source Qualifier |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `SEQTRANS` | Sequence |
| `lkp_LESU_KEY` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LESU` | TARGET | `LESU` |
| `LES_EMP_DETAIL_RECTYPE_U_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_U_TBL` |
| `SQ_LES_EMP_DETAIL_RECTYPE_U_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_U_TBL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `SEQTRANS` | TRANSFORMATION | `SEQTRANS` |
| `lkp_LESU_KEY` | TRANSFORMATION | `lkp_LESU_KEY` |

</details>

<details><summary><code>m_LESRPT_Load_LESC</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | Source Qualifier |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |
| `SEQTRANS` | Sequence |
| `lkp_LESC_KEY` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LESC` | TARGET | `LESC` |
| `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `SEQTRANS` | TRANSFORMATION | `SEQTRANS` |
| `lkp_LESC_KEY` | TRANSFORMATION | `lkp_LESC_KEY` |
| `LES_EMP_DETAIL_RECTYPE_C_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_C_TBL` |

</details>

<details><summary><code>m_LESRPT_Load_LESR</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SEQTRANS` | Sequence |
| `lkp_LESR_KEY` | Lookup Procedure |
| `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | Source Qualifier |
| `exp_Final` | Expression |
| `exp_Initial` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LESR` | TARGET | `LESR` |
| `SEQTRANS` | TRANSFORMATION | `SEQTRANS` |
| `lkp_LESR_KEY` | TRANSFORMATION | `lkp_LESR_KEY` |
| `LES_EMP_DETAIL_RECTYPE_R_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_R_TBL` |
| `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |

</details>

<details><summary><code>m_LES_Verify_Header</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| `fil_LES_HEADER` | Filter |
| `exp_Convert` | Expression |
| `Norm_EMP_REC_TYPE_0` | Normalizer |
| `exp_Final` | Expression |
| `exp_Stage` | Expression |
| `exp_Verify_Header_Date` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_HEADER_FILE` | TARGET | `LES_HEADER_FILE` |
| `lkp_Pay_Period_Record_Date` | TRANSFORMATION | `lkp_Pay_Period_Record_Date` |
| `fil_LES_HEADER` | TRANSFORMATION | `fil_LES_HEADER` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `EMP_REC_TYPE_0` | SOURCE | `EMP_REC_TYPE_0` |
| `Norm_EMP_REC_TYPE_0` | TRANSFORMATION | `Norm_EMP_REC_TYPE_0` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Stage` | TRANSFORMATION | `exp_Stage` |
| `exp_Verify_Header_Date` | TRANSFORMATION | `exp_Verify_Header_Date` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |

</details>

<details><summary><code>m_LES_Verify_Record_Count</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_LES_Records` | Filter |
| `exp_Convert` | Expression |
| `exp_Final` | Expression |
| `exp_Stage` | Expression |
| `exp_Verify_Header_Date` | Expression |
| `Norm_EMP_REC_TYPE_E` | Normalizer |
| `fil_Trailer_Records` | Filter |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_TOTALS_FILE` | TARGET | `LES_TOTALS_FILE` |
| `fil_LES_Records` | TRANSFORMATION | `fil_LES_Records` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Stage` | TRANSFORMATION | `exp_Stage` |
| `exp_Verify_Header_Date` | TRANSFORMATION | `exp_Verify_Header_Date` |
| `EMP_REC_TYPE_E` | SOURCE | `EMP_REC_TYPE_E` |
| `Norm_EMP_REC_TYPE_E` | TRANSFORMATION | `Norm_EMP_REC_TYPE_E` |
| `fil_Trailer_Records` | TRANSFORMATION | `fil_Trailer_Records` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_EMP_DETAIL_RECTYPE_L_TBL` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_LEAVE_TBL` | TARGET | `LES_EMP_DETAIL_LEAVE_TBL` |
| `LES_EMP_DETAIL_RECTYPE_L_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_L_TBL` |
| `SQ_LES_EMP_DETAIL_RECTYPE_L_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_L_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_Remove_Blank_Retroactive_Earnings` | Filter |
| `exp_Initial` | Expression |
| `nrm_EMP_RETRO_EARN` | Normalizer |
| `exp_Convert` | Expression |
| `exp_Final` | Expression |
| `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RETRO_EARN_TBL` | TARGET | `LES_EMP_DETAIL_RETRO_EARN_TBL` |
| `fil_Remove_Blank_Retroactive_Earnings` | TRANSFORMATION | `fil_Remove_Blank_Retroactive_Earnings` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `nrm_EMP_RETRO_EARN` | TRANSFORMATION | `nrm_EMP_RETRO_EARN` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `LES_EMP_DETAIL_RECTYPE_R_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_R_TBL` |
| `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` |

</details>

<details><summary><code>m_LES_NIH_FILE</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `fil_NIH_Records` | Filter |
| `lkp_PSEUDOSSN_TBL` | Lookup Procedure |
| `exp_Initial` | Expression |
| `fil_Header_Trailer` | Filter |
| `exp_Flag_NIH_Record` | Expression |
| `SQ_LES_EMPLOYEE_DETAIL` | Source Qualifier |
| `fil_NIH_EMPLOYEE_DETAIL` | Filter |
| `exp_Final` | Expression |
| `exp_Set_Curr_Flag` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_NIH_EMPLOYEE_DETAIL` | TARGET | `LES_NIH_EMPLOYEE_DETAIL` |
| `LES_NIH_EMPLOYEE_SUMMARY_TBL` | TARGET | `LES_NIH_EMPLOYEE_SUMMARY_TBL` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `fil_NIH_Records` | TRANSFORMATION | `fil_NIH_Records` |
| `LES_EMPLOYEE_DETAIL` | SOURCE | `LES_EMPLOYEE_DETAIL` |
| `lkp_PSEUDOSSN_TBL` | TRANSFORMATION | `lkp_PSEUDOSSN_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `fil_Header_Trailer` | TRANSFORMATION | `fil_Header_Trailer` |
| `exp_Flag_NIH_Record` | TRANSFORMATION | `exp_Flag_NIH_Record` |
| `SQ_LES_EMPLOYEE_DETAIL` | TRANSFORMATION | `SQ_LES_EMPLOYEE_DETAIL` |
| `fil_NIH_EMPLOYEE_DETAIL` | TRANSFORMATION | `fil_NIH_EMPLOYEE_DETAIL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Set_Curr_Flag` | TRANSFORMATION | `exp_Set_Curr_Flag` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | Source Qualifier |
| `exp_Initial` | Expression |
| `nrm_EMP_CURR_EARN` | Normalizer |
| `fil_Remove_Blank_Current_Earnings` | Filter |
| `exp_Convert` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_CURR_EARN_TBL` | TARGET | `LES_EMP_DETAIL_CURR_EARN_TBL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `nrm_EMP_CURR_EARN` | TRANSFORMATION | `nrm_EMP_CURR_EARN` |
| `fil_Remove_Blank_Current_Earnings` | TRANSFORMATION | `fil_Remove_Blank_Current_Earnings` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `LES_EMP_DETAIL_RECTYPE_C_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_C_TBL` |

</details>

<details><summary><code>m_LES_Build_Message_Counters</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `jnr_Input_Loaded_NIH_Errors` | Joiner |
| `exp_Counters` | Expression |
| `exp_Final_Counters` | Expression |
| `exp_Stage_Counters` | Expression |
| `exp_Pay_Period` | Expression |
| `SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL` | Source Qualifier |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `nrm_Counters` | Normalizer |
| `SQ_ERROR_TBL` | Source Qualifier |
| `Norm_EMP_REC_TYPE_E` | Normalizer |
| `fil_EMPLOYEE_DETAIL` | Filter |
| `exp_Build_Message` | Expression |
| `exp_Final_Message` | Expression |
| `exp_Init_Inputs` | Expression |
| `agg_Count_Input_Records` | Aggregator |
| `SQ_LES_PRIMARY_DATA_TBL` | Source Qualifier |
| `exp_Init_Loaded_Records` | Expression |
| `agg_Count_Loaded_Records` | Aggregator |
| `exp_Init_Errors` | Expression |
| `agg_Count_Error_Records` | Aggregator |
| `exp_Input_Counters` | Expression |
| `exp_Loaded_Counters` | Expression |
| `exp_Init_NIH` | Expression |
| `agg_Count_NIH_Records` | Aggregator |
| `exp_NIH_Counters` | Expression |
| `exp_Error_Count` | Expression |
| `jnr_Inputs_Loaded` | Joiner |
| `jnr_Inputs_Loaded_NIH` | Joiner |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_MESSAGE_FILE` | TARGET | `LES_MESSAGE_FILE` |
| `COUNTER_TBL` | TARGET | `COUNTER_TBL` |
| `jnr_Input_Loaded_NIH_Errors` | TRANSFORMATION | `jnr_Input_Loaded_NIH_Errors` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |
| `exp_Final_Counters` | TRANSFORMATION | `exp_Final_Counters` |
| `exp_Stage_Counters` | TRANSFORMATION | `exp_Stage_Counters` |
| `exp_Pay_Period` | TRANSFORMATION | `exp_Pay_Period` |
| `LES_NIH_EMPLOYEE_SUMMARY_TBL` | SOURCE | `LES_NIH_EMPLOYEE_SUMMARY_TBL` |
| `SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL` | TRANSFORMATION | `SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `nrm_Counters` | TRANSFORMATION | `nrm_Counters` |
| `ERROR_TBL` | SOURCE | `ERROR_TBL` |
| `SQ_ERROR_TBL` | TRANSFORMATION | `SQ_ERROR_TBL` |
| `Norm_EMP_REC_TYPE_E` | TRANSFORMATION | `Norm_EMP_REC_TYPE_E` |
| `EMP_REC_TYPE_E` | SOURCE | `EMP_REC_TYPE_E` |
| `fil_EMPLOYEE_DETAIL` | TRANSFORMATION | `fil_EMPLOYEE_DETAIL` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `exp_Init_Inputs` | TRANSFORMATION | `exp_Init_Inputs` |
| `agg_Count_Input_Records` | TRANSFORMATION | `agg_Count_Input_Records` |
| `LES_PRIMARY_DATA_TBL` | SOURCE | `LES_PRIMARY_DATA_TBL` |
| `SQ_LES_PRIMARY_DATA_TBL` | TRANSFORMATION | `SQ_LES_PRIMARY_DATA_TBL` |
| `exp_Init_Loaded_Records` | TRANSFORMATION | `exp_Init_Loaded_Records` |
| `agg_Count_Loaded_Records` | TRANSFORMATION | `agg_Count_Loaded_Records` |
| `exp_Init_Errors` | TRANSFORMATION | `exp_Init_Errors` |
| `agg_Count_Error_Records` | TRANSFORMATION | `agg_Count_Error_Records` |
| `exp_Input_Counters` | TRANSFORMATION | `exp_Input_Counters` |
| `exp_Loaded_Counters` | TRANSFORMATION | `exp_Loaded_Counters` |
| `exp_Init_NIH` | TRANSFORMATION | `exp_Init_NIH` |
| `agg_Count_NIH_Records` | TRANSFORMATION | `agg_Count_NIH_Records` |
| `exp_NIH_Counters` | TRANSFORMATION | `exp_NIH_Counters` |
| `exp_Error_Count` | TRANSFORMATION | `exp_Error_Count` |
| `jnr_Inputs_Loaded` | TRANSFORMATION | `jnr_Inputs_Loaded` |
| `jnr_Inputs_Loaded_NIH` | TRANSFORMATION | `jnr_Inputs_Loaded_NIH` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `Norm_EMP_REC_TYPE_D` | Normalizer |
| `fil_EMP_REC_TYPE_D_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_D` | Filter |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_D_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_D_TBL` |
| `EMP_REC_TYPE_D` | SOURCE | `EMP_REC_TYPE_D` |
| `Norm_EMP_REC_TYPE_D` | TRANSFORMATION | `Norm_EMP_REC_TYPE_D` |
| `fil_EMP_REC_TYPE_D_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_D_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_D` | TRANSFORMATION | `fil_EMP_REC_TYPE_D` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Current_Pay_Period</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Build_Pay_Period` | Expression |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_PAY_PERIOD_DATE_FILE` | TARGET | `LES_PAY_PERIOD_DATE_FILE` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Build_Pay_Period` | TRANSFORMATION | `exp_Build_Pay_Period` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_EMP_REC_TYPE_2_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_2` | Filter |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |
| `Norm_EMP_REC_TYPE_2` | Normalizer |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_2_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_2_TBL` |
| `fil_EMP_REC_TYPE_2_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_2_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_2` | TRANSFORMATION | `fil_EMP_REC_TYPE_2` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `EMP_REC_TYPE_2` | SOURCE | `EMP_REC_TYPE_2` |
| `Norm_EMP_REC_TYPE_2` | TRANSFORMATION | `Norm_EMP_REC_TYPE_2` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_EMP_REC_TYPE_T_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_T` | Filter |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |
| `Norm_EMP_REC_TYPE_T` | Normalizer |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_T_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_T_TBL` |
| `fil_EMP_REC_TYPE_T_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_T_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_T` | TRANSFORMATION | `fil_EMP_REC_TYPE_T` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `EMP_REC_TYPE_T` | SOURCE | `EMP_REC_TYPE_T` |
| `Norm_EMP_REC_TYPE_T` | TRANSFORMATION | `Norm_EMP_REC_TYPE_T` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |

</details>

<details><summary><code>m_LES_Load_LES_PRIMARY_DATA_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Stage` | Expression |
| `lkp_PSEUDOSSN` | Lookup Procedure |
| `exp_Final` | Expression |
| `lkp_Pay_Period` | Lookup Procedure |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `exp_Initial` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_PRIMARY_DATA_TBL` | TARGET | `LES_PRIMARY_DATA_TBL` |
| `LES_EMP_DETAIL_RECTYPE_4_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_4_TBL` |
| `LES_EMP_DETAIL_RECTYPE_5_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_5_TBL` |
| `LES_EMP_DETAIL_RECTYPE_6_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_6_TBL` |
| `exp_Stage` | TRANSFORMATION | `exp_Stage` |
| `lkp_PSEUDOSSN` | TRANSFORMATION | `lkp_PSEUDOSSN` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Pay_Period` | TRANSFORMATION | `lkp_Pay_Period` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `LES_HEADER_TBL` | SOURCE | `LES_HEADER_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `LES_EMP_DETAIL_RECTYPE_1_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_1_TBL` |
| `LES_EMP_DETAIL_RECTYPE_2_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_2_TBL` |
| `LES_EMP_DETAIL_RECTYPE_3_TBL` | SOURCE | `LES_EMP_DETAIL_RECTYPE_3_TBL` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `Norm_EMP_REC_TYPE_3` | Normalizer |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `fil_EMP_REC_TYPE_3_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_3` | Filter |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_3_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_3_TBL` |
| `EMP_REC_TYPE_3` | SOURCE | `EMP_REC_TYPE_3` |
| `Norm_EMP_REC_TYPE_3` | TRANSFORMATION | `Norm_EMP_REC_TYPE_3` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `fil_EMP_REC_TYPE_3_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_3_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_3` | TRANSFORMATION | `fil_EMP_REC_TYPE_3` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Load_LES_HEADER_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| `fil_LES_HEADER` | Filter |
| `exp_Convert` | Expression |
| `Norm_EMP_REC_TYPE_0` | Normalizer |
| `exp_Final` | Expression |
| `exp_Stage` | Expression |
| `fil_First_Header_Record` | Filter |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_HEADER_TBL` | TARGET | `LES_HEADER_TBL` |
| `lkp_Pay_Period_Record_Date` | TRANSFORMATION | `lkp_Pay_Period_Record_Date` |
| `fil_LES_HEADER` | TRANSFORMATION | `fil_LES_HEADER` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `EMP_REC_TYPE_0` | SOURCE | `EMP_REC_TYPE_0` |
| `Norm_EMP_REC_TYPE_0` | TRANSFORMATION | `Norm_EMP_REC_TYPE_0` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `exp_Stage` | TRANSFORMATION | `exp_Stage` |
| `fil_First_Header_Record` | TRANSFORMATION | `fil_First_Header_Record` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `Norm_EMP_REC_TYPE_5` | Normalizer |
| `fil_EMP_REC_TYPE_5_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_5` | Filter |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_5_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_5_TBL` |
| `EMP_REC_TYPE_5` | SOURCE | `EMP_REC_TYPE_5` |
| `Norm_EMP_REC_TYPE_5` | TRANSFORMATION | `Norm_EMP_REC_TYPE_5` |
| `fil_EMP_REC_TYPE_5_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_5_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_5` | TRANSFORMATION | `fil_EMP_REC_TYPE_5` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_EMP_REC_TYPE_1_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `Norm_EMP_REC_TYPE_1` | Normalizer |
| `fil_EMP_REC_TYPE_1` | Filter |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_1_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_1_TBL` |
| `fil_EMP_REC_TYPE_1_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_1_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `EMP_REC_TYPE_1` | SOURCE | `EMP_REC_TYPE_1` |
| `Norm_EMP_REC_TYPE_1` | TRANSFORMATION | `Norm_EMP_REC_TYPE_1` |
| `fil_EMP_REC_TYPE_1` | TRANSFORMATION | `fil_EMP_REC_TYPE_1` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `Norm_EMP_REC_TYPE_4` | Normalizer |
| `fil_EMP_REC_TYPE_4_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_4` | Filter |
| `jnr_LES_NUMBER` | Joiner |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_4_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_4_TBL` |
| `EMP_REC_TYPE_4` | SOURCE | `EMP_REC_TYPE_4` |
| `Norm_EMP_REC_TYPE_4` | TRANSFORMATION | `Norm_EMP_REC_TYPE_4` |
| `fil_EMP_REC_TYPE_4_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_4_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_4` | TRANSFORMATION | `fil_EMP_REC_TYPE_4` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_HEADER_TBL` | Source Qualifier |
| `jnr_HEADER_EMP_DETAILS` | Joiner |
| `exp_HEADER` | Expression |
| `fil_EMPLOYEE_DETAIL` | Filter |
| `exp_FINAL` | Expression |
| `exp_Convert` | Expression |
| `Norm_EMP_REC_TYPE_E` | Normalizer |
| `lkp_PSEUDSSN_TBL` | Lookup Procedure |
| `exp_STAGE` | Expression |
| `exp_CHECK_ERRORS` | Expression |
| `rtr_GOOD_BAD_RECORDS` | Router |
| `exp_FINAL_ERRORS` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_TBL` | TARGET | `LES_EMP_DETAIL_TBL` |
| `ERROR_TBL` | TARGET | `ERROR_TBL` |
| `SQ_LES_HEADER_TBL` | TRANSFORMATION | `SQ_LES_HEADER_TBL` |
| `LES_HEADER_TBL` | SOURCE | `LES_HEADER_TBL` |
| `jnr_HEADER_EMP_DETAILS` | TRANSFORMATION | `jnr_HEADER_EMP_DETAILS` |
| `exp_HEADER` | TRANSFORMATION | `exp_HEADER` |
| `fil_EMPLOYEE_DETAIL` | TRANSFORMATION | `fil_EMPLOYEE_DETAIL` |
| `exp_FINAL` | TRANSFORMATION | `exp_FINAL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `EMP_REC_TYPE_E` | SOURCE | `EMP_REC_TYPE_E` |
| `Norm_EMP_REC_TYPE_E` | TRANSFORMATION | `Norm_EMP_REC_TYPE_E` |
| `lkp_PSEUDSSN_TBL` | TRANSFORMATION | `lkp_PSEUDSSN_TBL` |
| `exp_STAGE` | TRANSFORMATION | `exp_STAGE` |
| `exp_CHECK_ERRORS` | TRANSFORMATION | `exp_CHECK_ERRORS` |
| `rtr_GOOD_BAD_RECORDS` | TRANSFORMATION | `rtr_GOOD_BAD_RECORDS` |
| `exp_FINAL_ERRORS` | TRANSFORMATION | `exp_FINAL_ERRORS` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `Norm_EMP_REC_TYPE_R` | Normalizer |
| `fil_EMP_REC_TYPE_R_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_R` | Filter |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_R_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_R_TBL` |
| `EMP_REC_TYPE_R` | SOURCE | `EMP_REC_TYPE_R` |
| `Norm_EMP_REC_TYPE_R` | TRANSFORMATION | `Norm_EMP_REC_TYPE_R` |
| `fil_EMP_REC_TYPE_R_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_R_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_R` | TRANSFORMATION | `fil_EMP_REC_TYPE_R` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `fil_EMP_REC_TYPE_U_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_U` | Filter |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |
| `Norm_EMP_REC_TYPE_U` | Normalizer |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_U_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_U_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `fil_EMP_REC_TYPE_U_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_U_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_U` | TRANSFORMATION | `fil_EMP_REC_TYPE_U` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `EMP_REC_TYPE_U` | SOURCE | `EMP_REC_TYPE_U` |
| `Norm_EMP_REC_TYPE_U` | TRANSFORMATION | `Norm_EMP_REC_TYPE_U` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `Norm_EMP_REC_TYPE_L` | Normalizer |
| `fil_EMP_REC_TYPE_L_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_L` | Filter |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_L_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_L_TBL` |
| `EMP_REC_TYPE_L` | SOURCE | `EMP_REC_TYPE_L` |
| `Norm_EMP_REC_TYPE_L` | TRANSFORMATION | `Norm_EMP_REC_TYPE_L` |
| `fil_EMP_REC_TYPE_L_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_L_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_L` | TRANSFORMATION | `fil_EMP_REC_TYPE_L` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_EMP_REC_TYPE_6` | Filter |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |
| `Norm_EMP_REC_TYPE_6` | Normalizer |
| `fil_EMP_REC_TYPE_6_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_6_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_6_TBL` |
| `fil_EMP_REC_TYPE_6` | TRANSFORMATION | `fil_EMP_REC_TYPE_6` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `EMP_REC_TYPE_6` | SOURCE | `EMP_REC_TYPE_6` |
| `Norm_EMP_REC_TYPE_6` | TRANSFORMATION | `Norm_EMP_REC_TYPE_6` |
| `fil_EMP_REC_TYPE_6_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_6_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `Norm_EMP_REC_TYPE_M` | Normalizer |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `fil_EMP_REC_TYPE_M_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `exp_Final` | Expression |
| `fil_EMP_REC_TYPE_M` | Filter |
| `jnr_LES_NUMBER` | Joiner |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_M_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_M_TBL` |
| `Norm_EMP_REC_TYPE_M` | TRANSFORMATION | `Norm_EMP_REC_TYPE_M` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `fil_EMP_REC_TYPE_M_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_M_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `fil_EMP_REC_TYPE_M` | TRANSFORMATION | `fil_EMP_REC_TYPE_M` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `EMP_REC_TYPE_M` | SOURCE | `EMP_REC_TYPE_M` |

</details>

<details><summary><code>m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `Norm_EMP_REC_TYPE_C` | Normalizer |
| `fil_EMP_REC_TYPE_C_EMP_DETAIL` | Filter |
| `exp_Convert` | Expression |
| `fil_EMP_REC_TYPE_C` | Filter |
| `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| `jnr_LES_NUMBER` | Joiner |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `LES_EMP_DETAIL_RECTYPE_C_TBL` | TARGET | `LES_EMP_DETAIL_RECTYPE_C_TBL` |
| `EMP_REC_TYPE_C` | SOURCE | `EMP_REC_TYPE_C` |
| `Norm_EMP_REC_TYPE_C` | TRANSFORMATION | `Norm_EMP_REC_TYPE_C` |
| `fil_EMP_REC_TYPE_C_EMP_DETAIL` | TRANSFORMATION | `fil_EMP_REC_TYPE_C_EMP_DETAIL` |
| `exp_Convert` | TRANSFORMATION | `exp_Convert` |
| `fil_EMP_REC_TYPE_C` | TRANSFORMATION | `fil_EMP_REC_TYPE_C` |
| `LES_EMP_DETAIL_TBL` | SOURCE | `LES_EMP_DETAIL_TBL` |
| `SQ_LES_EMP_DETAIL_TBL` | TRANSFORMATION | `SQ_LES_EMP_DETAIL_TBL` |
| `jnr_LES_NUMBER` | TRANSFORMATION | `jnr_LES_NUMBER` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

### Pay_Calendar

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_Pay_Calendar_Verify_Pay_Calendar` | 4 | 14 | 6 |
| `m_Pay_Calendar_Set_Pay_Calendar` | 11 | 41 | 14 |
| `m_Pay_Calendar_Build_Message` | 3 | 18 | 5 |
| `m_Pay_Calendar_Reset_Pay_Calendar` | 3 | 17 | 5 |

<details><summary><code>m_Pay_Calendar_Verify_Pay_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `exp_Check_Current_Flag` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PAY_PERIOD_VERIFY_FILE` | TARGET | `PAY_PERIOD_VERIFY_FILE` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `exp_Check_Current_Flag` | TRANSFORMATION | `exp_Check_Current_Flag` |

</details>

<details><summary><code>m_Pay_Calendar_Set_Pay_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `rtr_Parameter_Non_Parameter` | Router |
| `exp_Set_Date` | Expression |
| `exp_Set_Current_Pay_Period_Non_Param` | Expression |
| `lkp_Existing_Pay_Period` | Lookup Procedure |
| `exp_Determine_Parameters_Exist` | Expression |
| `lkp_New_Current_Pay_Period` | Lookup Procedure |
| `upd_Set_Current_PP_Non_Param` | Update Strategy |
| `upd_Set_Current_PP_Param` | Update Strategy |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |
| `exp_Set_Current_Pay_Period_Param` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PAY_PERIOD_PARAM` | TARGET | `PAY_PERIOD` |
| `PAY_PERIOD` | TARGET | `PAY_PERIOD` |
| `rtr_Parameter_Non_Parameter` | TRANSFORMATION | `rtr_Parameter_Non_Parameter` |
| `exp_Set_Date` | TRANSFORMATION | `exp_Set_Date` |
| `exp_Set_Current_Pay_Period_Non_Param` | TRANSFORMATION | `exp_Set_Current_Pay_Period_Non_Param` |
| `lkp_Existing_Pay_Period` | TRANSFORMATION | `lkp_Existing_Pay_Period` |
| `exp_Determine_Parameters_Exist` | TRANSFORMATION | `exp_Determine_Parameters_Exist` |
| `lkp_New_Current_Pay_Period` | TRANSFORMATION | `lkp_New_Current_Pay_Period` |
| `upd_Set_Current_PP_Non_Param` | TRANSFORMATION | `upd_Set_Current_PP_Non_Param` |
| `upd_Set_Current_PP_Param` | TRANSFORMATION | `upd_Set_Current_PP_Param` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Set_Current_Pay_Period_Param` | TRANSFORMATION | `exp_Set_Current_Pay_Period_Param` |

</details>

<details><summary><code>m_Pay_Calendar_Build_Message</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Final` | Expression |
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Initial` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PAY_PERIOD_MESSAGE_FILE` | TARGET | `PAY_PERIOD_MESSAGE_FILE` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |

</details>

<details><summary><code>m_Pay_Calendar_Reset_Pay_Calendar</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD_RESET` | Source Qualifier |
| `exp_Initial` | Expression |
| `upd_Reset_Current_PP` | Update Strategy |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `RESET_PAY_PERIOD` | TARGET | `PAY_PERIOD` |
| `PAY_PERIOD1` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD_RESET` | TRANSFORMATION | `SQ_PAY_PERIOD_RESET` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `upd_Reset_Current_PP` | TRANSFORMATION | `upd_Reset_Current_PP` |

</details>

### Pseudossn

| Mapping Name | Transformations | Connectors | Instances |
|---|---:|---:|---:|
| `m_Pseudossn_Load_Pseudossn_From_SDA_Tbl` | 8 | 505 | 10 |
| `m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl` | 5 | 318 | 7 |
| `m_Pseudossn_Update_Timekeeper_Number` | 6 | 87 | 8 |
| `m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA` | 7 | 86 | 9 |
| `m_Pseudossn_Current_Pay_Period` | 3 | 13 | 5 |
| `m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1` | 2 | 189 | 4 |
| `m_Pseudossn_Load_Pseudossn_Tbl` | 14 | 591 | 17 |
| `m_Pseudossn_Verify_Record_Count` | 9 | 167 | 12 |
| `m_Pseudossn_Counters` | 13 | 110 | 16 |
| `m_Pseudossn_Verify_Header_Date_Current_Pay_Period` | 7 | 85 | 9 |

<details><summary><code>m_Pseudossn_Load_Pseudossn_From_SDA_Tbl</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `exp_Final` | Expression |
| `fil_Detail_Records` | Filter |
| `exp_Determine_Record_Type` | Expression |
| `exp_Conversions` | Expression |
| `srt_PSEUDOSSN_EFF_DT` | Sorter |
| `exp_Determine_Errors` | Expression |
| `SQ_PSEUDOSSN_FILE_TK_NUM` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PSEUDOSSN_FROM_SDA_TBL` | TARGET | `PSEUDOSSN_FROM_SDA_TBL` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `fil_Detail_Records` | TRANSFORMATION | `fil_Detail_Records` |
| `exp_Determine_Record_Type` | TRANSFORMATION | `exp_Determine_Record_Type` |
| `exp_Conversions` | TRANSFORMATION | `exp_Conversions` |
| `srt_PSEUDOSSN_EFF_DT` | TRANSFORMATION | `srt_PSEUDOSSN_EFF_DT` |
| `exp_Determine_Errors` | TRANSFORMATION | `exp_Determine_Errors` |
| `PSEUDOSSN_FILE_TK_NUM` | SOURCE | `PSEUDOSSN_FILE_TK_NUM` |
| `SQ_PSEUDOSSN_FILE_TK_NUM` | TRANSFORMATION | `SQ_PSEUDOSSN_FILE_TK_NUM` |

</details>

<details><summary><code>m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PSEUDOSSN_FROM_SDA_TBL` | Source Qualifier |
| `exp_Initial` | Expression |
| `lkp_PSEUDOSSN_TBL` | Lookup Procedure |
| `exp_Determine_Inserts` | Expression |
| `fil_Inserts` | Filter |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PSEUDOSSN_TBL` | TARGET | `PSEUDOSSN_TBL` |
| `PSEUDOSSN_FROM_SDA_TBL` | SOURCE | `PSEUDOSSN_FROM_SDA_TBL` |
| `SQ_PSEUDOSSN_FROM_SDA_TBL` | TRANSFORMATION | `SQ_PSEUDOSSN_FROM_SDA_TBL` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `lkp_PSEUDOSSN_TBL` | TRANSFORMATION | `lkp_PSEUDOSSN_TBL` |
| `exp_Determine_Inserts` | TRANSFORMATION | `exp_Determine_Inserts` |
| `fil_Inserts` | TRANSFORMATION | `fil_Inserts` |

</details>

<details><summary><code>m_Pseudossn_Update_Timekeeper_Number</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PSEUDOSSN_TBL` | Source Qualifier |
| `upd_Update_TK_NUM` | Update Strategy |
| `exp_Initial` | Expression |
| `exp_Determine_Updates` | Expression |
| `fil_Updates` | Filter |
| `lkp_PSEUDOSSN_FROM_SDA_TBL` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PSEUDOSSN_TBL` | TARGET | `PSEUDOSSN_TBL` |
| `PSEUDOSSN_TBL1` | SOURCE | `PSEUDOSSN_TBL` |
| `SQ_PSEUDOSSN_TBL` | TRANSFORMATION | `SQ_PSEUDOSSN_TBL` |
| `upd_Update_TK_NUM` | TRANSFORMATION | `upd_Update_TK_NUM` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Determine_Updates` | TRANSFORMATION | `exp_Determine_Updates` |
| `fil_Updates` | TRANSFORMATION | `fil_Updates` |
| `lkp_PSEUDOSSN_FROM_SDA_TBL` | TRANSFORMATION | `lkp_PSEUDOSSN_FROM_SDA_TBL` |

</details>

<details><summary><code>m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `lkp_Pay_Period_Header_Date` | Lookup Procedure |
| `exp_Initial` | Expression |
| `exp_Verify_Header_Date` | Expression |
| `fil_Header` | Filter |
| `exp_Final` | Expression |
| `SQ_PSEUDOSSN_FILE_TK_NUM` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PSEUDO_HDR_DATE_FILE` | TARGET | `PSEUDO_HDR_DATE_FILE` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `lkp_Pay_Period_Header_Date` | TRANSFORMATION | `lkp_Pay_Period_Header_Date` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `exp_Verify_Header_Date` | TRANSFORMATION | `exp_Verify_Header_Date` |
| `fil_Header` | TRANSFORMATION | `fil_Header` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `PSEUDOSSN_FILE_TK_NUM` | SOURCE | `PSEUDOSSN_FILE_TK_NUM` |
| `SQ_PSEUDOSSN_FILE_TK_NUM` | TRANSFORMATION | `SQ_PSEUDOSSN_FILE_TK_NUM` |

</details>

<details><summary><code>m_Pseudossn_Current_Pay_Period</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `SQ_PAY_PERIOD` | Source Qualifier |
| `exp_Build_Pay_Period` | Expression |
| `exp_Final` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PAY_PERIOD_DATE_FILE` | TARGET | `PAY_PERIOD_DATE_FILE` |
| `PAY_PERIOD` | SOURCE | `PAY_PERIOD` |
| `SQ_PAY_PERIOD` | TRANSFORMATION | `SQ_PAY_PERIOD` |
| `exp_Build_Pay_Period` | TRANSFORMATION | `exp_Build_Pay_Period` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |

</details>

<details><summary><code>m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_PSEUDOSSN_TBL` | Expression |
| `SQ_PSEUDOSSN_TBL` | Source Qualifier |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `HI_ARCH_PSEUDOSSN_TBL` | TARGET | `HI_ARCH_PSEUDOSSN_TBL` |
| `exp_PSEUDOSSN_TBL` | TRANSFORMATION | `exp_PSEUDOSSN_TBL` |
| `PSEUDOSSN_TBL` | SOURCE | `PSEUDOSSN_TBL` |
| `SQ_PSEUDOSSN_TBL` | TRANSFORMATION | `SQ_PSEUDOSSN_TBL` |

</details>

<details><summary><code>m_Pseudossn_Load_Pseudossn_Tbl</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_Current_Pay_Period1` | Lookup Procedure |
| `exp_Determine_Record_Type` | Expression |
| `SQ_PSEUDOSSN_FILE` | Source Qualifier |
| `exp_Conversions` | Expression |
| `srt_PSEUDOSSN_EFF_DT` | Sorter |
| `exp_Determine_Errors` | Expression |
| `rtr_Good_Bad_Records` | Router |
| `fil_Error_Message` | Filter |
| `nrm_Errors` | Normalizer |
| `exp_Final_Errors` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `exp_Final` | Expression |
| `fil_Detail_Records` | Filter |
| `exp_Pay_Period` | Expression |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PSEUDOSSN_TBL` | TARGET | `PSEUDOSSN_TBL` |
| `ERROR_TBL` | TARGET | `ERROR_TBL` |
| `lkp_Current_Pay_Period1` | TRANSFORMATION | `lkp_Current_Pay_Period1` |
| `exp_Determine_Record_Type` | TRANSFORMATION | `exp_Determine_Record_Type` |
| `PSEUDOSSN_FILE` | SOURCE | `PSEUDOSSN_FILE` |
| `SQ_PSEUDOSSN_FILE` | TRANSFORMATION | `SQ_PSEUDOSSN_FILE` |
| `exp_Conversions` | TRANSFORMATION | `exp_Conversions` |
| `srt_PSEUDOSSN_EFF_DT` | TRANSFORMATION | `srt_PSEUDOSSN_EFF_DT` |
| `exp_Determine_Errors` | TRANSFORMATION | `exp_Determine_Errors` |
| `rtr_Good_Bad_Records` | TRANSFORMATION | `rtr_Good_Bad_Records` |
| `fil_Error_Message` | TRANSFORMATION | `fil_Error_Message` |
| `nrm_Errors` | TRANSFORMATION | `nrm_Errors` |
| `exp_Final_Errors` | TRANSFORMATION | `exp_Final_Errors` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `fil_Detail_Records` | TRANSFORMATION | `fil_Detail_Records` |
| `exp_Pay_Period` | TRANSFORMATION | `exp_Pay_Period` |

</details>

<details><summary><code>m_Pseudossn_Verify_Record_Count</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `fil_DETAIL` | Filter |
| `exp_DETERMINE_DETAIL` | Expression |
| `SQ_PSEUDOSSN_FILE` | Source Qualifier |
| `exp_DETERMINE_HEADER_TRAILER` | Expression |
| `SQ_PSEUDOSSN_FILE1` | Source Qualifier |
| `fil_TRAILER` | Filter |
| `exp_COMPARE` | Expression |
| `jnr_RECORD_CONSTANTS` | Joiner |
| `agg_ALL_RECORDS` | Aggregator |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PSEUDO_RECORD_COUNT` | TARGET | `PSEUDO_RECORD_COUNT` |
| `fil_DETAIL` | TRANSFORMATION | `fil_DETAIL` |
| `exp_DETERMINE_DETAIL` | TRANSFORMATION | `exp_DETERMINE_DETAIL` |
| `PSEUDOSSN_FILE` | SOURCE | `PSEUDOSSN_FILE` |
| `SQ_PSEUDOSSN_FILE` | TRANSFORMATION | `SQ_PSEUDOSSN_FILE` |
| `exp_DETERMINE_HEADER_TRAILER` | TRANSFORMATION | `exp_DETERMINE_HEADER_TRAILER` |
| `PSEUDOSSN_FILE1` | SOURCE | `PSEUDOSSN_FILE` |
| `SQ_PSEUDOSSN_FILE1` | TRANSFORMATION | `SQ_PSEUDOSSN_FILE1` |
| `fil_TRAILER` | TRANSFORMATION | `fil_TRAILER` |
| `exp_COMPARE` | TRANSFORMATION | `exp_COMPARE` |
| `jnr_RECORD_CONSTANTS` | TRANSFORMATION | `jnr_RECORD_CONSTANTS` |
| `agg_ALL_RECORDS` | TRANSFORMATION | `agg_ALL_RECORDS` |

</details>

<details><summary><code>m_Pseudossn_Counters</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `lkp_PSEUDOSSN_TBL_Pay_Period` | Lookup Procedure |
| `exp_Final_Message` | Expression |
| `exp_Build_Message` | Expression |
| `fil_Detail` | Filter |
| `exp_Determine_Detail` | Expression |
| `SQ_PSEUDOSSN_FILE` | Source Qualifier |
| `agg_ALL_RECORDS` | Aggregator |
| `exp_Detail_Count` | Expression |
| `lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE` | Lookup Procedure |
| `exp_Counters` | Expression |
| `nrm_Counters` | Normalizer |
| `exp_Final` | Expression |
| `lkp_Count_PSEUDOSSN_TBL` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `COUNTER_TBL` | TARGET | `COUNTER_TBL` |
| `PSEUDOSSN_MESSAGE_FILE` | TARGET | `PSEUDOSSN_MESSAGE_FILE` |
| `lkp_PSEUDOSSN_TBL_Pay_Period` | TRANSFORMATION | `lkp_PSEUDOSSN_TBL_Pay_Period` |
| `exp_Final_Message` | TRANSFORMATION | `exp_Final_Message` |
| `exp_Build_Message` | TRANSFORMATION | `exp_Build_Message` |
| `fil_Detail` | TRANSFORMATION | `fil_Detail` |
| `exp_Determine_Detail` | TRANSFORMATION | `exp_Determine_Detail` |
| `PSEUDOSSN_FILE` | SOURCE | `PSEUDOSSN_FILE` |
| `SQ_PSEUDOSSN_FILE` | TRANSFORMATION | `SQ_PSEUDOSSN_FILE` |
| `agg_ALL_RECORDS` | TRANSFORMATION | `agg_ALL_RECORDS` |
| `exp_Detail_Count` | TRANSFORMATION | `exp_Detail_Count` |
| `lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE` | TRANSFORMATION | `lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE` |
| `exp_Counters` | TRANSFORMATION | `exp_Counters` |
| `nrm_Counters` | TRANSFORMATION | `nrm_Counters` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Count_PSEUDOSSN_TBL` | TRANSFORMATION | `lkp_Count_PSEUDOSSN_TBL` |

</details>

<details><summary><code>m_Pseudossn_Verify_Header_Date_Current_Pay_Period</code> — transformation chain</summary>

| Transformation Name | Type |
|---|---|
| `exp_Initial` | Expression |
| `SQ_PSEUDOSSN_FILE` | Source Qualifier |
| `exp_Verify_Header_Date` | Expression |
| `fil_Header` | Filter |
| `exp_Final` | Expression |
| `lkp_Current_Pay_Period` | Lookup Procedure |
| `lkp_Pay_Period_Header_Date` | Lookup Procedure |

**Instances:**

| Instance Name | Type | Transformation Name |
|---|---|---|
| `PSEUDO_HDR_DATE_FILE` | TARGET | `PSEUDO_HDR_DATE_FILE` |
| `exp_Initial` | TRANSFORMATION | `exp_Initial` |
| `PSEUDOSSN_FILE` | SOURCE | `PSEUDOSSN_FILE` |
| `SQ_PSEUDOSSN_FILE` | TRANSFORMATION | `SQ_PSEUDOSSN_FILE` |
| `exp_Verify_Header_Date` | TRANSFORMATION | `exp_Verify_Header_Date` |
| `fil_Header` | TRANSFORMATION | `fil_Header` |
| `exp_Final` | TRANSFORMATION | `exp_Final` |
| `lkp_Current_Pay_Period` | TRANSFORMATION | `lkp_Current_Pay_Period` |
| `lkp_Pay_Period_Header_Date` | TRANSFORMATION | `lkp_Pay_Period_Header_Date` |

</details>

---

## SESSION Definitions

| XML Export | Session Name | Mapping Name |
|---|---|---|
| COMPTIME | `s_COMPTIME_Current_Pay_Period` | `m_COMPTIME_Current_Pay_Period` |
| COMPTIME | `s_COMPTIME_Build_Message_Counters` | `m_COMPTIME_Build_Message_Counters` |
| COMPTIME | `s_COMPTIME_Load_COMP_TIME_DAILY_TBL` | `m_COMPTIME_Load_COMP_TIME_DAILY_TBL` |
| CPM | `s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL` |
| CPM | `s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |
| CPM | `s_CPM_Load_FDR_CPM_NEWPAY_TBL` | `m_CPM_Load_FDR_CPM_NEWPAY_TBL` |
| CPM | `s_CPM_Send_Counts` | `m_Generic_Mapping` |
| CPM | `s_CPM_Load_CPM_NEWPAY_TBL` | `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL` |
| CPM | `s_CPM_Load_CPM_PAD_Staging_Tables` | `m_CPM_Load_CPM_PAD_Staging_Tables` |
| CPM | `s_CPM_Load_CPM_PMR_Staging_Tables` | `m_CPM_Load_CPM_PMR_Staging_Tables` |
| CPM | `s_CPM_Build_Message_Counters` | `m_CPM_Build_Message_Counters` |
| CPM | `s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` |
| CPM | `s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| CPM | `s_CPM_Load_CPM_MER_Staging_Tables` | `m_CPM_Load_CPM_MER_Staging_Tables` |
| CPM | `s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` |
| CPM | `s_CPM_Load_CPM_YTD_Staging_Tables` | `m_CPM_Load_CPM_YTD_Staging_Tables` |
| CPM | `s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` |
| CPM | `s_CPM_Current_Pay_Period` | `m_CPM_Current_Pay_Period` |
| CPM_AFPS | `s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts` | `m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts` |
| CPM_AFPS | `s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend` | `m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend` |
| CPM_AFPS | `s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL` | `m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL` |
| CPM_AFPS | `s_CPM_AFPS_0800_Build_Message_Counters` | `m_CPM_AFPS_0800_Build_Message_Counters` |
| CPM_AFPS | `s_CPM_AFPS_0900_Build_Message` | `m_CPM_AFPS_0900_Build_Message` |
| CPM_AFPS | `s_CPM_AFPS_0820_Build_Message_Totals` | `m_CPM_AFPS_0820_Build_Message_Totals` |
| CPM_AFPS | `s_CPM_AFPS_0010_Set_CPM_Calendar` | `m_CPM_AFPS_0010_Set_CPM_Calendar` |
| CPM_AFPS | `s_CPM_AFPS_1000_Send_Report` | `m_CPM_AFPS_1000_Send_Report` |
| CPM_AFPS | `s_CPM_AFPS_0100_Data_Seperate` | `m_CPM_AFPS_0100_Data_Seperate` |
| CPM_AFPS | `s_CPM_AFPS_0760_Concatenate_Crossfoot_Files` | `m_CPM_AFPS_0760_Concatenate_Crossfoot_Files` |
| CPM_AFPS | `s_CPM_AFPS_0025_Set_Pay_Calendar` | `m_CPM_AFPS_0025_Set_Pay_Calendar` |
| CPM_AFPS | `s_CPM_AFPS_0860_Concatenate_Counts_Files` | `m_CPM_AFPS_0860_Concatenate_Counts_Files` |
| CPM_AFPS | `s_CPM_AFPS_0500_Crossfoot_Message_Header` | `m_CPM_AFPS_0500_Crossfoot_Message_Header` |
| CPM_AFPS | `s_CPM_AFPS_0300_Gross_Exp_Report` | `m_CPM_AFPS_0300_Gross_Exp_Report` |
| CPM_AFPS | `s_CPM_AFPS_0600_Crossfoot_Message_Details` | `m_CPM_AFPS_0600_Crossfoot_Message_Details` |
| CPM_AFPS | `s_CPM_AFPS_0400_Crossfoot_Errors` | `m_CPM_AFPS_0400_Crossfoot_Errors` |
| CPM_AFPS | `s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT` | `m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT` |
| CPM_CDC | `s_CPM_CDC_Set_CPM_Calendar` | `m_CPM_CDC_Set_CPM_Calendar` |
| CPM_CDC | `s_CPM_CDC_Load_CPM_CDC_Data_File` | `m_CPM_CDC_Load_CPM_CDC_Data_File` |
| CPM_CDC | `s_CPM_CDC_Set_Pay_Calendar` | `m_CPM_CDC_Set_Pay_Calendar` |
| CPM_CDC | `s_CPM_CDC_Concatenate_Files` | `m_CPM_CDC_Concatenate_Files` |
| CPM_CDC | `s_CPM_CDC_Load_CPM_CDC_Header_File` | `m_CPM_CDC_Load_CPM_CDC_Header_File` |
| CPM_CDC | `s_CPM_CDC_Build_Message` | `m_CPM_CDC_Build_Message` |
| CPM_NIH | `s_CPM_NIH_Set_Pay_Calendar` | `m_CPM_NIH_Set_Pay_Calendar` |
| CPM_NIH | `s_CPM_NIH_Concatenate_Files` | `m_CPM_NIH_Concatenate_Files` |
| CPM_NIH | `s_CPM_NIH_Set_CPM_Calendar` | `m_CPM_NIH_Set_CPM_Calendar` |
| CPM_NIH | `s_CPM_NIH_Load_CPM_NIH_Data_File` | `m_CPM_NIH_Load_CPM_NIH_Data_File` |
| CPM_NIH | `s_CPM_NIH_Load_CPM_NIH_Header_File` | `m_CPM_NIH_Load_CPM_NIH_Header_File` |
| CPM_NIH | `s_CPM_NIH_Build_Message` | `m_CPM_NIH_Build_Message` |
| CPM_OIG | `s_CPM_OIG_Load_CPM_OIG_File` | `m_CPM_OIG_Load_CPM_OIG_File` |
| CPM_OIG | `s_CPM_OIG_Set_CPM_Calendar` | `m_CPM_OIG_Set_CPM_Calendar` |
| CPM_OIG | `s_CPM_OIG_Set_Pay_Calendar` | `m_CPM_OIG_Set_Pay_Calendar` |
| CPM_OIG | `s_CPM_OIG_Build_Message` | `m_CPM_OIG_Build_Message` |
| EHRP2BIIS_UPDATE | `s_m_EHRP2BIIS_UPDATE` | `m_EHRP2BIIS_UPDATE` |
| FDA_Leave | `s_0025_PM_FDA_Set_Pay_Calendar` | `m_0025_PM_FDA_Set_Pay_Calendar` |
| FDA_Leave | `s_0100_PM_FDA_Load_TATRAN_To_DB` | `m_0100_PM_FDA_Load_TATRAN_To_DB` |
| FDA_Leave | `s_0010_PM_FDA_Verify_File` | `m_0010_PM_FDA_Verify_File` |
| FDA_Leave | `s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA` | `m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA` |
| FDA_Leave | `s_0500_PM_FDA_IO_Counter` | `m_0500_PM_FDA_IO_Counter` |
| FDA_Leave | `s_0200_PM_FDA_Create_200_Rows` | `m_0200_PM_FDA_Create_Insert_200_Rows` |
| FDA_Leave | `s_1100_PM_FDA_Send_Email` | `m_1100_PM_FDA_Send_Email` |
| FDA_Leave | `s_0020_PM_FDA_Set_CPM_Calendar` | `m_0020_PM_FDA_Set_CPM_Calendar` |
| FDA_Leave | `s_0300_PM_FDA_Create_Output_File` | `m_0300_PM_FDA_Create_Output_File` |
| FDA_Leave | `s_0150_PM_FDA_Error_Counter` | `m_0150_PM_FDA_Error_Counter` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_TBL` | `m_LES_Load_LES_EMP_DETAIL_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL` |
| LES | `s_LES_Load_LES_HEADER_TBL` | `m_LES_Load_LES_HEADER_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL` |
| LES | `s_LES_Load_LES_PRIMARY_DATA_TBL` | `m_LES_Load_LES_PRIMARY_DATA_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL` |
| LES | `s_LES_Current_Pay_Period` | `m_LES_Current_Pay_Period` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL` | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL` |
| LES | `s_LES_Build_Message_Counters` | `m_LES_Build_Message_Counters` |
| LES | `s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL` | `m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL` |
| LES | `s_LES_NIH_FILE` | `m_LES_NIH_FILE` |
| LES | `s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL` | `m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL` |
| LES | `s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL` | `m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL` |
| LES | `s_LES_Verify_Record_Count` | `m_LES_Verify_Record_Count` |
| LES | `s_LES_Verify_Header` | `m_LES_Verify_Header` |
| LES | `s_LESRPT_Load_LESR` | `m_LESRPT_Load_LESR` |
| LES | `s_LESRPT_Load_LESC` | `m_LESRPT_Load_LESC` |
| LES | `s_LESRPT_Load_LESU` | `m_LESRPT_Load_LESU` |
| LES | `s_LESRPT_Load_LESS` | `m_LESRPT_Load_LESS` |
| LES | `s_LESRPT_Load_LESD` | `m_LESRPT_Load_LESD` |
| LES | `s_LESRPT_Load_LESM` | `m_LESRPT_Load_LESM` |
| LES | `s_LESRPT_Load_LEST` | `m_LESRPT_Load_LEST` |
| LES | `s_LESRPT_Load_LESL` | `m_LESRPT_Load_LESL` |
| Pay_Calendar | `s_Pay_Calendar_Reset_Pay_Calendar` | `m_Pay_Calendar_Reset_Pay_Calendar` |
| Pay_Calendar | `s_Pay_Calendar_Build_Message` | `m_Pay_Calendar_Build_Message` |
| Pay_Calendar | `s_Pay_Calendar_Set_Pay_Calendar` | `m_Pay_Calendar_Set_Pay_Calendar` |
| Pay_Calendar | `s_Pay_Calendar_Verify_Pay_Calendar` | `m_Pay_Calendar_Verify_Pay_Calendar` |
| Pseudossn | `s_Pseudossn_Verify_Header_Date_Current_Pay_Period` | `m_Pseudossn_Verify_Header_Date_Current_Pay_Period` |
| Pseudossn | `s_Pseudossn_Counters` | `m_Pseudossn_Counters` |
| Pseudossn | `s_Pseudossn_Verify_Record_Count` | `m_Pseudossn_Verify_Record_Count` |
| Pseudossn | `s_Pseudossn_Load_Pseudossn_Tbl` | `m_Pseudossn_Load_Pseudossn_Tbl` |
| Pseudossn | `s_Pseudossn_Load_Archive_Pseudossn_Tbl` | `m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1` |
| Pseudossn | `s_Pseudossn_Current_Pay_Period` | `m_Pseudossn_Current_Pay_Period` |
| Pseudossn | `s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA` | `m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA` |
| Pseudossn | `s_Pseudossn_Update_Timekeeper_Number` | `m_Pseudossn_Update_Timekeeper_Number` |
| Pseudossn | `s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl` | `m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl` |
| Pseudossn | `s_Pseudossn_Load_Pseudossn_From_SDA_Tbl` | `m_Pseudossn_Load_Pseudossn_From_SDA_Tbl` |

---

## WORKFLOW Definitions

### `wf_COMPTIME` (COMPTIME)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_COMPTIME_Current_Pay_Period` | Session |
| `s_COMPTIME_Build_Message_Counters` | Session |
| `s_COMPTIME_Load_COMP_TIME_DAILY_TBL` | Session |
| `Start` | Start |
| `email_COMPTIME_Complete` | Email |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `Start` | `s_COMPTIME_Current_Pay_Period` | — |
| `s_COMPTIME_Load_COMP_TIME_DAILY_TBL` | `s_COMPTIME_Build_Message_Counters` | $s_COMPTIME_Load_COMP_TIME_DAILY_TBL.Status  = Succeeded |
| `s_COMPTIME_Current_Pay_Period` | `s_COMPTIME_Load_COMP_TIME_DAILY_TBL` | $s_COMPTIME_Current_Pay_Period.Status = Succeeded |
| `s_COMPTIME_Build_Message_Counters` | `email_COMPTIME_Complete` | $s_COMPTIME_Build_Message_Counters.Status = Succeeded |

### `wf_CPM` (CPM)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL` | Session |
| `s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Session |
| `s_CPM_Load_FDR_CPM_NEWPAY_TBL` | Session |
| `s_CPM_Send_Counts` | Session |
| `s_CPM_Load_CPM_NEWPAY_TBL` | Session |
| `s_CPM_Load_CPM_PAD_Staging_Tables` | Session |
| `s_CPM_Load_CPM_PMR_Staging_Tables` | Session |
| `s_CPM_Build_Message_Counters` | Session |
| `s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | Session |
| `s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Session |
| `s_CPM_Load_CPM_MER_Staging_Tables` | Session |
| `s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | Session |
| `s_CPM_Load_CPM_YTD_Staging_Tables` | Session |
| `s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | Session |
| `Start` | Start |
| `s_CPM_Current_Pay_Period` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL` | $s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL.Status = Succeeded |
| `s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | $s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL.Status = Succeeded |
| `s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL` | `s_CPM_Load_FDR_CPM_NEWPAY_TBL` | $s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL.Status = Succeeded |
| `s_CPM_Build_Message_Counters` | `s_CPM_Send_Counts` | $s_CPM_Build_Message_Counters.Status = Succeeded |
| `s_CPM_Load_FDR_CPM_NEWPAY_TBL` | `s_CPM_Load_CPM_NEWPAY_TBL` | $s_CPM_Load_FDR_CPM_NEWPAY_TBL.Status = Succeeded |
| `s_CPM_Load_CPM_MER_Staging_Tables` | `s_CPM_Load_CPM_PAD_Staging_Tables` | $s_CPM_Load_CPM_MER_Staging_Tables.Status = Succeeded |
| `s_CPM_Load_CPM_YTD_Staging_Tables` | `s_CPM_Load_CPM_PMR_Staging_Tables` | $s_CPM_Load_CPM_YTD_Staging_Tables.Status = Succeeded |
| `s_CPM_Load_CPM_NEWPAY_TBL` | `s_CPM_Build_Message_Counters` | $s_CPM_Load_CPM_NEWPAY_TBL.Status = Succeeded |
| `s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | `s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | $s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL.Status = Succeeded |
| `s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | `s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | $s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL.Status = Succeeded |
| `s_CPM_Current_Pay_Period` | `s_CPM_Load_CPM_MER_Staging_Tables` | $s_CPM_Current_Pay_Period.Status = Succeeded |
| `s_CPM_Load_CPM_PMR_Staging_Tables` | `s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | $s_CPM_Load_CPM_PMR_Staging_Tables.Status = Succeeded |
| `s_CPM_Load_CPM_PAD_Staging_Tables` | `s_CPM_Load_CPM_YTD_Staging_Tables` | $s_CPM_Load_CPM_PAD_Staging_Tables.Status = Succeeded |
| `s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | `s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | $s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL.Status = Succeeded |
| `Start` | `s_CPM_Current_Pay_Period` | — |

### `wf_CPM_AFPS` (CPM_AFPS)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts` | Session |
| `s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend` | Session |
| `s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL` | Session |
| `s_CPM_AFPS_0800_Build_Message_Counters` | Session |
| `s_CPM_AFPS_0900_Build_Message` | Session |
| `s_CPM_AFPS_0820_Build_Message_Totals` | Session |
| `s_CPM_AFPS_0010_Set_CPM_Calendar` | Session |
| `s_CPM_AFPS_1000_Send_Report` | Session |
| `s_CPM_AFPS_0100_Data_Seperate` | Session |
| `s_CPM_AFPS_0760_Concatenate_Crossfoot_Files` | Session |
| `s_CPM_AFPS_0025_Set_Pay_Calendar` | Session |
| `s_CPM_AFPS_0860_Concatenate_Counts_Files` | Session |
| `s_CPM_AFPS_0500_Crossfoot_Message_Header` | Session |
| `Start` | Start |
| `s_CPM_AFPS_0300_Gross_Exp_Report` | Session |
| `s_CPM_AFPS_0600_Crossfoot_Message_Details` | Session |
| `s_CPM_AFPS_0400_Crossfoot_Errors` | Session |
| `s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `s_CPM_AFPS_0600_Crossfoot_Message_Details` | `s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts` | $s_CPM_AFPS_0600_Crossfoot_Message_Details.Status = Succeeded |
| `s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts` | `s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend` | $s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts.Status = Succeeded |
| `s_CPM_AFPS_0025_Set_Pay_Calendar` | `s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL` | $s_CPM_AFPS_0025_Set_Pay_Calendar.Status = Succeeded |
| `s_CPM_AFPS_0760_Concatenate_Crossfoot_Files` | `s_CPM_AFPS_0800_Build_Message_Counters` | $s_CPM_AFPS_0760_Concatenate_Crossfoot_Files.Status = Succeeded |
| `s_CPM_AFPS_0860_Concatenate_Counts_Files` | `s_CPM_AFPS_0900_Build_Message` | $s_CPM_AFPS_0860_Concatenate_Counts_Files.Status = Succeeded |
| `s_CPM_AFPS_0800_Build_Message_Counters` | `s_CPM_AFPS_0820_Build_Message_Totals` | $s_CPM_AFPS_0800_Build_Message_Counters.Status = Succeeded |
| `Start` | `s_CPM_AFPS_0010_Set_CPM_Calendar` | — |
| `s_CPM_AFPS_0900_Build_Message` | `s_CPM_AFPS_1000_Send_Report` | $s_CPM_AFPS_0900_Build_Message.Status = Succeeded |
| `s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL` | `s_CPM_AFPS_0100_Data_Seperate` | $s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL.Status = Succeeded |
| `s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend` | `s_CPM_AFPS_0760_Concatenate_Crossfoot_Files` | $s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend.Status = Succeeded |
| `s_CPM_AFPS_0010_Set_CPM_Calendar` | `s_CPM_AFPS_0025_Set_Pay_Calendar` | $s_CPM_AFPS_0010_Set_CPM_Calendar.Status = Succeeded |
| `s_CPM_AFPS_0820_Build_Message_Totals` | `s_CPM_AFPS_0860_Concatenate_Counts_Files` | $s_CPM_AFPS_0820_Build_Message_Totals.Status = Succeeded |
| `s_CPM_AFPS_0400_Crossfoot_Errors` | `s_CPM_AFPS_0500_Crossfoot_Message_Header` | $s_CPM_AFPS_0400_Crossfoot_Errors.Status = Succeeded |
| `s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT` | `s_CPM_AFPS_0300_Gross_Exp_Report` | $s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT.Status = Succeeded |
| `s_CPM_AFPS_0500_Crossfoot_Message_Header` | `s_CPM_AFPS_0600_Crossfoot_Message_Details` | $s_CPM_AFPS_0500_Crossfoot_Message_Header.Status = Succeeded |
| `s_CPM_AFPS_0300_Gross_Exp_Report` | `s_CPM_AFPS_0400_Crossfoot_Errors` | $s_CPM_AFPS_0300_Gross_Exp_Report.Status = Succeeded |
| `s_CPM_AFPS_0100_Data_Seperate` | `s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT` | $s_CPM_AFPS_0100_Data_Seperate.Status = Succeeded |

### `wf_CPM_CDC` (CPM_CDC)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_CPM_CDC_Set_CPM_Calendar` | Session |
| `s_CPM_CDC_Load_CPM_CDC_Data_File` | Session |
| `s_CPM_CDC_Set_Pay_Calendar` | Session |
| `s_CPM_CDC_Concatenate_Files` | Session |
| `email_CPM_CDC` | Email |
| `Start` | Start |
| `s_CPM_CDC_Load_CPM_CDC_Header_File` | Session |
| `s_CPM_CDC_Build_Message` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `Start` | `s_CPM_CDC_Set_CPM_Calendar` | — |
| `s_CPM_CDC_Load_CPM_CDC_Header_File` | `s_CPM_CDC_Load_CPM_CDC_Data_File` | $s_CPM_CDC_Load_CPM_CDC_Header_File.Status = Succeeded |
| `s_CPM_CDC_Set_CPM_Calendar` | `s_CPM_CDC_Set_Pay_Calendar` | $s_CPM_CDC_Set_CPM_Calendar.Status = Succeeded |
| `s_CPM_CDC_Load_CPM_CDC_Data_File` | `s_CPM_CDC_Concatenate_Files` | $s_CPM_CDC_Load_CPM_CDC_Data_File.Status = Succeeded |
| `s_CPM_CDC_Build_Message` | `email_CPM_CDC` | $s_CPM_CDC_Build_Message.Status = Succeeded |
| `s_CPM_CDC_Set_Pay_Calendar` | `s_CPM_CDC_Load_CPM_CDC_Header_File` | $s_CPM_CDC_Set_Pay_Calendar.Status = Succeeded |
| `s_CPM_CDC_Concatenate_Files` | `s_CPM_CDC_Build_Message` | $s_CPM_CDC_Concatenate_Files.Status = Succeeded |

### `wf_CPM_NIH` (CPM_NIH)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_CPM_NIH_Set_Pay_Calendar` | Session |
| `email_CPM_NIH` | Email |
| `s_CPM_NIH_Concatenate_Files` | Session |
| `s_CPM_NIH_Set_CPM_Calendar` | Session |
| `Start` | Start |
| `s_CPM_NIH_Load_CPM_NIH_Data_File` | Session |
| `s_CPM_NIH_Load_CPM_NIH_Header_File` | Session |
| `s_CPM_NIH_Build_Message` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `s_CPM_NIH_Set_CPM_Calendar` | `s_CPM_NIH_Set_Pay_Calendar` | $s_CPM_NIH_Set_CPM_Calendar.Status = Succeeded |
| `s_CPM_NIH_Build_Message` | `email_CPM_NIH` | $s_CPM_NIH_Build_Message.Status = Succeeded |
| `s_CPM_NIH_Load_CPM_NIH_Data_File` | `s_CPM_NIH_Concatenate_Files` | $s_CPM_NIH_Load_CPM_NIH_Data_File.Status = Succeeded |
| `Start` | `s_CPM_NIH_Set_CPM_Calendar` | — |
| `s_CPM_NIH_Load_CPM_NIH_Header_File` | `s_CPM_NIH_Load_CPM_NIH_Data_File` | $s_CPM_NIH_Load_CPM_NIH_Header_File.Status = Succeeded |
| `s_CPM_NIH_Set_Pay_Calendar` | `s_CPM_NIH_Load_CPM_NIH_Header_File` | $s_CPM_NIH_Set_Pay_Calendar.Status = Succeeded |
| `s_CPM_NIH_Concatenate_Files` | `s_CPM_NIH_Build_Message` | $s_CPM_NIH_Concatenate_Files.Status = Succeeded |

### `wf_CPM_OIG` (CPM_OIG)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_CPM_OIG_Load_CPM_OIG_File` | Session |
| `email_CPM_OIG` | Email |
| `Start` | Start |
| `s_CPM_OIG_Set_CPM_Calendar` | Session |
| `s_CPM_OIG_Set_Pay_Calendar` | Session |
| `s_CPM_OIG_Build_Message` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `s_CPM_OIG_Set_Pay_Calendar` | `s_CPM_OIG_Load_CPM_OIG_File` | $s_CPM_OIG_Set_Pay_Calendar.Status = Succeeded |
| `s_CPM_OIG_Build_Message` | `email_CPM_OIG` | $s_CPM_OIG_Build_Message.Status = Succeeded |
| `Start` | `s_CPM_OIG_Set_CPM_Calendar` | — |
| `s_CPM_OIG_Set_CPM_Calendar` | `s_CPM_OIG_Set_Pay_Calendar` | $s_CPM_OIG_Set_CPM_Calendar.Status = Succeeded |
| `s_CPM_OIG_Load_CPM_OIG_File` | `s_CPM_OIG_Build_Message` | $s_CPM_OIG_Load_CPM_OIG_File.Status = Succeeded |

### `wf_EHRP2BIIS_UPDATE` (EHRP2BIIS_UPDATE)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `Start` | Start |
| `s_m_EHRP2BIIS_UPDATE` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `Start` | `s_m_EHRP2BIIS_UPDATE` | — |

### `wf_FDA_Leave` (FDA_Leave)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_0025_PM_FDA_Set_Pay_Calendar` | Session |
| `s_0100_PM_FDA_Load_TATRAN_To_DB` | Session |
| `s_0010_PM_FDA_Verify_File` | Session |
| `s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA` | Session |
| `s_0500_PM_FDA_IO_Counter` | Session |
| `s_0200_PM_FDA_Create_200_Rows` | Session |
| `Start` | Start |
| `s_1100_PM_FDA_Send_Email` | Session |
| `s_0020_PM_FDA_Set_CPM_Calendar` | Session |
| `s_0300_PM_FDA_Create_Output_File` | Session |
| `s_0150_PM_FDA_Error_Counter` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `s_0020_PM_FDA_Set_CPM_Calendar` | `s_0025_PM_FDA_Set_Pay_Calendar` | $s_0020_PM_FDA_Set_CPM_Calendar.Status = Succeeded |
| `s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA` | `s_0100_PM_FDA_Load_TATRAN_To_DB` | $s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA.Status = Succeeded |
| `Start` | `s_0010_PM_FDA_Verify_File` | — |
| `s_0025_PM_FDA_Set_Pay_Calendar` | `s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA` | $s_0025_PM_FDA_Set_Pay_Calendar.Status = Succeeded |
| `s_0300_PM_FDA_Create_Output_File` | `s_0500_PM_FDA_IO_Counter` | $s_0300_PM_FDA_Create_Output_File.Status = Succeeded |
| `s_0150_PM_FDA_Error_Counter` | `s_0200_PM_FDA_Create_200_Rows` | $s_0150_PM_FDA_Error_Counter.Status = Succeeded |
| `s_0500_PM_FDA_IO_Counter` | `s_1100_PM_FDA_Send_Email` | $s_0500_PM_FDA_IO_Counter.Status = Succeeded |
| `s_0010_PM_FDA_Verify_File` | `s_0020_PM_FDA_Set_CPM_Calendar` | $s_0010_PM_FDA_Verify_File.Status = Succeeded |
| `s_0200_PM_FDA_Create_200_Rows` | `s_0300_PM_FDA_Create_Output_File` | $s_0200_PM_FDA_Create_200_Rows.Status = Succeeded |
| `s_0100_PM_FDA_Load_TATRAN_To_DB` | `s_0150_PM_FDA_Error_Counter` | $s_0100_PM_FDA_Load_TATRAN_To_DB.Status = Succeeded |

### `wf_LES` (LES)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL` | Session |
| `s_LES_Load_LES_HEADER_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL` | Session |
| `s_LES_Load_LES_PRIMARY_DATA_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL` | Session |
| `email_LES_Complete` | Email |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL` | Session |
| `s_LES_Current_Pay_Period` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL` | Session |
| `Start` | Start |
| `s_LES_Build_Message_Counters` | Session |
| `s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL` | Session |
| `s_LES_NIH_FILE` | Session |
| `s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL` | Session |
| `s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL` | Session |
| `s_LES_Verify_Record_Count` | Session |
| `s_LES_Verify_Header` | Session |
| `s_LESRPT_Load_LESR` | Session |
| `s_LESRPT_Load_LESC` | Session |
| `s_LESRPT_Load_LESU` | Session |
| `s_LESRPT_Load_LESS` | Session |
| `s_LESRPT_Load_LESD` | Session |
| `s_LESRPT_Load_LESM` | Session |
| `s_LESRPT_Load_LEST` | Session |
| `s_LESRPT_Load_LESL` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL.Status = Succeeded |
| `s_LES_Load_LES_HEADER_TBL` | `s_LES_Load_LES_EMP_DETAIL_TBL` | $s_LES_Load_LES_HEADER_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL` | $s_LES_Load_LES_EMP_DETAIL_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL.Status = Succeeded |
| `s_LES_Verify_Record_Count` | `s_LES_Load_LES_HEADER_TBL` | $s_LES_Verify_Record_Count.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL` | `s_LES_Load_LES_PRIMARY_DATA_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL.Status = Succeeded |
| `s_LES_Build_Message_Counters` | `email_LES_Complete` | $s_LES_Build_Message_Counters.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL.Status = Succeeded |
| `Start` | `s_LES_Current_Pay_Period` | — |
| `s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL` | `s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL` | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL.Status = Succeeded |
| `s_LES_NIH_FILE` | `s_LES_Build_Message_Counters` | $s_LES_NIH_FILE.Status = Succeeded |
| `s_LES_Load_LES_PRIMARY_DATA_TBL` | `s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL` | $s_LES_Load_LES_PRIMARY_DATA_TBL.Status = Succeeded |
| `s_LESRPT_Load_LESU` | `s_LES_NIH_FILE` | $s_LESRPT_Load_LESU.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL` | `s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL` | $s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL` | `s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL` | $s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL.Status = Succeeded |
| `s_LES_Verify_Header` | `s_LES_Verify_Record_Count` | $s_LES_Verify_Header.Status = Succeeded |
| `s_LES_Current_Pay_Period` | `s_LES_Verify_Header` | $s_LES_Current_Pay_Period.Status = Succeeded |
| `s_LESRPT_Load_LESM` | `s_LESRPT_Load_LESR` | $s_LESRPT_Load_LESM.Status = Succeeded |
| `s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL` | `s_LESRPT_Load_LESC` | $s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL.Status = Succeeded |
| `s_LESRPT_Load_LEST` | `s_LESRPT_Load_LESU` | $s_LESRPT_Load_LEST.Status = Succeeded |
| `s_LESRPT_Load_LESR` | `s_LESRPT_Load_LESS` | $s_LESRPT_Load_LESR.Status = Succeeded |
| `s_LESRPT_Load_LESC` | `s_LESRPT_Load_LESD` | $s_LESRPT_Load_LESC.Status = Succeeded |
| `s_LESRPT_Load_LESL` | `s_LESRPT_Load_LESM` | $s_LESRPT_Load_LESL.Status = Succeeded |
| `s_LESRPT_Load_LESS` | `s_LESRPT_Load_LEST` | $s_LESRPT_Load_LESS.Status = Succeeded |
| `s_LESRPT_Load_LESD` | `s_LESRPT_Load_LESL` | $s_LESRPT_Load_LESD.Status = Succeeded |

### `wf_Pay_Calendar` (Pay_Calendar)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `s_Pay_Calendar_Reset_Pay_Calendar` | Session |
| `Email_Pay_Calendar` | Email |
| `s_Pay_Calendar_Build_Message` | Session |
| `Start` | Start |
| `s_Pay_Calendar_Set_Pay_Calendar` | Session |
| `s_Pay_Calendar_Verify_Pay_Calendar` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `Start` | `s_Pay_Calendar_Reset_Pay_Calendar` | — |
| `s_Pay_Calendar_Build_Message` | `Email_Pay_Calendar` | $s_Pay_Calendar_Build_Message.Status = Succeeded |
| `s_Pay_Calendar_Verify_Pay_Calendar` | `s_Pay_Calendar_Build_Message` | $s_Pay_Calendar_Verify_Pay_Calendar.Status = Succeeded |
| `s_Pay_Calendar_Reset_Pay_Calendar` | `s_Pay_Calendar_Set_Pay_Calendar` | $s_Pay_Calendar_Reset_Pay_Calendar.Status = Succeeded |
| `s_Pay_Calendar_Set_Pay_Calendar` | `s_Pay_Calendar_Verify_Pay_Calendar` | $s_Pay_Calendar_Set_Pay_Calendar.Status = Succeeded |

### `wf_Pseudossn` (Pseudossn)

**Task Instances:**

| Task Name | Task Type |
|---|---|
| `Start` | Start |
| `Email_Pseudossn` | Email |
| `s_Pseudossn_Verify_Header_Date_Current_Pay_Period` | Session |
| `s_Pseudossn_Counters` | Session |
| `s_Pseudossn_Verify_Record_Count` | Session |
| `s_Pseudossn_Load_Pseudossn_Tbl` | Session |
| `s_Pseudossn_Load_Archive_Pseudossn_Tbl` | Session |
| `s_Pseudossn_Current_Pay_Period` | Session |
| `s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA` | Session |
| `s_Pseudossn_Update_Timekeeper_Number` | Session |
| `s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl` | Session |
| `s_Pseudossn_Load_Pseudossn_From_SDA_Tbl` | Session |

**Execution Order (Links):**

| From Task | To Task | Condition |
|---|---|---|
| `s_Pseudossn_Counters` | `Email_Pseudossn` | $s_Pseudossn_Counters.Status = Succeeded |
| `Start` | `s_Pseudossn_Verify_Header_Date_Current_Pay_Period` | — |
| `s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl` | `s_Pseudossn_Counters` | $s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl.Status = Succeeded |
| `s_Pseudossn_Verify_Header_Date_Current_Pay_Period` | `s_Pseudossn_Verify_Record_Count` | $s_Pseudossn_Verify_Header_Date_Current_Pay_Period.Status = Succeeded |
| `s_Pseudossn_Load_Archive_Pseudossn_Tbl` | `s_Pseudossn_Load_Pseudossn_Tbl` | $s_Pseudossn_Load_Archive_Pseudossn_Tbl.Status = Succeeded |
| `s_Pseudossn_Current_Pay_Period` | `s_Pseudossn_Load_Archive_Pseudossn_Tbl` | $s_Pseudossn_Current_Pay_Period.Status = Succeeded |
| `s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA` | `s_Pseudossn_Current_Pay_Period` | $s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA.Status = Succeeded |
| `s_Pseudossn_Verify_Record_Count` | `s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA` | $s_Pseudossn_Verify_Record_Count.Status = Succeeded |
| `s_Pseudossn_Load_Pseudossn_From_SDA_Tbl` | `s_Pseudossn_Update_Timekeeper_Number` | $s_Pseudossn_Load_Pseudossn_From_SDA_Tbl.Status = Succeeded |
| `s_Pseudossn_Update_Timekeeper_Number` | `s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl` | $s_Pseudossn_Update_Timekeeper_Number.Status = Succeeded |
| `s_Pseudossn_Load_Pseudossn_Tbl` | `s_Pseudossn_Load_Pseudossn_From_SDA_Tbl` | $s_Pseudossn_Load_Pseudossn_Tbl.Status = Succeeded |

---

## Shell Script Orchestration

### Transfer Scripts

All transfer scripts follow an identical SFTP-based pattern using KornShell (`ksh`):

| Script | Source Directory | SFTP Target Account | Remote Path |
|---|---|---|---|
| `afps_transfer` | `/data/BIISINT/data/int/out/CPM/` | `sa-cdirect@m1csv301.hhs.gov` | `/opt/app/jail/sa-afps/outbound` |
| `cdc_transfer` | `/data/BIISINT/data/int/out/CPM/` | `sa-cdirect@m1csv301.hhs.gov` | `/opt/app/jail/sa-cdcusr/outbound` |
| `fda_transfer` | `/data/BIISINT/data/int/out/CPM/` | `sa-cdirect@m1csv301.hhs.gov` | `/opt/app/jail/sa-fdausr2/outbound` |
| `nih_cpm_transfer` | `/data/BIISINT/data/int/out/CPM/` | `sa-cdirect@m1csv301.hhs.gov` | `/opt/app/jail/sa-nihbiisu/outbound` |
| `nih_les_transfer` | `/data/BIISINT/data/int/out/LES/` | `sa-cdirect@m1csv301.hhs.gov` | `/opt/app/jail/sa-nihbiisu/outbound` |
| `nih_transfer_les` | `/data/BIISINT/data/int/out/LES/` | `sa-cdirect@m1csv301.hhs.gov` | `/opt/app/jail/sa-nihbiisu/outbound` |
| `oig_transfer` | `/data/BIISINT/data/int/out/CPM/` | `sa-cdirect@m1csv301.hhs.gov` | `/opt/app/jail/sa-oig/outbound` |

**Common pattern:**
1. Accept a filename as `$1` parameter
2. Validate the file exists at the source path
3. Transfer via SFTP to the agency-specific dropbox on `m1csv301.hhs.gov`
4. Send email notification on success or failure via `mailx`
5. Log transfer timestamps to `/tmp/<name>.out`

### Maintenance Scripts

| Script | Purpose |
|---|---|
| `archive_files` | Moves files from input directory to destination, appending pay-period suffix (`_P<pp>.txt`) |
| `remove_file` | Deletes a named file from a specified directory |

### Pre/Post-Load Scripts

| Script | Purpose |
|---|---|
| `ehrp2biis_preload` | Runs `step01` SQL via SQL*Plus before the Informatica load; sends email notification |
| `actstage_load` | Runs `action_stage_load` SQL via SQL*Plus for staging record loads |
| `ehrp2biis_afterload.sql` | Post-load SQL: updates retained-step codes, sequence numbers, runs BIIS formatting procedures (`UPDT_ERP2BIIS_CRE8_REMARKS01_P`, `UPDATE_ERP2BIIS_NO900S01_p`, `ERP2BIIS_CRE8_REMARKS_900s01`, `UPDATE_ERP2BIIS_900SONLY01_P`), propagates staging records to production `_ALL` tables |

