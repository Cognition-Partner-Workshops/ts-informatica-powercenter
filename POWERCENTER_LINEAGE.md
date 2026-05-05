# PowerCenter Source-to-Target Data Lineage

Detailed data-flow documentation for every mapping in the Informatica PowerCenter XML exports.

**Platform:** Informatica PowerCenter 9.6.1  
**Purpose:** EHRP (Electronic Health Record Program) to BIIS (Business Intelligence Information System) data integration

---

## Table of Contents

- [COMPTIME](#comptime)
- [CPM](#cpm)
- [CPM_AFPS](#cpm-afps)
- [CPM_CDC](#cpm-cdc)
- [CPM_NIH](#cpm-nih)
- [CPM_OIG](#cpm-oig)
- [EHRP2BIIS_UPDATE](#ehrp2biis-update)
- [FDA_Leave](#fda-leave)
- [LES](#les)
- [Pay_Calendar](#pay-calendar)
- [Pseudossn](#pseudossn)
- [Shell Script Orchestration](#shell-script-orchestration)

## COMPTIME

**Folder:** COMP_TIME | **Owner:** Administrator

### Workflow: `wf_COMPTIME`

**Valid:** YES | **Task Instances:** 5

**Execution Order:**

```
Start → s_COMPTIME_Current_Pay_Period → s_COMPTIME_Load_COMP_TIME_DAILY_TBL → s_COMPTIME_Build_Message_Counters → email_COMPTIME_Complete
```

### Mapping: `m_COMPTIME_Build_Message_Counters`

**Source(s):** `U0287D01`  
**Target(s):** `COUNTER_TBL`, `COMPTIME_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `U0287D01` |
| 2 | Expression | `exp_Build_Message` |
| 3 | Filter | `fil_Detail` |
| 4 | Expression | `exp_Initial` |
| 5 | Aggregator | `agg_ALL_RECORDS` |
| 6 | Expression | `exp_Detail_Count` |
| 7 | Expression | `exp_Counters` |
| 8 | Expression | `exp_Final` |
| 9 | Source Qualifier | `SQ_U0287D01` |
| 10 | Lookup Procedure | `lkp_PAY_PERIOD` |
| 11 | Expression | `exp_Final_Message` |
| 12 | Target | `COUNTER_TBL` |
| 13 | Target | `COMPTIME_MESSAGE_FILE` |

**Data Flow:**

```
[U0287D01] → (SQ_U0287D01) → (Expression: exp_Build_Message) → (Filter: fil_Detail) →
  (Expression: exp_Initial) → (Aggregator: agg_ALL_RECORDS) → (Expression: exp_Detail_Count) →
  (Expression: exp_Counters) → (Expression: exp_Final) → (Lookup Procedure: lkp_PAY_PERIOD) →
  (Expression: exp_Final_Message) → [COUNTER_TBL] → [COMPTIME_MESSAGE_FILE]
```

### Mapping: `m_COMPTIME_Load_COMP_TIME_DAILY_TBL`

**Source(s):** `U0287D01`  
**Target(s):** `COMP_TIME_DAILY_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `U0287D01` |
| 2 | Source Qualifier | `SQ_U0287D01` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Final` |
| 5 | Lookup Procedure | `lkp_PAY_PERIOD` |
| 6 | Expression | `exp_Convert` |
| 7 | Filter | `fil_Valid_Records` |
| 8 | Target | `COMP_TIME_DAILY_TBL` |

**Data Flow:**

```
[U0287D01] → (SQ_U0287D01) → (Expression: exp_Initial) → (Expression: exp_Final) →
  (Lookup Procedure: lkp_PAY_PERIOD) → (Expression: exp_Convert) → (Filter: fil_Valid_Records) →
  [COMP_TIME_DAILY_TBL]
```

### Mapping: `m_COMPTIME_Current_Pay_Period`

**Source(s):** `PAY_PERIOD`  
**Target(s):** `COMP_TIME_DATE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD` |
| 3 | Expression | `exp_Build_Pay_Period` |
| 4 | Expression | `exp_Final` |
| 5 | Target | `COMP_TIME_DATE_FILE` |

**Data Flow:**

```
[PAY_PERIOD] → (SQ_PAY_PERIOD) → (Expression: exp_Build_Pay_Period) → (Expression: exp_Final) → [COMP_TIME_DATE_FILE]
```

---

## CPM

**Folder:** CPM | **Owner:** NKNIGHT

### Workflow: `wf_CPM`

**Valid:** YES | **Task Instances:** 16

**Execution Order:**

```
Start → s_CPM_Current_Pay_Period → s_CPM_Load_CPM_MER_Staging_Tables → s_CPM_Load_CPM_PAD_Staging_Tables → s_CPM_Load_CPM_YTD_Staging_Tables → s_CPM_Load_CPM_PMR_Staging_Tables → s_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL → s_CPM_Load_CPM_NEWPAY_STG_ALT_TBL → s_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL → s_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL → s_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL → s_CPM_Load_From_FDR_CPM_NEWPAY_STG_TYPE_3_TBL → s_CPM_Load_FDR_CPM_NEWPAY_TBL → s_CPM_Load_CPM_NEWPAY_TBL → s_CPM_Build_Message_Counters → s_CPM_Send_Counts
```

### Mapping: `m_CPM_Current_Pay_Period`

**Source(s):** `PAY_PERIOD`  
**Target(s):** `CPM_PAY_PERIOD_DATE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD` |
| 3 | Expression | `exp_Build_Pay_Period` |
| 4 | Expression | `exp_Final` |
| 5 | Target | `CPM_PAY_PERIOD_DATE_FILE` |

**Data Flow:**

```
[PAY_PERIOD] → (SQ_PAY_PERIOD) → (Expression: exp_Build_Pay_Period) → (Expression: exp_Final) → [CPM_PAY_PERIOD_DATE_FILE]
```

### Mapping: `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL`

**Source(s):** `CPM_PM3_STG_TBL`  
**Target(s):** `ERROR_TBL`, `CPM_NEWPAY_STG_ALT_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_PM3_STG_TBL` |
| 2 | Filter | `fil_Error_Message` |
| 3 | Filter | `fil_Bad_Records` |
| 4 | Normalizer | `nrm_Errors` |
| 5 | Expression | `exp_Final_Errors` |
| 6 | Source Qualifier | `SQ_CPM_PM3_STG_TBL` |
| 7 | Expression | `exp_Initial` |
| 8 | Expression | `exp_Final` |
| 9 | Expression | `exp_Determine_Allotments` |
| 10 | Aggregator | `agg_Allotments` |
| 11 | Expression | `exp_Convert` |
| 12 | Expression | `exp_Stage_Converted_Fields` |
| 13 | Lookup Procedure | `lkp_PSEUDOSSN_TBL` |
| 14 | Mapplet | `mplt_Convert_Num_To_Prec7` |
| 15 | Target | `ERROR_TBL` |
| 16 | Target | `CPM_NEWPAY_STG_ALT_TBL` |

**Data Flow:**

```
[CPM_PM3_STG_TBL] → (SQ_CPM_PM3_STG_TBL) → (Filter: fil_Error_Message) → (Filter: fil_Bad_Records) →
  (Normalizer: nrm_Errors) → (Expression: exp_Final_Errors) → (Expression: exp_Initial) →
  (Expression: exp_Final) → (Expression: exp_Determine_Allotments) → (Aggregator: agg_Allotments) →
  (Expression: exp_Convert) → (Expression: exp_Stage_Converted_Fields) →
  (Lookup Procedure: lkp_PSEUDOSSN_TBL) → [ERROR_TBL] → [CPM_NEWPAY_STG_ALT_TBL]
```

### Mapping: `m_CPM_Load_CPM_YTD_Staging_Tables`

**Source(s):** `YTD_FILE`  
**Target(s):** `CPM_YTD_DETAIL_STG_TBL`, `CPM_YTD_HEADER_STG_TBL`, `CPM_YTD_STATE_STG_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `YTD_FILE` |
| 2 | Expression | `exp_Final_YTD_Detail` |
| 3 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 4 | Lookup Procedure | `lkp_Pay_Period_Record_Date` |
| 5 | Expression | `exp_Convert` |
| 6 | Expression | `exp_Final_YTD_Header` |
| 7 | Expression | `exp_Verify_Header_Date` |
| 8 | Normalizer | `Norm_YTD_FILE` |
| 9 | Router | `rtr_YTD_Records` |
| 10 | Expression | `exp_Initial` |
| 11 | Expression | `exp_Final_YTD_State` |
| 12 | Target | `CPM_YTD_DETAIL_STG_TBL` |
| 13 | Target | `CPM_YTD_HEADER_STG_TBL` |
| 14 | Target | `CPM_YTD_STATE_STG_TBL` |

**Data Flow:**

```
[YTD_FILE] → (Expression: exp_Final_YTD_Detail) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Lookup Procedure: lkp_Pay_Period_Record_Date) → (Expression: exp_Convert) →
  (Expression: exp_Final_YTD_Header) → (Expression: exp_Verify_Header_Date) →
  (Normalizer: Norm_YTD_FILE) → (Router: rtr_YTD_Records) → (Expression: exp_Initial) →
  (Expression: exp_Final_YTD_State) → [CPM_YTD_DETAIL_STG_TBL] → [CPM_YTD_HEADER_STG_TBL] →
  [CPM_YTD_STATE_STG_TBL]
```

### Mapping: `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL`

**Source(s):** `CPM_YTD_STATE_STG_TBL`  
**Target(s):** `CPM_NEWPAY_STG_YTD_STATE_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_YTD_STATE_STG_TBL` |
| 2 | Expression | `exp_Initial` |
| 3 | Expression | `exp_Final` |
| 4 | Expression | `exp_Determine_YTD_States` |
| 5 | Aggregator | `agg_YTD_State` |
| 6 | Source Qualifier | `SQ_CPM_YTD_STATE_STG_TBL` |
| 7 | Expression | `exp_Stage_Converted_Fields` |
| 8 | Mapplet | `mplt_Convert_Num_To_Prec7` |
| 9 | Target | `CPM_NEWPAY_STG_YTD_STATE_TBL` |

**Data Flow:**

```
[CPM_YTD_STATE_STG_TBL] → (SQ_CPM_YTD_STATE_STG_TBL) → (Expression: exp_Initial) →
  (Expression: exp_Final) → (Expression: exp_Determine_YTD_States) → (Aggregator: agg_YTD_State) →
  (Expression: exp_Stage_Converted_Fields) → [CPM_NEWPAY_STG_YTD_STATE_TBL]
```

### Mapping: `m_CPM_Load_CPM_MER_Staging_Tables`

**Source(s):** `MER_FILE`  
**Target(s):** `CPM_MER_DETAIL_STG_TBL`, `CPM_MER_HEADER_STG_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `MER_FILE` |
| 2 | Expression | `exp_Final_MER_Detail` |
| 3 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 4 | Lookup Procedure | `lkp_Pay_Period_Record_Date` |
| 5 | Expression | `exp_Final_MER_Header` |
| 6 | Expression | `exp_Convert` |
| 7 | Expression | `exp_Verify_Header_Date` |
| 8 | Expression | `exp_Initial` |
| 9 | Router | `rtr_MER_Records` |
| 10 | Normalizer | `Norm_MER_FILE` |
| 11 | Target | `CPM_MER_DETAIL_STG_TBL` |
| 12 | Target | `CPM_MER_HEADER_STG_TBL` |

**Data Flow:**

```
[MER_FILE] → (Expression: exp_Final_MER_Detail) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Lookup Procedure: lkp_Pay_Period_Record_Date) → (Expression: exp_Final_MER_Header) →
  (Expression: exp_Convert) → (Expression: exp_Verify_Header_Date) → (Expression: exp_Initial) →
  (Router: rtr_MER_Records) → (Normalizer: Norm_MER_FILE) → [CPM_MER_DETAIL_STG_TBL] →
  [CPM_MER_HEADER_STG_TBL]
```

### Mapping: `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL`

**Source(s):** `CPM_YTD_DETAIL_STG_TBL`, `PSEUDOSSN_TBL`, `CPM_PM1_STG_TBL`, `CPM_PM2_STG_TBL`  
**Target(s):** `CPM_NEWPAY_STG_TYPE_1_2_TBL`, `ERROR_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_YTD_DETAIL_STG_TBL` |
| 2 | Source | `PSEUDOSSN_TBL` |
| 3 | Source | `CPM_PM1_STG_TBL` |
| 4 | Source | `CPM_PM2_STG_TBL` |
| 5 | Filter | `fil_Bad_Records` |
| 6 | Source Qualifier | `SQ_CPM_YTD_DETAIL_STG_TBL` |
| 7 | Source Qualifier | `SQ_CPM_PM1_STG_TBL` |
| 8 | Expression | `exp_Convert_TYPE_1_PAD_MER` |
| 9 | Expression | `exp_Final` |
| 10 | Expression | `exp_Initial` |
| 11 | Filter | `fil_Error_Message` |
| 12 | Expression | `exp_Convert_YTD` |
| 13 | Lookup Procedure | `lkp_CPM_MER_DETAIL_STG_TBL` |
| 14 | Lookup Procedure | `lkp_CPM_PAD_DETAIL_STG_TBL` |
| 15 | Lookup Procedure | `lkp_CPM_NEWPAY_STG_YTD_STATE_TBL` |
| 16 | Expression | `exp_Determine_Errors` |
| 17 | Normalizer | `nrm_Errors` |
| 18 | Expression | `exp_Final_Errors` |
| 19 | Joiner | `jnr_CPM_YTD` |
| 20 | Expression | `exp_Initial_YTD` |
| 21 | Expression | `exp_Stage_PAD_MER_Converted_Fields` |
| 22 | Expression | `exp_Stg_YTD_Converted_Fields` |
| 23 | Mapplet | `mplt_Convert_Num_To_Prec7` |
| 24 | Mapplet | `mplt_Convert_Num_To_Prec71` |
| 25 | Mapplet | `mplt_Convert_Num_To_Prec72` |
| 26 | Mapplet | `mplt_Convert_Num_To_Prec73` |
| 27 | Mapplet | `mplt_Convert_Num_To_Prec74` |
| 28 | Mapplet | `mplt_Convert_Num_To_Prec75` |
| 29 | Target | `CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| 30 | Target | `ERROR_TBL` |

**Data Flow:**

```
[CPM_YTD_DETAIL_STG_TBL] → [PSEUDOSSN_TBL] → [CPM_PM1_STG_TBL] → [CPM_PM2_STG_TBL] →
  (SQ_CPM_YTD_DETAIL_STG_TBL) → (SQ_CPM_PM1_STG_TBL) → (Filter: fil_Bad_Records) →
  (Expression: exp_Convert_TYPE_1_PAD_MER) → (Expression: exp_Final) → (Expression: exp_Initial) →
  (Filter: fil_Error_Message) → (Expression: exp_Convert_YTD) →
  (Lookup Procedure: lkp_CPM_MER_DETAIL_STG_TBL) → (Lookup Procedure: lkp_CPM_PAD_DETAIL_STG_TBL) →
  (Lookup Procedure: lkp_CPM_NEWPAY_STG_YTD_STATE_TBL) → (Expression: exp_Determine_Errors) →
  (Normalizer: nrm_Errors) → (Expression: exp_Final_Errors) → (Joiner: jnr_CPM_YTD) →
  (Expression: exp_Initial_YTD) → (Expression: exp_Stage_PAD_MER_Converted_Fields) →
  (Expression: exp_Stg_YTD_Converted_Fields) → [CPM_NEWPAY_STG_TYPE_1_2_TBL] → [ERROR_TBL]
```

### Mapping: `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL`

**Source(s):** `CPM_PM3_STG_TBL`  
**Target(s):** `CPM_NEWPAY_STG_DETAIL_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_PM3_STG_TBL` |
| 2 | Expression | `exp_Format_Fields` |
| 3 | Source Qualifier | `SQ_CPM_PM3_STG_TBL` |
| 4 | Aggregator | `agg_PYF_EYE_ID_PP_NUM` |
| 5 | Expression | `exp_Initial` |
| 6 | Expression | `exp_Final` |
| 7 | Target | `CPM_NEWPAY_STG_DETAIL_TBL` |

**Data Flow:**

```
[CPM_PM3_STG_TBL] → (SQ_CPM_PM3_STG_TBL) → (Expression: exp_Format_Fields) →
  (Aggregator: agg_PYF_EYE_ID_PP_NUM) → (Expression: exp_Initial) → (Expression: exp_Final) →
  [CPM_NEWPAY_STG_DETAIL_TBL]
```

### Mapping: `m_CPM_Build_Message_Counters`

**Source(s):** `CPM_NEWPAY_TBL`, `ERROR_TBL`, `PAYMASTER_THREE`, `CPM_NEWPAY_TBL1`  
**Target(s):** `COUNTER_TBL`, `CPM_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Source | `ERROR_TBL` |
| 3 | Source | `PAYMASTER_THREE` |
| 4 | Source | `CPM_NEWPAY_TBL1` |
| 5 | Normalizer | `nrm_Counters_Message` |
| 6 | Expression | `exp_Final_Message` |
| 7 | Expression | `exp_Build_Message` |
| 8 | Lookup Procedure | `lkp_PSEUDOSSN_TBL` |
| 9 | Lookup Procedure | `lkp_CPM_MER_DETAIL_STG_TBL` |
| 10 | Lookup Procedure | `lkp_CPM_PAD_DETAIL_STG_TBL` |
| 11 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 12 | Source Qualifier | `SQ_ERROR_TBL` |
| 13 | Expression | `exp_Initial_Input` |
| 14 | Expression | `exp_Initial_CPM` |
| 15 | Expression | `exp_Initial_Errors` |
| 16 | Joiner | `jnr_Inputs_CPM` |
| 17 | Aggregator | `agg_Count_Inputs` |
| 18 | Aggregator | `agg_Count_CPM` |
| 19 | Expression | `exp_Stage_CPM` |
| 20 | Aggregator | `agg_Count_Errors` |
| 21 | Joiner | `jnr_Inputs_CPM_Errors` |
| 22 | Normalizer | `nrm_Counters` |
| 23 | Expression | `exp_Counters` |
| 24 | Expression | `exp_Final_Counters` |
| 25 | Lookup Procedure | `lkp_CPM_YTD_DETAIL_STG_TBL` |
| 26 | Normalizer | `Norm_PAYMASTER_THREE` |
| 27 | Source Qualifier | `SQ_CPM_NEWPAY_TBL1` |
| 28 | Expression | `exp_Initial_Multiple_Pay_Lines` |
| 29 | Joiner | `jnr_Inputs_CPM_Errors_Pay_Lines` |
| 30 | Aggregator | `agg_Multiple_Pay_Lines` |
| 31 | Target | `COUNTER_TBL` |
| 32 | Target | `CPM_MESSAGE_FILE` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → [ERROR_TBL] → [PAYMASTER_THREE] → [CPM_NEWPAY_TBL1] →
  (SQ_CPM_NEWPAY_TBL) → (SQ_ERROR_TBL) → (SQ_CPM_NEWPAY_TBL1) → (Normalizer: nrm_Counters_Message) →
  (Expression: exp_Final_Message) → (Expression: exp_Build_Message) →
  (Lookup Procedure: lkp_PSEUDOSSN_TBL) → (Lookup Procedure: lkp_CPM_MER_DETAIL_STG_TBL) →
  (Lookup Procedure: lkp_CPM_PAD_DETAIL_STG_TBL) → (Expression: exp_Initial_Input) →
  (Expression: exp_Initial_CPM) → (Expression: exp_Initial_Errors) → (Joiner: jnr_Inputs_CPM) →
  (Aggregator: agg_Count_Inputs) → (Aggregator: agg_Count_CPM) → (Expression: exp_Stage_CPM) →
  (Aggregator: agg_Count_Errors) → (Joiner: jnr_Inputs_CPM_Errors) → (Normalizer: nrm_Counters) →
  (Expression: exp_Counters) → (Expression: exp_Final_Counters) →
  (Lookup Procedure: lkp_CPM_YTD_DETAIL_STG_TBL) → (Normalizer: Norm_PAYMASTER_THREE) →
  (Expression: exp_Initial_Multiple_Pay_Lines) → (Joiner: jnr_Inputs_CPM_Errors_Pay_Lines) →
  (Aggregator: agg_Multiple_Pay_Lines) → [COUNTER_TBL] → [CPM_MESSAGE_FILE]
```

### Mapping: `m_CPM_Load_CPM_PMR_Staging_Tables`

**Source(s):** `PAYMASTER_FILE`  
**Target(s):** `CPM_PM1_STG_TBL`, `CPM_PMH_STG_TBL`, `CPM_PM2_STG_TBL`, `CPM_PM3_STG_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAYMASTER_FILE` |
| 2 | Expression | `exp_Final_Paymaster_3` |
| 3 | Expression | `exp_Final_Paymaster_2` |
| 4 | Expression | `exp_Final_Paymaster_1` |
| 5 | Lookup Procedure | `lkp_Pay_Period_Record_Date` |
| 6 | Expression | `exp_Initial` |
| 7 | Expression | `exp_Stage` |
| 8 | Expression | `exp_Final_Paymaster_Header` |
| 9 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 10 | Normalizer | `Norm_PAYMASTER_FILE` |
| 11 | Expression | `exp_Determine_Record_Type` |
| 12 | Router | `rtr_Paymaster_Records` |
| 13 | Target | `CPM_PM1_STG_TBL` |
| 14 | Target | `CPM_PMH_STG_TBL` |
| 15 | Target | `CPM_PM2_STG_TBL` |
| 16 | Target | `CPM_PM3_STG_TBL` |

**Data Flow:**

```
[PAYMASTER_FILE] → (Expression: exp_Final_Paymaster_3) → (Expression: exp_Final_Paymaster_2) →
  (Expression: exp_Final_Paymaster_1) → (Lookup Procedure: lkp_Pay_Period_Record_Date) →
  (Expression: exp_Initial) → (Expression: exp_Stage) → (Expression: exp_Final_Paymaster_Header) →
  (Lookup Procedure: lkp_Current_Pay_Period) → (Normalizer: Norm_PAYMASTER_FILE) →
  (Expression: exp_Determine_Record_Type) → (Router: rtr_Paymaster_Records) → [CPM_PM1_STG_TBL] →
  [CPM_PMH_STG_TBL] → [CPM_PM2_STG_TBL] → [CPM_PM3_STG_TBL]
```

### Mapping: `m_CPM_Load_CPM_PAD_Staging_Tables`

**Source(s):** `PAD_FILE`  
**Target(s):** `CPM_PAD_DETAIL_STG_TBL`, `CPM_PAD_HEADER_STG_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAD_FILE` |
| 2 | Expression | `exp_Final_PAD_Detail` |
| 3 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 4 | Lookup Procedure | `lkp_Pay_Period_Record_Date` |
| 5 | Expression | `exp_Final_PAD_Header` |
| 6 | Expression | `exp_Convert` |
| 7 | Expression | `exp_Verify_Header_Date` |
| 8 | Normalizer | `Norm_PAD_FILE` |
| 9 | Expression | `exp_Determine_Record_Type` |
| 10 | Router | `rtr_PAD_Records` |
| 11 | Target | `CPM_PAD_DETAIL_STG_TBL` |
| 12 | Target | `CPM_PAD_HEADER_STG_TBL` |

**Data Flow:**

```
[PAD_FILE] → (Expression: exp_Final_PAD_Detail) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Lookup Procedure: lkp_Pay_Period_Record_Date) → (Expression: exp_Final_PAD_Header) →
  (Expression: exp_Convert) → (Expression: exp_Verify_Header_Date) → (Normalizer: Norm_PAD_FILE) →
  (Expression: exp_Determine_Record_Type) → (Router: rtr_PAD_Records) → [CPM_PAD_DETAIL_STG_TBL] →
  [CPM_PAD_HEADER_STG_TBL]
```

### Mapping: `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL`

**Source(s):** `CPM_NEWPAY_STG_TYPE_1_2_TBL`, `CPM_NEWPAY_STG_TYPE_3_TBL`  
**Target(s):** `CPM_NEWPAY_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| 2 | Source | `CPM_NEWPAY_STG_TYPE_3_TBL` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Final` |
| 5 | Source Qualifier | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| 6 | Expression | `exp_Convert` |
| 7 | Target | `CPM_NEWPAY_TBL` |

**Data Flow:**

```
[CPM_NEWPAY_STG_TYPE_1_2_TBL] → [CPM_NEWPAY_STG_TYPE_3_TBL] → (SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL) →
  (Expression: exp_Initial) → (Expression: exp_Final) → (Expression: exp_Convert) → [CPM_NEWPAY_TBL]
```

### Mapping: `m_Generic_Mapping`

**Source(s):** `HI_GENERIC_SRC_TBL`  
**Target(s):** `GENERIC_TARGET_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_GENERIC_SRC_TBL` |
| 2 | Source Qualifier | `SQ_HI_GENERIC_SRC_TBL` |
| 3 | Target | `GENERIC_TARGET_FILE` |

**Data Flow:**

```
[HI_GENERIC_SRC_TBL] → (SQ_HI_GENERIC_SRC_TBL) → [GENERIC_TARGET_FILE]
```

### Mapping: `m_CPM_Load_FDR_CPM_NEWPAY_TBL`

**Source(s):** `CPM_NEWPAY_STG_TYPE_1_2_TBL`, `CPM_NEWPAY_STG_TYPE_3_FDR_TBL`  
**Target(s):** `CPM_NEWPAY_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| 2 | Source | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Final` |
| 5 | Source Qualifier | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| 6 | Expression | `exp_Convert` |
| 7 | Lookup Procedure | `lkp_REG_REEMPLED` |
| 8 | Target | `CPM_NEWPAY_TBL` |

**Data Flow:**

```
[CPM_NEWPAY_STG_TYPE_1_2_TBL] → [CPM_NEWPAY_STG_TYPE_3_FDR_TBL] → (SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL) →
  (Expression: exp_Initial) → (Expression: exp_Final) → (Expression: exp_Convert) →
  (Lookup Procedure: lkp_REG_REEMPLED) → [CPM_NEWPAY_TBL]
```

### Mapping: `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL`

**Source(s):** `CPM_PM3_STG_TBL`  
**Target(s):** `CPM_NEWPAY_STG_TYPE_3_FDR_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_PM3_STG_TBL` |
| 2 | Expression | `exp_Initial` |
| 3 | Aggregator | `agg_PYF_EYE_ID_PP_NUM` |
| 4 | Expression | `exp_Final` |
| 5 | Lookup Procedure | `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| 6 | Source Qualifier | `SQ_CPM_PM3_STG_TBL` |
| 7 | Expression | `exp_Format_Fields` |
| 8 | Lookup Procedure | `lkp_CPM_NEWPAY_STG_ALT_TBL` |
| 9 | Expression | `exp_GEN_SEQ_NUMBER` |
| 10 | Expression | `exp_Double_T38_SUN_DIF_HRS_CPP` |
| 11 | Expression | `exp_Set_REEMP_ANN_CDE` |
| 12 | Mapplet | `mplt_Convert_Num_To_Prec7` |
| 13 | Mapplet | `mplt_Convert_Num_To_Prec71` |
| 14 | Mapplet | `mplt_Convert_Num_To_Prec72` |
| 15 | Mapplet | `mplt_Convert_Num_To_Prec73` |
| 16 | Mapplet | `mplt_Convert_Num_To_Prec74` |
| 17 | Mapplet | `mplt_Convert_Num_To_Prec75` |
| 18 | Mapplet | `mplt_Convert_Num_To_Prec76` |
| 19 | Mapplet | `mplt_Convert_Num_To_Prec77` |
| 20 | Mapplet | `mplt_Convert_Num_To_Prec78` |
| 21 | Mapplet | `mplt_Convert_Num_To_Prec79` |
| 22 | Mapplet | `mplt_Convert_Num_To_Prec711` |
| 23 | Mapplet | `mplt_Convert_Num_To_Prec710` |
| 24 | Target | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |

**Data Flow:**

```
[CPM_PM3_STG_TBL] → (SQ_CPM_PM3_STG_TBL) → (Expression: exp_Initial) →
  (Aggregator: agg_PYF_EYE_ID_PP_NUM) → (Expression: exp_Final) →
  (Lookup Procedure: lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL) → (Expression: exp_Format_Fields) →
  (Lookup Procedure: lkp_CPM_NEWPAY_STG_ALT_TBL) → (Expression: exp_GEN_SEQ_NUMBER) →
  (Expression: exp_Double_T38_SUN_DIF_HRS_CPP) → (Expression: exp_Set_REEMP_ANN_CDE) →
  [CPM_NEWPAY_STG_TYPE_3_FDR_TBL]
```

### Mapping: `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL`

**Source(s):** `CPM_NEWPAY_STG_TYPE_3_FDR_TBL`  
**Target(s):** `CPM_NEWPAY_STG_TYPE_3_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |
| 2 | Expression | `exp_Initial` |
| 3 | Aggregator | `agg_PYF_EYE_ID_PP_NUM` |
| 4 | Expression | `exp_Final` |
| 5 | Lookup Procedure | `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` |
| 6 | Expression | `exp_Format_Fields` |
| 7 | Lookup Procedure | `lkp_CPM_NEWPAY_STG_ALT_TBL` |
| 8 | Source Qualifier | `SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` |
| 9 | Lookup Procedure | `lkp_CPM_NEWPAY_STG_DETAIL_TBL` |
| 10 | Target | `CPM_NEWPAY_STG_TYPE_3_TBL` |

**Data Flow:**

```
[CPM_NEWPAY_STG_TYPE_3_FDR_TBL] → (SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL) → (Expression: exp_Initial) →
  (Aggregator: agg_PYF_EYE_ID_PP_NUM) → (Expression: exp_Final) →
  (Lookup Procedure: lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL) → (Expression: exp_Format_Fields) →
  (Lookup Procedure: lkp_CPM_NEWPAY_STG_ALT_TBL) → (Lookup Procedure: lkp_CPM_NEWPAY_STG_DETAIL_TBL) →
  [CPM_NEWPAY_STG_TYPE_3_TBL]
```

---

## CPM_AFPS

**Folder:** CPM | **Owner:** NKNIGHT

### Workflow: `wf_CPM_AFPS`

**Valid:** YES | **Task Instances:** 18

**Execution Order:**

```
Start → s_CPM_AFPS_0010_Set_CPM_Calendar → s_CPM_AFPS_0025_Set_Pay_Calendar → s_CPM_AFPS_0050_Update_CPM_CYCLE_TBL → s_CPM_AFPS_0100_Data_Seperate → s_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT → s_CPM_AFPS_0300_Gross_Exp_Report → s_CPM_AFPS_0400_Crossfoot_Errors → s_CPM_AFPS_0500_Crossfoot_Message_Header → s_CPM_AFPS_0600_Crossfoot_Message_Details → s_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts → s_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend → s_CPM_AFPS_0760_Concatenate_Crossfoot_Files → s_CPM_AFPS_0800_Build_Message_Counters → s_CPM_AFPS_0820_Build_Message_Totals → s_CPM_AFPS_0860_Concatenate_Counts_Files → s_CPM_AFPS_0900_Build_Message → s_CPM_AFPS_1000_Send_Report
```

### Mapping: `m_CPM_AFPS_0100_Data_Seperate`

**Source(s):** `CPM_NEWPAY_TBL`, `PAY_PERIOD`  
**Target(s):** `HI_AFPS_FEEDER_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Source | `PAY_PERIOD` |
| 3 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 4 | Expression | `exp_Format_AFPS_Feeder` |
| 5 | Sorter | `srt_Sort_By_Payment_Type` |
| 6 | Expression | `exp_Convert_Calc_Fields` |
| 7 | Expression | `exp_Format_Text_Fields` |
| 8 | Target | `HI_AFPS_FEEDER_TBL` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → [PAY_PERIOD] → (SQ_CPM_NEWPAY_TBL) → (Expression: exp_Format_AFPS_Feeder) →
  (Sorter: srt_Sort_By_Payment_Type) → (Expression: exp_Convert_Calc_Fields) →
  (Expression: exp_Format_Text_Fields) → [HI_AFPS_FEEDER_TBL]
```

### Mapping: `m_CPM_AFPS_0300_Gross_Exp_Report`

**Source(s):** `HI_AFPS_FEEDER_TBL`  
**Target(s):** `HI_GROSS_EXP_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_AFPS_FEEDER_TBL` |
| 2 | Expression | `exp_Compute_Main` |
| 3 | Source Qualifier | `SQ_HI_AFPS_FEEDER_TBL` |
| 4 | Target | `HI_GROSS_EXP_TBL` |

**Data Flow:**

```
[HI_AFPS_FEEDER_TBL] → (SQ_HI_AFPS_FEEDER_TBL) → (Expression: exp_Compute_Main) → [HI_GROSS_EXP_TBL]
```

### Mapping: `m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend`

**Source(s):** `HI_AFPS_FEEDER_TBL`  
**Target(s):** `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_AFPS_FEEDER_TBL` |
| 2 | Expression | `exp_Final_Message` |
| 3 | Source Qualifier | `SQ_HI_AFPS_FEEDER_TBL` |
| 4 | Expression | `exp_Initial_Feeder` |
| 5 | Aggregator | `agg_Gross_Expenditures` |
| 6 | Expression | `exp_Counters` |
| 7 | Target | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` |

**Data Flow:**

```
[HI_AFPS_FEEDER_TBL] → (SQ_HI_AFPS_FEEDER_TBL) → (Expression: exp_Final_Message) →
  (Expression: exp_Initial_Feeder) → (Aggregator: agg_Gross_Expenditures) → (Expression: exp_Counters) →
  [CPM_AFPS_MESSAGE_COUNTS_TOT_FILE]
```

### Mapping: `m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts`

**Source(s):** `HI_AFPS_FEEDER_TBL`, `ERROR_TBL`  
**Target(s):** `CPM_AFPS_MESSAGE_COUNTS_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_AFPS_FEEDER_TBL` |
| 2 | Source | `ERROR_TBL` |
| 3 | Source Qualifier | `SQ_ERROR_TBL` |
| 4 | Expression | `exp_Final_Message` |
| 5 | Expression | `exp_Initial_Crossfoot_Errors` |
| 6 | Source Qualifier | `SQ_HI_AFPS_FEEDER_TBL` |
| 7 | Expression | `exp_Initial_Feeder` |
| 8 | Aggregator | `agg_Gross_Expenditures` |
| 9 | Aggregator | `agg_Crossfoot_Errors` |
| 10 | Joiner | `jnr_Feeder_Crossfoot` |
| 11 | Normalizer | `nrm_Counters` |
| 12 | Expression | `exp_Counters` |
| 13 | Target | `CPM_AFPS_MESSAGE_COUNTS_FILE` |

**Data Flow:**

```
[HI_AFPS_FEEDER_TBL] → [ERROR_TBL] → (SQ_ERROR_TBL) → (SQ_HI_AFPS_FEEDER_TBL) →
  (Expression: exp_Final_Message) → (Expression: exp_Initial_Crossfoot_Errors) →
  (Expression: exp_Initial_Feeder) → (Aggregator: agg_Gross_Expenditures) →
  (Aggregator: agg_Crossfoot_Errors) → (Joiner: jnr_Feeder_Crossfoot) → (Normalizer: nrm_Counters) →
  (Expression: exp_Counters) → [CPM_AFPS_MESSAGE_COUNTS_FILE]
```

### Mapping: `m_CPM_AFPS_0800_Build_Message_Counters`

**Source(s):** `CPM_NEWPAY_TBL`, `HI_AFPS_FEEDER_TBL`  
**Target(s):** `AFPS_COUNTER_TBL`, `CPM_AFPS_MESSAGE_COUNTS_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Source | `HI_AFPS_FEEDER_TBL` |
| 3 | Expression | `exp_Initial_Feeder` |
| 4 | Aggregator | `agg_Feeder` |
| 5 | Normalizer | `nrm_Counters_Message` |
| 6 | Expression | `exp_Final_Message` |
| 7 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 8 | Expression | `exp_Initial_CPM` |
| 9 | Joiner | `jnr_Inputs_CPM` |
| 10 | Aggregator | `agg_Count_CPM` |
| 11 | Normalizer | `nrm_Counters` |
| 12 | Expression | `exp_Counters` |
| 13 | Expression | `exp_Final_Counters` |
| 14 | Source Qualifier | `SQ_HI_AFPS_FEEDER_TBL` |
| 15 | Target | `AFPS_COUNTER_TBL` |
| 16 | Target | `CPM_AFPS_MESSAGE_COUNTS_FILE` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → [HI_AFPS_FEEDER_TBL] → (SQ_CPM_NEWPAY_TBL) → (SQ_HI_AFPS_FEEDER_TBL) →
  (Expression: exp_Initial_Feeder) → (Aggregator: agg_Feeder) → (Normalizer: nrm_Counters_Message) →
  (Expression: exp_Final_Message) → (Expression: exp_Initial_CPM) → (Joiner: jnr_Inputs_CPM) →
  (Aggregator: agg_Count_CPM) → (Normalizer: nrm_Counters) → (Expression: exp_Counters) →
  (Expression: exp_Final_Counters) → [AFPS_COUNTER_TBL] → [CPM_AFPS_MESSAGE_COUNTS_FILE]
```

### Mapping: `m_CPM_AFPS_0900_Build_Message`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_AFPS_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Final` |
| 5 | Target | `CPM_AFPS_MESSAGE_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Initial) → (Expression: exp_Final) → [CPM_AFPS_MESSAGE_FILE]
```

### Mapping: `m_CPM_AFPS_0760_Concatenate_Crossfoot_Files`

**Source(s):** `HI_GENERIC_SRC_TBL`  
**Target(s):** `GENERIC_TARGET_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_GENERIC_SRC_TBL` |
| 2 | Source Qualifier | `SQ_HI_GENERIC_SRC_TBL` |
| 3 | Target | `GENERIC_TARGET_FILE` |

**Data Flow:**

```
[HI_GENERIC_SRC_TBL] → (SQ_HI_GENERIC_SRC_TBL) → [GENERIC_TARGET_FILE]
```

### Mapping: `m_CPM_AFPS_1000_Send_Report`

**Source(s):** `HI_GENERIC_SRC_TBL`  
**Target(s):** `GENERIC_TARGET_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_GENERIC_SRC_TBL` |
| 2 | Source Qualifier | `SQ_HI_GENERIC_SRC_TBL` |
| 3 | Target | `GENERIC_TARGET_FILE` |

**Data Flow:**

```
[HI_GENERIC_SRC_TBL] → (SQ_HI_GENERIC_SRC_TBL) → [GENERIC_TARGET_FILE]
```

### Mapping: `m_CPM_AFPS_0500_Crossfoot_Message_Header`

**Source(s):** `PAY_PERIOD`  
**Target(s):** `CPM_AFPS_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD` |
| 2 | Expression | `exp_Build_Message` |
| 3 | Expression | `exp_Final_Message` |
| 4 | Source Qualifier | `SQ_PAY_PERIOD` |
| 5 | Expression | `exp_Initial` |
| 6 | Target | `CPM_AFPS_MESSAGE_FILE` |

**Data Flow:**

```
[PAY_PERIOD] → (SQ_PAY_PERIOD) → (Expression: exp_Build_Message) → (Expression: exp_Final_Message) →
  (Expression: exp_Initial) → [CPM_AFPS_MESSAGE_FILE]
```

### Mapping: `m_CPM_AFPS_0820_Build_Message_Totals`

**Source(s):** `HI_AFPS_FEEDER_TBL`, `CPM_NEWPAY_TBL`  
**Target(s):** `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE`, `AFPS_COUNTER_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_AFPS_FEEDER_TBL` |
| 2 | Source | `CPM_NEWPAY_TBL` |
| 3 | Source Qualifier | `SQ_HI_AFPS_FEEDER_TBL` |
| 4 | Expression | `exp_Initial_Feeder` |
| 5 | Aggregator | `agg_Feeder` |
| 6 | Expression | `exp_Final_Message` |
| 7 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 8 | Expression | `exp_Initial_CPM` |
| 9 | Joiner | `jnr_Inputs_CPM` |
| 10 | Aggregator | `agg_Count_CPM` |
| 11 | Normalizer | `nrm_Counters` |
| 12 | Expression | `exp_Counters` |
| 13 | Expression | `exp_Final_Counters` |
| 14 | Target | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` |
| 15 | Target | `AFPS_COUNTER_TBL` |

**Data Flow:**

```
[HI_AFPS_FEEDER_TBL] → [CPM_NEWPAY_TBL] → (SQ_HI_AFPS_FEEDER_TBL) → (SQ_CPM_NEWPAY_TBL) →
  (Expression: exp_Initial_Feeder) → (Aggregator: agg_Feeder) → (Expression: exp_Final_Message) →
  (Expression: exp_Initial_CPM) → (Joiner: jnr_Inputs_CPM) → (Aggregator: agg_Count_CPM) →
  (Normalizer: nrm_Counters) → (Expression: exp_Counters) → (Expression: exp_Final_Counters) →
  [CPM_AFPS_MESSAGE_COUNTS_TOT_FILE] → [AFPS_COUNTER_TBL]
```

### Mapping: `m_CPM_AFPS_0860_Concatenate_Counts_Files`

**Source(s):** `HI_GENERIC_SRC_TBL`  
**Target(s):** `GENERIC_TARGET_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_GENERIC_SRC_TBL` |
| 2 | Source Qualifier | `SQ_HI_GENERIC_SRC_TBL` |
| 3 | Target | `GENERIC_TARGET_FILE` |

**Data Flow:**

```
[HI_GENERIC_SRC_TBL] → (SQ_HI_GENERIC_SRC_TBL) → [GENERIC_TARGET_FILE]
```

### Mapping: `m_CPM_AFPS_0025_Set_Pay_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_AFPS_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Final` |
| 3 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 4 | Expression | `exp_Set_Parameters` |
| 5 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 6 | Source Qualifier | `SQ_PAY_PERIOD` |
| 7 | Expression | `exp_Initial` |
| 8 | Expression | `exp_Validate_Parameters` |
| 9 | Lookup Procedure | `lkp_CPM_NEWPAY_TBL` |
| 10 | Target | `CPM_AFPS_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Set_Parameters) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Initial) → (Expression: exp_Validate_Parameters) →
  (Lookup Procedure: lkp_CPM_NEWPAY_TBL) → [CPM_AFPS_PAY_PERIOD_FILE]
```

### Mapping: `m_CPM_AFPS_0600_Crossfoot_Message_Details`

**Source(s):** `ERROR_TBL`  
**Target(s):** `CPM_AFPS_CROSSFOOT_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `ERROR_TBL` |
| 2 | Expression | `exp_Final_Message` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Convert` |
| 5 | Source Qualifier | `SQ_ERROR_TBL` |
| 6 | Target | `CPM_AFPS_CROSSFOOT_FILE` |

**Data Flow:**

```
[ERROR_TBL] → (SQ_ERROR_TBL) → (Expression: exp_Final_Message) → (Expression: exp_Initial) →
  (Expression: exp_Convert) → [CPM_AFPS_CROSSFOOT_FILE]
```

### Mapping: `m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL`

**Source(s):** `CPM_CYCLE_TBL1`  
**Target(s):** `CPM_CYCLE_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_CYCLE_TBL1` |
| 2 | Update Strategy | `upd_DFAS_HEADER_TABLE` |
| 3 | Source Qualifier | `SQ_CPM_CYCLE_TBL` |
| 4 | Expression | `exp_Increment_Cycle_ID` |
| 5 | Expression | `exp_Format_Lookup_Current_PAY_PERIOD` |
| 6 | Lookup Procedure | `lkp_PAY_PERIOD` |
| 7 | Target | `CPM_CYCLE_TBL` |

**Data Flow:**

```
[CPM_CYCLE_TBL1] → (SQ_CPM_CYCLE_TBL) → (Update Strategy: upd_DFAS_HEADER_TABLE) →
  (Expression: exp_Increment_Cycle_ID) → (Expression: exp_Format_Lookup_Current_PAY_PERIOD) →
  (Lookup Procedure: lkp_PAY_PERIOD) → [CPM_CYCLE_TBL]
```

### Mapping: `m_CPM_AFPS_0010_Set_CPM_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_AFPS_PAY_PERIOD_CAL_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Final` |
| 3 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 4 | Expression | `exp_Set_Parameters` |
| 5 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 6 | Source Qualifier | `SQ_PAY_PERIOD` |
| 7 | Expression | `exp_Initial` |
| 8 | Expression | `exp_Validate_Parameters` |
| 9 | Expression | `exp_Stage_Parameters` |
| 10 | Expression | `exp_PP_YEAR_NUM` |
| 11 | Target | `CPM_AFPS_PAY_PERIOD_CAL_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Set_Parameters) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Initial) → (Expression: exp_Validate_Parameters) →
  (Expression: exp_Stage_Parameters) → (Expression: exp_PP_YEAR_NUM) → [CPM_AFPS_PAY_PERIOD_CAL_FILE]
```

### Mapping: `m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT`

**Source(s):** `HI_AFPS_FEEDER_TBL`  
**Target(s):** `feeder_FEEDER_RECORD`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_AFPS_FEEDER_TBL` |
| 2 | Source Qualifier | `SQ_HI_AFPS_FEEDER_TBL` |
| 3 | Target | `feeder_FEEDER_RECORD` |

**Data Flow:**

```
[HI_AFPS_FEEDER_TBL] → (SQ_HI_AFPS_FEEDER_TBL) → [feeder_FEEDER_RECORD]
```

### Mapping: `m_CPM_AFPS_0400_Crossfoot_Errors`

**Source(s):** `HI_GROSS_EXP_TBL`, `CPM_PM3_STG_TBL`, `HI_GROSS_EXP_TBL1`  
**Target(s):** `ERROR_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_GROSS_EXP_TBL` |
| 2 | Source | `CPM_PM3_STG_TBL` |
| 3 | Source | `HI_GROSS_EXP_TBL1` |
| 4 | Source Qualifier | `SQ_HI_GROSS_EXP_TBL` |
| 5 | Expression | `exp_Format_Message` |
| 6 | Expression | `exp_Join_Tables` |
| 7 | Lookup Procedure | `lkp_CPM3` |
| 8 | Source Qualifier | `SQ_HI_GROSS_EXP_TBL1` |
| 9 | Joiner | `jnr_Check_For_Records_Not_In_CPM3` |
| 10 | Target | `ERROR_TBL` |

**Data Flow:**

```
[HI_GROSS_EXP_TBL] → [CPM_PM3_STG_TBL] → [HI_GROSS_EXP_TBL1] →
  (SQ_HI_GROSS_EXP_TBL) → (SQ_HI_GROSS_EXP_TBL1) → (Expression: exp_Format_Message) →
  (Expression: exp_Join_Tables) → (Lookup Procedure: lkp_CPM3) →
  (Joiner: jnr_Check_For_Records_Not_In_CPM3) → [ERROR_TBL]
```

---

## CPM_CDC

**Folder:** CPM | **Owner:** NKNIGHT

### Workflow: `wf_CPM_CDC`

**Valid:** YES | **Task Instances:** 8

**Execution Order:**

```
Start → s_CPM_CDC_Set_CPM_Calendar → s_CPM_CDC_Set_Pay_Calendar → s_CPM_CDC_Load_CPM_CDC_Header_File → s_CPM_CDC_Load_CPM_CDC_Data_File → s_CPM_CDC_Concatenate_Files → s_CPM_CDC_Build_Message → email_CPM_CDC
```

### Mapping: `m_CPM_CDC_Load_CPM_CDC_Header_File`

**Source(s):** `PAY_PERIOD`  
**Target(s):** `cdchdr_WS_CDC_HDR`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD` |
| 2 | Expression | `exp_Final` |
| 3 | Expression | `exp_Initial` |
| 4 | Source Qualifier | `SQ_PAY_PERIOD` |
| 5 | Target | `cdchdr_WS_CDC_HDR` |

**Data Flow:**

```
[PAY_PERIOD] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Expression: exp_Initial) → [cdchdr_WS_CDC_HDR]
```

### Mapping: `m_CPM_CDC_Concatenate_Files`

**Source(s):** `HI_GENERIC_SRC_TBL`  
**Target(s):** `GENERIC_TARGET_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_GENERIC_SRC_TBL` |
| 2 | Source Qualifier | `SQ_HI_GENERIC_SRC_TBL` |
| 3 | Target | `GENERIC_TARGET_FILE` |

**Data Flow:**

```
[HI_GENERIC_SRC_TBL] → (SQ_HI_GENERIC_SRC_TBL) → [GENERIC_TARGET_FILE]
```

### Mapping: `m_CPM_CDC_Set_Pay_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_CDC_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Final` |
| 3 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 4 | Expression | `exp_Set_Parameters` |
| 5 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 6 | Source Qualifier | `SQ_PAY_PERIOD` |
| 7 | Expression | `exp_Initial` |
| 8 | Expression | `exp_Validate_Parameters` |
| 9 | Lookup Procedure | `lkp_CPM_NEWPAY_TBL` |
| 10 | Target | `CPM_CDC_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Set_Parameters) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Initial) → (Expression: exp_Validate_Parameters) →
  (Lookup Procedure: lkp_CPM_NEWPAY_TBL) → [CPM_CDC_PAY_PERIOD_FILE]
```

### Mapping: `m_CPM_CDC_Load_CPM_CDC_Data_File`

**Source(s):** `CPM_NEWPAY_TBL`  
**Target(s):** `cdcskel_WS_PAY_OUT_REC`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 3 | Expression | `exp_Set_Defaults` |
| 4 | Expression | `exp_Init` |
| 5 | Expression | `exp_Final` |
| 6 | Expression | `exp_Convert` |
| 7 | Target | `cdcskel_WS_PAY_OUT_REC` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → (SQ_CPM_NEWPAY_TBL) → (Expression: exp_Set_Defaults) → (Expression: exp_Init) →
  (Expression: exp_Final) → (Expression: exp_Convert) → [cdcskel_WS_PAY_OUT_REC]
```

### Mapping: `m_CPM_CDC_Set_CPM_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_CDC_CPM_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 3 | Expression | `exp_Set_Parameters` |
| 4 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 5 | Source Qualifier | `SQ_PAY_PERIOD` |
| 6 | Expression | `exp_Initial` |
| 7 | Expression | `exp_Final` |
| 8 | Expression | `exp_Validate_Parameters` |
| 9 | Target | `CPM_CDC_CPM_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Set_Parameters) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Initial) → (Expression: exp_Final) → (Expression: exp_Validate_Parameters) →
  [CPM_CDC_CPM_PAY_PERIOD_FILE]
```

### Mapping: `m_CPM_CDC_Build_Message`

**Source(s):** `CPM_NEWPAY_TBL`  
**Target(s):** `CPM_CDC_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 3 | Expression | `exp_Build_Message` |
| 4 | Expression | `exp_Final` |
| 5 | Expression | `exp_Initial` |
| 6 | Aggregator | `agg_Count_CPM_CDC` |
| 7 | Lookup Procedure | `lkp_Pay_Period_Total` |
| 8 | Target | `CPM_CDC_MESSAGE_FILE` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → (SQ_CPM_NEWPAY_TBL) → (Expression: exp_Build_Message) → (Expression: exp_Final) →
  (Expression: exp_Initial) → (Aggregator: agg_Count_CPM_CDC) →
  (Lookup Procedure: lkp_Pay_Period_Total) → [CPM_CDC_MESSAGE_FILE]
```

---

## CPM_NIH

**Folder:** CPM | **Owner:** NKNIGHT

### Workflow: `wf_CPM_NIH`

**Valid:** YES | **Task Instances:** 8

**Execution Order:**

```
Start → s_CPM_NIH_Set_CPM_Calendar → s_CPM_NIH_Set_Pay_Calendar → s_CPM_NIH_Load_CPM_NIH_Header_File → s_CPM_NIH_Load_CPM_NIH_Data_File → s_CPM_NIH_Concatenate_Files → s_CPM_NIH_Build_Message → email_CPM_NIH
```

### Mapping: `m_CPM_NIH_Build_Message`

**Source(s):** `CPM_NEWPAY_TBL`  
**Target(s):** `CPM_NIH_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Lookup Procedure | `lkp_Pay_Period_Total` |
| 3 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 4 | Expression | `exp_Build_Message` |
| 5 | Expression | `exp_Final` |
| 6 | Expression | `exp_Initial` |
| 7 | Aggregator | `agg_Count_CPM_NIH` |
| 8 | Target | `CPM_NIH_MESSAGE_FILE` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → (SQ_CPM_NEWPAY_TBL) → (Lookup Procedure: lkp_Pay_Period_Total) →
  (Expression: exp_Build_Message) → (Expression: exp_Final) → (Expression: exp_Initial) →
  (Aggregator: agg_Count_CPM_NIH) → [CPM_NIH_MESSAGE_FILE]
```

### Mapping: `m_CPM_NIH_Load_CPM_NIH_Header_File`

**Source(s):** `PAY_PERIOD`  
**Target(s):** `nihhdr_WS_NIH_HDR`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD` |
| 3 | Expression | `exp_Final` |
| 4 | Expression | `exp_Initial` |
| 5 | Target | `nihhdr_WS_NIH_HDR` |

**Data Flow:**

```
[PAY_PERIOD] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Expression: exp_Initial) → [nihhdr_WS_NIH_HDR]
```

### Mapping: `m_CPM_NIH_Load_CPM_NIH_Data_File`

**Source(s):** `CPM_NEWPAY_TBL`  
**Target(s):** `nihtest_NIH_PAYROLL_MASTER`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 3 | Expression | `exp_Set_Defaults` |
| 4 | Expression | `exp_Init` |
| 5 | Expression | `exp_Final` |
| 6 | Expression | `exp_Convert` |
| 7 | Target | `nihtest_NIH_PAYROLL_MASTER` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → (SQ_CPM_NEWPAY_TBL) → (Expression: exp_Set_Defaults) → (Expression: exp_Init) →
  (Expression: exp_Final) → (Expression: exp_Convert) → [nihtest_NIH_PAYROLL_MASTER]
```

### Mapping: `m_CPM_NIH_Set_CPM_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_NIH_CPM_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Final` |
| 3 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 4 | Expression | `exp_Set_Parameters` |
| 5 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 6 | Source Qualifier | `SQ_PAY_PERIOD` |
| 7 | Expression | `exp_Initial` |
| 8 | Expression | `exp_Validate_Parameters` |
| 9 | Target | `CPM_NIH_CPM_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Set_Parameters) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Initial) → (Expression: exp_Validate_Parameters) → [CPM_NIH_CPM_PAY_PERIOD_FILE]
```

### Mapping: `m_CPM_NIH_Concatenate_Files`

**Source(s):** `HI_GENERIC_SRC_TBL`  
**Target(s):** `GENERIC_TARGET_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_GENERIC_SRC_TBL` |
| 2 | Source Qualifier | `SQ_HI_GENERIC_SRC_TBL` |
| 3 | Target | `GENERIC_TARGET_FILE` |

**Data Flow:**

```
[HI_GENERIC_SRC_TBL] → (SQ_HI_GENERIC_SRC_TBL) → [GENERIC_TARGET_FILE]
```

### Mapping: `m_CPM_NIH_Set_Pay_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_NIH_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Final` |
| 3 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 4 | Expression | `exp_Set_Parameters` |
| 5 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 6 | Source Qualifier | `SQ_PAY_PERIOD` |
| 7 | Expression | `exp_Initial` |
| 8 | Expression | `exp_Validate_Parameters` |
| 9 | Lookup Procedure | `lkp_CPM_NEWPAY_TBL` |
| 10 | Target | `CPM_NIH_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Set_Parameters) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Initial) → (Expression: exp_Validate_Parameters) →
  (Lookup Procedure: lkp_CPM_NEWPAY_TBL) → [CPM_NIH_PAY_PERIOD_FILE]
```

---

## CPM_OIG

**Folder:** CPM | **Owner:** NKNIGHT

### Workflow: `wf_CPM_OIG`

**Valid:** YES | **Task Instances:** 6

**Execution Order:**

```
Start → s_CPM_OIG_Set_CPM_Calendar → s_CPM_OIG_Set_Pay_Calendar → s_CPM_OIG_Load_CPM_OIG_File → s_CPM_OIG_Build_Message → email_CPM_OIG
```

### Mapping: `m_CPM_OIG_Build_Message`

**Source(s):** `CPM_NEWPAY_TBL`  
**Target(s):** `CPM_OIG_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 3 | Expression | `exp_Build_Message` |
| 4 | Expression | `exp_Final` |
| 5 | Expression | `exp_Initial` |
| 6 | Aggregator | `agg_Count_CPM_OIG` |
| 7 | Target | `CPM_OIG_MESSAGE_FILE` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → (SQ_CPM_NEWPAY_TBL) → (Expression: exp_Build_Message) → (Expression: exp_Final) →
  (Expression: exp_Initial) → (Aggregator: agg_Count_CPM_OIG) → [CPM_OIG_MESSAGE_FILE]
```

### Mapping: `m_CPM_OIG_Set_Pay_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_OIG_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Validate_Parameters` |
| 3 | Expression | `exp_Set_Current_Pay_Period_Param` |
| 4 | Lookup Procedure | `lkp_CPM_NEWPAY_TBL` |
| 5 | Expression | `exp_Final` |
| 6 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 7 | Expression | `exp_Set_Parameters` |
| 8 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 9 | Source Qualifier | `SQ_PAY_PERIOD` |
| 10 | Expression | `exp_Initial` |
| 11 | Target | `CPM_OIG_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Validate_Parameters) →
  (Expression: exp_Set_Current_Pay_Period_Param) → (Lookup Procedure: lkp_CPM_NEWPAY_TBL) →
  (Expression: exp_Final) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Set_Parameters) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Initial) → [CPM_OIG_PAY_PERIOD_FILE]
```

### Mapping: `m_CPM_OIG_Set_CPM_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_OIG_CPM_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Validate_Parameters` |
| 3 | Expression | `exp_Final` |
| 4 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 5 | Expression | `exp_Set_Parameters` |
| 6 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 7 | Source Qualifier | `SQ_PAY_PERIOD` |
| 8 | Expression | `exp_Initial` |
| 9 | Target | `CPM_OIG_CPM_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Validate_Parameters) → (Expression: exp_Final) →
  (Lookup Procedure: lkp_Existing_Pay_Period) → (Expression: exp_Set_Parameters) →
  (Lookup Procedure: lkp_Current_Pay_Period) → (Expression: exp_Initial) →
  [CPM_OIG_CPM_PAY_PERIOD_FILE]
```

### Mapping: `m_CPM_OIG_Load_CPM_OIG_File`

**Source(s):** `CPM_NEWPAY_TBL`  
**Target(s):** `oigsgndec_SKPAYROLL_MASTER`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_NEWPAY_TBL` |
| 2 | Source Qualifier | `SQ_CPM_NEWPAY_TBL` |
| 3 | Expression | `exp_Set_Defaults` |
| 4 | Expression | `exp_Init` |
| 5 | Expression | `exp_Final` |
| 6 | Update Strategy | `UPDTRANS` |
| 7 | Expression | `exp_Convert` |
| 8 | Target | `oigsgndec_SKPAYROLL_MASTER` |

**Data Flow:**

```
[CPM_NEWPAY_TBL] → (SQ_CPM_NEWPAY_TBL) → (Expression: exp_Set_Defaults) → (Expression: exp_Init) →
  (Expression: exp_Final) → (Update Strategy: UPDTRANS) → (Expression: exp_Convert) →
  [oigsgndec_SKPAYROLL_MASTER]
```

---

## EHRP2BIIS_UPDATE

**Folder:** EHRP2BIIS | **Owner:** NKNIGHT

### Workflow: `wf_EHRP2BIIS_UPDATE`

**Valid:** YES | **Task Instances:** 2

**Execution Order:**

```
Start → s_m_EHRP2BIIS_UPDATE
```

### Mapping: `m_EHRP2BIIS_UPDATE`

**Source(s):** `PS_GVT_JOB`, `NWK_NEW_EHRP_ACTIONS_TBL`  
**Target(s):** `NWK_ACTION_SECONDARY_TBL`, `NWK_ACTION_PRIMARY_TBL`, `EHRP_RECS_TRACKING_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PS_GVT_JOB` |
| 2 | Source | `NWK_NEW_EHRP_ACTIONS_TBL` |
| 3 | Expression | `exp_GET_EFFDT_YEAR` |
| 4 | Lookup Procedure | `lkp_OLD_SEQUENCE_NUMBER` |
| 5 | Source Qualifier | `SQ_PS_GVT_JOB` |
| 6 | Lookup Procedure | `lkp_PS_GVT_EMPLOYMENT` |
| 7 | Lookup Procedure | `lkp_PS_GVT_PERS_NID` |
| 8 | Expression | `exp_MAIN2BIIS` |
| 9 | Lookup Procedure | `lkp_PS_GVT_AWD_DATA` |
| 10 | Lookup Procedure | `lkp_PS_GVT_EE_DATA_TRK` |
| 11 | Lookup Procedure | `lkp_PS_HE_FILL_POS` |
| 12 | Lookup Procedure | `lkp_PS_GVT_CITIZENSHIP` |
| 13 | Lookup Procedure | `lkp_PS_GVT_PERS_DATA` |
| 14 | Expression | `exp_PERS_DATA` |
| 15 | Lookup Procedure | `lkp_PS_JPM_JP_ITEMS` |
| 16 | Target | `NWK_ACTION_SECONDARY_TBL` |
| 17 | Target | `NWK_ACTION_PRIMARY_TBL` |
| 18 | Target | `EHRP_RECS_TRACKING_TBL` |

**Data Flow:**

```
[PS_GVT_JOB] → [NWK_NEW_EHRP_ACTIONS_TBL] → (SQ_PS_GVT_JOB) → (Expression: exp_GET_EFFDT_YEAR) →
  (Lookup Procedure: lkp_OLD_SEQUENCE_NUMBER) → (Lookup Procedure: lkp_PS_GVT_EMPLOYMENT) →
  (Lookup Procedure: lkp_PS_GVT_PERS_NID) → (Expression: exp_MAIN2BIIS) →
  (Lookup Procedure: lkp_PS_GVT_AWD_DATA) → (Lookup Procedure: lkp_PS_GVT_EE_DATA_TRK) →
  (Lookup Procedure: lkp_PS_HE_FILL_POS) → (Lookup Procedure: lkp_PS_GVT_CITIZENSHIP) →
  (Lookup Procedure: lkp_PS_GVT_PERS_DATA) → (Expression: exp_PERS_DATA) →
  (Lookup Procedure: lkp_PS_JPM_JP_ITEMS) → [NWK_ACTION_SECONDARY_TBL] → [NWK_ACTION_PRIMARY_TBL] →
  [EHRP_RECS_TRACKING_TBL]
```

---

## FDA_Leave

**Folder:** CPM | **Owner:** NKNIGHT

### Workflow: `wf_FDA_Leave`

**Valid:** YES | **Task Instances:** 11

**Execution Order:**

```
Start → s_0010_PM_FDA_Verify_File → s_0020_PM_FDA_Set_CPM_Calendar → s_0025_PM_FDA_Set_Pay_Calendar → s_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA → s_0100_PM_FDA_Load_TATRAN_To_DB → s_0150_PM_FDA_Error_Counter → s_0200_PM_FDA_Create_200_Rows → s_0300_PM_FDA_Create_Output_File → s_0500_PM_FDA_IO_Counter → s_1100_PM_FDA_Send_Email
```

### Mapping: `m_0150_PM_FDA_Error_Counter`

**Source(s):** `HI_PM_FDA_TATRAN_TBL11`  
**Target(s):** `ERROR_TBL_CPM`, `ERROR_TBL_MER`, `ERROR_TBL_YTD`, `ERROR_TBL_PAD`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_PM_FDA_TATRAN_TBL11` |
| 2 | Expression | `exp_Format_YTD` |
| 3 | Lookup Procedure | `lkp_CPM_YTD_DETAIL_STG_TBL` |
| 4 | Source Qualifier | `SQ_HI_PM_FDA_TATRAN_TBL11` |
| 5 | Expression | `exp_Format_Get_Current_PP11` |
| 6 | Lookup Procedure | `lkp_PAY_PERIOD11` |
| 7 | Expression | `exp_Format_PAD` |
| 8 | Filter | `fil_Errors_PAD` |
| 9 | Lookup Procedure | `lkp_CPM_PAD_DETAIL_STG_TBL` |
| 10 | Filter | `fil_Errors_MER` |
| 11 | Lookup Procedure | `lkp_CPM_MER_DETAIL_STG_TBL` |
| 12 | Expression | `exp_Format_MER` |
| 13 | Lookup Procedure | `lkp_CPM_NEWPAY_TBL` |
| 14 | Expression | `exp_Format_CPM` |
| 15 | Filter | `fil_Errors_CPM` |
| 16 | Filter | `fil_Errors_YTD` |
| 17 | Target | `ERROR_TBL_CPM` |
| 18 | Target | `ERROR_TBL_MER` |
| 19 | Target | `ERROR_TBL_YTD` |
| 20 | Target | `ERROR_TBL_PAD` |

**Data Flow:**

```
[HI_PM_FDA_TATRAN_TBL11] → (SQ_HI_PM_FDA_TATRAN_TBL11) → (Expression: exp_Format_YTD) →
  (Lookup Procedure: lkp_CPM_YTD_DETAIL_STG_TBL) → (Expression: exp_Format_Get_Current_PP11) →
  (Lookup Procedure: lkp_PAY_PERIOD11) → (Expression: exp_Format_PAD) → (Filter: fil_Errors_PAD) →
  (Lookup Procedure: lkp_CPM_PAD_DETAIL_STG_TBL) → (Filter: fil_Errors_MER) →
  (Lookup Procedure: lkp_CPM_MER_DETAIL_STG_TBL) → (Expression: exp_Format_MER) →
  (Lookup Procedure: lkp_CPM_NEWPAY_TBL) → (Expression: exp_Format_CPM) → (Filter: fil_Errors_CPM) →
  (Filter: fil_Errors_YTD) → [ERROR_TBL_CPM] → [ERROR_TBL_MER] → [ERROR_TBL_YTD] → [ERROR_TBL_PAD]
```

### Mapping: `m_0300_PM_FDA_Create_Output_File`

**Source(s):** `HI_PM_FDA_TATRAN_TBL`  
**Target(s):** `HI_PM_FDA_TATRAN_FLAT`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_PM_FDA_TATRAN_TBL` |
| 2 | Source Qualifier | `SQ_HI_PM_FDA_TATRAN_TBL` |
| 3 | Expression | `exp_Convert_Minutes_REPLACESTR` |
| 4 | Target | `HI_PM_FDA_TATRAN_FLAT` |

**Data Flow:**

```
[HI_PM_FDA_TATRAN_TBL] → (SQ_HI_PM_FDA_TATRAN_TBL) → (Expression: exp_Convert_Minutes_REPLACESTR) → [HI_PM_FDA_TATRAN_FLAT]
```

### Mapping: `m_0020_PM_FDA_Set_CPM_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_FDA_CPM_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Final` |
| 3 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 4 | Expression | `exp_Set_Parameters` |
| 5 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 6 | Source Qualifier | `SQ_PAY_PERIOD` |
| 7 | Expression | `exp_Initial` |
| 8 | Expression | `exp_Validate_Parameters` |
| 9 | Target | `CPM_FDA_CPM_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Set_Parameters) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Initial) → (Expression: exp_Validate_Parameters) → [CPM_FDA_CPM_PAY_PERIOD_FILE]
```

### Mapping: `m_1100_PM_FDA_Send_Email`

**Source(s):** `HI_GENERIC_SRC_TBL`  
**Target(s):** `GENERIC_TARGET_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_GENERIC_SRC_TBL` |
| 2 | Source Qualifier | `SQ_HI_GENERIC_SRC_TBL` |
| 3 | Target | `GENERIC_TARGET_FILE` |

**Data Flow:**

```
[HI_GENERIC_SRC_TBL] → (SQ_HI_GENERIC_SRC_TBL) → [GENERIC_TARGET_FILE]
```

### Mapping: `m_0200_PM_FDA_Create_Insert_200_Rows`

**Source(s):** `HI_PM_FDA_TATRAN_TBL`  
**Target(s):** `HI_PM_FDA_TATRAN_TBL1`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_PM_FDA_TATRAN_TBL` |
| 2 | Source Qualifier | `SQ_HI_PM_FDA_TATRAN_TBL` |
| 3 | Expression | `exp_Format_200_Records` |
| 4 | Normalizer | `nrm_Normalize_200_Records` |
| 5 | Lookup Procedure | `lkp_CPM_MER_DETAIL_STG_TBL` |
| 6 | Expression | `exp_Set_PP` |
| 7 | Lookup Procedure | `lkp_PAY_PERIOD` |
| 8 | Lookup Procedure | `lkp_CPM_PAD_DETAIL_STG_TBL` |
| 9 | Lookup Procedure | `lkp_CPM_YTD_DETAIL_STG_TBL` |
| 10 | Filter | `fil_Filter_Out_NULL` |
| 11 | Lookup Procedure | `lkp_PSEUDOSSN` |
| 12 | Lookup Procedure | `lkp_CPM_NEWPAY_TBL` |
| 13 | Target | `HI_PM_FDA_TATRAN_TBL1` |

**Data Flow:**

```
[HI_PM_FDA_TATRAN_TBL] → (SQ_HI_PM_FDA_TATRAN_TBL) → (Expression: exp_Format_200_Records) →
  (Normalizer: nrm_Normalize_200_Records) → (Lookup Procedure: lkp_CPM_MER_DETAIL_STG_TBL) →
  (Expression: exp_Set_PP) → (Lookup Procedure: lkp_PAY_PERIOD) →
  (Lookup Procedure: lkp_CPM_PAD_DETAIL_STG_TBL) → (Lookup Procedure: lkp_CPM_YTD_DETAIL_STG_TBL) →
  (Filter: fil_Filter_Out_NULL) → (Lookup Procedure: lkp_PSEUDOSSN) →
  (Lookup Procedure: lkp_CPM_NEWPAY_TBL) → [HI_PM_FDA_TATRAN_TBL1]
```

### Mapping: `m_0500_PM_FDA_IO_Counter`

**Source(s):** `HI_PM_FDA_TATRAN_TBL`, `ERROR_TBL`, `PAY_PERIOD`  
**Target(s):** `COUNTER_TBL`, `FDA_EXTRACT_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_PM_FDA_TATRAN_TBL` |
| 2 | Source | `ERROR_TBL` |
| 3 | Source | `PAY_PERIOD` |
| 4 | Normalizer | `nrm_Counters_Message` |
| 5 | Expression | `exp_Counters1` |
| 6 | Source Qualifier | `SQ_HI_PM_FDA_TATRAN_TBL` |
| 7 | Filter | `fil_Leave_Records` |
| 8 | Aggregator | `agg_All_Leave_Recs` |
| 9 | Expression | `exp_Leave_Rec_Count` |
| 10 | Lookup Procedure | `lkp_Curr_Pay_Period` |
| 11 | Expression | `exp_Counters` |
| 12 | Lookup Procedure | `lkp_Count_HI_PM_FDA_TATRAN_TBL_READ` |
| 13 | Normalizer | `nrm_Counters` |
| 14 | Expression | `exp_Final_Rec_Insert` |
| 15 | Expression | `exp_Build_Message` |
| 16 | Expression | `exp_Final_Message` |
| 17 | Lookup Procedure | `lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL` |
| 18 | Aggregator | `agg_Error_Records` |
| 19 | Expression | `exp_Error_Count` |
| 20 | Joiner | `jnr_All_Counts` |
| 21 | Source Qualifier | `SQ_ERROR_TBL` |
| 22 | Expression | `exp_Initial_Error` |
| 23 | Target | `COUNTER_TBL` |
| 24 | Target | `FDA_EXTRACT_MESSAGE_FILE` |

**Data Flow:**

```
[HI_PM_FDA_TATRAN_TBL] → [ERROR_TBL] → [PAY_PERIOD] → (SQ_HI_PM_FDA_TATRAN_TBL) → (SQ_ERROR_TBL) →
  (Normalizer: nrm_Counters_Message) → (Expression: exp_Counters1) → (Filter: fil_Leave_Records) →
  (Aggregator: agg_All_Leave_Recs) → (Expression: exp_Leave_Rec_Count) →
  (Lookup Procedure: lkp_Curr_Pay_Period) → (Expression: exp_Counters) →
  (Lookup Procedure: lkp_Count_HI_PM_FDA_TATRAN_TBL_READ) → (Normalizer: nrm_Counters) →
  (Expression: exp_Final_Rec_Insert) → (Expression: exp_Build_Message) →
  (Expression: exp_Final_Message) → (Lookup Procedure: lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL) →
  (Aggregator: agg_Error_Records) → (Expression: exp_Error_Count) → (Joiner: jnr_All_Counts) →
  (Expression: exp_Initial_Error) → [COUNTER_TBL] → [FDA_EXTRACT_MESSAGE_FILE]
```

### Mapping: `m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA`

**Source(s):** `CPM_CYCLE_TBL1`  
**Target(s):** `CPM_CYCLE_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `CPM_CYCLE_TBL1` |
| 2 | Expression | `exp_Increment_Cycle_ID` |
| 3 | Expression | `exp_Format_Lookup_Current_PAY_PERIOD` |
| 4 | Lookup Procedure | `lkp_PAY_PERIOD` |
| 5 | Update Strategy | `upd_DFAS_HEADER_TABLE` |
| 6 | Source Qualifier | `SQ_CPM_CYCLE_TBL` |
| 7 | Target | `CPM_CYCLE_TBL` |

**Data Flow:**

```
[CPM_CYCLE_TBL1] → (SQ_CPM_CYCLE_TBL) → (Expression: exp_Increment_Cycle_ID) →
  (Expression: exp_Format_Lookup_Current_PAY_PERIOD) → (Lookup Procedure: lkp_PAY_PERIOD) →
  (Update Strategy: upd_DFAS_HEADER_TABLE) → [CPM_CYCLE_TBL]
```

### Mapping: `m_0010_PM_FDA_Verify_File`

**Source(s):** `HI_PM_FDA_TATRAN_FLAT_FILE_NAME`  
**Target(s):** `CPM_FDA_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_PM_FDA_TATRAN_FLAT_FILE_NAME` |
| 2 | Expression | `exp_Final` |
| 3 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 4 | Expression | `exp_Set_Parameters` |
| 5 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 6 | Expression | `exp_Initial` |
| 7 | Expression | `exp_Validate_Parameters` |
| 8 | Lookup Procedure | `lkp_CPM_NEWPAY_TBL` |
| 9 | Source Qualifier | `SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME` |
| 10 | Aggregator | `agg_Count_Number_of_Files` |
| 11 | Expression | `EXPTRANS` |
| 12 | Sorter | `srt_Distinct_File_Names` |
| 13 | Target | `CPM_FDA_PAY_PERIOD_FILE` |

**Data Flow:**

```
[HI_PM_FDA_TATRAN_FLAT_FILE_NAME] → (SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME) → (Expression: exp_Final) →
  (Lookup Procedure: lkp_Existing_Pay_Period) → (Expression: exp_Set_Parameters) →
  (Lookup Procedure: lkp_Current_Pay_Period) → (Expression: exp_Initial) →
  (Expression: exp_Validate_Parameters) → (Lookup Procedure: lkp_CPM_NEWPAY_TBL) →
  (Aggregator: agg_Count_Number_of_Files) → (Expression: EXPTRANS) → (Sorter: srt_Distinct_File_Names) →
  [CPM_FDA_PAY_PERIOD_FILE]
```

### Mapping: `m_0100_PM_FDA_Load_TATRAN_To_DB`

**Source(s):** `HI_PM_FDA_TATRAN_FLAT`  
**Target(s):** `HI_PM_FDA_TATRAN_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `HI_PM_FDA_TATRAN_FLAT` |
| 2 | Expression | `exp_Add_FDA_SEQ` |
| 3 | Source Qualifier | `SQ_HI_PM_FDA_TATRAN_FLAT` |
| 4 | Filter | `fil_Filter_Out_01_99` |
| 5 | Sorter | `srt_Sort_By_BATCH_SEQ` |
| 6 | Target | `HI_PM_FDA_TATRAN_TBL` |

**Data Flow:**

```
[HI_PM_FDA_TATRAN_FLAT] → (SQ_HI_PM_FDA_TATRAN_FLAT) → (Expression: exp_Add_FDA_SEQ) →
  (Filter: fil_Filter_Out_01_99) → (Sorter: srt_Sort_By_BATCH_SEQ) → [HI_PM_FDA_TATRAN_TBL]
```

### Mapping: `m_0025_PM_FDA_Set_Pay_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `CPM_FDA_PAY_PERIOD_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Validate_Parameters` |
| 5 | Lookup Procedure | `lkp_CPM_NEWPAY_TBL` |
| 6 | Expression | `exp_Stage_Parameters` |
| 7 | Expression | `exp_Final` |
| 8 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 9 | Expression | `exp_Set_Parameters` |
| 10 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 11 | Target | `CPM_FDA_PAY_PERIOD_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Initial) → (Expression: exp_Validate_Parameters) →
  (Lookup Procedure: lkp_CPM_NEWPAY_TBL) → (Expression: exp_Stage_Parameters) → (Expression: exp_Final) →
  (Lookup Procedure: lkp_Existing_Pay_Period) → (Expression: exp_Set_Parameters) →
  (Lookup Procedure: lkp_Current_Pay_Period) → [CPM_FDA_PAY_PERIOD_FILE]
```

---

## LES

**Folder:** LES | **Owner:** NKNIGHT

### Workflow: `wf_LES`

**Valid:** YES | **Task Instances:** 34

**Execution Order:**

```
Start → s_LES_Current_Pay_Period → s_LES_Verify_Header → s_LES_Verify_Record_Count → s_LES_Load_LES_HEADER_TBL → s_LES_Load_LES_EMP_DETAIL_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL → s_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL → s_LES_Load_LES_PRIMARY_DATA_TBL → s_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL → s_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL → s_LES_Load_LES_EMP_DETAIL_LEAVE_TBL → s_LESRPT_Load_LESC → s_LESRPT_Load_LESD → s_LESRPT_Load_LESL → s_LESRPT_Load_LESM → s_LESRPT_Load_LESR → s_LESRPT_Load_LESS → s_LESRPT_Load_LEST → s_LESRPT_Load_LESU → s_LES_NIH_FILE → s_LES_Build_Message_Counters → email_LES_Complete
```

### Mapping: `m_LESRPT_Load_LESL`

**Source(s):** `LES_EMP_DETAIL_LEAVE_TBL`  
**Target(s):** `LESL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_LEAVE_TBL` |
| 2 | Source Qualifier | `SQ_LES_EMP_DETAIL_LEAVE_TBL` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Final` |
| 5 | Lookup Procedure | `lkp_LESL_KEY` |
| 6 | Target | `LESL` |

**Data Flow:**

```
[LES_EMP_DETAIL_LEAVE_TBL] → (SQ_LES_EMP_DETAIL_LEAVE_TBL) → (Expression: exp_Initial) →
  (Expression: exp_Final) → (Lookup Procedure: lkp_LESL_KEY) → [LESL]
```

### Mapping: `m_LESRPT_Load_LEST`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_T_TBL`  
**Target(s):** `LEST`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_T_TBL` |
| 2 | Sequence | `SEQTRANS` |
| 3 | Expression | `exp_Final` |
| 4 | Expression | `exp_Initial` |
| 5 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_T_TBL` |
| 6 | Lookup Procedure | `lkp_LEST_KEY` |
| 7 | Target | `LEST` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_T_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_T_TBL) → (Sequence: SEQTRANS) →
  (Expression: exp_Final) → (Expression: exp_Initial) → (Lookup Procedure: lkp_LEST_KEY) → [LEST]
