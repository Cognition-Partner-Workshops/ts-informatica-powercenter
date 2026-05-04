# PowerCenter Inventory

Comprehensive inventory of all Informatica PowerCenter XML export files in this repository.

## Summary

| XML File | Repository | Folder | Sources | Targets | Mappings | Sessions | Workflows |
|----------|-----------|--------|---------|---------|----------|----------|-----------|
| COMPTIME | Test_Repo_Srvc | COMP_TIME | 2 | 4 | 3 | 3 | 1 |
| CPM | Test_Repo_Srvc | CPM | 18 | 23 | 15 | 15 | 1 |
| CPM_AFPS | Test_Repo_Srvc | CPM | 8 | 13 | 17 | 17 | 1 |
| CPM_CDC | Test_Repo_Srvc | CPM | 3 | 6 | 6 | 6 | 1 |
| CPM_NIH | Test_Repo_Srvc | CPM | 3 | 6 | 6 | 6 | 1 |
| CPM_OIG | Test_Repo_Srvc | CPM | 2 | 4 | 4 | 4 | 1 |
| EHRP2BIIS_UPDATE | Prd_Repo_Srvc | EHRP2BIIS | 2 | 3 | 1 | 1 | 1 |
| FDA_Leave | Test_Repo_Srvc | CPM | 7 | 9 | 10 | 10 | 1 |
| LES | Prd_Repo_Srvc | LES | 36 | 35 | 32 | 32 | 1 |
| Pay_Calendar | Prd_Repo_Srvc | Pay_Calendar | 1 | 3 | 4 | 4 | 1 |
| Pseudossn | Prd_Repo_Srvc | Pseudossn | 5 | 9 | 10 | 10 | 1 |

---

## COMPTIME

- **Repository**: `Test_Repo_Srvc`
- **Folder**: `COMP_TIME`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| U0287D01 | Flat File | FlatFile |  | 12 |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| COUNTER_TBL | Oracle | 7 |
| COMPTIME_MESSAGE_FILE | Flat File | 2 |
| COMP_TIME_DAILY_TBL | Oracle | 15 |
| COMP_TIME_DATE_FILE | Flat File | 1 |

### Mappings

#### `m_COMPTIME_Build_Message_Counters`

- **Valid**: YES
- **Description**: This mapping gets the count of detail records on the CompTime file that was processed and loads it to the Counters Table. 

| Transformation Name | Type |
|-------------------|------|
| exp_Build_Message | Expression |
| fil_Detail | Filter |
| exp_Initial | Expression |
| agg_ALL_RECORDS | Aggregator |
| exp_Detail_Count | Expression |
| exp_Counters | Expression |
| exp_Final | Expression |
| SQ_U0287D01 | Source Qualifier |
| lkp_PAY_PERIOD | Lookup Procedure |
| exp_Final_Message | Expression |

#### `m_COMPTIME_Load_COMP_TIME_DAILY_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_U0287D01 | Source Qualifier |
| exp_Initial | Expression |
| exp_Final | Expression |
| lkp_PAY_PERIOD | Lookup Procedure |
| exp_Convert | Expression |
| fil_Valid_Records | Filter |

#### `m_COMPTIME_Current_Pay_Period`

- **Valid**: YES
- **Description**: This mapping returns the Current Pay Period from the Pay Period table.

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Build_Pay_Period | Expression |
| exp_Final | Expression |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_COMPTIME_Current_Pay_Period | m_COMPTIME_Current_Pay_Period | YES |
| s_COMPTIME_Build_Message_Counters | m_COMPTIME_Build_Message_Counters | YES |
| s_COMPTIME_Load_COMP_TIME_DAILY_TBL | m_COMPTIME_Load_COMP_TIME_DAILY_TBL | YES |

### Workflows

#### `wf_COMPTIME`

- **Valid**: YES
- **Server**: `Test_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| Start | s_COMPTIME_Current_Pay_Period |  |
| s_COMPTIME_Load_COMP_TIME_DAILY_TBL | s_COMPTIME_Build_Message_Counters | $s_COMPTIME_Load_COMP_TIME_DAILY_TBL.Status  = Succeeded |
| s_COMPTIME_Current_Pay_Period | s_COMPTIME_Load_COMP_TIME_DAILY_TBL | $s_COMPTIME_Current_Pay_Period.Status = Succeeded |
| s_COMPTIME_Build_Message_Counters | email_COMPTIME_Complete | $s_COMPTIME_Build_Message_Counters.Status = Succeeded |

---

## CPM

- **Repository**: `Test_Repo_Srvc`
- **Folder**: `CPM`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |
| YTD_FILE | VSAM | PC_DOEYTD_RDF.TXT |  | 3 |
| CPM_YTD_STATE_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 |
| MER_FILE | VSAM | PC_DOEMER_RDF.TXT |  | 2 |
| CPM_PM1_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 37 |
| CPM_YTD_DETAIL_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 106 |
| CPM_PM2_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 43 |
| PSEUDOSSN_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 63 |
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 |
| PAYMASTER_THREE | VSAM | PC_DOE_EXP_PMR3.TXT |  | 1 |
| ERROR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 |
| PAYMASTER_FILE | VSAM | PC_DOE_EXP_PMR_RDF.TXT |  | 4 |
| PAD_FILE | VSAM | PC_DOEPAD_RDF.TXT |  | 2 |
| CPM_NEWPAY_STG_TYPE_3_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 242 |
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 |
| CPM_NEWPAY_STG_TYPE_1_2_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 262 |
| CPM_PM3_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 40 |
| CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 246 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| CPM_PAY_PERIOD_DATE_FILE | Flat File | 1 |
| CPM_NEWPAY_STG_ALT_TBL | Oracle | 46 |
| CPM_YTD_HEADER_STG_TBL | Oracle | 7 |
| CPM_YTD_STATE_STG_TBL | Oracle | 8 |
| CPM_YTD_DETAIL_STG_TBL | Oracle | 106 |
| CPM_NEWPAY_STG_YTD_STATE_TBL | Oracle | 19 |
| CPM_MER_DETAIL_STG_TBL | Oracle | 95 |
| CPM_MER_HEADER_STG_TBL | Oracle | 7 |
| CPM_NEWPAY_STG_TYPE_1_2_TBL | Oracle | 262 |
| ERROR_TBL | Oracle | 8 |
| CPM_NEWPAY_STG_DETAIL_TBL | Oracle | 22 |
| CPM_MESSAGE_FILE | Flat File | 2 |
| COUNTER_TBL | Oracle | 7 |
| CPM_PM1_STG_TBL | Oracle | 37 |
| CPM_PM3_STG_TBL | Oracle | 40 |
| CPM_PM2_STG_TBL | Oracle | 43 |
| CPM_PMH_STG_TBL | Oracle | 3 |
| CPM_PAD_HEADER_STG_TBL | Oracle | 8 |
| CPM_PAD_DETAIL_STG_TBL | Oracle | 150 |
| GENERIC_TARGET_FILE | Flat File | 1 |
| CPM_NEWPAY_TBL | Oracle | 499 |
| CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Oracle | 246 |
| CPM_NEWPAY_STG_TYPE_3_TBL | Oracle | 242 |

### Mappings

#### `m_CPM_Current_Pay_Period`

- **Valid**: YES
- **Description**: This mapping returns the Current Pay Period from the Pay Period table.

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Build_Pay_Period | Expression |
| exp_Final | Expression |

#### `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| fil_Error_Message | Filter |
| fil_Bad_Records | Filter |
| nrm_Errors | Normalizer |
| exp_Final_Errors | Expression |
| SQ_CPM_PM3_STG_TBL | Source Qualifier |
| exp_Initial | Expression |
| exp_Final | Expression |
| exp_Determine_Allotments | Expression |
| agg_Allotments | Aggregator |
| exp_Convert | Expression |
| exp_Stage_Converted_Fields | Expression |
| lkp_PSEUDOSSN_TBL | Lookup Procedure |

#### `m_CPM_Load_CPM_YTD_Staging_Tables`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final_YTD_Detail | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| lkp_Pay_Period_Record_Date | Lookup Procedure |
| exp_Convert | Expression |
| exp_Final_YTD_Header | Expression |
| exp_Verify_Header_Date | Expression |
| Norm_YTD_FILE | Normalizer |
| rtr_YTD_Records | Router |
| exp_Initial | Expression |
| exp_Final_YTD_State | Expression |

#### `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Initial | Expression |
| exp_Final | Expression |
| exp_Determine_YTD_States | Expression |
| agg_YTD_State | Aggregator |
| SQ_CPM_YTD_STATE_STG_TBL | Source Qualifier |
| exp_Stage_Converted_Fields | Expression |

#### `m_CPM_Load_CPM_MER_Staging_Tables`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final_MER_Detail | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| lkp_Pay_Period_Record_Date | Lookup Procedure |
| exp_Final_MER_Header | Expression |
| exp_Convert | Expression |
| exp_Verify_Header_Date | Expression |
| exp_Initial | Expression |
| rtr_MER_Records | Router |
| Norm_MER_FILE | Normalizer |

#### `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| fil_Bad_Records | Filter |
| SQ_CPM_YTD_DETAIL_STG_TBL | Source Qualifier |
| SQ_CPM_PM1_STG_TBL | Source Qualifier |
| exp_Convert_TYPE_1_PAD_MER | Expression |
| exp_Final | Expression |
| exp_Initial | Expression |
| fil_Error_Message | Filter |
| exp_Convert_YTD | Expression |
| lkp_CPM_MER_DETAIL_STG_TBL | Lookup Procedure |
| lkp_CPM_PAD_DETAIL_STG_TBL | Lookup Procedure |
| lkp_CPM_NEWPAY_STG_YTD_STATE_TBL | Lookup Procedure |
| exp_Determine_Errors | Expression |
| nrm_Errors | Normalizer |
| exp_Final_Errors | Expression |
| jnr_CPM_YTD | Joiner |
| exp_Initial_YTD | Expression |
| exp_Stage_PAD_MER_Converted_Fields | Expression |
| exp_Stg_YTD_Converted_Fields | Expression |

#### `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Format_Fields | Expression |
| SQ_CPM_PM3_STG_TBL | Source Qualifier |
| agg_PYF_EYE_ID_PP_NUM | Aggregator |
| exp_Initial | Expression |
| exp_Final | Expression |

