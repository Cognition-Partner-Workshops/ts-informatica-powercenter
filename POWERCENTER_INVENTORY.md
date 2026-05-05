# PowerCenter Object Inventory

Complete inventory of all Informatica PowerCenter objects extracted from the XML exports in `XML/`.

**Platform:** Informatica PowerCenter 9.6.1  
**Repository Version:** 187.96  
**Database Type:** Oracle

## Summary

| Object Type | Count |
|---|---|
| XML Export Files | 11 |
| Folders | 6 |
| Source Definitions | 87 |
| Target Definitions | 115 |
| Mappings | 108 |
| Sessions | 108 |
| Workflows | 11 |

## Objects by XML Export File

| XML File | Folder | Sources | Targets | Mappings | Sessions | Workflows |
|---|---|---|---|---|---|---|
| `COMPTIME` | COMP_TIME | 2 | 4 | 3 | 3 | 1 |
| `CPM` | CPM | 18 | 23 | 15 | 15 | 1 |
| `CPM_AFPS` | CPM | 8 | 13 | 17 | 17 | 1 |
| `CPM_CDC` | CPM | 3 | 6 | 6 | 6 | 1 |
| `CPM_NIH` | CPM | 3 | 6 | 6 | 6 | 1 |
| `CPM_OIG` | CPM | 2 | 4 | 4 | 4 | 1 |
| `EHRP2BIIS_UPDATE` | EHRP2BIIS | 2 | 3 | 1 | 1 | 1 |
| `FDA_Leave` | CPM | 7 | 9 | 10 | 10 | 1 |
| `LES` | LES | 36 | 35 | 32 | 32 | 1 |
| `Pay_Calendar` | Pay_Calendar | 1 | 3 | 4 | 4 | 1 |
| `Pseudossn` | Pseudossn | 5 | 9 | 10 | 10 | 1 |

## Folders

| Folder Name | Owner | XML File(s) | Description |
|---|---|---|---|
| COMP_TIME | Administrator | `COMPTIME` | Deployement code COMP_TIME on 06202019 |
| CPM | NKNIGHT | `CPM`, `CPM_AFPS`, `CPM_CDC`, `CPM_NIH`, `CPM_OIG`, `FDA_Leave` |  |
| EHRP2BIIS | NKNIGHT | `EHRP2BIIS_UPDATE` |  |
| LES | NKNIGHT | `LES` |  |
| Pay_Calendar | RDIANA | `Pay_Calendar` |  |
| Pseudossn | RDIANA | `Pseudossn` |  |

## Source Definitions