```

### Mapping: `m_LESRPT_Load_LESM`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_M_TBL`  
**Target(s):** `LESM`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_M_TBL` |
| 2 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_M_TBL` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Final` |
| 5 | Lookup Procedure | `lkp_LESM_KEY` |
| 6 | Target | `LESM` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_M_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_M_TBL) → (Expression: exp_Initial) →
  (Expression: exp_Final) → (Lookup Procedure: lkp_LESM_KEY) → [LESM]
```

### Mapping: `m_LESRPT_Load_LESD`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_D_TBL`  
**Target(s):** `LESD`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_D_TBL` |
| 2 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_D_TBL` |
| 3 | Expression | `exp_Final` |
| 4 | Expression | `exp_Initial` |
| 5 | Sequence | `SEQTRANS` |
| 6 | Lookup Procedure | `lkp_MAX_LESD_KEY` |
| 7 | Target | `LESD` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_D_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_D_TBL) → (Expression: exp_Final) →
  (Expression: exp_Initial) → (Sequence: SEQTRANS) → (Lookup Procedure: lkp_MAX_LESD_KEY) → [LESD]
```

### Mapping: `m_LESRPT_Load_LESS`

**Source(s):** `LES_PRIMARY_DATA_TBL`  
**Target(s):** `LESS`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_PRIMARY_DATA_TBL` |
| 2 | Source Qualifier | `SQ_LES_PRIMARY_DATA_TBL` |
| 3 | Expression | `exp_Final` |
| 4 | Expression | `exp_Initial` |
| 5 | Lookup Procedure | `lkp_MAX_LESS_KEY` |
| 6 | Target | `LESS` |