#### `m_CPM_Build_Message_Counters`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| nrm_Counters_Message | Normalizer |
| exp_Final_Message | Expression |
| exp_Build_Message | Expression |
| lkp_PSEUDOSSN_TBL | Lookup Procedure |
| lkp_CPM_MER_DETAIL_STG_TBL | Lookup Procedure |
| lkp_CPM_PAD_DETAIL_STG_TBL | Lookup Procedure |
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| SQ_ERROR_TBL | Source Qualifier |
| exp_Initial_Input | Expression |
| exp_Initial_CPM | Expression |
| exp_Initial_Errors | Expression |
| jnr_Inputs_CPM | Joiner |
| agg_Count_Inputs | Aggregator |
| agg_Count_CPM | Aggregator |
| exp_Stage_CPM | Expression |
| agg_Count_Errors | Aggregator |
| jnr_Inputs_CPM_Errors | Joiner |
| nrm_Counters | Normalizer |
| exp_Counters | Expression |
| exp_Final_Counters | Expression |
| lkp_CPM_YTD_DETAIL_STG_TBL | Lookup Procedure |
| Norm_PAYMASTER_THREE | Normalizer |
| SQ_CPM_NEWPAY_TBL1 | Source Qualifier |
| exp_Initial_Multiple_Pay_Lines | Expression |
| jnr_Inputs_CPM_Errors_Pay_Lines | Joiner |
| agg_Multiple_Pay_Lines | Aggregator |

#### `m_CPM_Load_CPM_PMR_Staging_Tables`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final_Paymaster_3 | Expression |
| exp_Final_Paymaster_2 | Expression |
| exp_Final_Paymaster_1 | Expression |
| lkp_Pay_Period_Record_Date | Lookup Procedure |
| exp_Initial | Expression |
| exp_Stage | Expression |
| exp_Final_Paymaster_Header | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| Norm_PAYMASTER_FILE | Normalizer |
| exp_Determine_Record_Type | Expression |
| rtr_Paymaster_Records | Router |

#### `m_CPM_Load_CPM_PAD_Staging_Tables`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final_PAD_Detail | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| lkp_Pay_Period_Record_Date | Lookup Procedure |
| exp_Final_PAD_Header | Expression |
| exp_Convert | Expression |
| exp_Verify_Header_Date | Expression |
| Norm_PAD_FILE | Normalizer |
| exp_Determine_Record_Type | Expression |
| rtr_PAD_Records | Router |

#### `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Initial | Expression |
| exp_Final | Expression |
| SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL | Source Qualifier |
| exp_Convert | Expression |

#### `m_Generic_Mapping`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_GENERIC_SRC_TBL | Source Qualifier |

#### `m_CPM_Load_FDR_CPM_NEWPAY_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Initial | Expression |
| exp_Final | Expression |
| SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL | Source Qualifier |
| exp_Convert | Expression |
| lkp_REG_REEMPLED | Lookup Procedure |

#### `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Initial | Expression |
| agg_PYF_EYE_ID_PP_NUM | Aggregator |
| exp_Final | Expression |
| lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL | Lookup Procedure |
| SQ_CPM_PM3_STG_TBL | Source Qualifier |
| exp_Format_Fields | Expression |
| lkp_CPM_NEWPAY_STG_ALT_TBL | Lookup Procedure |
| exp_GEN_SEQ_NUMBER | Expression |
| exp_Double_T38_SUN_DIF_HRS_CPP | Expression |
| exp_Set_REEMP_ANN_CDE | Expression |

#### `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Initial | Expression |
| agg_PYF_EYE_ID_PP_NUM | Aggregator |
| exp_Final | Expression |
| lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL | Lookup Procedure |
| exp_Format_Fields | Expression |
| lkp_CPM_NEWPAY_STG_ALT_TBL | Lookup Procedure |
| SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | Source Qualifier |
| lkp_CPM_NEWPAY_STG_DETAIL_TBL | Lookup Procedure |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL | YES |
| s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | YES |
| s_CPM_Load_FDR_CPM_NEWPAY_TBL | m_CPM_Load_FDR_CPM_NEWPAY_TBL | YES |
| s_CPM_Send_Counts | m_Generic_Mapping | YES |
| s_CPM_Load_CPM_NEWPAY_TBL | m_CPM_Load_PMR_To_CPM_NEWPAY_TBL | YES |
| s_CPM_Load_CPM_PAD_Staging_Tables | m_CPM_Load_CPM_PAD_Staging_Tables | YES |
| s_CPM_Load_CPM_PMR_Staging_Tables | m_CPM_Load_CPM_PMR_Staging_Tables | YES |
| s_CPM_Build_Message_Counters | m_CPM_Build_Message_Counters | YES |
| s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | YES |
| s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | YES |
| s_CPM_Load_CPM_MER_Staging_Tables | m_CPM_Load_CPM_MER_Staging_Tables | YES |
| s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | YES |
| s_CPM_Load_CPM_YTD_Staging_Tables | m_CPM_Load_CPM_YTD_Staging_Tables | YES |
| s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | YES |
| s_CPM_Current_Pay_Period | m_CPM_Current_Pay_Period | YES |

### Workflows

#### `wf_CPM`

- **Valid**: YES
- **Server**: `Test_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL | $s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL.Status = Succeeded |
| s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL | $s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL.Status = Succeeded |
| s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL | s_CPM_Load_FDR_CPM_NEWPAY_TBL | $s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL.Status = Succeeded |
| s_CPM_Build_Message_Counters | s_CPM_Send_Counts | $s_CPM_Build_Message_Counters.Status = Succeeded |
| s_CPM_Load_FDR_CPM_NEWPAY_TBL | s_CPM_Load_CPM_NEWPAY_TBL | $s_CPM_Load_FDR_CPM_NEWPAY_TBL.Status = Succeeded |
| s_CPM_Load_CPM_MER_Staging_Tables | s_CPM_Load_CPM_PAD_Staging_Tables | $s_CPM_Load_CPM_MER_Staging_Tables.Status = Succeeded |
| s_CPM_Load_CPM_YTD_Staging_Tables | s_CPM_Load_CPM_PMR_Staging_Tables | $s_CPM_Load_CPM_YTD_Staging_Tables.Status = Succeeded |
| s_CPM_Load_CPM_NEWPAY_TBL | s_CPM_Build_Message_Counters | $s_CPM_Load_CPM_NEWPAY_TBL.Status = Succeeded |
| s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | $s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL.Status = Succeeded |
| s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL | s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL | $s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL.Status = Succeeded |
| s_CPM_Current_Pay_Period | s_CPM_Load_CPM_MER_Staging_Tables | $s_CPM_Current_Pay_Period.Status = Succeeded |
| s_CPM_Load_CPM_PMR_Staging_Tables | s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | $s_CPM_Load_CPM_PMR_Staging_Tables.Status = Succeeded |
| s_CPM_Load_CPM_PAD_Staging_Tables | s_CPM_Load_CPM_YTD_Staging_Tables | $s_CPM_Load_CPM_PAD_Staging_Tables.Status = Succeeded |
| s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL | s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL | $s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL.Status = Succeeded |
| Start | s_CPM_Current_Pay_Period |  |

---

## CPM_AFPS

- **Repository**: `Test_Repo_Srvc`
- **Folder**: `CPM`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 |
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 |
| ERROR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 |
| CPM_CYCLE_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 5 |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |
| HI_AFPS_FEEDER_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 283 |
| HI_GROSS_EXP_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 12 |
| CPM_PM3_STG_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 40 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| HI_AFPS_FEEDER_TBL | Oracle | 283 |
| HI_GROSS_EXP_TBL | Oracle | 12 |
| CPM_AFPS_MESSAGE_COUNTS_FILE | Flat File | 2 |
| CPM_AFPS_MESSAGE_FILE | Flat File | 2 |
| CPM_AFPS_MESSAGE_COUNTS_TOT_FILE | Flat File | 2 |
| AFPS_COUNTER_TBL | Oracle | 7 |
| GENERIC_TARGET_FILE | Flat File | 1 |
| CPM_AFPS_PAY_PERIOD_FILE | Flat File | 1 |
| CPM_AFPS_CROSSFOOT_FILE | Flat File | 2 |
| CPM_CYCLE_TBL | Oracle | 5 |
| CPM_AFPS_PAY_PERIOD_CAL_FILE | Flat File | 1 |
| feeder_FEEDER_RECORD | PWX_SEQ_NRDB2 | 275 |
| ERROR_TBL | Oracle | 8 |

### Mappings

#### `m_CPM_AFPS_0100_Data_Seperate`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Format_AFPS_Feeder | Expression |
| srt_Sort_By_Payment_Type | Sorter |
| exp_Convert_Calc_Fields | Expression |
| exp_Format_Text_Fields | Expression |

#### `m_CPM_AFPS_0300_Gross_Exp_Report`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Compute_Main | Expression |
| SQ_HI_AFPS_FEEDER_TBL | Source Qualifier |

#### `m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final_Message | Expression |
| SQ_HI_AFPS_FEEDER_TBL | Source Qualifier |
| exp_Initial_Feeder | Expression |
| agg_Gross_Expenditures | Aggregator |
| exp_Counters | Expression |

#### `m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_ERROR_TBL | Source Qualifier |
| exp_Final_Message | Expression |
| exp_Initial_Crossfoot_Errors | Expression |
| SQ_HI_AFPS_FEEDER_TBL | Source Qualifier |
| exp_Initial_Feeder | Expression |
| agg_Gross_Expenditures | Aggregator |
| agg_Crossfoot_Errors | Aggregator |
| jnr_Feeder_Crossfoot | Joiner |
| nrm_Counters | Normalizer |
| exp_Counters | Expression |

#### `m_CPM_AFPS_0800_Build_Message_Counters`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Initial_Feeder | Expression |
| agg_Feeder | Aggregator |
| nrm_Counters_Message | Normalizer |
| exp_Final_Message | Expression |
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Initial_CPM | Expression |
| jnr_Inputs_CPM | Joiner |
| agg_Count_CPM | Aggregator |
| nrm_Counters | Normalizer |
| exp_Counters | Expression |
| exp_Final_Counters | Expression |
| SQ_HI_AFPS_FEEDER_TBL | Source Qualifier |

#### `m_CPM_AFPS_0900_Build_Message`

- **Valid**: YES
- **Description**: This mapping queries the Pay Calendar table for the record marked current and uses that record to build the subject and message for an email message.

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Final | Expression |

#### `m_CPM_AFPS_0760_Concatenate_Crossfoot_Files`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_GENERIC_SRC_TBL | Source Qualifier |

#### `m_CPM_AFPS_1000_Send_Report`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_GENERIC_SRC_TBL | Source Qualifier |

#### `m_CPM_AFPS_0500_Crossfoot_Message_Header`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Build_Message | Expression |
| exp_Final_Message | Expression |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |

#### `m_CPM_AFPS_0820_Build_Message_Totals`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_AFPS_FEEDER_TBL | Source Qualifier |
| exp_Initial_Feeder | Expression |
| agg_Feeder | Aggregator |
| exp_Final_Message | Expression |
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Initial_CPM | Expression |
| jnr_Inputs_CPM | Joiner |
| agg_Count_CPM | Aggregator |
| nrm_Counters | Normalizer |
| exp_Counters | Expression |
| exp_Final_Counters | Expression |

#### `m_CPM_AFPS_0860_Concatenate_Counts_Files`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_GENERIC_SRC_TBL | Source Qualifier |

#### `m_CPM_AFPS_0025_Set_Pay_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Validate_Parameters | Expression |
| lkp_CPM_NEWPAY_TBL | Lookup Procedure |

#### `m_CPM_AFPS_0600_Crossfoot_Message_Details`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final_Message | Expression |
| exp_Initial | Expression |
| exp_Convert | Expression |
| SQ_ERROR_TBL | Source Qualifier |

#### `m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| upd_DFAS_HEADER_TABLE | Update Strategy |
| SQ_CPM_CYCLE_TBL | Source Qualifier |
| exp_Increment_Cycle_ID | Expression |
| exp_Format_Lookup_Current_PAY_PERIOD | Expression |
| lkp_PAY_PERIOD | Lookup Procedure |

#### `m_CPM_AFPS_0010_Set_CPM_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Validate_Parameters | Expression |
| exp_Stage_Parameters | Expression |
| exp_PP_YEAR_NUM | Expression |

#### `m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_AFPS_FEEDER_TBL | Source Qualifier |

#### `m_CPM_AFPS_0400_Crossfoot_Errors`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_GROSS_EXP_TBL | Source Qualifier |
| exp_Format_Message | Expression |
| exp_Join_Tables | Expression |
| lkp_CPM3 | Lookup Procedure |
| SQ_HI_GROSS_EXP_TBL1 | Source Qualifier |
| jnr_Check_For_Records_Not_In_CPM3 | Joiner |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | YES |
| s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | YES |
| s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | YES |
| s_CPM_AFPS_0800_Build_Message_Counters | m_CPM_AFPS_0800_Build_Message_Counters | YES |
| s_CPM_AFPS_0900_Build_Message | m_CPM_AFPS_0900_Build_Message | YES |
| s_CPM_AFPS_0820_Build_Message_Totals | m_CPM_AFPS_0820_Build_Message_Totals | YES |
| s_CPM_AFPS_0010_Set_CPM_Calendar | m_CPM_AFPS_0010_Set_CPM_Calendar | YES |
| s_CPM_AFPS_1000_Send_Report | m_CPM_AFPS_1000_Send_Report | YES |
| s_CPM_AFPS_0100_Data_Seperate | m_CPM_AFPS_0100_Data_Seperate | YES |
| s_CPM_AFPS_0760_Concatenate_Crossfoot_Files | m_CPM_AFPS_0760_Concatenate_Crossfoot_Files | YES |
| s_CPM_AFPS_0025_Set_Pay_Calendar | m_CPM_AFPS_0025_Set_Pay_Calendar | YES |
| s_CPM_AFPS_0860_Concatenate_Counts_Files | m_CPM_AFPS_0860_Concatenate_Counts_Files | YES |
| s_CPM_AFPS_0500_Crossfoot_Message_Header | m_CPM_AFPS_0500_Crossfoot_Message_Header | YES |
| s_CPM_AFPS_0300_Gross_Exp_Report | m_CPM_AFPS_0300_Gross_Exp_Report | YES |
| s_CPM_AFPS_0600_Crossfoot_Message_Details | m_CPM_AFPS_0600_Crossfoot_Message_Details | YES |
| s_CPM_AFPS_0400_Crossfoot_Errors | m_CPM_AFPS_0400_Crossfoot_Errors | YES |
| s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | YES |

### Workflows

#### `wf_CPM_AFPS`

- **Valid**: YES
- **Server**: `Test_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| s_CPM_AFPS_0600_Crossfoot_Message_Details | s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | $s_CPM_AFPS_0600_Crossfoot_Message_Details.Status = Succeeded |
| s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts | s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | $s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts.Status = Succeeded |
| s_CPM_AFPS_0025_Set_Pay_Calendar | s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | $s_CPM_AFPS_0025_Set_Pay_Calendar.Status = Succeeded |
| s_CPM_AFPS_0760_Concatenate_Crossfoot_Files | s_CPM_AFPS_0800_Build_Message_Counters | $s_CPM_AFPS_0760_Concatenate_Crossfoot_Files.Status = Succeeded |
| s_CPM_AFPS_0860_Concatenate_Counts_Files | s_CPM_AFPS_0900_Build_Message | $s_CPM_AFPS_0860_Concatenate_Counts_Files.Status = Succeeded |
| s_CPM_AFPS_0800_Build_Message_Counters | s_CPM_AFPS_0820_Build_Message_Totals | $s_CPM_AFPS_0800_Build_Message_Counters.Status = Succeeded |
| Start | s_CPM_AFPS_0010_Set_CPM_Calendar |  |
| s_CPM_AFPS_0900_Build_Message | s_CPM_AFPS_1000_Send_Report | $s_CPM_AFPS_0900_Build_Message.Status = Succeeded |
| s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL | s_CPM_AFPS_0100_Data_Seperate | $s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL.Status = Succeeded |
| s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend | s_CPM_AFPS_0760_Concatenate_Crossfoot_Files | $s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend.Status = Succeeded |
| s_CPM_AFPS_0010_Set_CPM_Calendar | s_CPM_AFPS_0025_Set_Pay_Calendar | $s_CPM_AFPS_0010_Set_CPM_Calendar.Status = Succeeded |
| s_CPM_AFPS_0820_Build_Message_Totals | s_CPM_AFPS_0860_Concatenate_Counts_Files | $s_CPM_AFPS_0820_Build_Message_Totals.Status = Succeeded |
| s_CPM_AFPS_0400_Crossfoot_Errors | s_CPM_AFPS_0500_Crossfoot_Message_Header | $s_CPM_AFPS_0400_Crossfoot_Errors.Status = Succeeded |
| s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | s_CPM_AFPS_0300_Gross_Exp_Report | $s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT.Status = Succeeded |
| s_CPM_AFPS_0500_Crossfoot_Message_Header | s_CPM_AFPS_0600_Crossfoot_Message_Details | $s_CPM_AFPS_0500_Crossfoot_Message_Header.Status = Succeeded |
| s_CPM_AFPS_0300_Gross_Exp_Report | s_CPM_AFPS_0400_Crossfoot_Errors | $s_CPM_AFPS_0300_Gross_Exp_Report.Status = Succeeded |
| s_CPM_AFPS_0100_Data_Seperate | s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT | $s_CPM_AFPS_0100_Data_Seperate.Status = Succeeded |

---

## CPM_CDC

- **Repository**: `Test_Repo_Srvc`
- **Folder**: `CPM`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| cdchdr_WS_CDC_HDR | PWX_SEQ_NRDB2 | 15 |
| GENERIC_TARGET_FILE | Flat File | 1 |
| CPM_CDC_PAY_PERIOD_FILE | Flat File | 1 |
| cdcskel_WS_PAY_OUT_REC | PWX_SEQ_NRDB2 | 736 |
| CPM_CDC_CPM_PAY_PERIOD_FILE | Flat File | 1 |
| CPM_CDC_MESSAGE_FILE | Flat File | 2 |

### Mappings

#### `m_CPM_CDC_Load_CPM_CDC_Header_File`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| exp_Initial | Expression |
| SQ_PAY_PERIOD | Source Qualifier |

#### `m_CPM_CDC_Concatenate_Files`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_GENERIC_SRC_TBL | Source Qualifier |

#### `m_CPM_CDC_Set_Pay_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Validate_Parameters | Expression |
| lkp_CPM_NEWPAY_TBL | Lookup Procedure |

#### `m_CPM_CDC_Load_CPM_CDC_Data_File`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Set_Defaults | Expression |
| exp_Init | Expression |
| exp_Final | Expression |
| exp_Convert | Expression |

#### `m_CPM_CDC_Set_CPM_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Final | Expression |
| exp_Validate_Parameters | Expression |

#### `m_CPM_CDC_Build_Message`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Build_Message | Expression |
| exp_Final | Expression |
| exp_Initial | Expression |
| agg_Count_CPM_CDC | Aggregator |
| lkp_Pay_Period_Total | Lookup Procedure |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_CPM_CDC_Set_CPM_Calendar | m_CPM_CDC_Set_CPM_Calendar | YES |
| s_CPM_CDC_Load_CPM_CDC_Data_File | m_CPM_CDC_Load_CPM_CDC_Data_File | YES |
| s_CPM_CDC_Set_Pay_Calendar | m_CPM_CDC_Set_Pay_Calendar | YES |
| s_CPM_CDC_Concatenate_Files | m_CPM_CDC_Concatenate_Files | YES |
| s_CPM_CDC_Load_CPM_CDC_Header_File | m_CPM_CDC_Load_CPM_CDC_Header_File | YES |
| s_CPM_CDC_Build_Message | m_CPM_CDC_Build_Message | YES |

### Workflows

#### `wf_CPM_CDC`