| Source Name | Database Type | Database/Connection | Owner | Fields | XML File |
|---|---|---|---|---|---|
| U0287D01 | Flat File | FlatFile | — | 12 | `COMPTIME` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `COMPTIME` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `CPM` |
| YTD_FILE | VSAM | PC_DOEYTD_RDF.TXT | — | 3 | `CPM` |
| CPM_YTD_STATE_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 | `CPM` |
| MER_FILE | VSAM | PC_DOEMER_RDF.TXT | — | 2 | `CPM` |
| CPM_PM1_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 37 | `CPM` |
| CPM_YTD_DETAIL_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 106 | `CPM` |
| CPM_PM2_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 43 | `CPM` |
| PSEUDOSSN_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 63 | `CPM` |
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 | `CPM` |
| PAYMASTER_THREE | VSAM | PC_DOE_EXP_PMR3.TXT | — | 1 | `CPM` |
| ERROR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 | `CPM` |
| PAYMASTER_FILE | VSAM | PC_DOE_EXP_PMR_RDF.TXT | — | 4 | `CPM` |
| PAD_FILE | VSAM | PC_DOEPAD_RDF.TXT | — | 2 | `CPM` |
| CPM_NEWPAY_STG_TYPE_3_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 242 | `CPM` |
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 | `CPM` |
| CPM_NEWPAY_STG_TYPE_1_2_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 262 | `CPM` |
| CPM_PM3_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 40 | `CPM` |
| CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 246 | `CPM` |
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 | `CPM_AFPS` |
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 | `CPM_AFPS` |
| ERROR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 | `CPM_AFPS` |
| CPM_CYCLE_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 5 | `CPM_AFPS` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `CPM_AFPS` |
| HI_AFPS_FEEDER_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 283 | `CPM_AFPS` |
| HI_GROSS_EXP_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 12 | `CPM_AFPS` |
| CPM_PM3_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 40 | `CPM_AFPS` |
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 | `CPM_CDC` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `CPM_CDC` |
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 | `CPM_CDC` |
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 | `CPM_NIH` |
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 | `CPM_NIH` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `CPM_NIH` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `CPM_OIG` |
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 | `CPM_OIG` |
| NWK_NEW_EHRP_ACTIONS_TBL | Oracle | ORA_BIISPRD_SRC | NKNIGHT | 4 | `EHRP2BIIS_UPDATE` |
| PS_GVT_JOB | Oracle | ORA_BIISPRD_SRC | EHRP | 246 | `EHRP2BIIS_UPDATE` |
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 | `FDA_Leave` |
| HI_PM_FDA_TATRAN_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 | `FDA_Leave` |
| ERROR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 | `FDA_Leave` |
| CPM_CYCLE_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 5 | `FDA_Leave` |
| HI_PM_FDA_TATRAN_FLAT_FILE_NAME | Flat File | ORA_BIIS | INFO_TARGET_DEV | 7 | `FDA_Leave` |
| HI_PM_FDA_TATRAN_FLAT | Flat File | ORA_BIIS | INFO_TARGET_DEV | 6 | `FDA_Leave` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `FDA_Leave` |
| LES_EMP_DETAIL_LEAVE_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 15 | `LES` |
| LES_EMP_DETAIL_RECTYPE_T_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 | `LES` |
| LES_EMP_DETAIL_RECTYPE_M_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 6 | `LES` |
| LES_EMP_DETAIL_RECTYPE_D_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 13 | `LES` |
| LES_EMP_DETAIL_RECTYPE_U_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 11 | `LES` |
| LES_EMP_DETAIL_RECTYPE_L_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 15 | `LES` |
| LES_EMP_DETAIL_RECTYPE_R_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 14 | `LES` |
| LES_EMPLOYEE_DETAIL | Flat File | FlatFile | — | 5 | `LES` |
| LES_EMP_DETAIL_RECTYPE_C_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 14 | `LES` |
| LES_NIH_EMPLOYEE_SUMMARY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 4 | `LES` |
| ERROR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 7 | `LES` |
| LES_PRIMARY_DATA_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 90 | `LES` |
| EMP_REC_TYPE_D | VSAM | EMP_REC_TYPE_D.TXT | — | 1 | `LES` |
| PAY_PERIOD | Oracle | ORA_BIIS | INFO_TARGET_DEV | 10 | `LES` |
| EMP_REC_TYPE_2 | VSAM | EMP_REC_TYPE_2.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_T | VSAM | EMP_REC_TYPE_T.TXT | — | 1 | `LES` |
| LES_EMP_DETAIL_RECTYPE_4_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 17 | `LES` |
| LES_EMP_DETAIL_RECTYPE_2_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 17 | `LES` |
| LES_EMP_DETAIL_RECTYPE_1_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 21 | `LES` |
| LES_EMP_DETAIL_RECTYPE_3_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 21 | `LES` |
| LES_EMP_DETAIL_RECTYPE_6_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 | `LES` |
| LES_EMP_DETAIL_RECTYPE_5_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 18 | `LES` |
| EMP_REC_TYPE_3 | VSAM | EMP_REC_TYPE_3.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_0 | VSAM | EMP_REC_TYPE_0.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_5 | VSAM | EMP_REC_TYPE_5.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_1 | VSAM | EMP_REC_TYPE_1.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_4 | VSAM | EMP_REC_TYPE_4.TXT | — | 1 | `LES` |
| LES_HEADER_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 7 | `LES` |
| EMP_REC_TYPE_E | VSAM | EMP_REC_TYPE_E.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_R | VSAM | EMP_REC_TYPE_R.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_U | VSAM | EMP_REC_TYPE_U.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_L | VSAM | EMP_REC_TYPE_L.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_6 | VSAM | EMP_REC_TYPE_6.TXT | — | 1 | `LES` |
| EMP_REC_TYPE_M | VSAM | EMP_REC_TYPE_M.TXT | — | 1 | `LES` |
| LES_EMP_DETAIL_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 5 | `LES` |
| EMP_REC_TYPE_C | VSAM | EMP_REC_TYPE_C.TXT | — | 1 | `LES` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `Pay_Calendar` |
| PSEUDOSSN_FROM_SDA_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 63 | `Pseudossn` |
| PSEUDOSSN_FILE_TK_NUM | Flat File | FlatFile | — | 67 | `Pseudossn` |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 | `Pseudossn` |
| PSEUDOSSN_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 63 | `Pseudossn` |
| PSEUDOSSN_FILE | Flat File | FlatFile | — | 66 | `Pseudossn` |

## Target Definitions