**Data Flow:**

```
[LES_PRIMARY_DATA_TBL] → (SQ_LES_PRIMARY_DATA_TBL) → (Expression: exp_Final) →
  (Expression: exp_Initial) → (Lookup Procedure: lkp_MAX_LESS_KEY) → [LESS]
```

### Mapping: `m_LESRPT_Load_LESU`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_U_TBL`  
**Target(s):** `LESU`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_U_TBL` |
| 2 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_U_TBL` |
| 3 | Expression | `exp_Final` |
| 4 | Expression | `exp_Initial` |
| 5 | Sequence | `SEQTRANS` |
| 6 | Lookup Procedure | `lkp_LESU_KEY` |
| 7 | Target | `LESU` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_U_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_U_TBL) → (Expression: exp_Final) →
  (Expression: exp_Initial) → (Sequence: SEQTRANS) → (Lookup Procedure: lkp_LESU_KEY) → [LESU]
```

### Mapping: `m_LESRPT_Load_LESC`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_C_TBL`  
**Target(s):** `LESC`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_C_TBL` |
| 2 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` |
| 3 | Expression | `exp_Final` |
| 4 | Expression | `exp_Initial` |
| 5 | Sequence | `SEQTRANS` |
| 6 | Lookup Procedure | `lkp_LESC_KEY` |
| 7 | Target | `LESC` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_C_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_C_TBL) → (Expression: exp_Final) →
  (Expression: exp_Initial) → (Sequence: SEQTRANS) → (Lookup Procedure: lkp_LESC_KEY) → [LESC]