- **Valid**: YES
- **Server**: `Test_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| Start | s_CPM_CDC_Set_CPM_Calendar |  |
| s_CPM_CDC_Load_CPM_CDC_Header_File | s_CPM_CDC_Load_CPM_CDC_Data_File | $s_CPM_CDC_Load_CPM_CDC_Header_File.Status = Succeeded |
| s_CPM_CDC_Set_CPM_Calendar | s_CPM_CDC_Set_Pay_Calendar | $s_CPM_CDC_Set_CPM_Calendar.Status = Succeeded |
| s_CPM_CDC_Load_CPM_CDC_Data_File | s_CPM_CDC_Concatenate_Files | $s_CPM_CDC_Load_CPM_CDC_Data_File.Status = Succeeded |
| s_CPM_CDC_Build_Message | email_CPM_CDC | $s_CPM_CDC_Build_Message.Status = Succeeded |
| s_CPM_CDC_Set_Pay_Calendar | s_CPM_CDC_Load_CPM_CDC_Header_File | $s_CPM_CDC_Set_Pay_Calendar.Status = Succeeded |
| s_CPM_CDC_Concatenate_Files | s_CPM_CDC_Build_Message | $s_CPM_CDC_Concatenate_Files.Status = Succeeded |

---

## CPM_NIH

- **Repository**: `Test_Repo_Srvc`
- **Folder**: `CPM`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 |
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| CPM_NIH_MESSAGE_FILE | Flat File | 2 |
| nihhdr_WS_NIH_HDR | PWX_SEQ_NRDB2 | 18 |
| nihtest_NIH_PAYROLL_MASTER | PWX_SEQ_NRDB2 | 534 |
| CPM_NIH_CPM_PAY_PERIOD_FILE | Flat File | 1 |
| GENERIC_TARGET_FILE | Flat File | 1 |
| CPM_NIH_PAY_PERIOD_FILE | Flat File | 1 |

### Mappings

#### `m_CPM_NIH_Build_Message`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| lkp_Pay_Period_Total | Lookup Procedure |
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Build_Message | Expression |
| exp_Final | Expression |
| exp_Initial | Expression |
| agg_Count_CPM_NIH | Aggregator |

#### `m_CPM_NIH_Load_CPM_NIH_Header_File`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Final | Expression |
| exp_Initial | Expression |

#### `m_CPM_NIH_Load_CPM_NIH_Data_File`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Set_Defaults | Expression |
| exp_Init | Expression |
| exp_Final | Expression |
| exp_Convert | Expression |

#### `m_CPM_NIH_Set_CPM_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Validate_Parameters | Expression |

#### `m_CPM_NIH_Concatenate_Files`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_GENERIC_SRC_TBL | Source Qualifier |

#### `m_CPM_NIH_Set_Pay_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Validate_Parameters | Expression |
| lkp_CPM_NEWPAY_TBL | Lookup Procedure |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_CPM_NIH_Set_Pay_Calendar | m_CPM_NIH_Set_Pay_Calendar | YES |
| s_CPM_NIH_Concatenate_Files | m_CPM_NIH_Concatenate_Files | YES |
| s_CPM_NIH_Set_CPM_Calendar | m_CPM_NIH_Set_CPM_Calendar | YES |
| s_CPM_NIH_Load_CPM_NIH_Data_File | m_CPM_NIH_Load_CPM_NIH_Data_File | YES |
| s_CPM_NIH_Load_CPM_NIH_Header_File | m_CPM_NIH_Load_CPM_NIH_Header_File | YES |
| s_CPM_NIH_Build_Message | m_CPM_NIH_Build_Message | YES |

### Workflows

#### `wf_CPM_NIH`

- **Valid**: YES
- **Server**: `Test_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| s_CPM_NIH_Set_CPM_Calendar | s_CPM_NIH_Set_Pay_Calendar | $s_CPM_NIH_Set_CPM_Calendar.Status = Succeeded |
| s_CPM_NIH_Build_Message | email_CPM_NIH | $s_CPM_NIH_Build_Message.Status = Succeeded |
| s_CPM_NIH_Load_CPM_NIH_Data_File | s_CPM_NIH_Concatenate_Files | $s_CPM_NIH_Load_CPM_NIH_Data_File.Status = Succeeded |
| Start | s_CPM_NIH_Set_CPM_Calendar |  |
| s_CPM_NIH_Load_CPM_NIH_Header_File | s_CPM_NIH_Load_CPM_NIH_Data_File | $s_CPM_NIH_Load_CPM_NIH_Header_File.Status = Succeeded |
| s_CPM_NIH_Set_Pay_Calendar | s_CPM_NIH_Load_CPM_NIH_Header_File | $s_CPM_NIH_Set_Pay_Calendar.Status = Succeeded |
| s_CPM_NIH_Concatenate_Files | s_CPM_NIH_Build_Message | $s_CPM_NIH_Concatenate_Files.Status = Succeeded |

---

## CPM_OIG

- **Repository**: `Test_Repo_Srvc`
- **Folder**: `CPM`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |
| CPM_NEWPAY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 501 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| CPM_OIG_MESSAGE_FILE | Flat File | 2 |
| CPM_OIG_PAY_PERIOD_FILE | Flat File | 1 |
| CPM_OIG_CPM_PAY_PERIOD_FILE | Flat File | 1 |
| oigsgndec_SKPAYROLL_MASTER | PWX_SEQ_NRDB2 | 287 |

### Mappings

#### `m_CPM_OIG_Build_Message`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Build_Message | Expression |
| exp_Final | Expression |
| exp_Initial | Expression |
| agg_Count_CPM_OIG | Aggregator |

#### `m_CPM_OIG_Set_Pay_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Validate_Parameters | Expression |
| exp_Set_Current_Pay_Period_Param | Expression |
| lkp_CPM_NEWPAY_TBL | Lookup Procedure |
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |

#### `m_CPM_OIG_Set_CPM_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Validate_Parameters | Expression |
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |

#### `m_CPM_OIG_Load_CPM_OIG_File`

- **Valid**: YES
- **Description**: 10/31/2018 MS: Changed the field Base Hrs in the transformation exp_Convert to ensure the absolute value of Base Hrs is passed to the target.

| Transformation Name | Type |
|-------------------|------|
| SQ_CPM_NEWPAY_TBL | Source Qualifier |
| exp_Set_Defaults | Expression |
| exp_Init | Expression |
| exp_Final | Expression |
| UPDTRANS | Update Strategy |
| exp_Convert | Expression |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_CPM_OIG_Load_CPM_OIG_File | m_CPM_OIG_Load_CPM_OIG_File | YES |
| s_CPM_OIG_Set_CPM_Calendar | m_CPM_OIG_Set_CPM_Calendar | YES |
| s_CPM_OIG_Set_Pay_Calendar | m_CPM_OIG_Set_Pay_Calendar | YES |
| s_CPM_OIG_Build_Message | m_CPM_OIG_Build_Message | YES |

### Workflows

#### `wf_CPM_OIG`

- **Valid**: YES
- **Server**: `Test_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| s_CPM_OIG_Set_Pay_Calendar | s_CPM_OIG_Load_CPM_OIG_File | $s_CPM_OIG_Set_Pay_Calendar.Status = Succeeded |
| s_CPM_OIG_Build_Message | email_CPM_OIG | $s_CPM_OIG_Build_Message.Status = Succeeded |
| Start | s_CPM_OIG_Set_CPM_Calendar |  |
| s_CPM_OIG_Set_CPM_Calendar | s_CPM_OIG_Set_Pay_Calendar | $s_CPM_OIG_Set_CPM_Calendar.Status = Succeeded |
| s_CPM_OIG_Load_CPM_OIG_File | s_CPM_OIG_Build_Message | $s_CPM_OIG_Load_CPM_OIG_File.Status = Succeeded |

---

## EHRP2BIIS_UPDATE

- **Repository**: `Prd_Repo_Srvc`
- **Folder**: `EHRP2BIIS`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| NWK_NEW_EHRP_ACTIONS_TBL | Oracle | ORA_BIISPRD_SRC | NKNIGHT | 4 |
| PS_GVT_JOB | Oracle | ORA_BIISPRD_SRC | EHRP | 246 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| EHRP_RECS_TRACKING_TBL | Oracle | 10 |
| NWK_ACTION_PRIMARY_TBL | Oracle | 260 |
| NWK_ACTION_SECONDARY_TBL | Oracle | 209 |

### Mappings

#### `m_EHRP2BIIS_UPDATE`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_GET_EFFDT_YEAR | Expression |
| lkp_OLD_SEQUENCE_NUMBER | Lookup Procedure |
| SQ_PS_GVT_JOB | Source Qualifier |
| lkp_PS_GVT_EMPLOYMENT | Lookup Procedure |
| lkp_PS_GVT_PERS_NID | Lookup Procedure |
| exp_MAIN2BIIS | Expression |
| lkp_PS_GVT_AWD_DATA | Lookup Procedure |
| lkp_PS_GVT_EE_DATA_TRK | Lookup Procedure |
| lkp_PS_HE_FILL_POS | Lookup Procedure |
| lkp_PS_GVT_CITIZENSHIP | Lookup Procedure |
| lkp_PS_GVT_PERS_DATA | Lookup Procedure |
| exp_PERS_DATA | Expression |
| lkp_PS_JPM_JP_ITEMS | Lookup Procedure |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_m_EHRP2BIIS_UPDATE | m_EHRP2BIIS_UPDATE | YES |

### Workflows

#### `wf_EHRP2BIIS_UPDATE`

- **Valid**: YES
- **Server**: `Prd_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| Start | s_m_EHRP2BIIS_UPDATE |  |

---

## FDA_Leave

- **Repository**: `Test_Repo_Srvc`
- **Folder**: `CPM`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| HI_GENERIC_SRC_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 1 |
| HI_PM_FDA_TATRAN_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 |
| ERROR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 |
| CPM_CYCLE_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 5 |
| HI_PM_FDA_TATRAN_FLAT_FILE_NAME | Flat File | ORA_BIIS | INFO_TARGET_DEV | 7 |
| HI_PM_FDA_TATRAN_FLAT | Flat File | ORA_BIIS | INFO_TARGET_DEV | 6 |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| ERROR_TBL | Oracle | 8 |
| HI_PM_FDA_TATRAN_FLAT | Flat File | 6 |
| CPM_FDA_CPM_PAY_PERIOD_FILE | Flat File | 1 |
| GENERIC_TARGET_FILE | Flat File | 1 |
| FDA_EXTRACT_MESSAGE_FILE | Flat File | 2 |
| COUNTER_TBL | Oracle | 7 |
| CPM_CYCLE_TBL | Oracle | 5 |
| HI_PM_FDA_TATRAN_TBL | Oracle | 8 |
| CPM_FDA_PAY_PERIOD_FILE | Flat File | 1 |

### Mappings

#### `m_0150_PM_FDA_Error_Counter`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Format_YTD | Expression |
| lkp_CPM_YTD_DETAIL_STG_TBL | Lookup Procedure |
| SQ_HI_PM_FDA_TATRAN_TBL11 | Source Qualifier |
| exp_Format_Get_Current_PP11 | Expression |
| lkp_PAY_PERIOD11 | Lookup Procedure |
| exp_Format_PAD | Expression |
| fil_Errors_PAD | Filter |
| lkp_CPM_PAD_DETAIL_STG_TBL | Lookup Procedure |
| fil_Errors_MER | Filter |
| lkp_CPM_MER_DETAIL_STG_TBL | Lookup Procedure |
| exp_Format_MER | Expression |
| lkp_CPM_NEWPAY_TBL | Lookup Procedure |
| exp_Format_CPM | Expression |
| fil_Errors_CPM | Filter |
| fil_Errors_YTD | Filter |