| Target Name | Database Type | Fields | XML File |
|---|---|---|---|
| COUNTER_TBL | Oracle | 7 | `COMPTIME` |
| COMPTIME_MESSAGE_FILE | Flat File | 2 | `COMPTIME` |
| COMP_TIME_DAILY_TBL | Oracle | 15 | `COMPTIME` |
| COMP_TIME_DATE_FILE | Flat File | 1 | `COMPTIME` |
| CPM_PAY_PERIOD_DATE_FILE | Flat File | 1 | `CPM` |
| CPM_NEWPAY_STG_ALT_TBL | Oracle | 46 | `CPM` |
| CPM_YTD_HEADER_STG_TBL | Oracle | 7 | `CPM` |
| CPM_YTD_STATE_STG_TBL | Oracle | 8 | `CPM` |
| CPM_YTD_DETAIL_STG_TBL | Oracle | 106 | `CPM` |
| CPM_NEWPAY_STG_YTD_STATE_TBL | Oracle | 19 | `CPM` |
| CPM_MER_DETAIL_STG_TBL | Oracle | 95 | `CPM` |
| CPM_MER_HEADER_STG_TBL | Oracle | 7 | `CPM` |
| CPM_NEWPAY_STG_TYPE_1_2_TBL | Oracle | 262 | `CPM` |
| ERROR_TBL | Oracle | 8 | `CPM` |
| CPM_NEWPAY_STG_DETAIL_TBL | Oracle | 22 | `CPM` |
| CPM_MESSAGE_FILE | Flat File | 2 | `CPM` |
| COUNTER_TBL | Oracle | 7 | `CPM` |
| CPM_PM1_STG_TBL | Oracle | 37 | `CPM` |
| CPM_PM3_STG_TBL | Oracle | 40 | `CPM` |
| CPM_PM2_STG_TBL | Oracle | 43 | `CPM` |
| CPM_PMH_STG_TBL | Oracle | 3 | `CPM` |
| CPM_PAD_HEADER_STG_TBL | Oracle | 8 | `CPM` |
| CPM_PAD_DETAIL_STG_TBL | Oracle | 150 | `CPM` |
| GENERIC_TARGET_FILE | Flat File | 1 | `CPM` |
| CPM_NEWPAY_TBL | Oracle | 499 | `CPM` |
| CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Oracle | 246 | `CPM` |
| CPM_NEWPAY_STG_TYPE_3_TBL | Oracle | 242 | `CPM` |
| HI_AFPS_FEEDER_TBL | Oracle | 283 | `CPM_AFPS` |
| HI_GROSS_EXP_TBL | Oracle | 12 | `CPM_AFPS` |
| CPM_AFPS_MESSAGE_COUNTS_FILE | Flat File | 2 | `CPM_AFPS` |
| CPM_AFPS_MESSAGE_FILE | Flat File | 2 | `CPM_AFPS` |
| CPM_AFPS_MESSAGE_COUNTS_TOT_FILE | Flat File | 2 | `CPM_AFPS` |
| AFPS_COUNTER_TBL | Oracle | 7 | `CPM_AFPS` |
| GENERIC_TARGET_FILE | Flat File | 1 | `CPM_AFPS` |
| CPM_AFPS_PAY_PERIOD_FILE | Flat File | 1 | `CPM_AFPS` |
| CPM_AFPS_CROSSFOOT_FILE | Flat File | 2 | `CPM_AFPS` |
| CPM_CYCLE_TBL | Oracle | 5 | `CPM_AFPS` |
| CPM_AFPS_PAY_PERIOD_CAL_FILE | Flat File | 1 | `CPM_AFPS` |
| feeder_FEEDER_RECORD | PWX_SEQ_NRDB2 | 275 | `CPM_AFPS` |
| ERROR_TBL | Oracle | 8 | `CPM_AFPS` |
| cdchdr_WS_CDC_HDR | PWX_SEQ_NRDB2 | 15 | `CPM_CDC` |
| GENERIC_TARGET_FILE | Flat File | 1 | `CPM_CDC` |
| CPM_CDC_PAY_PERIOD_FILE | Flat File | 1 | `CPM_CDC` |
| cdcskel_WS_PAY_OUT_REC | PWX_SEQ_NRDB2 | 736 | `CPM_CDC` |
| CPM_CDC_CPM_PAY_PERIOD_FILE | Flat File | 1 | `CPM_CDC` |
| CPM_CDC_MESSAGE_FILE | Flat File | 2 | `CPM_CDC` |
| CPM_NIH_MESSAGE_FILE | Flat File | 2 | `CPM_NIH` |
| nihhdr_WS_NIH_HDR | PWX_SEQ_NRDB2 | 18 | `CPM_NIH` |
| nihtest_NIH_PAYROLL_MASTER | PWX_SEQ_NRDB2 | 534 | `CPM_NIH` |
| CPM_NIH_CPM_PAY_PERIOD_FILE | Flat File | 1 | `CPM_NIH` |
| GENERIC_TARGET_FILE | Flat File | 1 | `CPM_NIH` |
| CPM_NIH_PAY_PERIOD_FILE | Flat File | 1 | `CPM_NIH` |
| CPM_OIG_MESSAGE_FILE | Flat File | 2 | `CPM_OIG` |
| CPM_OIG_PAY_PERIOD_FILE | Flat File | 1 | `CPM_OIG` |
| CPM_OIG_CPM_PAY_PERIOD_FILE | Flat File | 1 | `CPM_OIG` |
| oigsgndec_SKPAYROLL_MASTER | PWX_SEQ_NRDB2 | 287 | `CPM_OIG` |
| EHRP_RECS_TRACKING_TBL | Oracle | 10 | `EHRP2BIIS_UPDATE` |
| NWK_ACTION_PRIMARY_TBL | Oracle | 260 | `EHRP2BIIS_UPDATE` |
| NWK_ACTION_SECONDARY_TBL | Oracle | 209 | `EHRP2BIIS_UPDATE` |
| ERROR_TBL | Oracle | 8 | `FDA_Leave` |
| HI_PM_FDA_TATRAN_FLAT | Flat File | 6 | `FDA_Leave` |
| CPM_FDA_CPM_PAY_PERIOD_FILE | Flat File | 1 | `FDA_Leave` |
| GENERIC_TARGET_FILE | Flat File | 1 | `FDA_Leave` |
| FDA_EXTRACT_MESSAGE_FILE | Flat File | 2 | `FDA_Leave` |
| COUNTER_TBL | Oracle | 7 | `FDA_Leave` |
| CPM_CYCLE_TBL | Oracle | 5 | `FDA_Leave` |
| HI_PM_FDA_TATRAN_TBL | Oracle | 8 | `FDA_Leave` |
| CPM_FDA_PAY_PERIOD_FILE | Flat File | 1 | `FDA_Leave` |
| LESL | Oracle | 22 | `LES` |
| LEST | Oracle | 16 | `LES` |
| LESM | Oracle | 14 | `LES` |
| LESD | Oracle | 21 | `LES` |
| LESS | Oracle | 91 | `LES` |
| LESU | Oracle | 19 | `LES` |
| LESC | Oracle | 22 | `LES` |
| LESR | Oracle | 22 | `LES` |
| LES_HEADER_FILE | Flat File | 3 | `LES` |
| LES_TOTALS_FILE | Flat File | 2 | `LES` |
| LES_EMP_DETAIL_LEAVE_TBL | Oracle | 15 | `LES` |
| LES_EMP_DETAIL_RETRO_EARN_TBL | Oracle | 8 | `LES` |
| LES_NIH_EMPLOYEE_DETAIL | Flat File | 5 | `LES` |
| LES_NIH_EMPLOYEE_SUMMARY_TBL | Oracle | 4 | `LES` |
| LES_EMP_DETAIL_CURR_EARN_TBL | Oracle | 8 | `LES` |
| COUNTER_TBL | Oracle | 7 | `LES` |
| LES_MESSAGE_FILE | Flat File | 2 | `LES` |
| LES_EMP_DETAIL_RECTYPE_D_TBL | Oracle | 13 | `LES` |
| LES_PAY_PERIOD_DATE_FILE | Flat File | 1 | `LES` |
| LES_EMP_DETAIL_RECTYPE_2_TBL | Oracle | 17 | `LES` |
| LES_EMP_DETAIL_RECTYPE_T_TBL | Oracle | 8 | `LES` |
| LES_PRIMARY_DATA_TBL | Oracle | 90 | `LES` |
| LES_EMP_DETAIL_RECTYPE_3_TBL | Oracle | 21 | `LES` |
| LES_HEADER_TBL | Oracle | 7 | `LES` |
| LES_EMP_DETAIL_RECTYPE_5_TBL | Oracle | 18 | `LES` |
| LES_EMP_DETAIL_RECTYPE_1_TBL | Oracle | 21 | `LES` |
| LES_EMP_DETAIL_RECTYPE_4_TBL | Oracle | 17 | `LES` |
| ERROR_TBL | Oracle | 7 | `LES` |
| LES_EMP_DETAIL_TBL | Oracle | 5 | `LES` |
| LES_EMP_DETAIL_RECTYPE_R_TBL | Oracle | 14 | `LES` |
| LES_EMP_DETAIL_RECTYPE_U_TBL | Oracle | 11 | `LES` |
| LES_EMP_DETAIL_RECTYPE_L_TBL | Oracle | 15 | `LES` |
| LES_EMP_DETAIL_RECTYPE_6_TBL | Oracle | 8 | `LES` |
| LES_EMP_DETAIL_RECTYPE_M_TBL | Oracle | 6 | `LES` |
| LES_EMP_DETAIL_RECTYPE_C_TBL | Oracle | 14 | `LES` |
| PAY_PERIOD_VERIFY_FILE | Flat File | 1 | `Pay_Calendar` |
| PAY_PERIOD_MESSAGE_FILE | Flat File | 2 | `Pay_Calendar` |
| PAY_PERIOD | Oracle | 8 | `Pay_Calendar` |
| PSEUDOSSN_FROM_SDA_TBL | Oracle | 63 | `Pseudossn` |
| PAY_PERIOD_DATE_FILE | Flat File | 1 | `Pseudossn` |
| HI_ARCH_PSEUDOSSN_TBL | Oracle | 63 | `Pseudossn` |
| ERROR_TBL | Oracle | 8 | `Pseudossn` |
| PSEUDOSSN_TBL | Oracle | 63 | `Pseudossn` |
| PSEUDO_RECORD_COUNT | Oracle | 3 | `Pseudossn` |
| COUNTER_TBL | Oracle | 7 | `Pseudossn` |
| PSEUDOSSN_MESSAGE_FILE | Flat File | 2 | `Pseudossn` |
| PSEUDO_HDR_DATE_FILE | Flat File | 1 | `Pseudossn` |