```

### Mapping: `m_LESRPT_Load_LESR`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_R_TBL`  
**Target(s):** `LESR`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_R_TBL` |
| 2 | Sequence | `SEQTRANS` |
| 3 | Lookup Procedure | `lkp_LESR_KEY` |
| 4 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` |
| 5 | Expression | `exp_Final` |
| 6 | Expression | `exp_Initial` |
| 7 | Target | `LESR` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_R_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_R_TBL) → (Sequence: SEQTRANS) →
  (Lookup Procedure: lkp_LESR_KEY) → (Expression: exp_Final) → (Expression: exp_Initial) → [LESR]
```

### Mapping: `m_LES_Verify_Header`

**Source(s):** `EMP_REC_TYPE_0`  
**Target(s):** `LES_HEADER_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_0` |
| 2 | Lookup Procedure | `lkp_Pay_Period_Record_Date` |
| 3 | Filter | `fil_LES_HEADER` |
| 4 | Expression | `exp_Convert` |
| 5 | Normalizer | `Norm_EMP_REC_TYPE_0` |
| 6 | Expression | `exp_Final` |
| 7 | Expression | `exp_Stage` |
| 8 | Expression | `exp_Verify_Header_Date` |
| 9 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 10 | Target | `LES_HEADER_FILE` |

**Data Flow:**

```
[EMP_REC_TYPE_0] → (Lookup Procedure: lkp_Pay_Period_Record_Date) → (Filter: fil_LES_HEADER) →
  (Expression: exp_Convert) → (Normalizer: Norm_EMP_REC_TYPE_0) → (Expression: exp_Final) →
  (Expression: exp_Stage) → (Expression: exp_Verify_Header_Date) →
  (Lookup Procedure: lkp_Current_Pay_Period) → [LES_HEADER_FILE]