#### `m_0300_PM_FDA_Create_Output_File`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_PM_FDA_TATRAN_TBL | Source Qualifier |
| exp_Convert_Minutes_REPLACESTR | Expression |

#### `m_0020_PM_FDA_Set_CPM_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Validate_Parameters | Expression |

#### `m_1100_PM_FDA_Send_Email`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_GENERIC_SRC_TBL | Source Qualifier |

#### `m_0200_PM_FDA_Create_Insert_200_Rows`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_HI_PM_FDA_TATRAN_TBL | Source Qualifier |
| exp_Format_200_Records | Expression |
| nrm_Normalize_200_Records | Normalizer |
| lkp_CPM_MER_DETAIL_STG_TBL | Lookup Procedure |
| exp_Set_PP | Expression |
| lkp_PAY_PERIOD | Lookup Procedure |
| lkp_CPM_PAD_DETAIL_STG_TBL | Lookup Procedure |
| lkp_CPM_YTD_DETAIL_STG_TBL | Lookup Procedure |
| fil_Filter_Out_NULL | Filter |
| lkp_PSEUDOSSN | Lookup Procedure |
| lkp_CPM_NEWPAY_TBL | Lookup Procedure |

#### `m_0500_PM_FDA_IO_Counter`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| nrm_Counters_Message | Normalizer |
| exp_Counters1 | Expression |
| SQ_HI_PM_FDA_TATRAN_TBL | Source Qualifier |
| fil_Leave_Records | Filter |
| agg_All_Leave_Recs | Aggregator |
| exp_Leave_Rec_Count | Expression |
| lkp_Curr_Pay_Period | Lookup Procedure |
| exp_Counters | Expression |
| lkp_Count_HI_PM_FDA_TATRAN_TBL_READ | Lookup Procedure |
| nrm_Counters | Normalizer |
| exp_Final_Rec_Insert | Expression |
| exp_Build_Message | Expression |
| exp_Final_Message | Expression |
| lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL | Lookup Procedure |
| agg_Error_Records | Aggregator |
| exp_Error_Count | Expression |
| jnr_All_Counts | Joiner |
| SQ_ERROR_TBL | Source Qualifier |
| exp_Initial_Error | Expression |

#### `m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Increment_Cycle_ID | Expression |
| exp_Format_Lookup_Current_PAY_PERIOD | Expression |
| lkp_PAY_PERIOD | Lookup Procedure |
| upd_DFAS_HEADER_TABLE | Update Strategy |
| SQ_CPM_CYCLE_TBL | Source Qualifier |

#### `m_0010_PM_FDA_Verify_File`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| exp_Initial | Expression |
| exp_Validate_Parameters | Expression |
| lkp_CPM_NEWPAY_TBL | Lookup Procedure |
| SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME | Source Qualifier |
| agg_Count_Number_of_Files | Aggregator |
| EXPTRANS | Expression |
| srt_Distinct_File_Names | Sorter |

#### `m_0100_PM_FDA_Load_TATRAN_To_DB`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Add_FDA_SEQ | Expression |
| SQ_HI_PM_FDA_TATRAN_FLAT | Source Qualifier |
| fil_Filter_Out_01_99 | Filter |
| srt_Sort_By_BATCH_SEQ | Sorter |

#### `m_0025_PM_FDA_Set_Pay_Calendar`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Validate_Parameters | Expression |
| lkp_CPM_NEWPAY_TBL | Lookup Procedure |
| exp_Stage_Parameters | Expression |
| exp_Final | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Set_Parameters | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_0025_PM_FDA_Set_Pay_Calendar | m_0025_PM_FDA_Set_Pay_Calendar | YES |
| s_0100_PM_FDA_Load_TATRAN_To_DB | m_0100_PM_FDA_Load_TATRAN_To_DB | YES |
| s_0010_PM_FDA_Verify_File | m_0010_PM_FDA_Verify_File | YES |
| s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | YES |
| s_0500_PM_FDA_IO_Counter | m_0500_PM_FDA_IO_Counter | YES |
| s_0200_PM_FDA_Create_200_Rows | m_0200_PM_FDA_Create_Insert_200_Rows | YES |
| s_1100_PM_FDA_Send_Email | m_1100_PM_FDA_Send_Email | YES |
| s_0020_PM_FDA_Set_CPM_Calendar | m_0020_PM_FDA_Set_CPM_Calendar | YES |
| s_0300_PM_FDA_Create_Output_File | m_0300_PM_FDA_Create_Output_File | YES |
| s_0150_PM_FDA_Error_Counter | m_0150_PM_FDA_Error_Counter | YES |

### Workflows

#### `wf_FDA_Leave`

- **Valid**: YES
- **Server**: `Test_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| s_0020_PM_FDA_Set_CPM_Calendar | s_0025_PM_FDA_Set_Pay_Calendar | $s_0020_PM_FDA_Set_CPM_Calendar.Status = Succeeded |
| s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | s_0100_PM_FDA_Load_TATRAN_To_DB | $s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA.Status = Succeeded |
| Start | s_0010_PM_FDA_Verify_File |  |
| s_0025_PM_FDA_Set_Pay_Calendar | s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA | $s_0025_PM_FDA_Set_Pay_Calendar.Status = Succeeded |
| s_0300_PM_FDA_Create_Output_File | s_0500_PM_FDA_IO_Counter | $s_0300_PM_FDA_Create_Output_File.Status = Succeeded |
| s_0150_PM_FDA_Error_Counter | s_0200_PM_FDA_Create_200_Rows | $s_0150_PM_FDA_Error_Counter.Status = Succeeded |
| s_0500_PM_FDA_IO_Counter | s_1100_PM_FDA_Send_Email | $s_0500_PM_FDA_IO_Counter.Status = Succeeded |
| s_0010_PM_FDA_Verify_File | s_0020_PM_FDA_Set_CPM_Calendar | $s_0010_PM_FDA_Verify_File.Status = Succeeded |
| s_0200_PM_FDA_Create_200_Rows | s_0300_PM_FDA_Create_Output_File | $s_0200_PM_FDA_Create_200_Rows.Status = Succeeded |
| s_0100_PM_FDA_Load_TATRAN_To_DB | s_0150_PM_FDA_Error_Counter | $s_0100_PM_FDA_Load_TATRAN_To_DB.Status = Succeeded |

---

## LES

- **Repository**: `Prd_Repo_Srvc`
- **Folder**: `LES`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| LES_EMP_DETAIL_LEAVE_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 15 |
| LES_EMP_DETAIL_RECTYPE_T_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 |
| LES_EMP_DETAIL_RECTYPE_M_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 6 |
| LES_EMP_DETAIL_RECTYPE_D_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 13 |
| LES_EMP_DETAIL_RECTYPE_U_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 11 |
| LES_EMP_DETAIL_RECTYPE_L_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 15 |
| LES_EMP_DETAIL_RECTYPE_R_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 14 |
| LES_EMPLOYEE_DETAIL | Flat File | FlatFile |  | 5 |
| LES_EMP_DETAIL_RECTYPE_C_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 14 |
| LES_NIH_EMPLOYEE_SUMMARY_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 4 |
| ERROR_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 7 |
| LES_PRIMARY_DATA_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 90 |
| EMP_REC_TYPE_D | VSAM | EMP_REC_TYPE_D.TXT |  | 1 |
| PAY_PERIOD | Oracle | ORA_BIIS | INFO_TARGET_DEV | 10 |
| EMP_REC_TYPE_2 | VSAM | EMP_REC_TYPE_2.TXT |  | 1 |
| EMP_REC_TYPE_T | VSAM | EMP_REC_TYPE_T.TXT |  | 1 |
| LES_EMP_DETAIL_RECTYPE_4_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 17 |
| LES_EMP_DETAIL_RECTYPE_2_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 17 |
| LES_EMP_DETAIL_RECTYPE_1_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 21 |
| LES_EMP_DETAIL_RECTYPE_3_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 21 |
| LES_EMP_DETAIL_RECTYPE_6_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 8 |
| LES_EMP_DETAIL_RECTYPE_5_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 18 |
| EMP_REC_TYPE_3 | VSAM | EMP_REC_TYPE_3.TXT |  | 1 |
| EMP_REC_TYPE_0 | VSAM | EMP_REC_TYPE_0.TXT |  | 1 |
| EMP_REC_TYPE_5 | VSAM | EMP_REC_TYPE_5.TXT |  | 1 |
| EMP_REC_TYPE_1 | VSAM | EMP_REC_TYPE_1.TXT |  | 1 |
| EMP_REC_TYPE_4 | VSAM | EMP_REC_TYPE_4.TXT |  | 1 |
| LES_HEADER_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 7 |
| EMP_REC_TYPE_E | VSAM | EMP_REC_TYPE_E.TXT |  | 1 |
| EMP_REC_TYPE_R | VSAM | EMP_REC_TYPE_R.TXT |  | 1 |
| EMP_REC_TYPE_U | VSAM | EMP_REC_TYPE_U.TXT |  | 1 |
| EMP_REC_TYPE_L | VSAM | EMP_REC_TYPE_L.TXT |  | 1 |
| EMP_REC_TYPE_6 | VSAM | EMP_REC_TYPE_6.TXT |  | 1 |
| EMP_REC_TYPE_M | VSAM | EMP_REC_TYPE_M.TXT |  | 1 |
| LES_EMP_DETAIL_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 5 |
| EMP_REC_TYPE_C | VSAM | EMP_REC_TYPE_C.TXT |  | 1 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| LESL | Oracle | 22 |
| LEST | Oracle | 16 |
| LESM | Oracle | 14 |
| LESD | Oracle | 21 |
| LESS | Oracle | 91 |
| LESU | Oracle | 19 |
| LESC | Oracle | 22 |
| LESR | Oracle | 22 |
| LES_HEADER_FILE | Flat File | 3 |
| LES_TOTALS_FILE | Flat File | 2 |
| LES_EMP_DETAIL_LEAVE_TBL | Oracle | 15 |
| LES_EMP_DETAIL_RETRO_EARN_TBL | Oracle | 8 |
| LES_NIH_EMPLOYEE_DETAIL | Flat File | 5 |
| LES_NIH_EMPLOYEE_SUMMARY_TBL | Oracle | 4 |
| LES_EMP_DETAIL_CURR_EARN_TBL | Oracle | 8 |
| COUNTER_TBL | Oracle | 7 |
| LES_MESSAGE_FILE | Flat File | 2 |
| LES_EMP_DETAIL_RECTYPE_D_TBL | Oracle | 13 |
| LES_PAY_PERIOD_DATE_FILE | Flat File | 1 |
| LES_EMP_DETAIL_RECTYPE_2_TBL | Oracle | 17 |
| LES_EMP_DETAIL_RECTYPE_T_TBL | Oracle | 8 |
| LES_PRIMARY_DATA_TBL | Oracle | 90 |
| LES_EMP_DETAIL_RECTYPE_3_TBL | Oracle | 21 |
| LES_HEADER_TBL | Oracle | 7 |
| LES_EMP_DETAIL_RECTYPE_5_TBL | Oracle | 18 |
| LES_EMP_DETAIL_RECTYPE_1_TBL | Oracle | 21 |
| LES_EMP_DETAIL_RECTYPE_4_TBL | Oracle | 17 |
| ERROR_TBL | Oracle | 7 |
| LES_EMP_DETAIL_TBL | Oracle | 5 |
| LES_EMP_DETAIL_RECTYPE_R_TBL | Oracle | 14 |
| LES_EMP_DETAIL_RECTYPE_U_TBL | Oracle | 11 |
| LES_EMP_DETAIL_RECTYPE_L_TBL | Oracle | 15 |
| LES_EMP_DETAIL_RECTYPE_6_TBL | Oracle | 8 |
| LES_EMP_DETAIL_RECTYPE_M_TBL | Oracle | 6 |
| LES_EMP_DETAIL_RECTYPE_C_TBL | Oracle | 14 |

### Mappings

#### `m_LESRPT_Load_LESL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_EMP_DETAIL_LEAVE_TBL | Source Qualifier |
| exp_Initial | Expression |
| exp_Final | Expression |
| lkp_LESL_KEY | Lookup Procedure |