## Mapping Definitions

| Mapping Name | Transformations | Instances | XML File |
|---|---|---|---|
| m_COMPTIME_Build_Message_Counters | 10 | 13 | `COMPTIME` |
| m_COMPTIME_Load_COMP_TIME_DAILY_TBL | 6 | 8 | `COMPTIME` |
| m_COMPTIME_Current_Pay_Period | 3 | 5 | `COMPTIME` |
| m_CPM_Current_Pay_Period | 3 | 5 | `CPM` |
| m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | 12 | 16 | `CPM` |
| m_CPM_Load_CPM_YTD_Staging_Tables | 10 | 14 | `CPM` |
| m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | 6 | 9 | `CPM` |
| m_CPM_Load_CPM_MER_Staging_Tables | 9 | 12 | `CPM` |
| m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | 18 | 30 | `CPM` |
| m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | 5 | 7 | `CPM` |
| m_CPM_Build_Message_Counters | 26 | 32 | `CPM` |
| m_CPM_Load_CPM_PMR_Staging_Tables | 11 | 16 | `CPM` |
| m_CPM_Load_CPM_PAD_Staging_Tables | 9 | 12 | `CPM` |
| m_CPM_Load_PMR_To_CPM_NEWPAY_TBL | 4 | 7 | `CPM` |
| m_Generic_Mapping | 1 | 3 | `CPM` |
| m_CPM_Load_FDR_CPM_NEWPAY_TBL | 5 | 8 | `CPM` |
| m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | 10 | 24 | `CPM` |
| m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL | 8 | 10 | `CPM` |
| m_CPM_AFPS_0100_Data_Seperate | 5 | 8 | `CPM_AFPS` |
| m_CPM_AFPS_0300_Gross_Exp_Report | 2 | 4 | `CPM_AFPS` |
| m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | 5 | 7 | `CPM_AFPS` |
| m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | 10 | 13 | `CPM_AFPS` |
| m_CPM_AFPS_0800_Build_Message_Counters | 12 | 16 | `CPM_AFPS` |
| m_CPM_AFPS_0900_Build_Message | 3 | 5 | `CPM_AFPS` |
| m_CPM_AFPS_0760_Concatenate_Crossfoot_Files | 1 | 3 | `CPM_AFPS` |
| m_CPM_AFPS_1000_Send_Report | 1 | 3 | `CPM_AFPS` |
| m_CPM_AFPS_0500_Crossfoot_Message_Header | 4 | 6 | `CPM_AFPS` |
| m_CPM_AFPS_0820_Build_Message_Totals | 11 | 15 | `CPM_AFPS` |
| m_CPM_AFPS_0860_Concatenate_Counts_Files | 1 | 3 | `CPM_AFPS` |
| m_CPM_AFPS_0025_Set_Pay_Calendar | 8 | 10 | `CPM_AFPS` |
| m_CPM_AFPS_0600_Crossfoot_Message_Details | 4 | 6 | `CPM_AFPS` |
| m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | 5 | 7 | `CPM_AFPS` |
| m_CPM_AFPS_0010_Set_CPM_Calendar | 9 | 11 | `CPM_AFPS` |
| m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | 1 | 3 | `CPM_AFPS` |
| m_CPM_AFPS_0400_Crossfoot_Errors | 6 | 10 | `CPM_AFPS` |
| m_CPM_CDC_Load_CPM_CDC_Header_File | 3 | 5 | `CPM_CDC` |
| m_CPM_CDC_Concatenate_Files | 1 | 3 | `CPM_CDC` |
| m_CPM_CDC_Set_Pay_Calendar | 8 | 10 | `CPM_CDC` |
| m_CPM_CDC_Load_CPM_CDC_Data_File | 5 | 7 | `CPM_CDC` |
| m_CPM_CDC_Set_CPM_Calendar | 7 | 9 | `CPM_CDC` |
| m_CPM_CDC_Build_Message | 6 | 8 | `CPM_CDC` |
| m_CPM_NIH_Build_Message | 6 | 8 | `CPM_NIH` |
| m_CPM_NIH_Load_CPM_NIH_Header_File | 3 | 5 | `CPM_NIH` |
| m_CPM_NIH_Load_CPM_NIH_Data_File | 5 | 7 | `CPM_NIH` |
| m_CPM_NIH_Set_CPM_Calendar | 7 | 9 | `CPM_NIH` |
| m_CPM_NIH_Concatenate_Files | 1 | 3 | `CPM_NIH` |
| m_CPM_NIH_Set_Pay_Calendar | 8 | 10 | `CPM_NIH` |
| m_CPM_OIG_Build_Message | 5 | 7 | `CPM_OIG` |
| m_CPM_OIG_Set_Pay_Calendar | 9 | 11 | `CPM_OIG` |
| m_CPM_OIG_Set_CPM_Calendar | 7 | 9 | `CPM_OIG` |
| m_CPM_OIG_Load_CPM_OIG_File | 6 | 8 | `CPM_OIG` |
| m_EHRP2BIIS_UPDATE | 13 | 18 | `EHRP2BIIS_UPDATE` |
| m_0150_PM_FDA_Error_Counter | 15 | 20 | `FDA_Leave` |
| m_0300_PM_FDA_Create_Output_File | 2 | 4 | `FDA_Leave` |
| m_0020_PM_FDA_Set_CPM_Calendar | 7 | 9 | `FDA_Leave` |
| m_1100_PM_FDA_Send_Email | 1 | 3 | `FDA_Leave` |
| m_0200_PM_FDA_Create_Insert_200_Rows | 11 | 13 | `FDA_Leave` |
| m_0500_PM_FDA_IO_Counter | 19 | 24 | `FDA_Leave` |
| m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | 5 | 7 | `FDA_Leave` |
| m_0010_PM_FDA_Verify_File | 11 | 13 | `FDA_Leave` |
| m_0100_PM_FDA_Load_TATRAN_To_DB | 4 | 6 | `FDA_Leave` |
| m_0025_PM_FDA_Set_Pay_Calendar | 9 | 11 | `FDA_Leave` |
| m_LESRPT_Load_LESL | 4 | 6 | `LES` |
| m_LESRPT_Load_LEST | 5 | 7 | `LES` |
| m_LESRPT_Load_LESM | 4 | 6 | `LES` |
| m_LESRPT_Load_LESD | 5 | 7 | `LES` |
| m_LESRPT_Load_LESS | 4 | 6 | `LES` |
| m_LESRPT_Load_LESU | 5 | 7 | `LES` |
| m_LESRPT_Load_LESC | 5 | 7 | `LES` |
| m_LESRPT_Load_LESR | 5 | 7 | `LES` |
| m_LES_Verify_Header | 8 | 10 | `LES` |
| m_LES_Verify_Record_Count | 7 | 9 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | 3 | 5 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | 6 | 8 | `LES` |
| m_LES_NIH_FILE | 10 | 13 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | 6 | 8 | `LES` |
| m_LES_Build_Message_Counters | 28 | 34 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | 7 | 10 | `LES` |
| m_LES_Current_Pay_Period | 3 | 5 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_PRIMARY_DATA_TBL | 6 | 15 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_HEADER_TBL | 7 | 9 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_TBL | 12 | 16 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | 7 | 10 | `LES` |
| m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | 7 | 10 | `LES` |
| m_Pay_Calendar_Verify_Pay_Calendar | 4 | 6 | `Pay_Calendar` |
| m_Pay_Calendar_Set_Pay_Calendar | 11 | 14 | `Pay_Calendar` |
| m_Pay_Calendar_Build_Message | 3 | 5 | `Pay_Calendar` |
| m_Pay_Calendar_Reset_Pay_Calendar | 3 | 5 | `Pay_Calendar` |
| m_Pseudossn_Load_Pseudossn_From_SDA_Tbl | 8 | 10 | `Pseudossn` |
| m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | 5 | 7 | `Pseudossn` |
| m_Pseudossn_Update_Timekeeper_Number | 6 | 8 | `Pseudossn` |
| m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | 7 | 9 | `Pseudossn` |
| m_Pseudossn_Current_Pay_Period | 3 | 5 | `Pseudossn` |
| m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1 | 2 | 4 | `Pseudossn` |
| m_Pseudossn_Load_Pseudossn_Tbl | 14 | 17 | `Pseudossn` |
| m_Pseudossn_Verify_Record_Count | 9 | 12 | `Pseudossn` |
| m_Pseudossn_Counters | 13 | 16 | `Pseudossn` |
| m_Pseudossn_Verify_Header_Date_Current_Pay_Period | 7 | 9 | `Pseudossn` |