```

### Mapping: `m_LES_Verify_Record_Count`

**Source(s):** `EMP_REC_TYPE_E`  
**Target(s):** `LES_TOTALS_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_E` |
| 2 | Filter | `fil_LES_Records` |
| 3 | Expression | `exp_Convert` |
| 4 | Expression | `exp_Final` |
| 5 | Expression | `exp_Stage` |
| 6 | Expression | `exp_Verify_Header_Date` |
| 7 | Normalizer | `Norm_EMP_REC_TYPE_E` |
| 8 | Filter | `fil_Trailer_Records` |
| 9 | Target | `LES_TOTALS_FILE` |

**Data Flow:**

```
[EMP_REC_TYPE_E] → (Filter: fil_LES_Records) → (Expression: exp_Convert) → (Expression: exp_Final) →
  (Expression: exp_Stage) → (Expression: exp_Verify_Header_Date) → (Normalizer: Norm_EMP_REC_TYPE_E) →
  (Filter: fil_Trailer_Records) → [LES_TOTALS_FILE]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_L_TBL`  
**Target(s):** `LES_EMP_DETAIL_LEAVE_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_L_TBL` |
| 2 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_L_TBL` |
| 3 | Expression | `exp_Initial` |
| 4 | Expression | `exp_Final` |
| 5 | Target | `LES_EMP_DETAIL_LEAVE_TBL` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_L_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_L_TBL) → (Expression: exp_Initial) → (Expression: exp_Final) → [LES_EMP_DETAIL_LEAVE_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_R_TBL`  
**Target(s):** `LES_EMP_DETAIL_RETRO_EARN_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_R_TBL` |
| 2 | Filter | `fil_Remove_Blank_Retroactive_Earnings` |
| 3 | Expression | `exp_Initial` |
| 4 | Normalizer | `nrm_EMP_RETRO_EARN` |
| 5 | Expression | `exp_Convert` |
| 6 | Expression | `exp_Final` |
| 7 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` |
| 8 | Target | `LES_EMP_DETAIL_RETRO_EARN_TBL` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_R_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_R_TBL) →
  (Filter: fil_Remove_Blank_Retroactive_Earnings) → (Expression: exp_Initial) →
  (Normalizer: nrm_EMP_RETRO_EARN) → (Expression: exp_Convert) → (Expression: exp_Final) →
  [LES_EMP_DETAIL_RETRO_EARN_TBL]