#### `m_LESRPT_Load_LEST`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SEQTRANS | Sequence |
| exp_Final | Expression |
| exp_Initial | Expression |
| SQ_LES_EMP_DETAIL_RECTYPE_T_TBL | Source Qualifier |
| lkp_LEST_KEY | Lookup Procedure |

#### `m_LESRPT_Load_LESM`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_EMP_DETAIL_RECTYPE_M_TBL | Source Qualifier |
| exp_Initial | Expression |
| exp_Final | Expression |
| lkp_LESM_KEY | Lookup Procedure |

#### `m_LESRPT_Load_LESD`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_EMP_DETAIL_RECTYPE_D_TBL | Source Qualifier |
| exp_Final | Expression |
| exp_Initial | Expression |
| SEQTRANS | Sequence |
| lkp_MAX_LESD_KEY | Lookup Procedure |

#### `m_LESRPT_Load_LESS`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_PRIMARY_DATA_TBL | Source Qualifier |
| exp_Final | Expression |
| exp_Initial | Expression |
| lkp_MAX_LESS_KEY | Lookup Procedure |

#### `m_LESRPT_Load_LESU`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_EMP_DETAIL_RECTYPE_U_TBL | Source Qualifier |
| exp_Final | Expression |
| exp_Initial | Expression |
| SEQTRANS | Sequence |
| lkp_LESU_KEY | Lookup Procedure |

#### `m_LESRPT_Load_LESC`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_EMP_DETAIL_RECTYPE_C_TBL | Source Qualifier |
| exp_Final | Expression |
| exp_Initial | Expression |
| SEQTRANS | Sequence |
| lkp_LESC_KEY | Lookup Procedure |

#### `m_LESRPT_Load_LESR`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SEQTRANS | Sequence |
| lkp_LESR_KEY | Lookup Procedure |
| SQ_LES_EMP_DETAIL_RECTYPE_R_TBL | Source Qualifier |
| exp_Final | Expression |
| exp_Initial | Expression |

#### `m_LES_Verify_Header`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| lkp_Pay_Period_Record_Date | Lookup Procedure |
| fil_LES_HEADER | Filter |
| exp_Convert | Expression |
| Norm_EMP_REC_TYPE_0 | Normalizer |
| exp_Final | Expression |
| exp_Stage | Expression |
| exp_Verify_Header_Date | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |

#### `m_LES_Verify_Record_Count`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| fil_LES_Records | Filter |
| exp_Convert | Expression |
| exp_Final | Expression |
| exp_Stage | Expression |
| exp_Verify_Header_Date | Expression |
| Norm_EMP_REC_TYPE_E | Normalizer |
| fil_Trailer_Records | Filter |

#### `m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_EMP_DETAIL_RECTYPE_L_TBL | Source Qualifier |
| exp_Initial | Expression |
| exp_Final | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| fil_Remove_Blank_Retroactive_Earnings | Filter |
| exp_Initial | Expression |
| nrm_EMP_RETRO_EARN | Normalizer |
| exp_Convert | Expression |
| exp_Final | Expression |
| SQ_LES_EMP_DETAIL_RECTYPE_R_TBL | Source Qualifier |

#### `m_LES_NIH_FILE`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| lkp_Current_Pay_Period | Lookup Procedure |
| fil_NIH_Records | Filter |
| lkp_PSEUDOSSN_TBL | Lookup Procedure |
| exp_Initial | Expression |
| fil_Header_Trailer | Filter |
| exp_Flag_NIH_Record | Expression |
| SQ_LES_EMPLOYEE_DETAIL | Source Qualifier |
| fil_NIH_EMPLOYEE_DETAIL | Filter |
| exp_Final | Expression |
| exp_Set_Curr_Flag | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| SQ_LES_EMP_DETAIL_RECTYPE_C_TBL | Source Qualifier |
| exp_Initial | Expression |
| nrm_EMP_CURR_EARN | Normalizer |
| fil_Remove_Blank_Current_Earnings | Filter |
| exp_Convert | Expression |

#### `m_LES_Build_Message_Counters`

- **Valid**: YES
- **Description**: This mapping creates counters and builds the subject and message for an email message.

| Transformation Name | Type |
|-------------------|------|
| jnr_Input_Loaded_NIH_Errors | Joiner |
| exp_Counters | Expression |
| exp_Final_Counters | Expression |
| exp_Stage_Counters | Expression |
| exp_Pay_Period | Expression |
| SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL | Source Qualifier |
| lkp_Current_Pay_Period | Lookup Procedure |
| nrm_Counters | Normalizer |
| SQ_ERROR_TBL | Source Qualifier |
| Norm_EMP_REC_TYPE_E | Normalizer |
| fil_EMPLOYEE_DETAIL | Filter |
| exp_Build_Message | Expression |
| exp_Final_Message | Expression |
| exp_Init_Inputs | Expression |
| agg_Count_Input_Records | Aggregator |
| SQ_LES_PRIMARY_DATA_TBL | Source Qualifier |
| exp_Init_Loaded_Records | Expression |
| agg_Count_Loaded_Records | Aggregator |
| exp_Init_Errors | Expression |
| agg_Count_Error_Records | Aggregator |
| exp_Input_Counters | Expression |
| exp_Loaded_Counters | Expression |
| exp_Init_NIH | Expression |
| agg_Count_NIH_Records | Aggregator |
| exp_NIH_Counters | Expression |
| exp_Error_Count | Expression |
| jnr_Inputs_Loaded | Joiner |
| jnr_Inputs_Loaded_NIH | Joiner |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| Norm_EMP_REC_TYPE_D | Normalizer |
| fil_EMP_REC_TYPE_D_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_D | Filter |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |

#### `m_LES_Current_Pay_Period`

- **Valid**: YES
- **Description**: This mapping returns the Current Pay Period from the Pay Period table.

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Build_Pay_Period | Expression |
| exp_Final | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| fil_EMP_REC_TYPE_2_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_2 | Filter |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |
| Norm_EMP_REC_TYPE_2 | Normalizer |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| fil_EMP_REC_TYPE_T_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_T | Filter |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |
| Norm_EMP_REC_TYPE_T | Normalizer |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |

#### `m_LES_Load_LES_PRIMARY_DATA_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| exp_Stage | Expression |
| lkp_PSEUDOSSN | Lookup Procedure |
| exp_Final | Expression |
| lkp_Pay_Period | Lookup Procedure |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| exp_Initial | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| Norm_EMP_REC_TYPE_3 | Normalizer |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| fil_EMP_REC_TYPE_3_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_3 | Filter |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |

#### `m_LES_Load_LES_HEADER_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| lkp_Pay_Period_Record_Date | Lookup Procedure |
| fil_LES_HEADER | Filter |
| exp_Convert | Expression |
| Norm_EMP_REC_TYPE_0 | Normalizer |
| exp_Final | Expression |
| exp_Stage | Expression |
| fil_First_Header_Record | Filter |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| Norm_EMP_REC_TYPE_5 | Normalizer |
| fil_EMP_REC_TYPE_5_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_5 | Filter |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| fil_EMP_REC_TYPE_1_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| Norm_EMP_REC_TYPE_1 | Normalizer |
| fil_EMP_REC_TYPE_1 | Filter |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| Norm_EMP_REC_TYPE_4 | Normalizer |
| fil_EMP_REC_TYPE_4_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_4 | Filter |
| jnr_LES_NUMBER | Joiner |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| exp_Final | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_HEADER_TBL | Source Qualifier |
| jnr_HEADER_EMP_DETAILS | Joiner |
| exp_HEADER | Expression |
| fil_EMPLOYEE_DETAIL | Filter |
| exp_FINAL | Expression |
| exp_Convert | Expression |
| Norm_EMP_REC_TYPE_E | Normalizer |
| lkp_PSEUDSSN_TBL | Lookup Procedure |
| exp_STAGE | Expression |
| exp_CHECK_ERRORS | Expression |
| rtr_GOOD_BAD_RECORDS | Router |
| exp_FINAL_ERRORS | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| Norm_EMP_REC_TYPE_R | Normalizer |
| fil_EMP_REC_TYPE_R_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_R | Filter |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| fil_EMP_REC_TYPE_U_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_U | Filter |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |
| Norm_EMP_REC_TYPE_U | Normalizer |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| Norm_EMP_REC_TYPE_L | Normalizer |
| fil_EMP_REC_TYPE_L_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_L | Filter |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| fil_EMP_REC_TYPE_6 | Filter |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |
| Norm_EMP_REC_TYPE_6 | Normalizer |
| fil_EMP_REC_TYPE_6_EMP_DETAIL | Filter |
| exp_Convert | Expression |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| Norm_EMP_REC_TYPE_M | Normalizer |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| fil_EMP_REC_TYPE_M_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| exp_Final | Expression |
| fil_EMP_REC_TYPE_M | Filter |
| jnr_LES_NUMBER | Joiner |

#### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL`

- **Valid**: YES
- **Description**: (none)