## Session Definitions

| Session Name | Mapping | Valid | XML File |
|---|---|---|---|
| s_COMPTIME_Current_Pay_Period | m_COMPTIME_Current_Pay_Period | YES | `COMPTIME` |
| s_COMPTIME_Build_Message_Counters | m_COMPTIME_Build_Message_Counters | YES | `COMPTIME` |
| s_COMPTIME_Load_COMP_TIME_DAILY_TBL | m_COMPTIME_Load_COMP_TIME_DAILY_TBL | YES | `COMPTIME` |
| s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL | YES | `CPM` |
| s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | YES | `CPM` |
| s_CPM_Load_FDR_CPM_NEWPAY_TBL | m_CPM_Load_FDR_CPM_NEWPAY_TBL | YES | `CPM` |
| s_CPM_Send_Counts | m_Generic_Mapping | YES | `CPM` |
| s_CPM_Load_CPM_NEWPAY_TBL | m_CPM_Load_PMR_To_CPM_NEWPAY_TBL | YES | `CPM` |
| s_CPM_Load_CPM_PAD_Staging_Tables | m_CPM_Load_CPM_PAD_Staging_Tables | YES | `CPM` |
| s_CPM_Load_CPM_PMR_Staging_Tables | m_CPM_Load_CPM_PMR_Staging_Tables | YES | `CPM` |
| s_CPM_Build_Message_Counters | m_CPM_Build_Message_Counters | YES | `CPM` |
| s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | YES | `CPM` |
| s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | YES | `CPM` |
| s_CPM_Load_CPM_MER_Staging_Tables | m_CPM_Load_CPM_MER_Staging_Tables | YES | `CPM` |
| s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | YES | `CPM` |
| s_CPM_Load_CPM_YTD_Staging_Tables | m_CPM_Load_CPM_YTD_Staging_Tables | YES | `CPM` |
| s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | YES | `CPM` |
| s_CPM_Current_Pay_Period | m_CPM_Current_Pay_Period | YES | `CPM` |
| s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | YES | `CPM_AFPS` |
| s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | YES | `CPM_AFPS` |
| s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | YES | `CPM_AFPS` |
| s_CPM_AFPS_0800_Build_Message_Counters | m_CPM_AFPS_0800_Build_Message_Counters | YES | `CPM_AFPS` |
| s_CPM_AFPS_0900_Build_Message | m_CPM_AFPS_0900_Build_Message | YES | `CPM_AFPS` |
| s_CPM_AFPS_0820_Build_Message_Totals | m_CPM_AFPS_0820_Build_Message_Totals | YES | `CPM_AFPS` |
| s_CPM_AFPS_0010_Set_CPM_Calendar | m_CPM_AFPS_0010_Set_CPM_Calendar | YES | `CPM_AFPS` |
| s_CPM_AFPS_1000_Send_Report | m_CPM_AFPS_1000_Send_Report | YES | `CPM_AFPS` |
| s_CPM_AFPS_0100_Data_Seperate | m_CPM_AFPS_0100_Data_Seperate | YES | `CPM_AFPS` |
| s_CPM_AFPS_0760_Concatenate_Crossfoot_Files | m_CPM_AFPS_0760_Concatenate_Crossfoot_Files | YES | `CPM_AFPS` |
| s_CPM_AFPS_0025_Set_Pay_Calendar | m_CPM_AFPS_0025_Set_Pay_Calendar | YES | `CPM_AFPS` |
| s_CPM_AFPS_0860_Concatenate_Counts_Files | m_CPM_AFPS_0860_Concatenate_Counts_Files | YES | `CPM_AFPS` |
| s_CPM_AFPS_0500_Crossfoot_Message_Header | m_CPM_AFPS_0500_Crossfoot_Message_Header | YES | `CPM_AFPS` |
| s_CPM_AFPS_0300_Gross_Exp_Report | m_CPM_AFPS_0300_Gross_Exp_Report | YES | `CPM_AFPS` |
| s_CPM_AFPS_0600_Crossfoot_Message_Details | m_CPM_AFPS_0600_Crossfoot_Message_Details | YES | `CPM_AFPS` |
| s_CPM_AFPS_0400_Crossfoot_Errors | m_CPM_AFPS_0400_Crossfoot_Errors | YES | `CPM_AFPS` |
| s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | YES | `CPM_AFPS` |
| s_CPM_CDC_Set_CPM_Calendar | m_CPM_CDC_Set_CPM_Calendar | YES | `CPM_CDC` |
| s_CPM_CDC_Load_CPM_CDC_Data_File | m_CPM_CDC_Load_CPM_CDC_Data_File | YES | `CPM_CDC` |
| s_CPM_CDC_Set_Pay_Calendar | m_CPM_CDC_Set_Pay_Calendar | YES | `CPM_CDC` |
| s_CPM_CDC_Concatenate_Files | m_CPM_CDC_Concatenate_Files | YES | `CPM_CDC` |
| s_CPM_CDC_Load_CPM_CDC_Header_File | m_CPM_CDC_Load_CPM_CDC_Header_File | YES | `CPM_CDC` |
| s_CPM_CDC_Build_Message | m_CPM_CDC_Build_Message | YES | `CPM_CDC` |
| s_CPM_NIH_Set_Pay_Calendar | m_CPM_NIH_Set_Pay_Calendar | YES | `CPM_NIH` |
| s_CPM_NIH_Concatenate_Files | m_CPM_NIH_Concatenate_Files | YES | `CPM_NIH` |
| s_CPM_NIH_Set_CPM_Calendar | m_CPM_NIH_Set_CPM_Calendar | YES | `CPM_NIH` |
| s_CPM_NIH_Load_CPM_NIH_Data_File | m_CPM_NIH_Load_CPM_NIH_Data_File | YES | `CPM_NIH` |
| s_CPM_NIH_Load_CPM_NIH_Header_File | m_CPM_NIH_Load_CPM_NIH_Header_File | YES | `CPM_NIH` |
| s_CPM_NIH_Build_Message | m_CPM_NIH_Build_Message | YES | `CPM_NIH` |
| s_CPM_OIG_Load_CPM_OIG_File | m_CPM_OIG_Load_CPM_OIG_File | YES | `CPM_OIG` |
| s_CPM_OIG_Set_CPM_Calendar | m_CPM_OIG_Set_CPM_Calendar | YES | `CPM_OIG` |
| s_CPM_OIG_Set_Pay_Calendar | m_CPM_OIG_Set_Pay_Calendar | YES | `CPM_OIG` |
| s_CPM_OIG_Build_Message | m_CPM_OIG_Build_Message | YES | `CPM_OIG` |
| s_m_EHRP2BIIS_UPDATE | m_EHRP2BIIS_UPDATE | YES | `EHRP2BIIS_UPDATE` |
| s_0025_PM_FDA_Set_Pay_Calendar | m_0025_PM_FDA_Set_Pay_Calendar | YES | `FDA_Leave` |
| s_0100_PM_FDA_Load_TATRAN_To_DB | m_0100_PM_FDA_Load_TATRAN_To_DB | YES | `FDA_Leave` |
| s_0010_PM_FDA_Verify_File | m_0010_PM_FDA_Verify_File | YES | `FDA_Leave` |
| s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | YES | `FDA_Leave` |
| s_0500_PM_FDA_IO_Counter | m_0500_PM_FDA_IO_Counter | YES | `FDA_Leave` |
| s_0200_PM_FDA_Create_200_Rows | m_0200_PM_FDA_Create_Insert_200_Rows | YES | `FDA_Leave` |
| s_1100_PM_FDA_Send_Email | m_1100_PM_FDA_Send_Email | YES | `FDA_Leave` |
| s_0020_PM_FDA_Set_CPM_Calendar | m_0020_PM_FDA_Set_CPM_Calendar | YES | `FDA_Leave` |
| s_0300_PM_FDA_Create_Output_File | m_0300_PM_FDA_Create_Output_File | YES | `FDA_Leave` |
| s_0150_PM_FDA_Error_Counter | m_0150_PM_FDA_Error_Counter | YES | `FDA_Leave` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_TBL | m_LES_Load_LES_EMP_DETAIL_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | YES | `LES` |
| s_LES_Load_LES_HEADER_TBL | m_LES_Load_LES_HEADER_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | YES | `LES` |
| s_LES_Load_LES_PRIMARY_DATA_TBL | m_LES_Load_LES_PRIMARY_DATA_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | YES | `LES` |
| s_LES_Current_Pay_Period | m_LES_Current_Pay_Period | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | YES | `LES` |
| s_LES_Build_Message_Counters | m_LES_Build_Message_Counters | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | YES | `LES` |
| s_LES_NIH_FILE | m_LES_NIH_FILE | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | YES | `LES` |
| s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | YES | `LES` |
| s_LES_Verify_Record_Count | m_LES_Verify_Record_Count | YES | `LES` |
| s_LES_Verify_Header | m_LES_Verify_Header | YES | `LES` |
| s_LESRPT_Load_LESR | m_LESRPT_Load_LESR | YES | `LES` |
| s_LESRPT_Load_LESC | m_LESRPT_Load_LESC | YES | `LES` |
| s_LESRPT_Load_LESU | m_LESRPT_Load_LESU | YES | `LES` |
| s_LESRPT_Load_LESS | m_LESRPT_Load_LESS | YES | `LES` |
| s_LESRPT_Load_LESD | m_LESRPT_Load_LESD | YES | `LES` |
| s_LESRPT_Load_LESM | m_LESRPT_Load_LESM | YES | `LES` |
| s_LESRPT_Load_LEST | m_LESRPT_Load_LEST | YES | `LES` |
| s_LESRPT_Load_LESL | m_LESRPT_Load_LESL | YES | `LES` |
| s_Pay_Calendar_Reset_Pay_Calendar | m_Pay_Calendar_Reset_Pay_Calendar | YES | `Pay_Calendar` |
| s_Pay_Calendar_Build_Message | m_Pay_Calendar_Build_Message | YES | `Pay_Calendar` |
| s_Pay_Calendar_Set_Pay_Calendar | m_Pay_Calendar_Set_Pay_Calendar | YES | `Pay_Calendar` |
| s_Pay_Calendar_Verify_Pay_Calendar | m_Pay_Calendar_Verify_Pay_Calendar | YES | `Pay_Calendar` |
| s_Pseudossn_Verify_Header_Date_Current_Pay_Period | m_Pseudossn_Verify_Header_Date_Current_Pay_Period | YES | `Pseudossn` |
| s_Pseudossn_Counters | m_Pseudossn_Counters | YES | `Pseudossn` |
| s_Pseudossn_Verify_Record_Count | m_Pseudossn_Verify_Record_Count | YES | `Pseudossn` |
| s_Pseudossn_Load_Pseudossn_Tbl | m_Pseudossn_Load_Pseudossn_Tbl | YES | `Pseudossn` |
| s_Pseudossn_Load_Archive_Pseudossn_Tbl | m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1 | YES | `Pseudossn` |
| s_Pseudossn_Current_Pay_Period | m_Pseudossn_Current_Pay_Period | YES | `Pseudossn` |
| s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | YES | `Pseudossn` |
| s_Pseudossn_Update_Timekeeper_Number | m_Pseudossn_Update_Timekeeper_Number | YES | `Pseudossn` |
| s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | YES | `Pseudossn` |
| s_Pseudossn_Load_Pseudossn_From_SDA_Tbl | m_Pseudossn_Load_Pseudossn_From_SDA_Tbl | YES | `Pseudossn` |