```

### Mapping: `m_LES_NIH_FILE`

**Source(s):** `LES_EMPLOYEE_DETAIL`  
**Target(s):** `LES_NIH_EMPLOYEE_DETAIL`, `LES_NIH_EMPLOYEE_SUMMARY_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMPLOYEE_DETAIL` |
| 2 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 3 | Filter | `fil_NIH_Records` |
| 4 | Lookup Procedure | `lkp_PSEUDOSSN_TBL` |
| 5 | Expression | `exp_Initial` |
| 6 | Filter | `fil_Header_Trailer` |
| 7 | Expression | `exp_Flag_NIH_Record` |
| 8 | Source Qualifier | `SQ_LES_EMPLOYEE_DETAIL` |
| 9 | Filter | `fil_NIH_EMPLOYEE_DETAIL` |
| 10 | Expression | `exp_Final` |
| 11 | Expression | `exp_Set_Curr_Flag` |
| 12 | Target | `LES_NIH_EMPLOYEE_DETAIL` |
| 13 | Target | `LES_NIH_EMPLOYEE_SUMMARY_TBL` |

**Data Flow:**

```
[LES_EMPLOYEE_DETAIL] → (SQ_LES_EMPLOYEE_DETAIL) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Filter: fil_NIH_Records) → (Lookup Procedure: lkp_PSEUDOSSN_TBL) → (Expression: exp_Initial) →
  (Filter: fil_Header_Trailer) → (Expression: exp_Flag_NIH_Record) → (Filter: fil_NIH_EMPLOYEE_DETAIL) →
  (Expression: exp_Final) → (Expression: exp_Set_Curr_Flag) → [LES_NIH_EMPLOYEE_DETAIL] →
  [LES_NIH_EMPLOYEE_SUMMARY_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_C_TBL`  
**Target(s):** `LES_EMP_DETAIL_CURR_EARN_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_C_TBL` |
| 2 | Expression | `exp_Final` |
| 3 | Source Qualifier | `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` |
| 4 | Expression | `exp_Initial` |
| 5 | Normalizer | `nrm_EMP_CURR_EARN` |
| 6 | Filter | `fil_Remove_Blank_Current_Earnings` |
| 7 | Expression | `exp_Convert` |
| 8 | Target | `LES_EMP_DETAIL_CURR_EARN_TBL` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_C_TBL] → (SQ_LES_EMP_DETAIL_RECTYPE_C_TBL) → (Expression: exp_Final) →
  (Expression: exp_Initial) → (Normalizer: nrm_EMP_CURR_EARN) →
  (Filter: fil_Remove_Blank_Current_Earnings) → (Expression: exp_Convert) →
  [LES_EMP_DETAIL_CURR_EARN_TBL]
```

### Mapping: `m_LES_Build_Message_Counters`

**Source(s):** `LES_NIH_EMPLOYEE_SUMMARY_TBL`, `ERROR_TBL`, `EMP_REC_TYPE_E`, `LES_PRIMARY_DATA_TBL`  
**Target(s):** `LES_MESSAGE_FILE`, `COUNTER_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_NIH_EMPLOYEE_SUMMARY_TBL` |
| 2 | Source | `ERROR_TBL` |
| 3 | Source | `EMP_REC_TYPE_E` |
| 4 | Source | `LES_PRIMARY_DATA_TBL` |
| 5 | Joiner | `jnr_Input_Loaded_NIH_Errors` |
| 6 | Expression | `exp_Counters` |
| 7 | Expression | `exp_Final_Counters` |
| 8 | Expression | `exp_Stage_Counters` |
| 9 | Expression | `exp_Pay_Period` |
| 10 | Source Qualifier | `SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL` |
| 11 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 12 | Normalizer | `nrm_Counters` |
| 13 | Source Qualifier | `SQ_ERROR_TBL` |
| 14 | Normalizer | `Norm_EMP_REC_TYPE_E` |
| 15 | Filter | `fil_EMPLOYEE_DETAIL` |
| 16 | Expression | `exp_Build_Message` |
| 17 | Expression | `exp_Final_Message` |
| 18 | Expression | `exp_Init_Inputs` |
| 19 | Aggregator | `agg_Count_Input_Records` |
| 20 | Source Qualifier | `SQ_LES_PRIMARY_DATA_TBL` |
| 21 | Expression | `exp_Init_Loaded_Records` |
| 22 | Aggregator | `agg_Count_Loaded_Records` |
| 23 | Expression | `exp_Init_Errors` |
| 24 | Aggregator | `agg_Count_Error_Records` |
| 25 | Expression | `exp_Input_Counters` |
| 26 | Expression | `exp_Loaded_Counters` |
| 27 | Expression | `exp_Init_NIH` |
| 28 | Aggregator | `agg_Count_NIH_Records` |
| 29 | Expression | `exp_NIH_Counters` |
| 30 | Expression | `exp_Error_Count` |
| 31 | Joiner | `jnr_Inputs_Loaded` |
| 32 | Joiner | `jnr_Inputs_Loaded_NIH` |
| 33 | Target | `LES_MESSAGE_FILE` |
| 34 | Target | `COUNTER_TBL` |

**Data Flow:**

```
[LES_NIH_EMPLOYEE_SUMMARY_TBL] → [ERROR_TBL] → [EMP_REC_TYPE_E] → [LES_PRIMARY_DATA_TBL] →
  (SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL) → (SQ_ERROR_TBL) → (SQ_LES_PRIMARY_DATA_TBL) →
  (Joiner: jnr_Input_Loaded_NIH_Errors) → (Expression: exp_Counters) → (Expression: exp_Final_Counters) →
  (Expression: exp_Stage_Counters) → (Expression: exp_Pay_Period) →
  (Lookup Procedure: lkp_Current_Pay_Period) → (Normalizer: nrm_Counters) →
  (Normalizer: Norm_EMP_REC_TYPE_E) → (Filter: fil_EMPLOYEE_DETAIL) → (Expression: exp_Build_Message) →
  (Expression: exp_Final_Message) → (Expression: exp_Init_Inputs) →
  (Aggregator: agg_Count_Input_Records) → (Expression: exp_Init_Loaded_Records) →
  (Aggregator: agg_Count_Loaded_Records) → (Expression: exp_Init_Errors) →
  (Aggregator: agg_Count_Error_Records) → (Expression: exp_Input_Counters) →
  (Expression: exp_Loaded_Counters) → (Expression: exp_Init_NIH) → (Aggregator: agg_Count_NIH_Records) →
  (Expression: exp_NIH_Counters) → (Expression: exp_Error_Count) → (Joiner: jnr_Inputs_Loaded) →
  (Joiner: jnr_Inputs_Loaded_NIH) → [LES_MESSAGE_FILE] → [COUNTER_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL`

**Source(s):** `EMP_REC_TYPE_D`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_D_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_D` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Normalizer | `Norm_EMP_REC_TYPE_D` |
| 4 | Filter | `fil_EMP_REC_TYPE_D_EMP_DETAIL` |
| 5 | Expression | `exp_Convert` |
| 6 | Filter | `fil_EMP_REC_TYPE_D` |
| 7 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 8 | Joiner | `jnr_LES_NUMBER` |
| 9 | Expression | `exp_Final` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_D_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_D] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) → (Normalizer: Norm_EMP_REC_TYPE_D) →
  (Filter: fil_EMP_REC_TYPE_D_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_D) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → [LES_EMP_DETAIL_RECTYPE_D_TBL]
```

### Mapping: `m_LES_Current_Pay_Period`

**Source(s):** `PAY_PERIOD`  
**Target(s):** `LES_PAY_PERIOD_DATE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD` |
| 3 | Expression | `exp_Build_Pay_Period` |
| 4 | Expression | `exp_Final` |
| 5 | Target | `LES_PAY_PERIOD_DATE_FILE` |

**Data Flow:**

```
[PAY_PERIOD] → (SQ_PAY_PERIOD) → (Expression: exp_Build_Pay_Period) → (Expression: exp_Final) → [LES_PAY_PERIOD_DATE_FILE]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL`

**Source(s):** `LES_EMP_DETAIL_TBL`, `EMP_REC_TYPE_2`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_2_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_TBL` |
| 2 | Source | `EMP_REC_TYPE_2` |
| 3 | Filter | `fil_EMP_REC_TYPE_2_EMP_DETAIL` |
| 4 | Expression | `exp_Convert` |
| 5 | Filter | `fil_EMP_REC_TYPE_2` |
| 6 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 7 | Joiner | `jnr_LES_NUMBER` |
| 8 | Expression | `exp_Final` |
| 9 | Normalizer | `Norm_EMP_REC_TYPE_2` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_2_TBL` |

**Data Flow:**

```
[LES_EMP_DETAIL_TBL] → [EMP_REC_TYPE_2] → (SQ_LES_EMP_DETAIL_TBL) →
  (Filter: fil_EMP_REC_TYPE_2_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_2) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → (Normalizer: Norm_EMP_REC_TYPE_2) →
  [LES_EMP_DETAIL_RECTYPE_2_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL`

**Source(s):** `EMP_REC_TYPE_T`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_T_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_T` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Filter | `fil_EMP_REC_TYPE_T_EMP_DETAIL` |
| 4 | Expression | `exp_Convert` |
| 5 | Filter | `fil_EMP_REC_TYPE_T` |
| 6 | Joiner | `jnr_LES_NUMBER` |
| 7 | Expression | `exp_Final` |
| 8 | Normalizer | `Norm_EMP_REC_TYPE_T` |
| 9 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_T_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_T] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) →
  (Filter: fil_EMP_REC_TYPE_T_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_T) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → (Normalizer: Norm_EMP_REC_TYPE_T) →
  [LES_EMP_DETAIL_RECTYPE_T_TBL]
```

### Mapping: `m_LES_Load_LES_PRIMARY_DATA_TBL`

**Source(s):** `LES_EMP_DETAIL_RECTYPE_4_TBL`, `LES_EMP_DETAIL_RECTYPE_5_TBL`, `LES_EMP_DETAIL_RECTYPE_6_TBL`, `LES_EMP_DETAIL_TBL`, `LES_HEADER_TBL`, `LES_EMP_DETAIL_RECTYPE_1_TBL`, `LES_EMP_DETAIL_RECTYPE_2_TBL`, `LES_EMP_DETAIL_RECTYPE_3_TBL`  
**Target(s):** `LES_PRIMARY_DATA_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_RECTYPE_4_TBL` |
| 2 | Source | `LES_EMP_DETAIL_RECTYPE_5_TBL` |
| 3 | Source | `LES_EMP_DETAIL_RECTYPE_6_TBL` |
| 4 | Source | `LES_EMP_DETAIL_TBL` |
| 5 | Source | `LES_HEADER_TBL` |
| 6 | Source | `LES_EMP_DETAIL_RECTYPE_1_TBL` |
| 7 | Source | `LES_EMP_DETAIL_RECTYPE_2_TBL` |
| 8 | Source | `LES_EMP_DETAIL_RECTYPE_3_TBL` |
| 9 | Expression | `exp_Stage` |
| 10 | Lookup Procedure | `lkp_PSEUDOSSN` |
| 11 | Expression | `exp_Final` |
| 12 | Lookup Procedure | `lkp_Pay_Period` |
| 13 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 14 | Expression | `exp_Initial` |
| 15 | Target | `LES_PRIMARY_DATA_TBL` |

**Data Flow:**

```
[LES_EMP_DETAIL_RECTYPE_4_TBL] → [LES_EMP_DETAIL_RECTYPE_5_TBL] → [LES_EMP_DETAIL_RECTYPE_6_TBL] →
  [LES_EMP_DETAIL_TBL] → [LES_HEADER_TBL] → [LES_EMP_DETAIL_RECTYPE_1_TBL] →
  [LES_EMP_DETAIL_RECTYPE_2_TBL] → [LES_EMP_DETAIL_RECTYPE_3_TBL] → (SQ_LES_EMP_DETAIL_TBL) →
  (Expression: exp_Stage) → (Lookup Procedure: lkp_PSEUDOSSN) → (Expression: exp_Final) →
  (Lookup Procedure: lkp_Pay_Period) → (Expression: exp_Initial) → [LES_PRIMARY_DATA_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL`

**Source(s):** `EMP_REC_TYPE_3`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_3_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_3` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Normalizer | `Norm_EMP_REC_TYPE_3` |
| 4 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 5 | Filter | `fil_EMP_REC_TYPE_3_EMP_DETAIL` |
| 6 | Expression | `exp_Convert` |
| 7 | Filter | `fil_EMP_REC_TYPE_3` |
| 8 | Joiner | `jnr_LES_NUMBER` |
| 9 | Expression | `exp_Final` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_3_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_3] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) → (Normalizer: Norm_EMP_REC_TYPE_3) →
  (Filter: fil_EMP_REC_TYPE_3_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_3) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → [LES_EMP_DETAIL_RECTYPE_3_TBL]
```

### Mapping: `m_LES_Load_LES_HEADER_TBL`

**Source(s):** `EMP_REC_TYPE_0`  
**Target(s):** `LES_HEADER_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_0` |
| 2 | Lookup Procedure | `lkp_Pay_Period_Record_Date` |
| 3 | Filter | `fil_LES_HEADER` |
| 4 | Expression | `exp_Convert` |
| 5 | Normalizer | `Norm_EMP_REC_TYPE_0` |
| 6 | Expression | `exp_Final` |
| 7 | Expression | `exp_Stage` |
| 8 | Filter | `fil_First_Header_Record` |
| 9 | Target | `LES_HEADER_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_0] → (Lookup Procedure: lkp_Pay_Period_Record_Date) → (Filter: fil_LES_HEADER) →
  (Expression: exp_Convert) → (Normalizer: Norm_EMP_REC_TYPE_0) → (Expression: exp_Final) →
  (Expression: exp_Stage) → (Filter: fil_First_Header_Record) → [LES_HEADER_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL`

**Source(s):** `EMP_REC_TYPE_5`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_5_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_5` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Normalizer | `Norm_EMP_REC_TYPE_5` |
| 4 | Filter | `fil_EMP_REC_TYPE_5_EMP_DETAIL` |
| 5 | Expression | `exp_Convert` |
| 6 | Filter | `fil_EMP_REC_TYPE_5` |
| 7 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 8 | Joiner | `jnr_LES_NUMBER` |
| 9 | Expression | `exp_Final` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_5_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_5] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) → (Normalizer: Norm_EMP_REC_TYPE_5) →
  (Filter: fil_EMP_REC_TYPE_5_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_5) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → [LES_EMP_DETAIL_RECTYPE_5_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL`

**Source(s):** `EMP_REC_TYPE_1`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_1_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_1` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Filter | `fil_EMP_REC_TYPE_1_EMP_DETAIL` |
| 4 | Expression | `exp_Convert` |
| 5 | Normalizer | `Norm_EMP_REC_TYPE_1` |
| 6 | Filter | `fil_EMP_REC_TYPE_1` |
| 7 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 8 | Joiner | `jnr_LES_NUMBER` |
| 9 | Expression | `exp_Final` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_1_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_1] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) →
  (Filter: fil_EMP_REC_TYPE_1_EMP_DETAIL) → (Expression: exp_Convert) →
  (Normalizer: Norm_EMP_REC_TYPE_1) → (Filter: fil_EMP_REC_TYPE_1) → (Joiner: jnr_LES_NUMBER) →
  (Expression: exp_Final) → [LES_EMP_DETAIL_RECTYPE_1_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL`

**Source(s):** `EMP_REC_TYPE_4`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_4_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_4` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Normalizer | `Norm_EMP_REC_TYPE_4` |
| 4 | Filter | `fil_EMP_REC_TYPE_4_EMP_DETAIL` |
| 5 | Expression | `exp_Convert` |
| 6 | Filter | `fil_EMP_REC_TYPE_4` |
| 7 | Joiner | `jnr_LES_NUMBER` |
| 8 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 9 | Expression | `exp_Final` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_4_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_4] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) → (Normalizer: Norm_EMP_REC_TYPE_4) →
  (Filter: fil_EMP_REC_TYPE_4_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_4) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → [LES_EMP_DETAIL_RECTYPE_4_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_TBL`

**Source(s):** `LES_HEADER_TBL`, `EMP_REC_TYPE_E`  
**Target(s):** `LES_EMP_DETAIL_TBL`, `ERROR_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_HEADER_TBL` |
| 2 | Source | `EMP_REC_TYPE_E` |
| 3 | Source Qualifier | `SQ_LES_HEADER_TBL` |
| 4 | Joiner | `jnr_HEADER_EMP_DETAILS` |
| 5 | Expression | `exp_HEADER` |
| 6 | Filter | `fil_EMPLOYEE_DETAIL` |
| 7 | Expression | `exp_FINAL` |
| 8 | Expression | `exp_Convert` |
| 9 | Normalizer | `Norm_EMP_REC_TYPE_E` |
| 10 | Lookup Procedure | `lkp_PSEUDSSN_TBL` |
| 11 | Expression | `exp_STAGE` |
| 12 | Expression | `exp_CHECK_ERRORS` |
| 13 | Router | `rtr_GOOD_BAD_RECORDS` |
| 14 | Expression | `exp_FINAL_ERRORS` |
| 15 | Target | `LES_EMP_DETAIL_TBL` |
| 16 | Target | `ERROR_TBL` |

**Data Flow:**

```
[LES_HEADER_TBL] → [EMP_REC_TYPE_E] → (SQ_LES_HEADER_TBL) → (Joiner: jnr_HEADER_EMP_DETAILS) →
  (Expression: exp_HEADER) → (Filter: fil_EMPLOYEE_DETAIL) → (Expression: exp_FINAL) →
  (Expression: exp_Convert) → (Normalizer: Norm_EMP_REC_TYPE_E) → (Lookup Procedure: lkp_PSEUDSSN_TBL) →
  (Expression: exp_STAGE) → (Expression: exp_CHECK_ERRORS) → (Router: rtr_GOOD_BAD_RECORDS) →
  (Expression: exp_FINAL_ERRORS) → [LES_EMP_DETAIL_TBL] → [ERROR_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL`

**Source(s):** `EMP_REC_TYPE_R`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_R_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_R` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Normalizer | `Norm_EMP_REC_TYPE_R` |
| 4 | Filter | `fil_EMP_REC_TYPE_R_EMP_DETAIL` |
| 5 | Expression | `exp_Convert` |
| 6 | Filter | `fil_EMP_REC_TYPE_R` |
| 7 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 8 | Joiner | `jnr_LES_NUMBER` |
| 9 | Expression | `exp_Final` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_R_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_R] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) → (Normalizer: Norm_EMP_REC_TYPE_R) →
  (Filter: fil_EMP_REC_TYPE_R_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_R) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → [LES_EMP_DETAIL_RECTYPE_R_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL`

**Source(s):** `LES_EMP_DETAIL_TBL`, `EMP_REC_TYPE_U`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_U_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_TBL` |
| 2 | Source | `EMP_REC_TYPE_U` |
| 3 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 4 | Filter | `fil_EMP_REC_TYPE_U_EMP_DETAIL` |
| 5 | Expression | `exp_Convert` |
| 6 | Filter | `fil_EMP_REC_TYPE_U` |
| 7 | Joiner | `jnr_LES_NUMBER` |
| 8 | Expression | `exp_Final` |
| 9 | Normalizer | `Norm_EMP_REC_TYPE_U` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_U_TBL` |

**Data Flow:**

```
[LES_EMP_DETAIL_TBL] → [EMP_REC_TYPE_U] → (SQ_LES_EMP_DETAIL_TBL) →
  (Filter: fil_EMP_REC_TYPE_U_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_U) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → (Normalizer: Norm_EMP_REC_TYPE_U) →
  [LES_EMP_DETAIL_RECTYPE_U_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL`

**Source(s):** `EMP_REC_TYPE_L`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_L_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_L` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Normalizer | `Norm_EMP_REC_TYPE_L` |
| 4 | Filter | `fil_EMP_REC_TYPE_L_EMP_DETAIL` |
| 5 | Expression | `exp_Convert` |
| 6 | Filter | `fil_EMP_REC_TYPE_L` |
| 7 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 8 | Joiner | `jnr_LES_NUMBER` |
| 9 | Expression | `exp_Final` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_L_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_L] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) → (Normalizer: Norm_EMP_REC_TYPE_L) →
  (Filter: fil_EMP_REC_TYPE_L_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_L) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → [LES_EMP_DETAIL_RECTYPE_L_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL`

**Source(s):** `LES_EMP_DETAIL_TBL`, `EMP_REC_TYPE_6`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_6_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_TBL` |
| 2 | Source | `EMP_REC_TYPE_6` |
| 3 | Filter | `fil_EMP_REC_TYPE_6` |
| 4 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 5 | Joiner | `jnr_LES_NUMBER` |
| 6 | Expression | `exp_Final` |
| 7 | Normalizer | `Norm_EMP_REC_TYPE_6` |
| 8 | Filter | `fil_EMP_REC_TYPE_6_EMP_DETAIL` |
| 9 | Expression | `exp_Convert` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_6_TBL` |

**Data Flow:**

```
[LES_EMP_DETAIL_TBL] → [EMP_REC_TYPE_6] → (SQ_LES_EMP_DETAIL_TBL) → (Filter: fil_EMP_REC_TYPE_6) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → (Normalizer: Norm_EMP_REC_TYPE_6) →
  (Filter: fil_EMP_REC_TYPE_6_EMP_DETAIL) → (Expression: exp_Convert) → [LES_EMP_DETAIL_RECTYPE_6_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL`

**Source(s):** `LES_EMP_DETAIL_TBL`, `EMP_REC_TYPE_M`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_M_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `LES_EMP_DETAIL_TBL` |
| 2 | Source | `EMP_REC_TYPE_M` |
| 3 | Normalizer | `Norm_EMP_REC_TYPE_M` |
| 4 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 5 | Filter | `fil_EMP_REC_TYPE_M_EMP_DETAIL` |
| 6 | Expression | `exp_Convert` |
| 7 | Expression | `exp_Final` |
| 8 | Filter | `fil_EMP_REC_TYPE_M` |
| 9 | Joiner | `jnr_LES_NUMBER` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_M_TBL` |

**Data Flow:**

```
[LES_EMP_DETAIL_TBL] → [EMP_REC_TYPE_M] → (SQ_LES_EMP_DETAIL_TBL) → (Normalizer: Norm_EMP_REC_TYPE_M) →
  (Filter: fil_EMP_REC_TYPE_M_EMP_DETAIL) → (Expression: exp_Convert) → (Expression: exp_Final) →
  (Filter: fil_EMP_REC_TYPE_M) → (Joiner: jnr_LES_NUMBER) → [LES_EMP_DETAIL_RECTYPE_M_TBL]
```

### Mapping: `m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL`

**Source(s):** `EMP_REC_TYPE_C`, `LES_EMP_DETAIL_TBL`  
**Target(s):** `LES_EMP_DETAIL_RECTYPE_C_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `EMP_REC_TYPE_C` |
| 2 | Source | `LES_EMP_DETAIL_TBL` |
| 3 | Normalizer | `Norm_EMP_REC_TYPE_C` |
| 4 | Filter | `fil_EMP_REC_TYPE_C_EMP_DETAIL` |
| 5 | Expression | `exp_Convert` |
| 6 | Filter | `fil_EMP_REC_TYPE_C` |
| 7 | Source Qualifier | `SQ_LES_EMP_DETAIL_TBL` |
| 8 | Joiner | `jnr_LES_NUMBER` |
| 9 | Expression | `exp_Final` |
| 10 | Target | `LES_EMP_DETAIL_RECTYPE_C_TBL` |

**Data Flow:**

```
[EMP_REC_TYPE_C] → [LES_EMP_DETAIL_TBL] → (SQ_LES_EMP_DETAIL_TBL) → (Normalizer: Norm_EMP_REC_TYPE_C) →
  (Filter: fil_EMP_REC_TYPE_C_EMP_DETAIL) → (Expression: exp_Convert) → (Filter: fil_EMP_REC_TYPE_C) →
  (Joiner: jnr_LES_NUMBER) → (Expression: exp_Final) → [LES_EMP_DETAIL_RECTYPE_C_TBL]
```

---

## Pay_Calendar

**Folder:** Pay_Calendar | **Owner:** RDIANA

### Workflow: `wf_Pay_Calendar`

**Valid:** YES | **Task Instances:** 6

**Execution Order:**

```
Start → s_Pay_Calendar_Reset_Pay_Calendar → s_Pay_Calendar_Set_Pay_Calendar → s_Pay_Calendar_Verify_Pay_Calendar → s_Pay_Calendar_Build_Message → Email_Pay_Calendar
```

### Mapping: `m_Pay_Calendar_Verify_Pay_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `PAY_PERIOD_VERIFY_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD` |
| 3 | Expression | `exp_Initial` |
| 4 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 5 | Expression | `exp_Check_Current_Flag` |
| 6 | Target | `PAY_PERIOD_VERIFY_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Initial) →
  (Lookup Procedure: lkp_Current_Pay_Period) → (Expression: exp_Check_Current_Flag) →
  [PAY_PERIOD_VERIFY_FILE]
```

### Mapping: `m_Pay_Calendar_Set_Pay_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `PAY_PERIOD_PARAM`, `PAY_PERIOD`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Router | `rtr_Parameter_Non_Parameter` |
| 3 | Expression | `exp_Set_Date` |
| 4 | Expression | `exp_Set_Current_Pay_Period_Non_Param` |
| 5 | Lookup Procedure | `lkp_Existing_Pay_Period` |
| 6 | Expression | `exp_Determine_Parameters_Exist` |
| 7 | Lookup Procedure | `lkp_New_Current_Pay_Period` |
| 8 | Update Strategy | `upd_Set_Current_PP_Non_Param` |
| 9 | Update Strategy | `upd_Set_Current_PP_Param` |
| 10 | Source Qualifier | `SQ_PAY_PERIOD` |
| 11 | Expression | `exp_Initial` |
| 12 | Expression | `exp_Set_Current_Pay_Period_Param` |
| 13 | Target | `PAY_PERIOD_PARAM` |
| 14 | Target | `PAY_PERIOD` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Router: rtr_Parameter_Non_Parameter) → (Expression: exp_Set_Date) →
  (Expression: exp_Set_Current_Pay_Period_Non_Param) → (Lookup Procedure: lkp_Existing_Pay_Period) →
  (Expression: exp_Determine_Parameters_Exist) → (Lookup Procedure: lkp_New_Current_Pay_Period) →
  (Update Strategy: upd_Set_Current_PP_Non_Param) → (Update Strategy: upd_Set_Current_PP_Param) →
  (Expression: exp_Initial) → (Expression: exp_Set_Current_Pay_Period_Param) → [PAY_PERIOD_PARAM] →
  [PAY_PERIOD]