| Transformation Name | Type |
|-------------------|------|
| Norm_EMP_REC_TYPE_C | Normalizer |
| fil_EMP_REC_TYPE_C_EMP_DETAIL | Filter |
| exp_Convert | Expression |
| fil_EMP_REC_TYPE_C | Filter |
| SQ_LES_EMP_DETAIL_TBL | Source Qualifier |
| jnr_LES_NUMBER | Joiner |
| exp_Final | Expression |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_TBL | m_LES_Load_LES_EMP_DETAIL_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | YES |
| s_LES_Load_LES_HEADER_TBL | m_LES_Load_LES_HEADER_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | YES |
| s_LES_Load_LES_PRIMARY_DATA_TBL | m_LES_Load_LES_PRIMARY_DATA_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | YES |
| s_LES_Current_Pay_Period | m_LES_Current_Pay_Period | YES |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | YES |
| s_LES_Build_Message_Counters | m_LES_Build_Message_Counters | YES |
| s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | YES |
| s_LES_NIH_FILE | m_LES_NIH_FILE | YES |
| s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | YES |
| s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | YES |
| s_LES_Verify_Record_Count | m_LES_Verify_Record_Count | YES |
| s_LES_Verify_Header | m_LES_Verify_Header | YES |
| s_LESRPT_Load_LESR | m_LESRPT_Load_LESR | YES |
| s_LESRPT_Load_LESC | m_LESRPT_Load_LESC | YES |
| s_LESRPT_Load_LESU | m_LESRPT_Load_LESU | YES |
| s_LESRPT_Load_LESS | m_LESRPT_Load_LESS | YES |
| s_LESRPT_Load_LESD | m_LESRPT_Load_LESD | YES |
| s_LESRPT_Load_LESM | m_LESRPT_Load_LESM | YES |
| s_LESRPT_Load_LEST | m_LESRPT_Load_LEST | YES |
| s_LESRPT_Load_LESL | m_LESRPT_Load_LESL | YES |

### Workflows

#### `wf_LES`

- **Valid**: YES
- **Server**: `Prd_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL.Status = Succeeded |
| s_LES_Load_LES_HEADER_TBL | s_LES_Load_LES_EMP_DETAIL_TBL | $s_LES_Load_LES_HEADER_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | $s_LES_Load_LES_EMP_DETAIL_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL.Status = Succeeded |
| s_LES_Verify_Record_Count | s_LES_Load_LES_HEADER_TBL | $s_LES_Verify_Record_Count.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | s_LES_Load_LES_PRIMARY_DATA_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL.Status = Succeeded |
| s_LES_Build_Message_Counters | email_LES_Complete | $s_LES_Build_Message_Counters.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL.Status = Succeeded |
| Start | s_LES_Current_Pay_Period |  |
| s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL | s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL | $s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL.Status = Succeeded |
| s_LES_NIH_FILE | s_LES_Build_Message_Counters | $s_LES_NIH_FILE.Status = Succeeded |
| s_LES_Load_LES_PRIMARY_DATA_TBL | s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | $s_LES_Load_LES_PRIMARY_DATA_TBL.Status = Succeeded |
| s_LESRPT_Load_LESU | s_LES_NIH_FILE | $s_LESRPT_Load_LESU.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL | s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | $s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL | s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | $s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL.Status = Succeeded |
| s_LES_Verify_Header | s_LES_Verify_Record_Count | $s_LES_Verify_Header.Status = Succeeded |
| s_LES_Current_Pay_Period | s_LES_Verify_Header | $s_LES_Current_Pay_Period.Status = Succeeded |
| s_LESRPT_Load_LESM | s_LESRPT_Load_LESR | $s_LESRPT_Load_LESM.Status = Succeeded |
| s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL | s_LESRPT_Load_LESC | $s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL.Status = Succeeded |
| s_LESRPT_Load_LEST | s_LESRPT_Load_LESU | $s_LESRPT_Load_LEST.Status = Succeeded |
| s_LESRPT_Load_LESR | s_LESRPT_Load_LESS | $s_LESRPT_Load_LESR.Status = Succeeded |
| s_LESRPT_Load_LESC | s_LESRPT_Load_LESD | $s_LESRPT_Load_LESC.Status = Succeeded |
| s_LESRPT_Load_LESL | s_LESRPT_Load_LESM | $s_LESRPT_Load_LESL.Status = Succeeded |
| s_LESRPT_Load_LESS | s_LESRPT_Load_LEST | $s_LESRPT_Load_LESS.Status = Succeeded |
| s_LESRPT_Load_LESD | s_LESRPT_Load_LESL | $s_LESRPT_Load_LESD.Status = Succeeded |

---

## Pay_Calendar

- **Repository**: `Prd_Repo_Srvc`
- **Folder**: `Pay_Calendar`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| PAY_PERIOD_VERIFY_FILE | Flat File | 1 |
| PAY_PERIOD_MESSAGE_FILE | Flat File | 2 |
| PAY_PERIOD | Oracle | 8 |

### Mappings

#### `m_Pay_Calendar_Verify_Pay_Calendar`

- **Valid**: YES
- **Description**: This mapping ensures that at least one record in the Pay Period table is set to current. No more than one record in the Pay Period table should be current.

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| exp_Check_Current_Flag | Expression |

#### `m_Pay_Calendar_Set_Pay_Calendar`

- **Valid**: YES
- **Description**: This mapping uses the contents of a parameter file to determine whether a row will be set to current on the Pay Period table. If the parameters within the parameter file are set, the values within the parameter file will be used to determine the current pay period. If the parameters within the parameter file are empty, the system date will be used to determine the current pay period.

| Transformation Name | Type |
|-------------------|------|
| rtr_Parameter_Non_Parameter | Router |
| exp_Set_Date | Expression |
| exp_Set_Current_Pay_Period_Non_Param | Expression |
| lkp_Existing_Pay_Period | Lookup Procedure |
| exp_Determine_Parameters_Exist | Expression |
| lkp_New_Current_Pay_Period | Lookup Procedure |
| upd_Set_Current_PP_Non_Param | Update Strategy |
| upd_Set_Current_PP_Param | Update Strategy |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |
| exp_Set_Current_Pay_Period_Param | Expression |

#### `m_Pay_Calendar_Build_Message`

- **Valid**: YES
- **Description**: This mapping queries the Pay Calendar table for the record marked current and uses that record to build the subject and message for an email message.

| Transformation Name | Type |
|-------------------|------|
| exp_Final | Expression |
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Initial | Expression |

#### `m_Pay_Calendar_Reset_Pay_Calendar`

- **Valid**: YES
- **Description**: This mapping retrieves the record from the Pay Period table currently set to current and resets that record to the default.

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD_RESET | Source Qualifier |
| exp_Initial | Expression |
| upd_Reset_Current_PP | Update Strategy |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_Pay_Calendar_Reset_Pay_Calendar | m_Pay_Calendar_Reset_Pay_Calendar | YES |
| s_Pay_Calendar_Build_Message | m_Pay_Calendar_Build_Message | YES |
| s_Pay_Calendar_Set_Pay_Calendar | m_Pay_Calendar_Set_Pay_Calendar | YES |
| s_Pay_Calendar_Verify_Pay_Calendar | m_Pay_Calendar_Verify_Pay_Calendar | YES |

### Workflows

#### `wf_Pay_Calendar`

- **Valid**: YES
- **Server**: `Prd_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| Start | s_Pay_Calendar_Reset_Pay_Calendar |  |
| s_Pay_Calendar_Build_Message | Email_Pay_Calendar | $s_Pay_Calendar_Build_Message.Status = Succeeded |
| s_Pay_Calendar_Verify_Pay_Calendar | s_Pay_Calendar_Build_Message | $s_Pay_Calendar_Verify_Pay_Calendar.Status = Succeeded |
| s_Pay_Calendar_Reset_Pay_Calendar | s_Pay_Calendar_Set_Pay_Calendar | $s_Pay_Calendar_Reset_Pay_Calendar.Status = Succeeded |
| s_Pay_Calendar_Set_Pay_Calendar | s_Pay_Calendar_Verify_Pay_Calendar | $s_Pay_Calendar_Set_Pay_Calendar.Status = Succeeded |

---

## Pseudossn

- **Repository**: `Prd_Repo_Srvc`
- **Folder**: `Pseudossn`

### Sources

| Name | Database Type | DBD Name | Owner | Fields |
|------|-------------|----------|-------|--------|
| PSEUDOSSN_FROM_SDA_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 63 |
| PSEUDOSSN_FILE_TK_NUM | Flat File | FlatFile |  | 67 |
| PAY_PERIOD | Oracle | ORA_BIIS | HISTDBA | 10 |
| PSEUDOSSN_TBL | Oracle | ORA_BIIS | INFO_TARGET_DEV | 63 |
| PSEUDOSSN_FILE | Flat File | FlatFile |  | 66 |

### Targets

| Name | Database Type | Fields |
|------|-------------|--------|
| PSEUDOSSN_FROM_SDA_TBL | Oracle | 63 |
| PAY_PERIOD_DATE_FILE | Flat File | 1 |
| HI_ARCH_PSEUDOSSN_TBL | Oracle | 63 |
| ERROR_TBL | Oracle | 8 |
| PSEUDOSSN_TBL | Oracle | 63 |
| PSEUDO_RECORD_COUNT | Oracle | 3 |
| COUNTER_TBL | Oracle | 7 |
| PSEUDOSSN_MESSAGE_FILE | Flat File | 2 |
| PSEUDO_HDR_DATE_FILE | Flat File | 1 |

### Mappings

#### `m_Pseudossn_Load_Pseudossn_From_SDA_Tbl`

- **Valid**: YES
- **Description**: This mapping loads the PseudoSSN SDA file into the table Pseudossn_From_SDA_TBL.

| Transformation Name | Type |
|-------------------|------|
| lkp_Current_Pay_Period | Lookup Procedure |
| exp_Final | Expression |
| fil_Detail_Records | Filter |
| exp_Determine_Record_Type | Expression |
| exp_Conversions | Expression |
| srt_PSEUDOSSN_EFF_DT | Sorter |
| exp_Determine_Errors | Expression |
| SQ_PSEUDOSSN_FILE_TK_NUM | Source Qualifier |

#### `m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl`

- **Valid**: YES
- **Description**: This mapping loads records from the table Pseudossn_from_SDA_Tbl to the table Pseudossn_Tbl.

| Transformation Name | Type |
|-------------------|------|
| SQ_PSEUDOSSN_FROM_SDA_TBL | Source Qualifier |
| exp_Initial | Expression |
| lkp_PSEUDOSSN_TBL | Lookup Procedure |
| exp_Determine_Inserts | Expression |
| fil_Inserts | Filter |