## Workflow Definitions

| Workflow Name | Valid | Task Instances | XML File |
|---|---|---|---|
| wf_COMPTIME | YES | 5 | `COMPTIME` |
| wf_CPM | YES | 16 | `CPM` |
| wf_CPM_AFPS | YES | 18 | `CPM_AFPS` |
| wf_CPM_CDC | YES | 8 | `CPM_CDC` |
| wf_CPM_NIH | YES | 8 | `CPM_NIH` |
| wf_CPM_OIG | YES | 6 | `CPM_OIG` |
| wf_EHRP2BIIS_UPDATE | YES | 2 | `EHRP2BIIS_UPDATE` |
| wf_FDA_Leave | YES | 11 | `FDA_Leave` |
| wf_LES | YES | 34 | `LES` |
| wf_Pay_Calendar | YES | 6 | `Pay_Calendar` |
| wf_Pseudossn | YES | 12 | `Pseudossn` |

## Transformation Types Used

| Transformation Type | Occurrences |
|---|---|
| Expression | 343 |
| Source Qualifier | 112 |
| Lookup Procedure | 112 |
| Filter | 61 |
| Normalizer | 39 |
| Aggregator | 29 |
| Joiner | 27 |
| Router | 7 |
| Update Strategy | 7 |
| Sorter | 5 |
| Sequence | 5 |