```

### Mapping: `m_Pay_Calendar_Build_Message`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `PAY_PERIOD_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Expression | `exp_Final` |
| 3 | Source Qualifier | `SQ_PAY_PERIOD` |
| 4 | Expression | `exp_Initial` |
| 5 | Target | `PAY_PERIOD_MESSAGE_FILE` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD) → (Expression: exp_Final) → (Expression: exp_Initial) → [PAY_PERIOD_MESSAGE_FILE]
```

### Mapping: `m_Pay_Calendar_Reset_Pay_Calendar`

**Source(s):** `PAY_PERIOD1`  
**Target(s):** `RESET_PAY_PERIOD`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD1` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD_RESET` |
| 3 | Expression | `exp_Initial` |
| 4 | Update Strategy | `upd_Reset_Current_PP` |
| 5 | Target | `RESET_PAY_PERIOD` |

**Data Flow:**

```
[PAY_PERIOD1] → (SQ_PAY_PERIOD_RESET) → (Expression: exp_Initial) → (Update Strategy: upd_Reset_Current_PP) → [RESET_PAY_PERIOD]
```

---

## Pseudossn

**Folder:** Pseudossn | **Owner:** RDIANA

### Workflow: `wf_Pseudossn`

**Valid:** YES | **Task Instances:** 12

**Execution Order:**

```
Start → s_Pseudossn_Verify_Header_Date_Current_Pay_Period → s_Pseudossn_Verify_Record_Count → s_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA → s_Pseudossn_Current_Pay_Period → s_Pseudossn_Load_Archive_Pseudossn_Tbl → s_Pseudossn_Load_Pseudossn_Tbl → s_Pseudossn_Load_Pseudossn_From_SDA_Tbl → s_Pseudossn_Update_Timekeeper_Number → s_Pseudossn_Load_SDA_Records_Pseudossn_Tbl → s_Pseudossn_Counters → Email_Pseudossn
```

### Mapping: `m_Pseudossn_Load_Pseudossn_From_SDA_Tbl`

**Source(s):** `PSEUDOSSN_FILE_TK_NUM`  
**Target(s):** `PSEUDOSSN_FROM_SDA_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_FILE_TK_NUM` |
| 2 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 3 | Expression | `exp_Final` |
| 4 | Filter | `fil_Detail_Records` |
| 5 | Expression | `exp_Determine_Record_Type` |
| 6 | Expression | `exp_Conversions` |
| 7 | Sorter | `srt_PSEUDOSSN_EFF_DT` |
| 8 | Expression | `exp_Determine_Errors` |
| 9 | Source Qualifier | `SQ_PSEUDOSSN_FILE_TK_NUM` |
| 10 | Target | `PSEUDOSSN_FROM_SDA_TBL` |

**Data Flow:**

```
[PSEUDOSSN_FILE_TK_NUM] → (SQ_PSEUDOSSN_FILE_TK_NUM) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Expression: exp_Final) → (Filter: fil_Detail_Records) → (Expression: exp_Determine_Record_Type) →
  (Expression: exp_Conversions) → (Sorter: srt_PSEUDOSSN_EFF_DT) → (Expression: exp_Determine_Errors) →
  [PSEUDOSSN_FROM_SDA_TBL]