#### `m_Pseudossn_Update_Timekeeper_Number`

- **Valid**: YES
- **Description**: This mapping updates the Timekeeper Number on the table Pseudossn_Tbl.

| Transformation Name | Type |
|-------------------|------|
| SQ_PSEUDOSSN_TBL | Source Qualifier |
| upd_Update_TK_NUM | Update Strategy |
| exp_Initial | Expression |
| exp_Determine_Updates | Expression |
| fil_Updates | Filter |
| lkp_PSEUDOSSN_FROM_SDA_TBL | Lookup Procedure |

#### `m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA`

- **Valid**: YES
- **Description**: This mapping will verify that the Header Date in the PseudoSSN file from SDA matches the end date for the Current Pay Period.

| Transformation Name | Type |
|-------------------|------|
| lkp_Current_Pay_Period | Lookup Procedure |
| lkp_Pay_Period_Header_Date | Lookup Procedure |
| exp_Initial | Expression |
| exp_Verify_Header_Date | Expression |
| fil_Header | Filter |
| exp_Final | Expression |
| SQ_PSEUDOSSN_FILE_TK_NUM | Source Qualifier |

#### `m_Pseudossn_Current_Pay_Period`

- **Valid**: YES
- **Description**: This mapping returns the Current Pay Period from the Pay Period table.

| Transformation Name | Type |
|-------------------|------|
| SQ_PAY_PERIOD | Source Qualifier |
| exp_Build_Pay_Period | Expression |
| exp_Final | Expression |

#### `m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1`

- **Valid**: YES
- **Description**: This mapping loads the contents of the table Pseudossn_TBL into a backup of the table.

| Transformation Name | Type |
|-------------------|------|
| exp_PSEUDOSSN_TBL | Expression |
| SQ_PSEUDOSSN_TBL | Source Qualifier |

#### `m_Pseudossn_Load_Pseudossn_Tbl`

- **Valid**: YES
- **Description**: This mapping loads the PseudoSSN file into the table Pseudossn_TBL.

MS 12/13/2012: The following changes were made.
1) The field Position_Sensitivity_Code is linked to the target.

2) The format of the field Effective_Date has been changed from YYYYDDMM to YYYYMMDD.

3) The Sorter transformation has been changed to sort by Pseudossn (Asc), Emp_Status (Asc) and Effecitve Date Desc

| Transformation Name | Type |
|-------------------|------|
| lkp_Current_Pay_Period1 | Lookup Procedure |
| exp_Determine_Record_Type | Expression |
| SQ_PSEUDOSSN_FILE | Source Qualifier |
| exp_Conversions | Expression |
| srt_PSEUDOSSN_EFF_DT | Sorter |
| exp_Determine_Errors | Expression |
| rtr_Good_Bad_Records | Router |
| fil_Error_Message | Filter |
| nrm_Errors | Normalizer |
| exp_Final_Errors | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| exp_Final | Expression |
| fil_Detail_Records | Filter |
| exp_Pay_Period | Expression |

#### `m_Pseudossn_Verify_Record_Count`

- **Valid**: YES
- **Description**: This mapping compares the total in the Trailer Record to the count of all Detail Records in the file.

| Transformation Name | Type |
|-------------------|------|
| fil_DETAIL | Filter |
| exp_DETERMINE_DETAIL | Expression |
| SQ_PSEUDOSSN_FILE | Source Qualifier |
| exp_DETERMINE_HEADER_TRAILER | Expression |
| SQ_PSEUDOSSN_FILE1 | Source Qualifier |
| fil_TRAILER | Filter |
| exp_COMPARE | Expression |
| jnr_RECORD_CONSTANTS | Joiner |
| agg_ALL_RECORDS | Aggregator |

#### `m_Pseudossn_Counters`

- **Valid**: YES
- **Description**: This mapping gets different counts on the PseudoSSN file that was processed and loads them to the Counters Table. 

| Transformation Name | Type |
|-------------------|------|
| lkp_PSEUDOSSN_TBL_Pay_Period | Lookup Procedure |
| exp_Final_Message | Expression |
| exp_Build_Message | Expression |
| fil_Detail | Filter |
| exp_Determine_Detail | Expression |
| SQ_PSEUDOSSN_FILE | Source Qualifier |
| agg_ALL_RECORDS | Aggregator |
| exp_Detail_Count | Expression |
| lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE | Lookup Procedure |
| exp_Counters | Expression |
| nrm_Counters | Normalizer |
| exp_Final | Expression |
| lkp_Count_PSEUDOSSN_TBL | Lookup Procedure |

#### `m_Pseudossn_Verify_Header_Date_Current_Pay_Period`

- **Valid**: YES
- **Description**: This mapping will verify that the Header Date in the PseudoSSN file matches the end date for the Current Pay Period.

| Transformation Name | Type |
|-------------------|------|
| exp_Initial | Expression |
| SQ_PSEUDOSSN_FILE | Source Qualifier |
| exp_Verify_Header_Date | Expression |
| fil_Header | Filter |
| exp_Final | Expression |
| lkp_Current_Pay_Period | Lookup Procedure |
| lkp_Pay_Period_Header_Date | Lookup Procedure |

### Sessions

| Name | Mapping Name | Valid |
|------|-------------|-------|
| s_Pseudossn_Verify_Header_Date_Current_Pay_Period | m_Pseudossn_Verify_Header_Date_Current_Pay_Period | YES |
| s_Pseudossn_Counters | m_Pseudossn_Counters | YES |
| s_Pseudossn_Verify_Record_Count | m_Pseudossn_Verify_Record_Count | YES |
| s_Pseudossn_Load_Pseudossn_Tbl | m_Pseudossn_Load_Pseudossn_Tbl | YES |
| s_Pseudossn_Load_Archive_Pseudossn_Tbl | m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1 | YES |
| s_Pseudossn_Current_Pay_Period | m_Pseudossn_Current_Pay_Period | YES |
| s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | YES |
| s_Pseudossn_Update_Timekeeper_Number | m_Pseudossn_Update_Timekeeper_Number | YES |
| s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | YES |
| s_Pseudossn_Load_Pseudossn_From_SDA_Tbl | m_Pseudossn_Load_Pseudossn_From_SDA_Tbl | YES |

### Workflows

#### `wf_Pseudossn`

- **Valid**: YES
- **Server**: `Prd_IS`

**Execution Order (Workflow Links):**

| From Task | To Task | Condition |
|-----------|---------|-----------|
| s_Pseudossn_Counters | Email_Pseudossn | $s_Pseudossn_Counters.Status = Succeeded |
| Start | s_Pseudossn_Verify_Header_Date_Current_Pay_Period |  |
| s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | s_Pseudossn_Counters | $s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl.Status = Succeeded |
| s_Pseudossn_Verify_Header_Date_Current_Pay_Period | s_Pseudossn_Verify_Record_Count | $s_Pseudossn_Verify_Header_Date_Current_Pay_Period.Status = Succeeded |
| s_Pseudossn_Load_Archive_Pseudossn_Tbl | s_Pseudossn_Load_Pseudossn_Tbl | $s_Pseudossn_Load_Archive_Pseudossn_Tbl.Status = Succeeded |
| s_Pseudossn_Current_Pay_Period | s_Pseudossn_Load_Archive_Pseudossn_Tbl | $s_Pseudossn_Current_Pay_Period.Status = Succeeded |
| s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | s_Pseudossn_Current_Pay_Period | $s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA.Status = Succeeded |
| s_Pseudossn_Verify_Record_Count | s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA | $s_Pseudossn_Verify_Record_Count.Status = Succeeded |
| s_Pseudossn_Load_Pseudossn_From_SDA_Tbl | s_Pseudossn_Update_Timekeeper_Number | $s_Pseudossn_Load_Pseudossn_From_SDA_Tbl.Status = Succeeded |
| s_Pseudossn_Update_Timekeeper_Number | s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl | $s_Pseudossn_Update_Timekeeper_Number.Status = Succeeded |
| s_Pseudossn_Load_Pseudossn_Tbl | s_Pseudossn_Load_Pseudossn_From_SDA_Tbl | $s_Pseudossn_Load_Pseudossn_Tbl.Status = Succeeded |

---

## Transfer Scripts

Seven KornShell (ksh) scripts under `Transfer Scripts/` that deliver output files to agency dropboxes via SFTP.
All scripts connect as `sa-cdirect@m1csv301.hhs.gov`.

| Script | Source Path | Destination Path | Description |
|--------|-----------|-----------------|-------------|
| afps_transfer | `/data/BIISINT/data/int/out/CPM/` | `/opt/app/jail/sa-afps/outbound` | Transfers AFPS payroll files |
| cdc_transfer | `/data/BIISINT/data/int/out/CPM/` | `/opt/app/jail/sa-cdcusr/outbound` | Transfers CDC payroll files |
| fda_transfer | `/data/BIISINT/data/int/out/CPM/` | `/opt/app/jail/sa-fdausr2/outbound` | Transfers FDA payroll files |
| nih_cpm_transfer | `/data/BIISINT/data/int/out/CPM/` | `/opt/app/jail/sa-nihbiisu/outbound` | Transfers NIH CPM payroll files |
| nih_les_transfer | `/data/BIISINT/data/int/out/LES/` | `/opt/app/jail/sa-nihbiisu/outbound` | Transfers NIH LES files |
| nih_transfer_les | `/data/BIISINT/data/int/out/LES/` | `/opt/app/jail/sa-nihbiisu/outbound` | Transfers NIH LES files (alternate) |
| oig_transfer | `/data/BIISINT/data/int/out/CPM/` | `/opt/app/jail/sa-oig/outbound` | Transfers OIG payroll files |

All scripts send email notifications on success or failure to a distribution list.

---

## Supporting Scripts

### `actstage_load`

KornShell (ksh) script that runs the Oracle SQL procedure `action_stage_load` for EHRP2BIIS staging. Handles database connection, error checking, and email notifications.

### `ehrp2biis_preload`

KornShell (ksh) script that runs Oracle SQL `step01` for EHRP2BIIS pre-load processing. Sets up environment variables and executes the initial data preparation step.

### `ehrp2biis_afterload.sql`

Oracle SQL script that performs post-load processing for EHRP2BIIS:

- Updates sequence numbers for tracking
- Runs formatting procedures for personnel action data
- Inserts processed records into production tables
- Handles cancelled actions and status updates
- Manages WIP (Work-In-Progress) status tracking