## Shell Scripts

### Transfer Scripts (`Transfer Scripts/`)

| Script | Description | Source Directory | SFTP Target Host | Remote Account/Path |
|---|---|---|---|---|
| `afps_transfer` | Transfer AFPS CPM output file | `/data/BIISINT/data/int/out/CPM/` | m1csv301.hhs.gov | sa-afps → /opt/app/jail/sa-afps/outbound |
| `cdc_transfer` | Transfer CDC CPM output file | `/data/BIISINT/data/int/out/CPM/` | m1csv301.hhs.gov | sa-cdcusr → /opt/app/jail/sa-cdcusr/outbound |
| `fda_transfer` | Transfer FDA CPM output file | `/data/BIISINT/data/int/out/CPM/` | m1csv301.hhs.gov | sa-fdausr2 → /opt/app/jail/sa-fdausr2/outbound |
| `nih_cpm_transfer` | Transfer NIH CPM output file | `/data/BIISINT/data/int/out/CPM/` | m1csv301.hhs.gov | sa-nihbiisu → /opt/app/jail/sa-nihbiisu/outbound |
| `nih_les_transfer` | Transfer NIH LES output file | `/data/BIISINT/data/int/out/LES/` | m1csv301.hhs.gov | sa-nihbiisu → /opt/app/jail/sa-nihbiisu/outbound |
| `nih_transfer_les` | Transfer NIH LES output file (alt) | `/data/BIISINT/data/int/out/LES/` | m1csv301.hhs.gov | sa-nihbiisu → /opt/app/jail/sa-nihbiisu/outbound |
| `oig_transfer` | Transfer OIG CPM output file | `/data/BIISINT/data/int/out/CPM/` | m1csv301.hhs.gov | sa-oig → /opt/app/jail/sa-oig/outbound |

### Maintenance Scripts (`Maintenance Scripts/`)

| Script | Description |
|---|---|
| `archive_files` | Archives files by renaming with pay period suffix and moving to destination directory |
| `remove_file` | Deletes a specified file from a given directory |

### Orchestration Scripts (root)

| Script | Description |
|---|---|
| `actstage_load` | Executes `action_stage_load` SQL via SQL*Plus; sends email on success/failure |
| `ehrp2biis_preload` | Executes `step01` SQL via SQL*Plus for EHRP2BIIS pre-load staging |
| `ehrp2biis_afterload.sql` | Post-load SQL: updates sequences, runs formatting procedures, copies staging to production tables |