```

### Mapping: `m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl`

**Source(s):** `PSEUDOSSN_FROM_SDA_TBL`  
**Target(s):** `PSEUDOSSN_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_FROM_SDA_TBL` |
| 2 | Source Qualifier | `SQ_PSEUDOSSN_FROM_SDA_TBL` |
| 3 | Expression | `exp_Initial` |
| 4 | Lookup Procedure | `lkp_PSEUDOSSN_TBL` |
| 5 | Expression | `exp_Determine_Inserts` |
| 6 | Filter | `fil_Inserts` |
| 7 | Target | `PSEUDOSSN_TBL` |

**Data Flow:**

```
[PSEUDOSSN_FROM_SDA_TBL] → (SQ_PSEUDOSSN_FROM_SDA_TBL) → (Expression: exp_Initial) →
  (Lookup Procedure: lkp_PSEUDOSSN_TBL) → (Expression: exp_Determine_Inserts) → (Filter: fil_Inserts) →
  [PSEUDOSSN_TBL]
```

### Mapping: `m_Pseudossn_Update_Timekeeper_Number`

**Source(s):** `PSEUDOSSN_TBL1`  
**Target(s):** `PSEUDOSSN_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_TBL1` |
| 2 | Source Qualifier | `SQ_PSEUDOSSN_TBL` |
| 3 | Update Strategy | `upd_Update_TK_NUM` |
| 4 | Expression | `exp_Initial` |
| 5 | Expression | `exp_Determine_Updates` |
| 6 | Filter | `fil_Updates` |
| 7 | Lookup Procedure | `lkp_PSEUDOSSN_FROM_SDA_TBL` |
| 8 | Target | `PSEUDOSSN_TBL` |

**Data Flow:**

```
[PSEUDOSSN_TBL1] → (SQ_PSEUDOSSN_TBL) → (Update Strategy: upd_Update_TK_NUM) →
  (Expression: exp_Initial) → (Expression: exp_Determine_Updates) → (Filter: fil_Updates) →
  (Lookup Procedure: lkp_PSEUDOSSN_FROM_SDA_TBL) → [PSEUDOSSN_TBL]
```

### Mapping: `m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA`

**Source(s):** `PSEUDOSSN_FILE_TK_NUM`  
**Target(s):** `PSEUDO_HDR_DATE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_FILE_TK_NUM` |
| 2 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 3 | Lookup Procedure | `lkp_Pay_Period_Header_Date` |
| 4 | Expression | `exp_Initial` |
| 5 | Expression | `exp_Verify_Header_Date` |
| 6 | Filter | `fil_Header` |
| 7 | Expression | `exp_Final` |
| 8 | Source Qualifier | `SQ_PSEUDOSSN_FILE_TK_NUM` |
| 9 | Target | `PSEUDO_HDR_DATE_FILE` |

**Data Flow:**

```
[PSEUDOSSN_FILE_TK_NUM] → (SQ_PSEUDOSSN_FILE_TK_NUM) → (Lookup Procedure: lkp_Current_Pay_Period) →
  (Lookup Procedure: lkp_Pay_Period_Header_Date) → (Expression: exp_Initial) →
  (Expression: exp_Verify_Header_Date) → (Filter: fil_Header) → (Expression: exp_Final) →
  [PSEUDO_HDR_DATE_FILE]
```

### Mapping: `m_Pseudossn_Current_Pay_Period`

**Source(s):** `PAY_PERIOD`  
**Target(s):** `PAY_PERIOD_DATE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PAY_PERIOD` |
| 2 | Source Qualifier | `SQ_PAY_PERIOD` |
| 3 | Expression | `exp_Build_Pay_Period` |
| 4 | Expression | `exp_Final` |
| 5 | Target | `PAY_PERIOD_DATE_FILE` |

**Data Flow:**

```
[PAY_PERIOD] → (SQ_PAY_PERIOD) → (Expression: exp_Build_Pay_Period) → (Expression: exp_Final) → [PAY_PERIOD_DATE_FILE]
```

### Mapping: `m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1`

**Source(s):** `PSEUDOSSN_TBL`  
**Target(s):** `HI_ARCH_PSEUDOSSN_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_TBL` |
| 2 | Expression | `exp_PSEUDOSSN_TBL` |
| 3 | Source Qualifier | `SQ_PSEUDOSSN_TBL` |
| 4 | Target | `HI_ARCH_PSEUDOSSN_TBL` |

**Data Flow:**

```
[PSEUDOSSN_TBL] → (SQ_PSEUDOSSN_TBL) → (Expression: exp_PSEUDOSSN_TBL) → [HI_ARCH_PSEUDOSSN_TBL]
```

### Mapping: `m_Pseudossn_Load_Pseudossn_Tbl`

**Source(s):** `PSEUDOSSN_FILE`  
**Target(s):** `PSEUDOSSN_TBL`, `ERROR_TBL`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_FILE` |
| 2 | Lookup Procedure | `lkp_Current_Pay_Period1` |
| 3 | Expression | `exp_Determine_Record_Type` |
| 4 | Source Qualifier | `SQ_PSEUDOSSN_FILE` |
| 5 | Expression | `exp_Conversions` |
| 6 | Sorter | `srt_PSEUDOSSN_EFF_DT` |
| 7 | Expression | `exp_Determine_Errors` |
| 8 | Router | `rtr_Good_Bad_Records` |
| 9 | Filter | `fil_Error_Message` |
| 10 | Normalizer | `nrm_Errors` |
| 11 | Expression | `exp_Final_Errors` |
| 12 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 13 | Expression | `exp_Final` |
| 14 | Filter | `fil_Detail_Records` |
| 15 | Expression | `exp_Pay_Period` |
| 16 | Target | `PSEUDOSSN_TBL` |
| 17 | Target | `ERROR_TBL` |

**Data Flow:**

```
[PSEUDOSSN_FILE] → (SQ_PSEUDOSSN_FILE) → (Lookup Procedure: lkp_Current_Pay_Period1) →
  (Expression: exp_Determine_Record_Type) → (Expression: exp_Conversions) →
  (Sorter: srt_PSEUDOSSN_EFF_DT) → (Expression: exp_Determine_Errors) → (Router: rtr_Good_Bad_Records) →
  (Filter: fil_Error_Message) → (Normalizer: nrm_Errors) → (Expression: exp_Final_Errors) →
  (Lookup Procedure: lkp_Current_Pay_Period) → (Expression: exp_Final) → (Filter: fil_Detail_Records) →
  (Expression: exp_Pay_Period) → [PSEUDOSSN_TBL] → [ERROR_TBL]
```

### Mapping: `m_Pseudossn_Verify_Record_Count`

**Source(s):** `PSEUDOSSN_FILE`, `PSEUDOSSN_FILE1`  
**Target(s):** `PSEUDO_RECORD_COUNT`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_FILE` |
| 2 | Source | `PSEUDOSSN_FILE1` |
| 3 | Filter | `fil_DETAIL` |
| 4 | Expression | `exp_DETERMINE_DETAIL` |
| 5 | Source Qualifier | `SQ_PSEUDOSSN_FILE` |
| 6 | Expression | `exp_DETERMINE_HEADER_TRAILER` |
| 7 | Source Qualifier | `SQ_PSEUDOSSN_FILE1` |
| 8 | Filter | `fil_TRAILER` |
| 9 | Expression | `exp_COMPARE` |
| 10 | Joiner | `jnr_RECORD_CONSTANTS` |
| 11 | Aggregator | `agg_ALL_RECORDS` |
| 12 | Target | `PSEUDO_RECORD_COUNT` |

**Data Flow:**

```
[PSEUDOSSN_FILE] → [PSEUDOSSN_FILE1] → (SQ_PSEUDOSSN_FILE) → (SQ_PSEUDOSSN_FILE1) →
  (Filter: fil_DETAIL) → (Expression: exp_DETERMINE_DETAIL) →
  (Expression: exp_DETERMINE_HEADER_TRAILER) → (Filter: fil_TRAILER) → (Expression: exp_COMPARE) →
  (Joiner: jnr_RECORD_CONSTANTS) → (Aggregator: agg_ALL_RECORDS) → [PSEUDO_RECORD_COUNT]
```

### Mapping: `m_Pseudossn_Counters`

**Source(s):** `PSEUDOSSN_FILE`  
**Target(s):** `COUNTER_TBL`, `PSEUDOSSN_MESSAGE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_FILE` |
| 2 | Lookup Procedure | `lkp_PSEUDOSSN_TBL_Pay_Period` |
| 3 | Expression | `exp_Final_Message` |
| 4 | Expression | `exp_Build_Message` |
| 5 | Filter | `fil_Detail` |
| 6 | Expression | `exp_Determine_Detail` |
| 7 | Source Qualifier | `SQ_PSEUDOSSN_FILE` |
| 8 | Aggregator | `agg_ALL_RECORDS` |
| 9 | Expression | `exp_Detail_Count` |
| 10 | Lookup Procedure | `lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE` |
| 11 | Expression | `exp_Counters` |
| 12 | Normalizer | `nrm_Counters` |
| 13 | Expression | `exp_Final` |
| 14 | Lookup Procedure | `lkp_Count_PSEUDOSSN_TBL` |
| 15 | Target | `COUNTER_TBL` |
| 16 | Target | `PSEUDOSSN_MESSAGE_FILE` |

**Data Flow:**

```
[PSEUDOSSN_FILE] → (SQ_PSEUDOSSN_FILE) → (Lookup Procedure: lkp_PSEUDOSSN_TBL_Pay_Period) →
  (Expression: exp_Final_Message) → (Expression: exp_Build_Message) → (Filter: fil_Detail) →
  (Expression: exp_Determine_Detail) → (Aggregator: agg_ALL_RECORDS) → (Expression: exp_Detail_Count) →
  (Lookup Procedure: lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE) → (Expression: exp_Counters) →
  (Normalizer: nrm_Counters) → (Expression: exp_Final) → (Lookup Procedure: lkp_Count_PSEUDOSSN_TBL) →
  [COUNTER_TBL] → [PSEUDOSSN_MESSAGE_FILE]
```

### Mapping: `m_Pseudossn_Verify_Header_Date_Current_Pay_Period`

**Source(s):** `PSEUDOSSN_FILE`  
**Target(s):** `PSEUDO_HDR_DATE_FILE`

**Transformation Chain:**

| # | Type | Name |
|---|---|---|
| 1 | Source | `PSEUDOSSN_FILE` |
| 2 | Expression | `exp_Initial` |
| 3 | Source Qualifier | `SQ_PSEUDOSSN_FILE` |
| 4 | Expression | `exp_Verify_Header_Date` |
| 5 | Filter | `fil_Header` |
| 6 | Expression | `exp_Final` |
| 7 | Lookup Procedure | `lkp_Current_Pay_Period` |
| 8 | Lookup Procedure | `lkp_Pay_Period_Header_Date` |
| 9 | Target | `PSEUDO_HDR_DATE_FILE` |

**Data Flow:**

```
[PSEUDOSSN_FILE] → (SQ_PSEUDOSSN_FILE) → (Expression: exp_Initial) →
  (Expression: exp_Verify_Header_Date) → (Filter: fil_Header) → (Expression: exp_Final) →
  (Lookup Procedure: lkp_Current_Pay_Period) → (Lookup Procedure: lkp_Pay_Period_Header_Date) →
  [PSEUDO_HDR_DATE_FILE]
```

---

## Shell Script Orchestration

### Transfer Script Pattern

All transfer scripts in `Transfer Scripts/` follow the same pattern:

```
1. Accept filename as parameter ($1)
2. Construct full path: /data/BIISINT/data/int/out/{CPM|LES}/$1
3. Validate file exists (abort with email notification if missing)
4. SFTP transfer via sa-cdirect@m1csv301.hhs.gov to agency-specific jail directory
5. Log transfer timestamp to /tmp/{script}.out
6. Send success email notification to distribution list
7. Clean up temporary log file
```

### Transfer Destinations

| Script | Agency | Remote Jail Path |
|---|---|---|
| `afps_transfer` | AFPS (DFAS) | `/opt/app/jail/sa-afps/outbound` |
| `cdc_transfer` | CDC | `/opt/app/jail/sa-cdcusr/outbound` |
| `fda_transfer` | FDA | `/opt/app/jail/sa-fdausr2/outbound` |
| `nih_cpm_transfer` | NIH (CPM) | `/opt/app/jail/sa-nihbiisu/outbound` |
| `nih_les_transfer` | NIH (LES) | `/opt/app/jail/sa-nihbiisu/outbound` |
| `nih_transfer_les` | NIH (LES alt) | `/opt/app/jail/sa-nihbiisu/outbound` |
| `oig_transfer` | OIG | `/opt/app/jail/sa-oig/outbound` |

### Pre/Post-Load Orchestration

```
EHRP2BIIS Data Load Pipeline:

  ehrp2biis_preload (step01 SQL)
       │
       ▼
  Informatica PowerCenter Workflows
  (wf_EHRP2BIIS_UPDATE, wf_CPM, wf_CPM_AFPS, etc.)
       │
       ▼
  actstage_load (action_stage_load SQL)
       │
       ▼
  ehrp2biis_afterload.sql
    ├── Update retained step codes
    ├── Update sequence numbers
    ├── Run formatting procedures (non-900s + 900s)
    ├── Update cancelled transactions
    ├── Update PROCESS_TABLE for WIP status tracking
    ├── Copy NWK_ staging → production ALL tables
    └── Verify record counts
       │
       ▼
  Transfer Scripts (SFTP to agency endpoints)
```

### Maintenance Scripts

| Script | Purpose |
|---|---|
| `archive_files` | Move output files to archive directory with pay period suffix (`_P{pp}.txt`) |
| `remove_file` | Delete specified file from given directory |
