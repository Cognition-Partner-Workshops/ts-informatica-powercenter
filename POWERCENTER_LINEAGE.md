# PowerCenter Data Lineage

Source-to-target data flow documentation for every mapping in the Informatica PowerCenter EHRP-to-BIIS integration platform.

---

## COMPTIME

### `m_COMPTIME_Build_Message_Counters`

**Data Flow:**

```
[SOURCE] U0287D01 → [Source Qualifier] SQ_U0287D01 → [Expression] exp_Initial
  ... → [Filter] fil_Detail → [Aggregator] agg_ALL_RECORDS → [Expression] exp_Detail_Count
  ... → [Expression] exp_Counters → [Lookup Procedure] lkp_PAY_PERIOD → [Expression] exp_Build_Message
  ... → [Expression] exp_Final → [Expression] exp_Final_Message → [TARGET] COUNTER_TBL
  ... → [TARGET] COMPTIME_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `U0287D01` | Source Definition |
| Target | `COUNTER_TBL` | Target Definition |
| Target | `COMPTIME_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Build_Message` | Expression |
| 2 | `fil_Detail` | Filter |
| 3 | `exp_Initial` | Expression |
| 4 | `agg_ALL_RECORDS` | Aggregator |
| 5 | `exp_Detail_Count` | Expression |
| 6 | `exp_Counters` | Expression |
| 7 | `exp_Final` | Expression |
| 8 | `SQ_U0287D01` | Source Qualifier |
| 9 | `lkp_PAY_PERIOD` | Lookup Procedure |
| 10 | `exp_Final_Message` | Expression |

<details><summary>Connector details (38 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `COUNTER_TBL` | 4 |
| `exp_Final_Message` | `COMPTIME_MESSAGE_FILE` | 2 |
| `exp_Build_Message` | `exp_Final_Message` | 2 |
| `exp_Counters` | `exp_Build_Message` | 4 |
| `exp_Initial` | `fil_Detail` | 2 |
| `fil_Detail` | `agg_ALL_RECORDS` | 3 |
| `SQ_U0287D01` | `exp_Initial` | 2 |
| `agg_ALL_RECORDS` | `exp_Detail_Count` | 1 |
| `exp_Detail_Count` | `exp_Counters` | 1 |
| `exp_Detail_Count` | `lkp_PAY_PERIOD` | 1 |
| `lkp_PAY_PERIOD` | `exp_Counters` | 2 |
| `exp_Counters` | `exp_Final` | 2 |
| `U0287D01` | `SQ_U0287D01` | 12 |

</details>

### `m_COMPTIME_Load_COMP_TIME_DAILY_TBL`

**Data Flow:**

```
[SOURCE] U0287D01 → [Source Qualifier] SQ_U0287D01 → [Expression] exp_Initial
  ... → [Filter] fil_Valid_Records → [Expression] exp_Convert → [Lookup Procedure] lkp_PAY_PERIOD
  ... → [Expression] exp_Final → [TARGET] COMP_TIME_DAILY_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `U0287D01` | Source Definition |
| Target | `COMP_TIME_DAILY_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_U0287D01` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `exp_Final` | Expression |
| 4 | `lkp_PAY_PERIOD` | Lookup Procedure |
| 5 | `exp_Convert` | Expression |
| 6 | `fil_Valid_Records` | Filter |

<details><summary>Connector details (83 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `COMP_TIME_DAILY_TBL` | 15 |
| `U0287D01` | `SQ_U0287D01` | 12 |
| `SQ_U0287D01` | `exp_Initial` | 12 |
| `exp_Initial` | `fil_Valid_Records` | 14 |
| `exp_Convert` | `exp_Final` | 15 |
| `fil_Valid_Records` | `lkp_PAY_PERIOD` | 1 |
| `lkp_PAY_PERIOD` | `exp_Convert` | 2 |
| `fil_Valid_Records` | `exp_Convert` | 12 |

</details>

### `m_COMPTIME_Current_Pay_Period`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Build_Pay_Period
  ... → [Expression] exp_Final → [TARGET] COMP_TIME_DATE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `COMP_TIME_DATE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD` | Source Qualifier |
| 2 | `exp_Build_Pay_Period` | Expression |
| 3 | `exp_Final` | Expression |

<details><summary>Connector details (15 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `COMP_TIME_DATE_FILE` | 1 |
| `PAY_PERIOD` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Build_Pay_Period` | 2 |
| `exp_Build_Pay_Period` | `exp_Final` | 4 |

</details>

---

## CPM

### `m_CPM_Current_Pay_Period`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Build_Pay_Period
  ... → [Expression] exp_Final → [TARGET] CPM_PAY_PERIOD_DATE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_PAY_PERIOD_DATE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD` | Source Qualifier |
| 2 | `exp_Build_Pay_Period` | Expression |
| 3 | `exp_Final` | Expression |

<details><summary>Connector details (15 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_PAY_PERIOD_DATE_FILE` | 1 |
| `PAY_PERIOD` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Build_Pay_Period` | 2 |
| `exp_Build_Pay_Period` | `exp_Final` | 4 |

</details>

### `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL`

**Data Flow:**

```
[SOURCE] ERROR_TBL → [SOURCE] CPM_PM3_STG_TBL → [Source Qualifier] SQ_CPM_PM3_STG_TBL
  ... → [Expression] exp_Initial → [Expression] exp_Determine_Allotments → [Lookup Procedure] lkp_PSEUDOSSN_TBL
  ... → [Aggregator] agg_Allotments → [Filter] fil_Bad_Records → [Expression] exp_Convert
  ... → [Normalizer] nrm_Errors → [Expression] exp_Final → [Mapplet] mplt_Convert_Num_To_Prec7
  ... → [Filter] fil_Error_Message → [TARGET] CPM_NEWPAY_STG_ALT_TBL → [Expression] exp_Stage_Converted_Fields
  ... → [Expression] exp_Final_Errors
```

| Direction | Object | Type |
|---|---|---|
| Source | `ERROR_TBL` | Target Definition |
| Source | `CPM_PM3_STG_TBL` | Source Definition |
| Target | `CPM_NEWPAY_STG_ALT_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_Error_Message` | Filter |
| 2 | `fil_Bad_Records` | Filter |
| 3 | `nrm_Errors` | Normalizer |
| 4 | `exp_Final_Errors` | Expression |
| 5 | `SQ_CPM_PM3_STG_TBL` | Source Qualifier |
| 6 | `exp_Initial` | Expression |
| 7 | `exp_Final` | Expression |
| 8 | `exp_Determine_Allotments` | Expression |
| 9 | `agg_Allotments` | Aggregator |
| 10 | `exp_Convert` | Expression |
| 11 | `exp_Stage_Converted_Fields` | Expression |
| 12 | `lkp_PSEUDOSSN_TBL` | Lookup Procedure |

<details><summary>Connector details (284 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Errors` | `ERROR_TBL` | 6 |
| `exp_Final` | `CPM_NEWPAY_STG_ALT_TBL` | 46 |
| `nrm_Errors` | `fil_Error_Message` | 5 |
| `fil_Error_Message` | `exp_Final_Errors` | 5 |
| `exp_Determine_Allotments` | `fil_Bad_Records` | 6 |
| `fil_Bad_Records` | `nrm_Errors` | 5 |
| `CPM_PM3_STG_TBL` | `SQ_CPM_PM3_STG_TBL` | 40 |
| `SQ_CPM_PM3_STG_TBL` | `exp_Initial` | 24 |
| `exp_Initial` | `exp_Determine_Allotments` | 10 |
| `exp_Initial` | `lkp_PSEUDOSSN_TBL` | 1 |
| `exp_Convert` | `exp_Final` | 40 |
| `exp_Stage_Converted_Fields` | `exp_Final` | 7 |
| `lkp_PSEUDOSSN_TBL` | `exp_Determine_Allotments` | 1 |
| `exp_Determine_Allotments` | `agg_Allotments` | 37 |
| `agg_Allotments` | `exp_Convert` | 37 |
| `exp_Convert` | `mplt_Convert_Num_To_Prec7` | 7 |
| `mplt_Convert_Num_To_Prec7` | `exp_Stage_Converted_Fields` | 7 |

</details>

### `m_CPM_Load_CPM_YTD_Staging_Tables`

**Data Flow:**

```
[SOURCE] YTD_FILE → [SOURCE] CPM_YTD_STATE_STG_TBL → [SOURCE] CPM_YTD_DETAIL_STG_TBL
  ... → [Normalizer] Norm_YTD_FILE → [Expression] exp_Initial → [Router] rtr_YTD_Records
  ... → [Expression] exp_Convert → [Expression] exp_Final_YTD_Detail → [Expression] exp_Final_YTD_State
  ... → [Expression] exp_Verify_Header_Date → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Pay_Period_Record_Date
  ... → [Expression] exp_Final_YTD_Header → [TARGET] CPM_YTD_HEADER_STG_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_YTD_DETAIL_STG_TBL` | Target Definition |
| Source | `CPM_YTD_STATE_STG_TBL` | Target Definition |
| Source | `YTD_FILE` | Source Definition |
| Target | `CPM_YTD_HEADER_STG_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final_YTD_Detail` | Expression |
| 2 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 3 | `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| 4 | `exp_Convert` | Expression |
| 5 | `exp_Final_YTD_Header` | Expression |
| 6 | `exp_Verify_Header_Date` | Expression |
| 7 | `Norm_YTD_FILE` | Normalizer |
| 8 | `rtr_YTD_Records` | Router |
| 9 | `exp_Initial` | Expression |
| 10 | `exp_Final_YTD_State` | Expression |

<details><summary>Connector details (615 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_YTD_Detail` | `CPM_YTD_DETAIL_STG_TBL` | 106 |
| `exp_Final_YTD_Header` | `CPM_YTD_HEADER_STG_TBL` | 7 |
| `exp_Final_YTD_State` | `CPM_YTD_STATE_STG_TBL` | 8 |
| `rtr_YTD_Records` | `exp_Final_YTD_Detail` | 106 |
| `lkp_Current_Pay_Period` | `exp_Verify_Header_Date` | 2 |
| `exp_Convert` | `lkp_Current_Pay_Period` | 1 |
| `lkp_Pay_Period_Record_Date` | `exp_Verify_Header_Date` | 2 |
| `exp_Convert` | `lkp_Pay_Period_Record_Date` | 1 |
| `exp_Convert` | `exp_Verify_Header_Date` | 9 |
| `rtr_YTD_Records` | `exp_Convert` | 7 |
| `exp_Verify_Header_Date` | `exp_Final_YTD_Header` | 8 |
| `YTD_FILE` | `Norm_YTD_FILE` | 121 |
| `Norm_YTD_FILE` | `exp_Initial` | 114 |
| `exp_Initial` | `rtr_YTD_Records` | 116 |
| `rtr_YTD_Records` | `exp_Final_YTD_State` | 7 |

</details>

### `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL`

**Data Flow:**

```
[SOURCE] CPM_YTD_STATE_STG_TBL → [Source Qualifier] SQ_CPM_YTD_STATE_STG_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Determine_YTD_States → [Aggregator] agg_YTD_State → [Expression] exp_Final
  ... → [Mapplet] mplt_Convert_Num_To_Prec7 → [TARGET] CPM_NEWPAY_STG_YTD_STATE_TBL → [Expression] exp_Stage_Converted_Fields
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_YTD_STATE_STG_TBL` | Source Definition |
| Target | `CPM_NEWPAY_STG_YTD_STATE_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Initial` | Expression |
| 2 | `exp_Final` | Expression |
| 3 | `exp_Determine_YTD_States` | Expression |
| 4 | `agg_YTD_State` | Aggregator |
| 5 | `SQ_CPM_YTD_STATE_STG_TBL` | Source Qualifier |
| 6 | `exp_Stage_Converted_Fields` | Expression |

<details><summary>Connector details (87 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NEWPAY_STG_YTD_STATE_TBL` | 19 |
| `SQ_CPM_YTD_STATE_STG_TBL` | `exp_Initial` | 7 |
| `exp_Initial` | `exp_Determine_YTD_States` | 6 |
| `agg_YTD_State` | `exp_Final` | 15 |
| `exp_Stage_Converted_Fields` | `exp_Final` | 4 |
| `exp_Determine_YTD_States` | `agg_YTD_State` | 20 |
| `agg_YTD_State` | `mplt_Convert_Num_To_Prec7` | 4 |
| `CPM_YTD_STATE_STG_TBL` | `SQ_CPM_YTD_STATE_STG_TBL` | 8 |
| `mplt_Convert_Num_To_Prec7` | `exp_Stage_Converted_Fields` | 4 |

</details>

### `m_CPM_Load_CPM_MER_Staging_Tables`

**Data Flow:**

```
[SOURCE] MER_FILE → [Normalizer] Norm_MER_FILE → [Expression] exp_Initial
  ... → [Router] rtr_MER_Records → [Expression] exp_Convert → [Expression] exp_Final_MER_Detail
  ... → [Expression] exp_Verify_Header_Date → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Pay_Period_Record_Date
  ... → [TARGET] CPM_MER_DETAIL_STG_TBL → [Expression] exp_Final_MER_Header → [TARGET] CPM_MER_HEADER_STG_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `MER_FILE` | Source Definition |
| Target | `CPM_MER_DETAIL_STG_TBL` | Target Definition |
| Target | `CPM_MER_HEADER_STG_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final_MER_Detail` | Expression |
| 2 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 3 | `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| 4 | `exp_Final_MER_Header` | Expression |
| 5 | `exp_Convert` | Expression |
| 6 | `exp_Verify_Header_Date` | Expression |
| 7 | `exp_Initial` | Expression |
| 8 | `rtr_MER_Records` | Router |
| 9 | `Norm_MER_FILE` | Normalizer |

<details><summary>Connector details (541 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_MER_Detail` | `CPM_MER_DETAIL_STG_TBL` | 95 |
| `exp_Final_MER_Header` | `CPM_MER_HEADER_STG_TBL` | 7 |
| `rtr_MER_Records` | `exp_Final_MER_Detail` | 95 |
| `lkp_Current_Pay_Period` | `exp_Verify_Header_Date` | 2 |
| `exp_Convert` | `lkp_Current_Pay_Period` | 1 |
| `lkp_Pay_Period_Record_Date` | `exp_Verify_Header_Date` | 2 |
| `exp_Convert` | `lkp_Pay_Period_Record_Date` | 1 |
| `exp_Verify_Header_Date` | `exp_Final_MER_Header` | 8 |
| `rtr_MER_Records` | `exp_Convert` | 7 |
| `exp_Convert` | `exp_Verify_Header_Date` | 9 |
| `Norm_MER_FILE` | `exp_Initial` | 106 |
| `exp_Initial` | `rtr_MER_Records` | 100 |
| `MER_FILE` | `Norm_MER_FILE` | 108 |

</details>

### `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_TBL → [SOURCE] CPM_PM1_STG_TBL → [SOURCE] CPM_NEWPAY_STG_TYPE_1_2_TBL
  ... → [SOURCE] CPM_YTD_DETAIL_STG_TBL → [SOURCE] ERROR_TBL → [SOURCE] CPM_PM2_STG_TBL
  ... → [Source Qualifier] SQ_CPM_PM1_STG_TBL → [Source Qualifier] SQ_CPM_YTD_DETAIL_STG_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Initial_YTD → [Joiner] jnr_CPM_YTD → [Expression] exp_Convert_TYPE_1_PAD_MER
  ... → [Expression] exp_Convert_YTD → [Expression] exp_Determine_Errors → [Lookup Procedure] lkp_CPM_MER_DETAIL_STG_TBL
  ... → [Lookup Procedure] lkp_CPM_NEWPAY_STG_YTD_STATE_TBL → [Lookup Procedure] lkp_CPM_PAD_DETAIL_STG_TBL → [Expression] exp_Final
  ... → [Mapplet] mplt_Convert_Num_To_Prec7 → [Mapplet] mplt_Convert_Num_To_Prec71 → [Mapplet] mplt_Convert_Num_To_Prec72
  ... → [Mapplet] mplt_Convert_Num_To_Prec73 → [Mapplet] mplt_Convert_Num_To_Prec74 → [Mapplet] mplt_Convert_Num_To_Prec75
  ... → [Filter] fil_Bad_Records → [Expression] exp_Stage_PAD_MER_Converted_Fields → [Expression] exp_Stg_YTD_Converted_Fields
  ... → [Normalizer] nrm_Errors → [Filter] fil_Error_Message → [Expression] exp_Final_Errors
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_STG_TYPE_1_2_TBL` | Target Definition |
| Source | `ERROR_TBL` | Target Definition |
| Source | `CPM_YTD_DETAIL_STG_TBL` | Source Definition |
| Source | `PSEUDOSSN_TBL` | Source Definition |
| Source | `CPM_PM1_STG_TBL` | Source Definition |
| Source | `CPM_PM2_STG_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_Bad_Records` | Filter |
| 2 | `SQ_CPM_YTD_DETAIL_STG_TBL` | Source Qualifier |
| 3 | `SQ_CPM_PM1_STG_TBL` | Source Qualifier |
| 4 | `exp_Convert_TYPE_1_PAD_MER` | Expression |
| 5 | `exp_Final` | Expression |
| 6 | `exp_Initial` | Expression |
| 7 | `fil_Error_Message` | Filter |
| 8 | `exp_Convert_YTD` | Expression |
| 9 | `lkp_CPM_MER_DETAIL_STG_TBL` | Lookup Procedure |
| 10 | `lkp_CPM_PAD_DETAIL_STG_TBL` | Lookup Procedure |
| 11 | `lkp_CPM_NEWPAY_STG_YTD_STATE_TBL` | Lookup Procedure |
| 12 | `exp_Determine_Errors` | Expression |
| 13 | `nrm_Errors` | Normalizer |
| 14 | `exp_Final_Errors` | Expression |
| 15 | `jnr_CPM_YTD` | Joiner |
| 16 | `exp_Initial_YTD` | Expression |
| 17 | `exp_Stage_PAD_MER_Converted_Fields` | Expression |
| 18 | `exp_Stg_YTD_Converted_Fields` | Expression |

<details><summary>Connector details (1436 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NEWPAY_STG_TYPE_1_2_TBL` | 254 |
| `exp_Final_Errors` | `ERROR_TBL` | 6 |
| `fil_Bad_Records` | `nrm_Errors` | 7 |
| `exp_Determine_Errors` | `fil_Bad_Records` | 8 |
| `CPM_YTD_DETAIL_STG_TBL` | `SQ_CPM_YTD_DETAIL_STG_TBL` | 87 |
| `SQ_CPM_YTD_DETAIL_STG_TBL` | `exp_Initial_YTD` | 87 |
| `SQ_CPM_PM1_STG_TBL` | `exp_Initial` | 89 |
| `CPM_PM2_STG_TBL` | `SQ_CPM_PM1_STG_TBL` | 18 |
| `PSEUDOSSN_TBL` | `SQ_CPM_PM1_STG_TBL` | 43 |
| `CPM_PM1_STG_TBL` | `SQ_CPM_PM1_STG_TBL` | 37 |
| `exp_Convert_TYPE_1_PAD_MER` | `exp_Final` | 153 |
| `jnr_CPM_YTD` | `exp_Convert_TYPE_1_PAD_MER` | 84 |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | `exp_Convert_TYPE_1_PAD_MER` | 19 |
| `lkp_CPM_MER_DETAIL_STG_TBL` | `exp_Convert_TYPE_1_PAD_MER` | 40 |
| `exp_Convert_TYPE_1_PAD_MER` | `mplt_Convert_Num_To_Prec7` | 2 |
| `exp_Stg_YTD_Converted_Fields` | `exp_Final` | 49 |
| `exp_Convert_YTD` | `exp_Final` | 50 |
| `exp_Stage_PAD_MER_Converted_Fields` | `exp_Final` | 2 |
| `exp_Initial` | `jnr_CPM_YTD` | 88 |
| `fil_Error_Message` | `exp_Final_Errors` | 5 |
| `nrm_Errors` | `fil_Error_Message` | 5 |
| `jnr_CPM_YTD` | `exp_Convert_YTD` | 85 |
| `lkp_CPM_NEWPAY_STG_YTD_STATE_TBL` | `exp_Convert_YTD` | 16 |
| `exp_Convert_YTD` | `mplt_Convert_Num_To_Prec71` | 10 |
| `exp_Convert_YTD` | `mplt_Convert_Num_To_Prec72` | 10 |
| `exp_Convert_YTD` | `mplt_Convert_Num_To_Prec73` | 10 |
| `exp_Convert_YTD` | `mplt_Convert_Num_To_Prec74` | 9 |
| `exp_Convert_YTD` | `mplt_Convert_Num_To_Prec75` | 10 |
| `jnr_CPM_YTD` | `lkp_CPM_MER_DETAIL_STG_TBL` | 3 |
| `lkp_CPM_MER_DETAIL_STG_TBL` | `exp_Determine_Errors` | 1 |
| `jnr_CPM_YTD` | `lkp_CPM_PAD_DETAIL_STG_TBL` | 3 |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | `exp_Determine_Errors` | 1 |
| `jnr_CPM_YTD` | `lkp_CPM_NEWPAY_STG_YTD_STATE_TBL` | 3 |
| `jnr_CPM_YTD` | `exp_Determine_Errors` | 4 |
| `exp_Initial_YTD` | `jnr_CPM_YTD` | 87 |
| `mplt_Convert_Num_To_Prec7` | `exp_Stage_PAD_MER_Converted_Fields` | 2 |
| `mplt_Convert_Num_To_Prec71` | `exp_Stg_YTD_Converted_Fields` | 10 |
| `mplt_Convert_Num_To_Prec75` | `exp_Stg_YTD_Converted_Fields` | 10 |
| `mplt_Convert_Num_To_Prec72` | `exp_Stg_YTD_Converted_Fields` | 10 |
| `mplt_Convert_Num_To_Prec73` | `exp_Stg_YTD_Converted_Fields` | 10 |
| `mplt_Convert_Num_To_Prec74` | `exp_Stg_YTD_Converted_Fields` | 9 |

</details>

### `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL`

**Data Flow:**

```
[SOURCE] CPM_PM3_STG_TBL → [Source Qualifier] SQ_CPM_PM3_STG_TBL → [Expression] exp_Initial
  ... → [Aggregator] agg_PYF_EYE_ID_PP_NUM → [Expression] exp_Final → [Expression] exp_Format_Fields
  ... → [TARGET] CPM_NEWPAY_STG_DETAIL_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_PM3_STG_TBL` | Source Definition |
| Target | `CPM_NEWPAY_STG_DETAIL_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Format_Fields` | Expression |
| 2 | `SQ_CPM_PM3_STG_TBL` | Source Qualifier |
| 3 | `agg_PYF_EYE_ID_PP_NUM` | Aggregator |
| 4 | `exp_Initial` | Expression |
| 5 | `exp_Final` | Expression |

<details><summary>Connector details (125 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NEWPAY_STG_DETAIL_TBL` | 22 |
| `exp_Format_Fields` | `exp_Final` | 3 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_Format_Fields` | 4 |
| `CPM_PM3_STG_TBL` | `SQ_CPM_PM3_STG_TBL` | 39 |
| `SQ_CPM_PM3_STG_TBL` | `exp_Initial` | 22 |
| `exp_Initial` | `agg_PYF_EYE_ID_PP_NUM` | 16 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_Final` | 19 |

</details>

### `m_CPM_Build_Message_Counters`

**Data Flow:**

```
[SOURCE] PAYMASTER_THREE → [SOURCE] CPM_NEWPAY_TBL → [SOURCE] CPM_NEWPAY_TBL1
  ... → [SOURCE] ERROR_TBL → [Normalizer] Norm_PAYMASTER_THREE → [Source Qualifier] SQ_CPM_NEWPAY_TBL
  ... → [Source Qualifier] SQ_CPM_NEWPAY_TBL1 → [Source Qualifier] SQ_ERROR_TBL → [Expression] exp_Initial_Input
  ... → [Expression] exp_Initial_CPM → [Expression] exp_Initial_Multiple_Pay_Lines → [Expression] exp_Initial_Errors
  ... → [Aggregator] agg_Count_Inputs → [Expression] exp_Stage_CPM → [Lookup Procedure] lkp_CPM_MER_DETAIL_STG_TBL
  ... → [Lookup Procedure] lkp_CPM_PAD_DETAIL_STG_TBL → [Lookup Procedure] lkp_CPM_YTD_DETAIL_STG_TBL → [Lookup Procedure] lkp_PSEUDOSSN_TBL
  ... → [Aggregator] agg_Multiple_Pay_Lines → [Aggregator] agg_Count_Errors → [Joiner] jnr_Inputs_CPM
  ... → [Aggregator] agg_Count_CPM → [Joiner] jnr_Inputs_CPM_Errors_Pay_Lines → [Joiner] jnr_Inputs_CPM_Errors
  ... → [Expression] exp_Build_Message → [Expression] exp_Counters → [Normalizer] nrm_Counters
  ... → [Normalizer] nrm_Counters_Message → [Expression] exp_Final_Counters → [Expression] exp_Final_Message
  ... → [TARGET] COUNTER_TBL → [TARGET] CPM_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Source | `ERROR_TBL` | Source Definition |
| Source | `PAYMASTER_THREE` | Source Definition |
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Target | `COUNTER_TBL` | Target Definition |
| Target | `CPM_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `nrm_Counters_Message` | Normalizer |
| 2 | `exp_Final_Message` | Expression |
| 3 | `exp_Build_Message` | Expression |
| 4 | `lkp_PSEUDOSSN_TBL` | Lookup Procedure |
| 5 | `lkp_CPM_MER_DETAIL_STG_TBL` | Lookup Procedure |
| 6 | `lkp_CPM_PAD_DETAIL_STG_TBL` | Lookup Procedure |
| 7 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 8 | `SQ_ERROR_TBL` | Source Qualifier |
| 9 | `exp_Initial_Input` | Expression |
| 10 | `exp_Initial_CPM` | Expression |
| 11 | `exp_Initial_Errors` | Expression |
| 12 | `jnr_Inputs_CPM` | Joiner |
| 13 | `agg_Count_Inputs` | Aggregator |
| 14 | `agg_Count_CPM` | Aggregator |
| 15 | `exp_Stage_CPM` | Expression |
| 16 | `agg_Count_Errors` | Aggregator |
| 17 | `jnr_Inputs_CPM_Errors` | Joiner |
| 18 | `nrm_Counters` | Normalizer |
| 19 | `exp_Counters` | Expression |
| 20 | `exp_Final_Counters` | Expression |
| 21 | `lkp_CPM_YTD_DETAIL_STG_TBL` | Lookup Procedure |
| 22 | `Norm_PAYMASTER_THREE` | Normalizer |
| 23 | `SQ_CPM_NEWPAY_TBL1` | Source Qualifier |
| 24 | `exp_Initial_Multiple_Pay_Lines` | Expression |
| 25 | `jnr_Inputs_CPM_Errors_Pay_Lines` | Joiner |
| 26 | `agg_Multiple_Pay_Lines` | Aggregator |

<details><summary>Connector details (768 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Counters` | `COUNTER_TBL` | 6 |
| `exp_Final_Message` | `CPM_MESSAGE_FILE` | 2 |
| `exp_Counters` | `nrm_Counters_Message` | 40 |
| `nrm_Counters_Message` | `exp_Final_Message` | 2 |
| `exp_Build_Message` | `exp_Counters` | 1 |
| `jnr_Inputs_CPM_Errors_Pay_Lines` | `exp_Build_Message` | 3 |
| `lkp_PSEUDOSSN_TBL` | `exp_Stage_CPM` | 1 |
| `exp_Initial_CPM` | `lkp_PSEUDOSSN_TBL` | 3 |
| `lkp_CPM_MER_DETAIL_STG_TBL` | `exp_Stage_CPM` | 1 |
| `exp_Initial_CPM` | `lkp_CPM_MER_DETAIL_STG_TBL` | 3 |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | `exp_Stage_CPM` | 1 |
| `exp_Initial_CPM` | `lkp_CPM_PAD_DETAIL_STG_TBL` | 3 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 471 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Initial_CPM` | 8 |
| `ERROR_TBL` | `SQ_ERROR_TBL` | 7 |
| `SQ_ERROR_TBL` | `exp_Initial_Errors` | 5 |
| `Norm_PAYMASTER_THREE` | `exp_Initial_Input` | 4 |
| `exp_Initial_Input` | `agg_Count_Inputs` | 4 |
| `exp_Initial_CPM` | `exp_Stage_CPM` | 7 |
| `exp_Initial_CPM` | `lkp_CPM_YTD_DETAIL_STG_TBL` | 3 |
| `exp_Initial_Errors` | `agg_Count_Errors` | 1 |
| `agg_Count_CPM` | `jnr_Inputs_CPM` | 15 |
| `agg_Count_Inputs` | `jnr_Inputs_CPM` | 6 |
| `jnr_Inputs_CPM` | `jnr_Inputs_CPM_Errors` | 20 |
| `exp_Stage_CPM` | `agg_Count_CPM` | 11 |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | `exp_Stage_CPM` | 1 |
| `agg_Count_Errors` | `jnr_Inputs_CPM_Errors` | 5 |
| `jnr_Inputs_CPM_Errors` | `jnr_Inputs_CPM_Errors_Pay_Lines` | 23 |
| `exp_Counters` | `nrm_Counters` | 38 |
| `nrm_Counters` | `exp_Final_Counters` | 4 |
| `jnr_Inputs_CPM_Errors_Pay_Lines` | `exp_Counters` | 23 |
| `PAYMASTER_THREE` | `Norm_PAYMASTER_THREE` | 35 |
| `CPM_NEWPAY_TBL1` | `SQ_CPM_NEWPAY_TBL1` | 4 |
| `SQ_CPM_NEWPAY_TBL1` | `exp_Initial_Multiple_Pay_Lines` | 4 |
| `exp_Initial_Multiple_Pay_Lines` | `agg_Multiple_Pay_Lines` | 1 |
| `agg_Multiple_Pay_Lines` | `jnr_Inputs_CPM_Errors_Pay_Lines` | 2 |

</details>

### `m_CPM_Load_CPM_PMR_Staging_Tables`

**Data Flow:**

```
[SOURCE] CPM_PM3_STG_TBL → [SOURCE] PAYMASTER_FILE → [SOURCE] CPM_PM2_STG_TBL
  ... → [SOURCE] CPM_PM1_STG_TBL → [Normalizer] Norm_PAYMASTER_FILE → [Expression] exp_Determine_Record_Type
  ... → [Router] rtr_Paymaster_Records → [Expression] exp_Final_Paymaster_1 → [Expression] exp_Final_Paymaster_2
  ... → [Expression] exp_Final_Paymaster_3 → [Expression] exp_Initial → [Expression] exp_Stage
  ... → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Pay_Period_Record_Date → [Expression] exp_Final_Paymaster_Header
  ... → [TARGET] CPM_PMH_STG_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_PM1_STG_TBL` | Target Definition |
| Source | `CPM_PM2_STG_TBL` | Target Definition |
| Source | `CPM_PM3_STG_TBL` | Target Definition |
| Source | `PAYMASTER_FILE` | Source Definition |
| Target | `CPM_PMH_STG_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final_Paymaster_3` | Expression |
| 2 | `exp_Final_Paymaster_2` | Expression |
| 3 | `exp_Final_Paymaster_1` | Expression |
| 4 | `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| 5 | `exp_Initial` | Expression |
| 6 | `exp_Stage` | Expression |
| 7 | `exp_Final_Paymaster_Header` | Expression |
| 8 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 9 | `Norm_PAYMASTER_FILE` | Normalizer |
| 10 | `exp_Determine_Record_Type` | Expression |
| 11 | `rtr_Paymaster_Records` | Router |

<details><summary>Connector details (592 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Paymaster_1` | `CPM_PM1_STG_TBL` | 37 |
| `exp_Final_Paymaster_Header` | `CPM_PMH_STG_TBL` | 3 |
| `exp_Final_Paymaster_2` | `CPM_PM2_STG_TBL` | 43 |
| `exp_Final_Paymaster_3` | `CPM_PM3_STG_TBL` | 40 |
| `rtr_Paymaster_Records` | `exp_Final_Paymaster_3` | 36 |
| `rtr_Paymaster_Records` | `exp_Final_Paymaster_2` | 41 |
| `rtr_Paymaster_Records` | `exp_Final_Paymaster_1` | 35 |
| `lkp_Pay_Period_Record_Date` | `exp_Stage` | 2 |
| `exp_Initial` | `lkp_Pay_Period_Record_Date` | 1 |
| `exp_Initial` | `exp_Stage` | 5 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `rtr_Paymaster_Records` | `exp_Initial` | 3 |
| `lkp_Current_Pay_Period` | `exp_Stage` | 2 |
| `exp_Stage` | `exp_Final_Paymaster_Header` | 4 |
| `PAYMASTER_FILE` | `Norm_PAYMASTER_FILE` | 112 |
| `Norm_PAYMASTER_FILE` | `exp_Determine_Record_Type` | 112 |
| `exp_Determine_Record_Type` | `rtr_Paymaster_Records` | 115 |

</details>

### `m_CPM_Load_CPM_PAD_Staging_Tables`

**Data Flow:**

```
[SOURCE] PAD_FILE → [Normalizer] Norm_PAD_FILE → [Expression] exp_Determine_Record_Type
  ... → [Router] rtr_PAD_Records → [Expression] exp_Convert → [Expression] exp_Final_PAD_Detail
  ... → [Expression] exp_Verify_Header_Date → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Pay_Period_Record_Date
  ... → [TARGET] CPM_PAD_DETAIL_STG_TBL → [Expression] exp_Final_PAD_Header → [TARGET] CPM_PAD_HEADER_STG_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAD_FILE` | Source Definition |
| Target | `CPM_PAD_DETAIL_STG_TBL` | Target Definition |
| Target | `CPM_PAD_HEADER_STG_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final_PAD_Detail` | Expression |
| 2 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 3 | `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| 4 | `exp_Final_PAD_Header` | Expression |
| 5 | `exp_Convert` | Expression |
| 6 | `exp_Verify_Header_Date` | Expression |
| 7 | `Norm_PAD_FILE` | Normalizer |
| 8 | `exp_Determine_Record_Type` | Expression |
| 9 | `rtr_PAD_Records` | Router |

<details><summary>Connector details (805 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_PAD_Detail` | `CPM_PAD_DETAIL_STG_TBL` | 150 |
| `exp_Final_PAD_Header` | `CPM_PAD_HEADER_STG_TBL` | 8 |
| `rtr_PAD_Records` | `exp_Final_PAD_Detail` | 149 |
| `exp_Convert` | `lkp_Current_Pay_Period` | 1 |
| `lkp_Current_Pay_Period` | `exp_Verify_Header_Date` | 2 |
| `exp_Convert` | `lkp_Pay_Period_Record_Date` | 1 |
| `lkp_Pay_Period_Record_Date` | `exp_Verify_Header_Date` | 2 |
| `exp_Verify_Header_Date` | `exp_Final_PAD_Header` | 9 |
| `rtr_PAD_Records` | `exp_Convert` | 8 |
| `exp_Convert` | `exp_Verify_Header_Date` | 10 |
| `PAD_FILE` | `Norm_PAD_FILE` | 156 |
| `Norm_PAD_FILE` | `exp_Determine_Record_Type` | 153 |
| `exp_Determine_Record_Type` | `rtr_PAD_Records` | 156 |

</details>

### `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_TBL → [SOURCE] CPM_NEWPAY_STG_TYPE_1_2_TBL → [SOURCE] CPM_NEWPAY_STG_TYPE_3_TBL
  ... → [Source Qualifier] SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL → [Expression] exp_Initial → [Expression] exp_Convert
  ... → [Expression] exp_Final
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Target Definition |
| Source | `CPM_NEWPAY_STG_TYPE_1_2_TBL` | Source Definition |
| Source | `CPM_NEWPAY_STG_TYPE_3_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Initial` | Expression |
| 2 | `exp_Final` | Expression |
| 3 | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Source Qualifier |
| 4 | `exp_Convert` | Expression |

<details><summary>Connector details (1985 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NEWPAY_TBL` | 488 |
| `exp_Initial` | `exp_Final` | 486 |
| `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `exp_Initial` | 500 |
| `exp_Initial` | `exp_Convert` | 5 |
| `exp_Convert` | `exp_Final` | 3 |
| `CPM_NEWPAY_STG_TYPE_1_2_TBL` | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | 261 |
| `CPM_NEWPAY_STG_TYPE_3_TBL` | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | 242 |

</details>

### `m_Generic_Mapping`

**Data Flow:**

```
[SOURCE] HI_GENERIC_SRC_TBL → [Source Qualifier] SQ_HI_GENERIC_SRC_TBL → [TARGET] GENERIC_TARGET_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_GENERIC_SRC_TBL` | Source Definition |
| Target | `GENERIC_TARGET_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

<details><summary>Connector details (2 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `SQ_HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` | 1 |
| `HI_GENERIC_SRC_TBL` | `SQ_HI_GENERIC_SRC_TBL` | 1 |

</details>

### `m_CPM_Load_FDR_CPM_NEWPAY_TBL`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_TBL → [SOURCE] CPM_NEWPAY_STG_TYPE_1_2_TBL → [SOURCE] CPM_NEWPAY_STG_TYPE_3_FDR_TBL
  ... → [Source Qualifier] SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL → [Expression] exp_Initial → [Expression] exp_Convert
  ... → [Expression] exp_Final → [Lookup Procedure] lkp_REG_REEMPLED
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Target Definition |
| Source | `CPM_NEWPAY_STG_TYPE_1_2_TBL` | Source Definition |
| Source | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Initial` | Expression |
| 2 | `exp_Final` | Expression |
| 3 | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Source Qualifier |
| 4 | `exp_Convert` | Expression |
| 5 | `lkp_REG_REEMPLED` | Lookup Procedure |

<details><summary>Connector details (2007 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NEWPAY_TBL` | 492 |
| `exp_Initial` | `exp_Convert` | 6 |
| `exp_Initial` | `lkp_REG_REEMPLED` | 5 |
| `exp_Initial` | `exp_Final` | 491 |
| `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `exp_Initial` | 504 |
| `exp_Convert` | `exp_Final` | 2 |
| `CPM_NEWPAY_STG_TYPE_1_2_TBL` | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | 261 |
| `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `SQ_CPM_NEWPAY_STG_TYPE_1_2_TBL` | 245 |
| `lkp_REG_REEMPLED` | `exp_Convert` | 1 |

</details>

### `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_STG_TYPE_3_FDR_TBL → [SOURCE] CPM_PM3_STG_TBL → [Source Qualifier] SQ_CPM_PM3_STG_TBL
  ... → [Expression] exp_Initial → [Aggregator] agg_PYF_EYE_ID_PP_NUM → [Lookup Procedure] lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL
  ... → [Expression] exp_Double_T38_SUN_DIF_HRS_CPP → [Expression] exp_Final → [Expression] exp_Format_Fields
  ... → [Expression] exp_GEN_SEQ_NUMBER → [Expression] exp_Set_REEMP_ANN_CDE → [Lookup Procedure] lkp_CPM_NEWPAY_STG_ALT_TBL
  ... → [Mapplet] mplt_Convert_Num_To_Prec7 → [Mapplet] mplt_Convert_Num_To_Prec71 → [Mapplet] mplt_Convert_Num_To_Prec710
  ... → [Mapplet] mplt_Convert_Num_To_Prec711 → [Mapplet] mplt_Convert_Num_To_Prec72 → [Mapplet] mplt_Convert_Num_To_Prec73
  ... → [Mapplet] mplt_Convert_Num_To_Prec74 → [Mapplet] mplt_Convert_Num_To_Prec75 → [Mapplet] mplt_Convert_Num_To_Prec76
  ... → [Mapplet] mplt_Convert_Num_To_Prec77 → [Mapplet] mplt_Convert_Num_To_Prec78 → [Mapplet] mplt_Convert_Num_To_Prec79
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Target Definition |
| Source | `CPM_PM3_STG_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Initial` | Expression |
| 2 | `agg_PYF_EYE_ID_PP_NUM` | Aggregator |
| 3 | `exp_Final` | Expression |
| 4 | `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Lookup Procedure |
| 5 | `SQ_CPM_PM3_STG_TBL` | Source Qualifier |
| 6 | `exp_Format_Fields` | Expression |
| 7 | `lkp_CPM_NEWPAY_STG_ALT_TBL` | Lookup Procedure |
| 8 | `exp_GEN_SEQ_NUMBER` | Expression |
| 9 | `exp_Double_T38_SUN_DIF_HRS_CPP` | Expression |
| 10 | `exp_Set_REEMP_ANN_CDE` | Expression |

<details><summary>Connector details (805 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | 246 |
| `SQ_CPM_PM3_STG_TBL` | `exp_Initial` | 23 |
| `exp_Initial` | `agg_PYF_EYE_ID_PP_NUM` | 21 |
| `exp_Initial` | `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | 3 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_Format_Fields` | 55 |
| `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `agg_PYF_EYE_ID_PP_NUM` | 5 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_Final` | 62 |
| `agg_PYF_EYE_ID_PP_NUM` | `lkp_CPM_NEWPAY_STG_ALT_TBL` | 3 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_GEN_SEQ_NUMBER` | 3 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec7` | 6 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec71` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec72` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec73` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec74` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec75` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec76` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec77` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec78` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec79` | 10 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec711` | 5 |
| `agg_PYF_EYE_ID_PP_NUM` | `mplt_Convert_Num_To_Prec710` | 9 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_Double_T38_SUN_DIF_HRS_CPP` | 1 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_Set_REEMP_ANN_CDE` | 3 |
| `mplt_Convert_Num_To_Prec71` | `exp_Final` | 10 |
| `mplt_Convert_Num_To_Prec72` | `exp_Final` | 10 |
| `exp_Set_REEMP_ANN_CDE` | `exp_Final` | 1 |
| `mplt_Convert_Num_To_Prec73` | `exp_Final` | 10 |
| `mplt_Convert_Num_To_Prec74` | `exp_Final` | 10 |
| `mplt_Convert_Num_To_Prec75` | `exp_Final` | 10 |
| `mplt_Convert_Num_To_Prec76` | `exp_Final` | 10 |
| `mplt_Convert_Num_To_Prec77` | `exp_Final` | 10 |
| `mplt_Convert_Num_To_Prec78` | `exp_Final` | 10 |
| `mplt_Convert_Num_To_Prec79` | `exp_Final` | 10 |
| `mplt_Convert_Num_To_Prec710` | `exp_Final` | 9 |
| `exp_Format_Fields` | `exp_Final` | 68 |
| `mplt_Convert_Num_To_Prec711` | `exp_Final` | 5 |
| `exp_GEN_SEQ_NUMBER` | `exp_Final` | 1 |
| `mplt_Convert_Num_To_Prec7` | `exp_Final` | 10 |
| `CPM_PM3_STG_TBL` | `SQ_CPM_PM3_STG_TBL` | 39 |
| `exp_Double_T38_SUN_DIF_HRS_CPP` | `exp_Format_Fields` | 1 |
| `lkp_CPM_NEWPAY_STG_ALT_TBL` | `exp_Format_Fields` | 41 |
| `exp_Format_Fields` | `mplt_Convert_Num_To_Prec7` | 4 |
| `exp_Format_Fields` | `exp_Set_REEMP_ANN_CDE` | 1 |

</details>

### `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_STG_TYPE_3_FDR_TBL → [SOURCE] CPM_NEWPAY_STG_TYPE_3_TBL → [Source Qualifier] SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL
  ... → [Expression] exp_Initial → [Aggregator] agg_PYF_EYE_ID_PP_NUM → [Lookup Procedure] lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL
  ... → [Expression] exp_Final → [Expression] exp_Format_Fields → [Lookup Procedure] lkp_CPM_NEWPAY_STG_ALT_TBL
  ... → [Lookup Procedure] lkp_CPM_NEWPAY_STG_DETAIL_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_STG_TYPE_3_TBL` | Target Definition |
| Source | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Initial` | Expression |
| 2 | `agg_PYF_EYE_ID_PP_NUM` | Aggregator |
| 3 | `exp_Final` | Expression |
| 4 | `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | Lookup Procedure |
| 5 | `exp_Format_Fields` | Expression |
| 6 | `lkp_CPM_NEWPAY_STG_ALT_TBL` | Lookup Procedure |
| 7 | `SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | Source Qualifier |
| 8 | `lkp_CPM_NEWPAY_STG_DETAIL_TBL` | Lookup Procedure |

<details><summary>Connector details (1230 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NEWPAY_STG_TYPE_3_TBL` | 241 |
| `exp_Initial` | `agg_PYF_EYE_ID_PP_NUM` | 204 |
| `exp_Initial` | `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | 3 |
| `SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `exp_Initial` | 205 |
| `agg_PYF_EYE_ID_PP_NUM` | `lkp_CPM_NEWPAY_STG_ALT_TBL` | 3 |
| `agg_PYF_EYE_ID_PP_NUM` | `lkp_CPM_NEWPAY_STG_DETAIL_TBL` | 3 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_Final` | 181 |
| `agg_PYF_EYE_ID_PP_NUM` | `exp_Format_Fields` | 19 |
| `lkp_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `agg_PYF_EYE_ID_PP_NUM` | 5 |
| `exp_Format_Fields` | `exp_Final` | 60 |
| `lkp_CPM_NEWPAY_STG_ALT_TBL` | `exp_Format_Fields` | 41 |
| `lkp_CPM_NEWPAY_STG_DETAIL_TBL` | `exp_Format_Fields` | 19 |
| `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `SQ_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | 246 |

</details>

---

## CPM_AFPS

### `m_CPM_AFPS_0100_Data_Seperate`

**Data Flow:**

```
[SOURCE] HI_AFPS_FEEDER_TBL → [SOURCE] CPM_NEWPAY_TBL → [SOURCE] PAY_PERIOD
  ... → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Format_AFPS_Feeder → [Expression] exp_Convert_Calc_Fields
  ... → [Expression] exp_Format_Text_Fields → [Sorter] srt_Sort_By_Payment_Type
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_AFPS_FEEDER_TBL` | Target Definition |
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Source | `PAY_PERIOD` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 2 | `exp_Format_AFPS_Feeder` | Expression |
| 3 | `srt_Sort_By_Payment_Type` | Sorter |
| 4 | `exp_Convert_Calc_Fields` | Expression |
| 5 | `exp_Format_Text_Fields` | Expression |

<details><summary>Connector details (1519 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `srt_Sort_By_Payment_Type` | `HI_AFPS_FEEDER_TBL` | 283 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 471 |
| `PAY_PERIOD` | `SQ_CPM_NEWPAY_TBL` | 3 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Format_AFPS_Feeder` | 472 |
| `exp_Format_AFPS_Feeder` | `srt_Sort_By_Payment_Type` | 278 |
| `exp_Format_AFPS_Feeder` | `exp_Convert_Calc_Fields` | 3 |
| `exp_Format_AFPS_Feeder` | `exp_Format_Text_Fields` | 2 |
| `exp_Convert_Calc_Fields` | `srt_Sort_By_Payment_Type` | 5 |
| `exp_Format_Text_Fields` | `srt_Sort_By_Payment_Type` | 2 |

</details>

### `m_CPM_AFPS_0300_Gross_Exp_Report`

**Data Flow:**

```
[SOURCE] HI_AFPS_FEEDER_TBL → [SOURCE] HI_GROSS_EXP_TBL → [Source Qualifier] SQ_HI_AFPS_FEEDER_TBL
  ... → [Expression] exp_Compute_Main
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_GROSS_EXP_TBL` | Target Definition |
| Source | `HI_AFPS_FEEDER_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Compute_Main` | Expression |
| 2 | `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |

<details><summary>Connector details (377 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Compute_Main` | `HI_GROSS_EXP_TBL` | 12 |
| `SQ_HI_AFPS_FEEDER_TBL` | `exp_Compute_Main` | 87 |
| `HI_AFPS_FEEDER_TBL` | `SQ_HI_AFPS_FEEDER_TBL` | 278 |

</details>

### `m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend`

**Data Flow:**

```
[SOURCE] HI_AFPS_FEEDER_TBL → [Source Qualifier] SQ_HI_AFPS_FEEDER_TBL → [Expression] exp_Initial_Feeder
  ... → [Aggregator] agg_Gross_Expenditures → [Expression] exp_Counters → [Expression] exp_Final_Message
  ... → [TARGET] CPM_AFPS_MESSAGE_COUNTS_TOT_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_AFPS_FEEDER_TBL` | Source Definition |
| Target | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final_Message` | Expression |
| 2 | `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |
| 3 | `exp_Initial_Feeder` | Expression |
| 4 | `agg_Gross_Expenditures` | Aggregator |
| 5 | `exp_Counters` | Expression |

<details><summary>Connector details (384 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Message` | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` | 2 |
| `exp_Counters` | `exp_Final_Message` | 2 |
| `HI_AFPS_FEEDER_TBL` | `SQ_HI_AFPS_FEEDER_TBL` | 279 |
| `SQ_HI_AFPS_FEEDER_TBL` | `exp_Initial_Feeder` | 50 |
| `exp_Initial_Feeder` | `agg_Gross_Expenditures` | 50 |
| `agg_Gross_Expenditures` | `exp_Counters` | 1 |

</details>

### `m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts`

**Data Flow:**

```
[SOURCE] HI_AFPS_FEEDER_TBL → [SOURCE] ERROR_TBL → [Source Qualifier] SQ_HI_AFPS_FEEDER_TBL
  ... → [Source Qualifier] SQ_ERROR_TBL → [Expression] exp_Initial_Feeder → [Expression] exp_Initial_Crossfoot_Errors
  ... → [Aggregator] agg_Gross_Expenditures → [Aggregator] agg_Crossfoot_Errors → [Joiner] jnr_Feeder_Crossfoot
  ... → [Expression] exp_Counters → [Normalizer] nrm_Counters → [Expression] exp_Final_Message
  ... → [TARGET] CPM_AFPS_MESSAGE_COUNTS_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_AFPS_FEEDER_TBL` | Source Definition |
| Source | `ERROR_TBL` | Source Definition |
| Target | `CPM_AFPS_MESSAGE_COUNTS_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_ERROR_TBL` | Source Qualifier |
| 2 | `exp_Final_Message` | Expression |
| 3 | `exp_Initial_Crossfoot_Errors` | Expression |
| 4 | `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |
| 5 | `exp_Initial_Feeder` | Expression |
| 6 | `agg_Gross_Expenditures` | Aggregator |
| 7 | `agg_Crossfoot_Errors` | Aggregator |
| 8 | `jnr_Feeder_Crossfoot` | Joiner |
| 9 | `nrm_Counters` | Normalizer |
| 10 | `exp_Counters` | Expression |

<details><summary>Connector details (426 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Message` | `CPM_AFPS_MESSAGE_COUNTS_FILE` | 2 |
| `ERROR_TBL` | `SQ_ERROR_TBL` | 8 |
| `SQ_ERROR_TBL` | `exp_Initial_Crossfoot_Errors` | 5 |
| `nrm_Counters` | `exp_Final_Message` | 2 |
| `exp_Initial_Crossfoot_Errors` | `agg_Crossfoot_Errors` | 3 |
| `HI_AFPS_FEEDER_TBL` | `SQ_HI_AFPS_FEEDER_TBL` | 279 |
| `SQ_HI_AFPS_FEEDER_TBL` | `exp_Initial_Feeder` | 50 |
| `exp_Initial_Feeder` | `agg_Gross_Expenditures` | 50 |
| `agg_Gross_Expenditures` | `jnr_Feeder_Crossfoot` | 3 |
| `agg_Crossfoot_Errors` | `jnr_Feeder_Crossfoot` | 4 |
| `jnr_Feeder_Crossfoot` | `exp_Counters` | 6 |
| `exp_Counters` | `nrm_Counters` | 14 |

</details>

### `m_CPM_AFPS_0800_Build_Message_Counters`

**Data Flow:**

```
[SOURCE] HI_AFPS_FEEDER_TBL → [SOURCE] CPM_NEWPAY_TBL → [Source Qualifier] SQ_HI_AFPS_FEEDER_TBL
  ... → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Initial_Feeder → [Expression] exp_Initial_CPM
  ... → [Aggregator] agg_Feeder → [Aggregator] agg_Count_CPM → [Joiner] jnr_Inputs_CPM
  ... → [Expression] exp_Counters → [Normalizer] nrm_Counters → [Normalizer] nrm_Counters_Message
  ... → [Expression] exp_Final_Counters → [Expression] exp_Final_Message → [TARGET] AFPS_COUNTER_TBL
  ... → [TARGET] CPM_AFPS_MESSAGE_COUNTS_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Source | `HI_AFPS_FEEDER_TBL` | Source Definition |
| Target | `AFPS_COUNTER_TBL` | Target Definition |
| Target | `CPM_AFPS_MESSAGE_COUNTS_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Initial_Feeder` | Expression |
| 2 | `agg_Feeder` | Aggregator |
| 3 | `nrm_Counters_Message` | Normalizer |
| 4 | `exp_Final_Message` | Expression |
| 5 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 6 | `exp_Initial_CPM` | Expression |
| 7 | `jnr_Inputs_CPM` | Joiner |
| 8 | `agg_Count_CPM` | Aggregator |
| 9 | `nrm_Counters` | Normalizer |
| 10 | `exp_Counters` | Expression |
| 11 | `exp_Final_Counters` | Expression |
| 12 | `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |

<details><summary>Connector details (832 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Counters` | `AFPS_COUNTER_TBL` | 6 |
| `exp_Final_Message` | `CPM_AFPS_MESSAGE_COUNTS_FILE` | 2 |
| `SQ_HI_AFPS_FEEDER_TBL` | `exp_Initial_Feeder` | 4 |
| `exp_Initial_Feeder` | `agg_Feeder` | 4 |
| `agg_Feeder` | `jnr_Inputs_CPM` | 6 |
| `exp_Counters` | `nrm_Counters_Message` | 12 |
| `nrm_Counters_Message` | `exp_Final_Message` | 2 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 471 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Initial_CPM` | 8 |
| `exp_Initial_CPM` | `agg_Count_CPM` | 8 |
| `agg_Count_CPM` | `jnr_Inputs_CPM` | 8 |
| `jnr_Inputs_CPM` | `exp_Counters` | 12 |
| `exp_Counters` | `nrm_Counters` | 6 |
| `nrm_Counters` | `exp_Final_Counters` | 4 |
| `HI_AFPS_FEEDER_TBL` | `SQ_HI_AFPS_FEEDER_TBL` | 279 |

</details>

### `m_CPM_AFPS_0900_Build_Message`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] CPM_AFPS_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_AFPS_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `exp_Final` | Expression |

<details><summary>Connector details (17 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_AFPS_MESSAGE_FILE` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 6 |
| `exp_Initial` | `exp_Final` | 2 |

</details>

### `m_CPM_AFPS_0760_Concatenate_Crossfoot_Files`

**Data Flow:**

```
[SOURCE] HI_GENERIC_SRC_TBL → [Source Qualifier] SQ_HI_GENERIC_SRC_TBL → [TARGET] GENERIC_TARGET_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_GENERIC_SRC_TBL` | Source Definition |
| Target | `GENERIC_TARGET_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

<details><summary>Connector details (2 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `SQ_HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` | 1 |
| `HI_GENERIC_SRC_TBL` | `SQ_HI_GENERIC_SRC_TBL` | 1 |

</details>

### `m_CPM_AFPS_1000_Send_Report`

**Data Flow:**

```
[SOURCE] HI_GENERIC_SRC_TBL → [Source Qualifier] SQ_HI_GENERIC_SRC_TBL → [TARGET] GENERIC_TARGET_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_GENERIC_SRC_TBL` | Source Definition |
| Target | `GENERIC_TARGET_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

<details><summary>Connector details (2 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `SQ_HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` | 1 |
| `HI_GENERIC_SRC_TBL` | `SQ_HI_GENERIC_SRC_TBL` | 1 |

</details>

### `m_CPM_AFPS_0500_Crossfoot_Message_Header`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Build_Message → [Expression] exp_Final_Message → [TARGET] CPM_AFPS_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_AFPS_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Build_Message` | Expression |
| 2 | `exp_Final_Message` | Expression |
| 3 | `SQ_PAY_PERIOD` | Source Qualifier |
| 4 | `exp_Initial` | Expression |

<details><summary>Connector details (16 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Message` | `CPM_AFPS_MESSAGE_FILE` | 1 |
| `exp_Build_Message` | `exp_Final_Message` | 3 |
| `exp_Initial` | `exp_Build_Message` | 2 |
| `PAY_PERIOD` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |

</details>

### `m_CPM_AFPS_0820_Build_Message_Totals`

**Data Flow:**

```
[SOURCE] HI_AFPS_FEEDER_TBL → [SOURCE] CPM_NEWPAY_TBL → [Source Qualifier] SQ_HI_AFPS_FEEDER_TBL
  ... → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Initial_Feeder → [Expression] exp_Initial_CPM
  ... → [Aggregator] agg_Feeder → [Aggregator] agg_Count_CPM → [Joiner] jnr_Inputs_CPM
  ... → [Expression] exp_Counters → [Normalizer] nrm_Counters → [Expression] exp_Final_Counters
  ... → [Expression] exp_Final_Message → [TARGET] AFPS_COUNTER_TBL → [TARGET] CPM_AFPS_MESSAGE_COUNTS_TOT_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_AFPS_FEEDER_TBL` | Source Definition |
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Target | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` | Target Definition |
| Target | `AFPS_COUNTER_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |
| 2 | `exp_Initial_Feeder` | Expression |
| 3 | `agg_Feeder` | Aggregator |
| 4 | `exp_Final_Message` | Expression |
| 5 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 6 | `exp_Initial_CPM` | Expression |
| 7 | `jnr_Inputs_CPM` | Joiner |
| 8 | `agg_Count_CPM` | Aggregator |
| 9 | `nrm_Counters` | Normalizer |
| 10 | `exp_Counters` | Expression |
| 11 | `exp_Final_Counters` | Expression |

<details><summary>Connector details (832 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Message` | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` | 2 |
| `exp_Final_Counters` | `AFPS_COUNTER_TBL` | 6 |
| `HI_AFPS_FEEDER_TBL` | `SQ_HI_AFPS_FEEDER_TBL` | 279 |
| `SQ_HI_AFPS_FEEDER_TBL` | `exp_Initial_Feeder` | 4 |
| `exp_Initial_Feeder` | `agg_Feeder` | 4 |
| `agg_Feeder` | `jnr_Inputs_CPM` | 6 |
| `nrm_Counters` | `exp_Final_Message` | 2 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 471 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Initial_CPM` | 8 |
| `exp_Initial_CPM` | `agg_Count_CPM` | 8 |
| `jnr_Inputs_CPM` | `exp_Counters` | 12 |
| `agg_Count_CPM` | `jnr_Inputs_CPM` | 8 |
| `exp_Counters` | `nrm_Counters` | 18 |
| `nrm_Counters` | `exp_Final_Counters` | 4 |

</details>

### `m_CPM_AFPS_0860_Concatenate_Counts_Files`

**Data Flow:**

```
[SOURCE] HI_GENERIC_SRC_TBL → [Source Qualifier] SQ_HI_GENERIC_SRC_TBL → [TARGET] GENERIC_TARGET_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_GENERIC_SRC_TBL` | Source Definition |
| Target | `GENERIC_TARGET_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

<details><summary>Connector details (2 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `SQ_HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` | 1 |
| `HI_GENERIC_SRC_TBL` | `SQ_HI_GENERIC_SRC_TBL` | 1 |

</details>

### `m_CPM_AFPS_0025_Set_Pay_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Validate_Parameters → [Lookup Procedure] lkp_CPM_NEWPAY_TBL → [Expression] exp_Final
  ... → [TARGET] CPM_AFPS_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_AFPS_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 3 | `exp_Set_Parameters` | Expression |
| 4 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 5 | `SQ_PAY_PERIOD` | Source Qualifier |
| 6 | `exp_Initial` | Expression |
| 7 | `exp_Validate_Parameters` | Expression |
| 8 | `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |

<details><summary>Connector details (38 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_AFPS_PAY_PERIOD_FILE` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 6 |
| `exp_Set_Parameters` | `lkp_CPM_NEWPAY_TBL` | 3 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `lkp_CPM_NEWPAY_TBL` | `exp_Validate_Parameters` | 1 |

</details>

### `m_CPM_AFPS_0600_Crossfoot_Message_Details`

**Data Flow:**

```
[SOURCE] ERROR_TBL → [Source Qualifier] SQ_ERROR_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Convert → [Expression] exp_Final_Message → [TARGET] CPM_AFPS_CROSSFOOT_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `ERROR_TBL` | Source Definition |
| Target | `CPM_AFPS_CROSSFOOT_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final_Message` | Expression |
| 2 | `exp_Initial` | Expression |
| 3 | `exp_Convert` | Expression |
| 4 | `SQ_ERROR_TBL` | Source Qualifier |

<details><summary>Connector details (24 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Message` | `CPM_AFPS_CROSSFOOT_FILE` | 2 |
| `exp_Convert` | `exp_Final_Message` | 2 |
| `SQ_ERROR_TBL` | `exp_Initial` | 7 |
| `exp_Initial` | `exp_Convert` | 5 |
| `ERROR_TBL` | `SQ_ERROR_TBL` | 8 |

</details>

### `m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL`

**Data Flow:**

```
[SOURCE] CPM_CYCLE_TBL1 → [SOURCE] CPM_CYCLE_TBL → [Source Qualifier] SQ_CPM_CYCLE_TBL
  ... → [Expression] exp_Format_Lookup_Current_PAY_PERIOD → [Expression] exp_Increment_Cycle_ID → [Lookup Procedure] lkp_PAY_PERIOD
  ... → [Update Strategy] upd_DFAS_HEADER_TABLE
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_CYCLE_TBL` | Target Definition |
| Source | `CPM_CYCLE_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `upd_DFAS_HEADER_TABLE` | Update Strategy |
| 2 | `SQ_CPM_CYCLE_TBL` | Source Qualifier |
| 3 | `exp_Increment_Cycle_ID` | Expression |
| 4 | `exp_Format_Lookup_Current_PAY_PERIOD` | Expression |
| 5 | `lkp_PAY_PERIOD` | Lookup Procedure |

<details><summary>Connector details (31 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `upd_DFAS_HEADER_TABLE` | `CPM_CYCLE_TBL` | 5 |
| `exp_Increment_Cycle_ID` | `upd_DFAS_HEADER_TABLE` | 6 |
| `CPM_CYCLE_TBL1` | `SQ_CPM_CYCLE_TBL` | 5 |
| `SQ_CPM_CYCLE_TBL` | `exp_Format_Lookup_Current_PAY_PERIOD` | 5 |
| `lkp_PAY_PERIOD` | `exp_Increment_Cycle_ID` | 3 |
| `exp_Format_Lookup_Current_PAY_PERIOD` | `exp_Increment_Cycle_ID` | 5 |
| `exp_Format_Lookup_Current_PAY_PERIOD` | `lkp_PAY_PERIOD` | 2 |

</details>

### `m_CPM_AFPS_0010_Set_CPM_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_PP_YEAR_NUM → [Expression] exp_Validate_Parameters → [Expression] exp_Final
  ... → [TARGET] CPM_AFPS_PAY_PERIOD_CAL_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_AFPS_PAY_PERIOD_CAL_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 3 | `exp_Set_Parameters` | Expression |
| 4 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 5 | `SQ_PAY_PERIOD` | Source Qualifier |
| 6 | `exp_Initial` | Expression |
| 7 | `exp_Validate_Parameters` | Expression |
| 8 | `exp_Stage_Parameters` | Expression |
| 9 | `exp_PP_YEAR_NUM` | Expression |

<details><summary>Connector details (36 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_AFPS_PAY_PERIOD_CAL_FILE` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 5 |
| `exp_Set_Parameters` | `exp_PP_YEAR_NUM` | 2 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `exp_PP_YEAR_NUM` | `exp_Validate_Parameters` | 1 |

</details>

### `m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT`

**Data Flow:**

```
[SOURCE] HI_AFPS_FEEDER_TBL → [Source Qualifier] SQ_HI_AFPS_FEEDER_TBL → [TARGET] feeder_FEEDER_RECORD
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_AFPS_FEEDER_TBL` | Source Definition |
| Target | `feeder_FEEDER_RECORD` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_AFPS_FEEDER_TBL` | Source Qualifier |

<details><summary>Connector details (556 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `SQ_HI_AFPS_FEEDER_TBL` | `feeder_FEEDER_RECORD` | 273 |
| `HI_AFPS_FEEDER_TBL` | `SQ_HI_AFPS_FEEDER_TBL` | 283 |

</details>

### `m_CPM_AFPS_0400_Crossfoot_Errors`

**Data Flow:**

```
[SOURCE] HI_GROSS_EXP_TBL1 → [SOURCE] HI_GROSS_EXP_TBL → [SOURCE] ERROR_TBL
  ... → [SOURCE] CPM_PM3_STG_TBL → [Source Qualifier] SQ_HI_GROSS_EXP_TBL1 → [Source Qualifier] SQ_HI_GROSS_EXP_TBL
  ... → [Joiner] jnr_Check_For_Records_Not_In_CPM3 → [Expression] exp_Join_Tables → [Expression] exp_Format_Message
  ... → [Lookup Procedure] lkp_CPM3
```

| Direction | Object | Type |
|---|---|---|
| Source | `ERROR_TBL` | Target Definition |
| Source | `HI_GROSS_EXP_TBL` | Source Definition |
| Source | `CPM_PM3_STG_TBL` | Source Definition |
| Source | `HI_GROSS_EXP_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_GROSS_EXP_TBL` | Source Qualifier |
| 2 | `exp_Format_Message` | Expression |
| 3 | `exp_Join_Tables` | Expression |
| 4 | `lkp_CPM3` | Lookup Procedure |
| 5 | `SQ_HI_GROSS_EXP_TBL1` | Source Qualifier |
| 6 | `jnr_Check_For_Records_Not_In_CPM3` | Joiner |

<details><summary>Connector details (76 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Format_Message` | `ERROR_TBL` | 8 |
| `HI_GROSS_EXP_TBL` | `SQ_HI_GROSS_EXP_TBL` | 12 |
| `CPM_PM3_STG_TBL` | `SQ_HI_GROSS_EXP_TBL` | 7 |
| `SQ_HI_GROSS_EXP_TBL` | `exp_Join_Tables` | 7 |
| `jnr_Check_For_Records_Not_In_CPM3` | `exp_Format_Message` | 8 |
| `exp_Join_Tables` | `lkp_CPM3` | 8 |
| `lkp_CPM3` | `jnr_Check_For_Records_Not_In_CPM3` | 8 |
| `HI_GROSS_EXP_TBL1` | `SQ_HI_GROSS_EXP_TBL1` | 12 |
| `SQ_HI_GROSS_EXP_TBL1` | `jnr_Check_For_Records_Not_In_CPM3` | 6 |

</details>

---

## CPM_CDC

### `m_CPM_CDC_Load_CPM_CDC_Header_File`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] cdchdr_WS_CDC_HDR
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `cdchdr_WS_CDC_HDR` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `exp_Initial` | Expression |
| 3 | `SQ_PAY_PERIOD` | Source Qualifier |

<details><summary>Connector details (41 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `cdchdr_WS_CDC_HDR` | 13 |
| `exp_Initial` | `exp_Final` | 18 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `PAY_PERIOD` | `SQ_PAY_PERIOD` | 8 |

</details>

### `m_CPM_CDC_Concatenate_Files`

**Data Flow:**

```
[SOURCE] HI_GENERIC_SRC_TBL → [Source Qualifier] SQ_HI_GENERIC_SRC_TBL → [TARGET] GENERIC_TARGET_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_GENERIC_SRC_TBL` | Source Definition |
| Target | `GENERIC_TARGET_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

<details><summary>Connector details (2 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `SQ_HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` | 1 |
| `HI_GENERIC_SRC_TBL` | `SQ_HI_GENERIC_SRC_TBL` | 1 |

</details>

### `m_CPM_CDC_Set_Pay_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Validate_Parameters → [Lookup Procedure] lkp_CPM_NEWPAY_TBL → [Expression] exp_Final
  ... → [TARGET] CPM_CDC_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_CDC_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 3 | `exp_Set_Parameters` | Expression |
| 4 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 5 | `SQ_PAY_PERIOD` | Source Qualifier |
| 6 | `exp_Initial` | Expression |
| 7 | `exp_Validate_Parameters` | Expression |
| 8 | `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |

<details><summary>Connector details (37 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_CDC_PAY_PERIOD_FILE` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 5 |
| `exp_Set_Parameters` | `lkp_CPM_NEWPAY_TBL` | 3 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `lkp_CPM_NEWPAY_TBL` | `exp_Validate_Parameters` | 1 |

</details>

### `m_CPM_CDC_Load_CPM_CDC_Data_File`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_TBL → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Init
  ... → [Expression] exp_Convert → [Expression] exp_Final → [Expression] exp_Set_Defaults
  ... → [TARGET] cdcskel_WS_PAY_OUT_REC
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Target | `cdcskel_WS_PAY_OUT_REC` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 2 | `exp_Set_Defaults` | Expression |
| 3 | `exp_Init` | Expression |
| 4 | `exp_Final` | Expression |
| 5 | `exp_Convert` | Expression |

<details><summary>Connector details (2091 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `cdcskel_WS_PAY_OUT_REC` | 541 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 468 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Init` | 270 |
| `exp_Set_Defaults` | `exp_Final` | 33 |
| `exp_Convert` | `exp_Set_Defaults` | 1 |
| `exp_Init` | `exp_Convert` | 267 |
| `exp_Convert` | `exp_Final` | 511 |

</details>

### `m_CPM_CDC_Set_CPM_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Validate_Parameters → [Expression] exp_Final → [TARGET] CPM_CDC_CPM_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_CDC_CPM_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 2 | `exp_Set_Parameters` | Expression |
| 3 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 4 | `SQ_PAY_PERIOD` | Source Qualifier |
| 5 | `exp_Initial` | Expression |
| 6 | `exp_Final` | Expression |
| 7 | `exp_Validate_Parameters` | Expression |

<details><summary>Connector details (34 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_CDC_CPM_PAY_PERIOD_FILE` | 1 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 6 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |

</details>

### `m_CPM_CDC_Build_Message`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_TBL → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Initial
  ... → [Aggregator] agg_Count_CPM_CDC → [Expression] exp_Build_Message → [Lookup Procedure] lkp_Pay_Period_Total
  ... → [Expression] exp_Final → [TARGET] CPM_CDC_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Target | `CPM_CDC_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 2 | `exp_Build_Message` | Expression |
| 3 | `exp_Final` | Expression |
| 4 | `exp_Initial` | Expression |
| 5 | `agg_Count_CPM_CDC` | Aggregator |
| 6 | `lkp_Pay_Period_Total` | Lookup Procedure |

<details><summary>Connector details (480 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_CDC_MESSAGE_FILE` | 2 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 466 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Initial` | 3 |
| `agg_Count_CPM_CDC` | `exp_Build_Message` | 3 |
| `lkp_Pay_Period_Total` | `exp_Build_Message` | 1 |
| `exp_Build_Message` | `exp_Final` | 2 |
| `exp_Initial` | `agg_Count_CPM_CDC` | 2 |
| `agg_Count_CPM_CDC` | `lkp_Pay_Period_Total` | 1 |

</details>

---

## CPM_NIH

### `m_CPM_NIH_Build_Message`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_TBL → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Initial
  ... → [Aggregator] agg_Count_CPM_NIH → [Expression] exp_Build_Message → [Lookup Procedure] lkp_Pay_Period_Total
  ... → [Expression] exp_Final → [TARGET] CPM_NIH_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Target | `CPM_NIH_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_Pay_Period_Total` | Lookup Procedure |
| 2 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 3 | `exp_Build_Message` | Expression |
| 4 | `exp_Final` | Expression |
| 5 | `exp_Initial` | Expression |
| 6 | `agg_Count_CPM_NIH` | Aggregator |

<details><summary>Connector details (480 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NIH_MESSAGE_FILE` | 2 |
| `lkp_Pay_Period_Total` | `exp_Build_Message` | 1 |
| `agg_Count_CPM_NIH` | `lkp_Pay_Period_Total` | 1 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 466 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Initial` | 3 |
| `agg_Count_CPM_NIH` | `exp_Build_Message` | 3 |
| `exp_Build_Message` | `exp_Final` | 2 |
| `exp_Initial` | `agg_Count_CPM_NIH` | 2 |

</details>

### `m_CPM_NIH_Load_CPM_NIH_Header_File`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] nihhdr_WS_NIH_HDR
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `nihhdr_WS_NIH_HDR` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD` | Source Qualifier |
| 2 | `exp_Final` | Expression |
| 3 | `exp_Initial` | Expression |

<details><summary>Connector details (42 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `nihhdr_WS_NIH_HDR` | 15 |
| `PAY_PERIOD` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `exp_Initial` | `exp_Final` | 17 |

</details>

### `m_CPM_NIH_Load_CPM_NIH_Data_File`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_TBL → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Init
  ... → [Expression] exp_Convert → [Expression] exp_Final → [Expression] exp_Set_Defaults
  ... → [TARGET] nihtest_NIH_PAYROLL_MASTER
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Target | `nihtest_NIH_PAYROLL_MASTER` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 2 | `exp_Set_Defaults` | Expression |
| 3 | `exp_Init` | Expression |
| 4 | `exp_Final` | Expression |
| 5 | `exp_Convert` | Expression |

<details><summary>Connector details (1971 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `nihtest_NIH_PAYROLL_MASTER` | 530 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 463 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Init` | 431 |
| `exp_Set_Defaults` | `exp_Final` | 101 |
| `exp_Init` | `exp_Set_Defaults` | 1 |
| `exp_Init` | `exp_Final` | 414 |
| `exp_Init` | `exp_Convert` | 16 |
| `exp_Convert` | `exp_Final` | 15 |

</details>

### `m_CPM_NIH_Set_CPM_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Validate_Parameters → [Expression] exp_Final → [TARGET] CPM_NIH_CPM_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_NIH_CPM_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 3 | `exp_Set_Parameters` | Expression |
| 4 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 5 | `SQ_PAY_PERIOD` | Source Qualifier |
| 6 | `exp_Initial` | Expression |
| 7 | `exp_Validate_Parameters` | Expression |

<details><summary>Connector details (34 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NIH_CPM_PAY_PERIOD_FILE` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 6 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |

</details>

### `m_CPM_NIH_Concatenate_Files`

**Data Flow:**

```
[SOURCE] HI_GENERIC_SRC_TBL → [Source Qualifier] SQ_HI_GENERIC_SRC_TBL → [TARGET] GENERIC_TARGET_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_GENERIC_SRC_TBL` | Source Definition |
| Target | `GENERIC_TARGET_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

<details><summary>Connector details (2 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `SQ_HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` | 1 |
| `HI_GENERIC_SRC_TBL` | `SQ_HI_GENERIC_SRC_TBL` | 1 |

</details>

### `m_CPM_NIH_Set_Pay_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Validate_Parameters → [Lookup Procedure] lkp_CPM_NEWPAY_TBL → [Expression] exp_Final
  ... → [TARGET] CPM_NIH_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_NIH_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 3 | `exp_Set_Parameters` | Expression |
| 4 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 5 | `SQ_PAY_PERIOD` | Source Qualifier |
| 6 | `exp_Initial` | Expression |
| 7 | `exp_Validate_Parameters` | Expression |
| 8 | `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |

<details><summary>Connector details (37 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_NIH_PAY_PERIOD_FILE` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 5 |
| `exp_Set_Parameters` | `lkp_CPM_NEWPAY_TBL` | 3 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `lkp_CPM_NEWPAY_TBL` | `exp_Validate_Parameters` | 1 |

</details>

---

## CPM_OIG

### `m_CPM_OIG_Build_Message`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_TBL → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Initial
  ... → [Aggregator] agg_Count_CPM_OIG → [Expression] exp_Build_Message → [Expression] exp_Final
  ... → [TARGET] CPM_OIG_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Target | `CPM_OIG_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 2 | `exp_Build_Message` | Expression |
| 3 | `exp_Final` | Expression |
| 4 | `exp_Initial` | Expression |
| 5 | `agg_Count_CPM_OIG` | Aggregator |

<details><summary>Connector details (478 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_OIG_MESSAGE_FILE` | 2 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 466 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Initial` | 3 |
| `agg_Count_CPM_OIG` | `exp_Build_Message` | 3 |
| `exp_Build_Message` | `exp_Final` | 2 |
| `exp_Initial` | `agg_Count_CPM_OIG` | 2 |

</details>

### `m_CPM_OIG_Set_Pay_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Validate_Parameters → [Lookup Procedure] lkp_CPM_NEWPAY_TBL → [Expression] exp_Final
  ... → [TARGET] CPM_OIG_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_OIG_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Validate_Parameters` | Expression |
| 2 | `exp_Set_Current_Pay_Period_Param` | Expression |
| 3 | `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |
| 4 | `exp_Final` | Expression |
| 5 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 6 | `exp_Set_Parameters` | Expression |
| 7 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 8 | `SQ_PAY_PERIOD` | Source Qualifier |
| 9 | `exp_Initial` | Expression |

<details><summary>Connector details (37 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_OIG_PAY_PERIOD_FILE` | 1 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 5 |
| `lkp_CPM_NEWPAY_TBL` | `exp_Validate_Parameters` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Set_Parameters` | `lkp_CPM_NEWPAY_TBL` | 3 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |

</details>

### `m_CPM_OIG_Set_CPM_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Validate_Parameters → [Expression] exp_Final → [TARGET] CPM_OIG_CPM_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_OIG_CPM_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Validate_Parameters` | Expression |
| 2 | `exp_Final` | Expression |
| 3 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 4 | `exp_Set_Parameters` | Expression |
| 5 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 6 | `SQ_PAY_PERIOD` | Source Qualifier |
| 7 | `exp_Initial` | Expression |

<details><summary>Connector details (34 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_OIG_CPM_PAY_PERIOD_FILE` | 1 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 6 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |

</details>

### `m_CPM_OIG_Load_CPM_OIG_File`

**Data Flow:**

```
[SOURCE] CPM_NEWPAY_TBL → [Source Qualifier] SQ_CPM_NEWPAY_TBL → [Expression] exp_Init
  ... → [Expression] exp_Convert → [Expression] exp_Final → [TARGET] oigsgndec_SKPAYROLL_MASTER
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_NEWPAY_TBL` | Source Definition |
| Target | `oigsgndec_SKPAYROLL_MASTER` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_CPM_NEWPAY_TBL` | Source Qualifier |
| 2 | `exp_Set_Defaults` | Expression |
| 3 | `exp_Init` | Expression |
| 4 | `exp_Final` | Expression |
| 5 | `UPDTRANS` | Update Strategy |
| 6 | `exp_Convert` | Expression |

<details><summary>Connector details (1429 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `oigsgndec_SKPAYROLL_MASTER` | 237 |
| `CPM_NEWPAY_TBL` | `SQ_CPM_NEWPAY_TBL` | 467 |
| `SQ_CPM_NEWPAY_TBL` | `exp_Init` | 448 |
| `exp_Init` | `exp_Final` | 40 |
| `exp_Init` | `exp_Convert` | 40 |
| `exp_Convert` | `exp_Final` | 197 |

</details>

---

## EHRP2BIIS_UPDATE

### `m_EHRP2BIIS_UPDATE`

**Data Flow:**

```
[SOURCE] NWK_NEW_EHRP_ACTIONS_TBL → [SOURCE] PS_GVT_JOB → [Source Qualifier] SQ_PS_GVT_JOB
  ... → [TARGET] EHRP_RECS_TRACKING_TBL → [Expression] exp_GET_EFFDT_YEAR → [Expression] exp_MAIN2BIIS
  ... → [Lookup Procedure] lkp_PS_GVT_AWD_DATA → [Lookup Procedure] lkp_PS_GVT_CITIZENSHIP → [Lookup Procedure] lkp_PS_GVT_EE_DATA_TRK
  ... → [Lookup Procedure] lkp_PS_GVT_EMPLOYMENT → [Lookup Procedure] lkp_PS_GVT_PERS_DATA → [Lookup Procedure] lkp_PS_GVT_PERS_NID
  ... → [Lookup Procedure] lkp_PS_HE_FILL_POS → [Lookup Procedure] lkp_PS_JPM_JP_ITEMS → [Lookup Procedure] lkp_OLD_SEQUENCE_NUMBER
  ... → [TARGET] NWK_ACTION_PRIMARY_TBL → [TARGET] NWK_ACTION_SECONDARY_TBL → [Expression] exp_PERS_DATA
```

| Direction | Object | Type |
|---|---|---|
| Source | `PS_GVT_JOB` | Source Definition |
| Source | `NWK_NEW_EHRP_ACTIONS_TBL` | Source Definition |
| Target | `NWK_ACTION_SECONDARY_TBL` | Target Definition |
| Target | `NWK_ACTION_PRIMARY_TBL` | Target Definition |
| Target | `EHRP_RECS_TRACKING_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_GET_EFFDT_YEAR` | Expression |
| 2 | `lkp_OLD_SEQUENCE_NUMBER` | Lookup Procedure |
| 3 | `SQ_PS_GVT_JOB` | Source Qualifier |
| 4 | `lkp_PS_GVT_EMPLOYMENT` | Lookup Procedure |
| 5 | `lkp_PS_GVT_PERS_NID` | Lookup Procedure |
| 6 | `exp_MAIN2BIIS` | Expression |
| 7 | `lkp_PS_GVT_AWD_DATA` | Lookup Procedure |
| 8 | `lkp_PS_GVT_EE_DATA_TRK` | Lookup Procedure |
| 9 | `lkp_PS_HE_FILL_POS` | Lookup Procedure |
| 10 | `lkp_PS_GVT_CITIZENSHIP` | Lookup Procedure |
| 11 | `lkp_PS_GVT_PERS_DATA` | Lookup Procedure |
| 12 | `exp_PERS_DATA` | Expression |
| 13 | `lkp_PS_JPM_JP_ITEMS` | Lookup Procedure |

<details><summary>Connector details (589 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_MAIN2BIIS` | `NWK_ACTION_SECONDARY_TBL` | 32 |
| `exp_PERS_DATA` | `NWK_ACTION_SECONDARY_TBL` | 2 |
| `exp_PERS_DATA` | `NWK_ACTION_PRIMARY_TBL` | 13 |
| `lkp_PS_GVT_EMPLOYMENT` | `NWK_ACTION_PRIMARY_TBL` | 14 |
| `exp_MAIN2BIIS` | `NWK_ACTION_PRIMARY_TBL` | 93 |
| `lkp_PS_HE_FILL_POS` | `NWK_ACTION_PRIMARY_TBL` | 1 |
| `lkp_PS_GVT_PERS_NID` | `NWK_ACTION_PRIMARY_TBL` | 1 |
| `lkp_PS_JPM_JP_ITEMS` | `NWK_ACTION_PRIMARY_TBL` | 2 |
| `exp_MAIN2BIIS` | `EHRP_RECS_TRACKING_TBL` | 3 |
| `SQ_PS_GVT_JOB` | `EHRP_RECS_TRACKING_TBL` | 7 |
| `SQ_PS_GVT_JOB` | `exp_GET_EFFDT_YEAR` | 1 |
| `exp_GET_EFFDT_YEAR` | `lkp_OLD_SEQUENCE_NUMBER` | 1 |
| `lkp_OLD_SEQUENCE_NUMBER` | `exp_MAIN2BIIS` | 1 |
| `PS_GVT_JOB` | `SQ_PS_GVT_JOB` | 246 |
| `NWK_NEW_EHRP_ACTIONS_TBL` | `SQ_PS_GVT_JOB` | 4 |
| `SQ_PS_GVT_JOB` | `lkp_PS_GVT_EMPLOYMENT` | 4 |
| `SQ_PS_GVT_JOB` | `lkp_PS_GVT_PERS_NID` | 4 |
| `SQ_PS_GVT_JOB` | `exp_MAIN2BIIS` | 97 |
| `SQ_PS_GVT_JOB` | `lkp_PS_GVT_AWD_DATA` | 4 |
| `SQ_PS_GVT_JOB` | `lkp_PS_GVT_EE_DATA_TRK` | 5 |
| `SQ_PS_GVT_JOB` | `lkp_PS_HE_FILL_POS` | 4 |
| `SQ_PS_GVT_JOB` | `lkp_PS_GVT_CITIZENSHIP` | 4 |
| `SQ_PS_GVT_JOB` | `lkp_PS_GVT_PERS_DATA` | 4 |
| `SQ_PS_GVT_JOB` | `lkp_PS_JPM_JP_ITEMS` | 1 |
| `lkp_PS_GVT_EMPLOYMENT` | `exp_MAIN2BIIS` | 13 |
| `lkp_PS_GVT_AWD_DATA` | `exp_MAIN2BIIS` | 6 |
| `lkp_PS_GVT_CITIZENSHIP` | `exp_MAIN2BIIS` | 1 |
| `lkp_PS_GVT_EE_DATA_TRK` | `exp_MAIN2BIIS` | 1 |
| `exp_PERS_DATA` | `exp_MAIN2BIIS` | 2 |
| `lkp_PS_JPM_JP_ITEMS` | `exp_MAIN2BIIS` | 1 |
| `lkp_PS_GVT_PERS_DATA` | `exp_PERS_DATA` | 17 |

</details>

---

## FDA_Leave

### `m_0150_PM_FDA_Error_Counter`

**Data Flow:**

```
[SOURCE] ERROR_TBL_MER → [SOURCE] HI_PM_FDA_TATRAN_TBL11 → [SOURCE] ERROR_TBL_CPM
  ... → [SOURCE] ERROR_TBL_YTD → [SOURCE] ERROR_TBL_PAD → [Source Qualifier] SQ_HI_PM_FDA_TATRAN_TBL11
  ... → [Expression] exp_Format_Get_Current_PP11 → [Lookup Procedure] lkp_CPM_MER_DETAIL_STG_TBL → [Lookup Procedure] lkp_CPM_NEWPAY_TBL
  ... → [Lookup Procedure] lkp_CPM_PAD_DETAIL_STG_TBL → [Lookup Procedure] lkp_CPM_YTD_DETAIL_STG_TBL → [Filter] fil_Errors_MER
  ... → [Filter] fil_Errors_CPM → [Filter] fil_Errors_PAD → [Filter] fil_Errors_YTD
  ... → [Expression] exp_Format_MER → [Expression] exp_Format_CPM → [Expression] exp_Format_PAD
  ... → [Expression] exp_Format_YTD
```

| Direction | Object | Type |
|---|---|---|
| Source | `ERROR_TBL` | Target Definition |
| Source | `ERROR_TBL` | Target Definition |
| Source | `ERROR_TBL` | Target Definition |
| Source | `ERROR_TBL` | Target Definition |
| Source | `HI_PM_FDA_TATRAN_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Format_YTD` | Expression |
| 2 | `lkp_CPM_YTD_DETAIL_STG_TBL` | Lookup Procedure |
| 3 | `SQ_HI_PM_FDA_TATRAN_TBL11` | Source Qualifier |
| 4 | `exp_Format_Get_Current_PP11` | Expression |
| 5 | `lkp_PAY_PERIOD11` | Lookup Procedure |
| 6 | `exp_Format_PAD` | Expression |
| 7 | `fil_Errors_PAD` | Filter |
| 8 | `lkp_CPM_PAD_DETAIL_STG_TBL` | Lookup Procedure |
| 9 | `fil_Errors_MER` | Filter |
| 10 | `lkp_CPM_MER_DETAIL_STG_TBL` | Lookup Procedure |
| 11 | `exp_Format_MER` | Expression |
| 12 | `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |
| 13 | `exp_Format_CPM` | Expression |
| 14 | `fil_Errors_CPM` | Filter |
| 15 | `fil_Errors_YTD` | Filter |

<details><summary>Connector details (89 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Format_CPM` | `ERROR_TBL_CPM` | 7 |
| `exp_Format_MER` | `ERROR_TBL_MER` | 7 |
| `exp_Format_YTD` | `ERROR_TBL_YTD` | 7 |
| `exp_Format_PAD` | `ERROR_TBL_PAD` | 7 |
| `fil_Errors_YTD` | `exp_Format_YTD` | 4 |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | `fil_Errors_YTD` | 5 |
| `exp_Format_Get_Current_PP11` | `lkp_CPM_YTD_DETAIL_STG_TBL` | 4 |
| `HI_PM_FDA_TATRAN_TBL11` | `SQ_HI_PM_FDA_TATRAN_TBL11` | 8 |
| `SQ_HI_PM_FDA_TATRAN_TBL11` | `exp_Format_Get_Current_PP11` | 1 |
| `exp_Format_Get_Current_PP11` | `lkp_CPM_NEWPAY_TBL` | 4 |
| `exp_Format_Get_Current_PP11` | `lkp_CPM_PAD_DETAIL_STG_TBL` | 4 |
| `exp_Format_Get_Current_PP11` | `lkp_CPM_MER_DETAIL_STG_TBL` | 4 |
| `fil_Errors_PAD` | `exp_Format_PAD` | 4 |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | `fil_Errors_PAD` | 5 |
| `lkp_CPM_MER_DETAIL_STG_TBL` | `fil_Errors_MER` | 5 |
| `fil_Errors_MER` | `exp_Format_MER` | 4 |
| `lkp_CPM_NEWPAY_TBL` | `fil_Errors_CPM` | 5 |
| `fil_Errors_CPM` | `exp_Format_CPM` | 4 |

</details>

### `m_0300_PM_FDA_Create_Output_File`

**Data Flow:**

```
[SOURCE] HI_PM_FDA_TATRAN_FLAT → [SOURCE] HI_PM_FDA_TATRAN_TBL → [Source Qualifier] SQ_HI_PM_FDA_TATRAN_TBL
  ... → [Expression] exp_Convert_Minutes_REPLACESTR
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_PM_FDA_TATRAN_FLAT` | Target Definition |
| Source | `HI_PM_FDA_TATRAN_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_PM_FDA_TATRAN_TBL` | Source Qualifier |
| 2 | `exp_Convert_Minutes_REPLACESTR` | Expression |

<details><summary>Connector details (20 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Convert_Minutes_REPLACESTR` | `HI_PM_FDA_TATRAN_FLAT` | 6 |
| `HI_PM_FDA_TATRAN_TBL` | `SQ_HI_PM_FDA_TATRAN_TBL` | 8 |
| `SQ_HI_PM_FDA_TATRAN_TBL` | `exp_Convert_Minutes_REPLACESTR` | 6 |

</details>

### `m_0020_PM_FDA_Set_CPM_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Validate_Parameters → [Expression] exp_Final → [TARGET] CPM_FDA_CPM_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_FDA_CPM_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 3 | `exp_Set_Parameters` | Expression |
| 4 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 5 | `SQ_PAY_PERIOD` | Source Qualifier |
| 6 | `exp_Initial` | Expression |
| 7 | `exp_Validate_Parameters` | Expression |

<details><summary>Connector details (33 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_FDA_CPM_PAY_PERIOD_FILE` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 5 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |

</details>

### `m_1100_PM_FDA_Send_Email`

**Data Flow:**

```
[SOURCE] HI_GENERIC_SRC_TBL → [Source Qualifier] SQ_HI_GENERIC_SRC_TBL → [TARGET] GENERIC_TARGET_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_GENERIC_SRC_TBL` | Source Definition |
| Target | `GENERIC_TARGET_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_GENERIC_SRC_TBL` | Source Qualifier |

<details><summary>Connector details (2 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `SQ_HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` | 1 |
| `HI_GENERIC_SRC_TBL` | `SQ_HI_GENERIC_SRC_TBL` | 1 |

</details>

### `m_0200_PM_FDA_Create_Insert_200_Rows`

**Data Flow:**

```
[SOURCE] HI_PM_FDA_TATRAN_TBL1 → [SOURCE] HI_PM_FDA_TATRAN_TBL → [Source Qualifier] SQ_HI_PM_FDA_TATRAN_TBL
  ... → [Expression] exp_Set_PP → [Filter] fil_Filter_Out_NULL → [Lookup Procedure] lkp_CPM_MER_DETAIL_STG_TBL
  ... → [Lookup Procedure] lkp_CPM_NEWPAY_TBL → [Lookup Procedure] lkp_CPM_PAD_DETAIL_STG_TBL → [Lookup Procedure] lkp_CPM_YTD_DETAIL_STG_TBL
  ... → [Expression] exp_Format_200_Records → [Lookup Procedure] lkp_PSEUDOSSN → [Normalizer] nrm_Normalize_200_Records
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_PM_FDA_TATRAN_TBL` | Target Definition |
| Source | `HI_PM_FDA_TATRAN_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_HI_PM_FDA_TATRAN_TBL` | Source Qualifier |
| 2 | `exp_Format_200_Records` | Expression |
| 3 | `nrm_Normalize_200_Records` | Normalizer |
| 4 | `lkp_CPM_MER_DETAIL_STG_TBL` | Lookup Procedure |
| 5 | `exp_Set_PP` | Expression |
| 6 | `lkp_PAY_PERIOD` | Lookup Procedure |
| 7 | `lkp_CPM_PAD_DETAIL_STG_TBL` | Lookup Procedure |
| 8 | `lkp_CPM_YTD_DETAIL_STG_TBL` | Lookup Procedure |
| 9 | `fil_Filter_Out_NULL` | Filter |
| 10 | `lkp_PSEUDOSSN` | Lookup Procedure |
| 11 | `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |

<details><summary>Connector details (303 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `nrm_Normalize_200_Records` | `HI_PM_FDA_TATRAN_TBL1` | 8 |
| `HI_PM_FDA_TATRAN_TBL` | `SQ_HI_PM_FDA_TATRAN_TBL` | 8 |
| `SQ_HI_PM_FDA_TATRAN_TBL` | `exp_Set_PP` | 1 |
| `SQ_HI_PM_FDA_TATRAN_TBL` | `fil_Filter_Out_NULL` | 5 |
| `fil_Filter_Out_NULL` | `exp_Format_200_Records` | 115 |
| `exp_Format_200_Records` | `nrm_Normalize_200_Records` | 33 |
| `exp_Format_200_Records` | `lkp_PSEUDOSSN` | 1 |
| `lkp_PSEUDOSSN` | `nrm_Normalize_200_Records` | 1 |
| `lkp_CPM_MER_DETAIL_STG_TBL` | `fil_Filter_Out_NULL` | 93 |
| `exp_Set_PP` | `lkp_CPM_MER_DETAIL_STG_TBL` | 5 |
| `exp_Set_PP` | `lkp_CPM_PAD_DETAIL_STG_TBL` | 5 |
| `exp_Set_PP` | `lkp_CPM_YTD_DETAIL_STG_TBL` | 5 |
| `exp_Set_PP` | `lkp_CPM_NEWPAY_TBL` | 3 |
| `lkp_CPM_PAD_DETAIL_STG_TBL` | `fil_Filter_Out_NULL` | 14 |
| `lkp_CPM_YTD_DETAIL_STG_TBL` | `fil_Filter_Out_NULL` | 3 |
| `lkp_CPM_NEWPAY_TBL` | `fil_Filter_Out_NULL` | 3 |

</details>

### `m_0500_PM_FDA_IO_Counter`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [SOURCE] ERROR_TBL → [SOURCE] HI_PM_FDA_TATRAN_TBL
  ... → [Source Qualifier] SQ_ERROR_TBL → [Source Qualifier] SQ_HI_PM_FDA_TATRAN_TBL → [Expression] exp_Initial_Error
  ... → [Filter] fil_Leave_Records → [Aggregator] agg_Error_Records → [Aggregator] agg_All_Leave_Recs
  ... → [Expression] exp_Error_Count → [Expression] exp_Leave_Rec_Count → [Joiner] jnr_All_Counts
  ... → [Expression] exp_Counters1 → [Lookup Procedure] lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL → [Lookup Procedure] lkp_Count_HI_PM_FDA_TATRAN_TBL_READ
  ... → [Lookup Procedure] lkp_Curr_Pay_Period → [Expression] exp_Counters → [Expression] exp_Build_Message
  ... → [Normalizer] nrm_Counters → [Normalizer] nrm_Counters_Message → [Expression] exp_Final_Rec_Insert
  ... → [Expression] exp_Final_Message → [TARGET] COUNTER_TBL → [TARGET] FDA_EXTRACT_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_PM_FDA_TATRAN_TBL` | Source Definition |
| Source | `ERROR_TBL` | Source Definition |
| Source | `PAY_PERIOD` | Source Definition |
| Target | `COUNTER_TBL` | Target Definition |
| Target | `FDA_EXTRACT_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `nrm_Counters_Message` | Normalizer |
| 2 | `exp_Counters1` | Expression |
| 3 | `SQ_HI_PM_FDA_TATRAN_TBL` | Source Qualifier |
| 4 | `fil_Leave_Records` | Filter |
| 5 | `agg_All_Leave_Recs` | Aggregator |
| 6 | `exp_Leave_Rec_Count` | Expression |
| 7 | `lkp_Curr_Pay_Period` | Lookup Procedure |
| 8 | `exp_Counters` | Expression |
| 9 | `lkp_Count_HI_PM_FDA_TATRAN_TBL_READ` | Lookup Procedure |
| 10 | `nrm_Counters` | Normalizer |
| 11 | `exp_Final_Rec_Insert` | Expression |
| 12 | `exp_Build_Message` | Expression |
| 13 | `exp_Final_Message` | Expression |
| 14 | `lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL` | Lookup Procedure |
| 15 | `agg_Error_Records` | Aggregator |
| 16 | `exp_Error_Count` | Expression |
| 17 | `jnr_All_Counts` | Joiner |
| 18 | `SQ_ERROR_TBL` | Source Qualifier |
| 19 | `exp_Initial_Error` | Expression |

<details><summary>Connector details (113 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Rec_Insert` | `COUNTER_TBL` | 6 |
| `exp_Final_Message` | `FDA_EXTRACT_MESSAGE_FILE` | 2 |
| `exp_Build_Message` | `nrm_Counters_Message` | 12 |
| `nrm_Counters_Message` | `exp_Final_Message` | 2 |
| `exp_Counters1` | `jnr_All_Counts` | 6 |
| `exp_Leave_Rec_Count` | `exp_Counters1` | 2 |
| `lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL` | `exp_Counters1` | 1 |
| `lkp_Count_HI_PM_FDA_TATRAN_TBL_READ` | `exp_Counters1` | 1 |
| `lkp_Curr_Pay_Period` | `exp_Counters1` | 2 |
| `HI_PM_FDA_TATRAN_TBL` | `SQ_HI_PM_FDA_TATRAN_TBL` | 8 |
| `SQ_HI_PM_FDA_TATRAN_TBL` | `fil_Leave_Records` | 5 |
| `fil_Leave_Records` | `agg_All_Leave_Recs` | 5 |
| `agg_All_Leave_Recs` | `exp_Leave_Rec_Count` | 1 |
| `exp_Leave_Rec_Count` | `lkp_Curr_Pay_Period` | 1 |
| `exp_Leave_Rec_Count` | `lkp_Count_HI_PM_FDA_TATRAN_TBL_READ` | 1 |
| `exp_Leave_Rec_Count` | `lkp_Count_HI_PM_FDA_TATRAN_TBL_ALL` | 1 |
| `jnr_All_Counts` | `exp_Counters` | 6 |
| `exp_Counters` | `nrm_Counters` | 12 |
| `exp_Counters` | `exp_Build_Message` | 15 |
| `nrm_Counters` | `exp_Final_Rec_Insert` | 3 |
| `exp_Initial_Error` | `agg_Error_Records` | 5 |
| `agg_Error_Records` | `exp_Error_Count` | 1 |
| `exp_Error_Count` | `jnr_All_Counts` | 2 |
| `ERROR_TBL` | `SQ_ERROR_TBL` | 7 |
| `SQ_ERROR_TBL` | `exp_Initial_Error` | 6 |

</details>

### `m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA`

**Data Flow:**

```
[SOURCE] CPM_CYCLE_TBL1 → [SOURCE] CPM_CYCLE_TBL → [Source Qualifier] SQ_CPM_CYCLE_TBL
  ... → [Expression] exp_Format_Lookup_Current_PAY_PERIOD → [Expression] exp_Increment_Cycle_ID → [Lookup Procedure] lkp_PAY_PERIOD
  ... → [Update Strategy] upd_DFAS_HEADER_TABLE
```

| Direction | Object | Type |
|---|---|---|
| Source | `CPM_CYCLE_TBL` | Target Definition |
| Source | `CPM_CYCLE_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Increment_Cycle_ID` | Expression |
| 2 | `exp_Format_Lookup_Current_PAY_PERIOD` | Expression |
| 3 | `lkp_PAY_PERIOD` | Lookup Procedure |
| 4 | `upd_DFAS_HEADER_TABLE` | Update Strategy |
| 5 | `SQ_CPM_CYCLE_TBL` | Source Qualifier |

<details><summary>Connector details (31 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `upd_DFAS_HEADER_TABLE` | `CPM_CYCLE_TBL` | 5 |
| `lkp_PAY_PERIOD` | `exp_Increment_Cycle_ID` | 3 |
| `exp_Format_Lookup_Current_PAY_PERIOD` | `exp_Increment_Cycle_ID` | 5 |
| `exp_Increment_Cycle_ID` | `upd_DFAS_HEADER_TABLE` | 6 |
| `SQ_CPM_CYCLE_TBL` | `exp_Format_Lookup_Current_PAY_PERIOD` | 5 |
| `exp_Format_Lookup_Current_PAY_PERIOD` | `lkp_PAY_PERIOD` | 2 |
| `CPM_CYCLE_TBL1` | `SQ_CPM_CYCLE_TBL` | 5 |

</details>

### `m_0010_PM_FDA_Verify_File`

**Data Flow:**

```
[SOURCE] HI_PM_FDA_TATRAN_FLAT_FILE_NAME → [Source Qualifier] SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME → [Expression] exp_Initial
  ... → [Sorter] srt_Distinct_File_Names → [Aggregator] agg_Count_Number_of_Files → [Expression] EXPTRANS
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Expression] exp_Validate_Parameters
  ... → [Expression] exp_Final → [TARGET] CPM_FDA_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | Source Definition |
| Target | `CPM_FDA_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 3 | `exp_Set_Parameters` | Expression |
| 4 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 5 | `exp_Initial` | Expression |
| 6 | `exp_Validate_Parameters` | Expression |
| 7 | `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |
| 8 | `SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | Source Qualifier |
| 9 | `agg_Count_Number_of_Files` | Aggregator |
| 10 | `EXPTRANS` | Expression |
| 11 | `srt_Distinct_File_Names` | Sorter |

<details><summary>Connector details (28 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_FDA_PAY_PERIOD_FILE` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 3 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |
| `EXPTRANS` | `exp_Set_Parameters` | 2 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 7 |
| `EXPTRANS` | `lkp_Current_Pay_Period` | 1 |
| `SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | `exp_Initial` | 1 |
| `exp_Initial` | `srt_Distinct_File_Names` | 1 |
| `HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | `SQ_HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | 7 |
| `srt_Distinct_File_Names` | `agg_Count_Number_of_Files` | 1 |
| `agg_Count_Number_of_Files` | `EXPTRANS` | 2 |

</details>

### `m_0100_PM_FDA_Load_TATRAN_To_DB`

**Data Flow:**

```
[SOURCE] HI_PM_FDA_TATRAN_FLAT → [SOURCE] HI_PM_FDA_TATRAN_TBL → [Source Qualifier] SQ_HI_PM_FDA_TATRAN_FLAT
  ... → [Filter] fil_Filter_Out_01_99 → [Expression] exp_Add_FDA_SEQ → [Sorter] srt_Sort_By_BATCH_SEQ
```

| Direction | Object | Type |
|---|---|---|
| Source | `HI_PM_FDA_TATRAN_TBL` | Target Definition |
| Source | `HI_PM_FDA_TATRAN_FLAT` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Add_FDA_SEQ` | Expression |
| 2 | `SQ_HI_PM_FDA_TATRAN_FLAT` | Source Qualifier |
| 3 | `fil_Filter_Out_01_99` | Filter |
| 4 | `srt_Sort_By_BATCH_SEQ` | Sorter |

<details><summary>Connector details (34 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `srt_Sort_By_BATCH_SEQ` | `HI_PM_FDA_TATRAN_TBL` | 8 |
| `fil_Filter_Out_01_99` | `exp_Add_FDA_SEQ` | 6 |
| `exp_Add_FDA_SEQ` | `srt_Sort_By_BATCH_SEQ` | 8 |
| `HI_PM_FDA_TATRAN_FLAT` | `SQ_HI_PM_FDA_TATRAN_FLAT` | 6 |
| `SQ_HI_PM_FDA_TATRAN_FLAT` | `fil_Filter_Out_01_99` | 6 |

</details>

### `m_0025_PM_FDA_Set_Pay_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Set_Parameters → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Existing_Pay_Period
  ... → [Expression] exp_Stage_Parameters → [Expression] exp_Validate_Parameters → [Lookup Procedure] lkp_CPM_NEWPAY_TBL
  ... → [Expression] exp_Final → [TARGET] CPM_FDA_PAY_PERIOD_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `CPM_FDA_PAY_PERIOD_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `exp_Validate_Parameters` | Expression |
| 4 | `lkp_CPM_NEWPAY_TBL` | Lookup Procedure |
| 5 | `exp_Stage_Parameters` | Expression |
| 6 | `exp_Final` | Expression |
| 7 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 8 | `exp_Set_Parameters` | Expression |
| 9 | `lkp_Current_Pay_Period` | Lookup Procedure |

<details><summary>Connector details (42 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `CPM_FDA_PAY_PERIOD_FILE` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `exp_Initial` | `exp_Set_Parameters` | 6 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `exp_Set_Parameters` | `exp_Validate_Parameters` | 5 |
| `lkp_CPM_NEWPAY_TBL` | `exp_Validate_Parameters` | 1 |
| `exp_Validate_Parameters` | `exp_Final` | 5 |
| `exp_Stage_Parameters` | `lkp_CPM_NEWPAY_TBL` | 3 |
| `exp_Set_Parameters` | `exp_Stage_Parameters` | 5 |
| `lkp_Existing_Pay_Period` | `exp_Set_Parameters` | 1 |
| `lkp_Current_Pay_Period` | `exp_Set_Parameters` | 2 |

</details>

---

## LES

### `m_LESRPT_Load_LESL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_LEAVE_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_LEAVE_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] LESL
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_LEAVE_TBL` | Source Definition |
| Target | `LESL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_EMP_DETAIL_LEAVE_TBL` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `exp_Final` | Expression |
| 4 | `lkp_LESL_KEY` | Lookup Procedure |

<details><summary>Connector details (64 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LESL` | 18 |
| `LES_EMP_DETAIL_LEAVE_TBL` | `SQ_LES_EMP_DETAIL_LEAVE_TBL` | 15 |
| `SQ_LES_EMP_DETAIL_LEAVE_TBL` | `exp_Initial` | 15 |
| `exp_Initial` | `exp_Final` | 16 |

</details>

### `m_LESRPT_Load_LEST`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_T_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_T_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] LEST → [Sequence] SEQTRANS
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_T_TBL` | Source Definition |
| Target | `LEST` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SEQTRANS` | Sequence |
| 2 | `exp_Final` | Expression |
| 3 | `exp_Initial` | Expression |
| 4 | `SQ_LES_EMP_DETAIL_RECTYPE_T_TBL` | Source Qualifier |
| 5 | `lkp_LEST_KEY` | Lookup Procedure |

<details><summary>Connector details (37 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LEST` | 11 |
| `SEQTRANS` | `exp_Final` | 2 |
| `exp_Initial` | `exp_Final` | 8 |
| `SQ_LES_EMP_DETAIL_RECTYPE_T_TBL` | `exp_Initial` | 8 |
| `LES_EMP_DETAIL_RECTYPE_T_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_T_TBL` | 8 |

</details>

### `m_LESRPT_Load_LESM`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_M_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_M_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] LESM
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_M_TBL` | Source Definition |
| Target | `LESM` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_EMP_DETAIL_RECTYPE_M_TBL` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `exp_Final` | Expression |
| 4 | `lkp_LESM_KEY` | Lookup Procedure |

<details><summary>Connector details (29 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LESM` | 9 |
| `LES_EMP_DETAIL_RECTYPE_M_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_M_TBL` | 6 |
| `SQ_LES_EMP_DETAIL_RECTYPE_M_TBL` | `exp_Initial` | 6 |
| `exp_Initial` | `exp_Final` | 8 |

</details>

### `m_LESRPT_Load_LESD`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_D_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_D_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] LESD → [Sequence] SEQTRANS
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_D_TBL` | Source Definition |
| Target | `LESD` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_EMP_DETAIL_RECTYPE_D_TBL` | Source Qualifier |
| 2 | `exp_Final` | Expression |
| 3 | `exp_Initial` | Expression |
| 4 | `SEQTRANS` | Sequence |
| 5 | `lkp_MAX_LESD_KEY` | Lookup Procedure |

<details><summary>Connector details (56 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LESD` | 16 |
| `LES_EMP_DETAIL_RECTYPE_D_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_D_TBL` | 13 |
| `SQ_LES_EMP_DETAIL_RECTYPE_D_TBL` | `exp_Initial` | 13 |
| `exp_Initial` | `exp_Final` | 13 |
| `SEQTRANS` | `exp_Final` | 1 |

</details>

### `m_LESRPT_Load_LESS`

**Data Flow:**

```
[SOURCE] LES_PRIMARY_DATA_TBL → [Source Qualifier] SQ_LES_PRIMARY_DATA_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] LESS
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_PRIMARY_DATA_TBL` | Source Definition |
| Target | `LESS` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_PRIMARY_DATA_TBL` | Source Qualifier |
| 2 | `exp_Final` | Expression |
| 3 | `exp_Initial` | Expression |
| 4 | `lkp_MAX_LESS_KEY` | Lookup Procedure |

<details><summary>Connector details (324 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LESS` | 74 |
| `LES_PRIMARY_DATA_TBL` | `SQ_LES_PRIMARY_DATA_TBL` | 90 |
| `SQ_LES_PRIMARY_DATA_TBL` | `exp_Initial` | 89 |
| `exp_Initial` | `exp_Final` | 71 |

</details>

### `m_LESRPT_Load_LESU`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_U_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_U_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] LESU → [Sequence] SEQTRANS
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_U_TBL` | Source Definition |
| Target | `LESU` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_EMP_DETAIL_RECTYPE_U_TBL` | Source Qualifier |
| 2 | `exp_Final` | Expression |
| 3 | `exp_Initial` | Expression |
| 4 | `SEQTRANS` | Sequence |
| 5 | `lkp_LESU_KEY` | Lookup Procedure |

<details><summary>Connector details (48 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LESU` | 14 |
| `LES_EMP_DETAIL_RECTYPE_U_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_U_TBL` | 11 |
| `SQ_LES_EMP_DETAIL_RECTYPE_U_TBL` | `exp_Initial` | 11 |
| `exp_Initial` | `exp_Final` | 11 |
| `SEQTRANS` | `exp_Final` | 1 |

</details>

### `m_LESRPT_Load_LESC`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_C_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_C_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] LESC → [Sequence] SEQTRANS
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_C_TBL` | Source Definition |
| Target | `LESC` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | Source Qualifier |
| 2 | `exp_Final` | Expression |
| 3 | `exp_Initial` | Expression |
| 4 | `SEQTRANS` | Sequence |
| 5 | `lkp_LESC_KEY` | Lookup Procedure |

<details><summary>Connector details (60 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LESC` | 17 |
| `LES_EMP_DETAIL_RECTYPE_C_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | 14 |
| `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | `exp_Initial` | 14 |
| `exp_Initial` | `exp_Final` | 14 |
| `SEQTRANS` | `exp_Final` | 1 |

</details>

### `m_LESRPT_Load_LESR`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_R_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_R_TBL → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] LESR → [Sequence] SEQTRANS
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_R_TBL` | Source Definition |
| Target | `LESR` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SEQTRANS` | Sequence |
| 2 | `lkp_LESR_KEY` | Lookup Procedure |
| 3 | `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | Source Qualifier |
| 4 | `exp_Final` | Expression |
| 5 | `exp_Initial` | Expression |

<details><summary>Connector details (60 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LESR` | 17 |
| `SEQTRANS` | `exp_Final` | 1 |
| `LES_EMP_DETAIL_RECTYPE_R_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | 14 |
| `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | `exp_Initial` | 14 |
| `exp_Initial` | `exp_Final` | 14 |

</details>

### `m_LES_Verify_Header`

**Data Flow:**

```
[SOURCE] EMP_REC_TYPE_0 → [Normalizer] Norm_EMP_REC_TYPE_0 → [Filter] fil_LES_HEADER
  ... → [Expression] exp_Convert → [Expression] exp_Verify_Header_Date → [Lookup Procedure] lkp_Current_Pay_Period
  ... → [Lookup Procedure] lkp_Pay_Period_Record_Date → [Expression] exp_Stage → [Expression] exp_Final
  ... → [TARGET] LES_HEADER_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `EMP_REC_TYPE_0` | Source Definition |
| Target | `LES_HEADER_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| 2 | `fil_LES_HEADER` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `Norm_EMP_REC_TYPE_0` | Normalizer |
| 5 | `exp_Final` | Expression |
| 6 | `exp_Stage` | Expression |
| 7 | `exp_Verify_Header_Date` | Expression |
| 8 | `lkp_Current_Pay_Period` | Lookup Procedure |

<details><summary>Connector details (48 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_HEADER_FILE` | 3 |
| `exp_Convert` | `lkp_Pay_Period_Record_Date` | 1 |
| `lkp_Pay_Period_Record_Date` | `exp_Verify_Header_Date` | 2 |
| `Norm_EMP_REC_TYPE_0` | `fil_LES_HEADER` | 9 |
| `fil_LES_HEADER` | `exp_Convert` | 9 |
| `exp_Convert` | `exp_Verify_Header_Date` | 3 |
| `exp_Convert` | `lkp_Current_Pay_Period` | 1 |
| `EMP_REC_TYPE_0` | `Norm_EMP_REC_TYPE_0` | 10 |
| `exp_Stage` | `exp_Final` | 3 |
| `exp_Verify_Header_Date` | `exp_Stage` | 5 |
| `lkp_Current_Pay_Period` | `exp_Verify_Header_Date` | 2 |

</details>

### `m_LES_Verify_Record_Count`

**Data Flow:**

```
[SOURCE] EMP_REC_TYPE_E → [Normalizer] Norm_EMP_REC_TYPE_E → [Filter] fil_LES_Records
  ... → [Expression] exp_Convert → [Expression] exp_Verify_Header_Date → [Filter] fil_Trailer_Records
  ... → [Expression] exp_Stage → [Expression] exp_Final → [TARGET] LES_TOTALS_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `EMP_REC_TYPE_E` | Source Definition |
| Target | `LES_TOTALS_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_LES_Records` | Filter |
| 2 | `exp_Convert` | Expression |
| 3 | `exp_Final` | Expression |
| 4 | `exp_Stage` | Expression |
| 5 | `exp_Verify_Header_Date` | Expression |
| 6 | `Norm_EMP_REC_TYPE_E` | Normalizer |
| 7 | `fil_Trailer_Records` | Filter |

<details><summary>Connector details (34 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_TOTALS_FILE` | 2 |
| `Norm_EMP_REC_TYPE_E` | `fil_LES_Records` | 7 |
| `fil_LES_Records` | `exp_Convert` | 6 |
| `exp_Convert` | `exp_Verify_Header_Date` | 3 |
| `exp_Stage` | `exp_Final` | 2 |
| `fil_Trailer_Records` | `exp_Stage` | 3 |
| `exp_Verify_Header_Date` | `fil_Trailer_Records` | 4 |
| `EMP_REC_TYPE_E` | `Norm_EMP_REC_TYPE_E` | 7 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_LEAVE_TBL → [SOURCE] LES_EMP_DETAIL_RECTYPE_L_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_L_TBL
  ... → [Expression] exp_Initial → [Expression] exp_Final
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_LEAVE_TBL` | Target Definition |
| Source | `LES_EMP_DETAIL_RECTYPE_L_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_EMP_DETAIL_RECTYPE_L_TBL` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `exp_Final` | Expression |

<details><summary>Connector details (60 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_LEAVE_TBL` | 15 |
| `LES_EMP_DETAIL_RECTYPE_L_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_L_TBL` | 15 |
| `SQ_LES_EMP_DETAIL_RECTYPE_L_TBL` | `exp_Initial` | 15 |
| `exp_Initial` | `exp_Final` | 15 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_R_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_R_TBL → [Expression] exp_Initial
  ... → [Normalizer] nrm_EMP_RETRO_EARN → [Filter] fil_Remove_Blank_Retroactive_Earnings → [Expression] exp_Convert
  ... → [Expression] exp_Final → [TARGET] LES_EMP_DETAIL_RETRO_EARN_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_R_TBL` | Source Definition |
| Target | `LES_EMP_DETAIL_RETRO_EARN_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_Remove_Blank_Retroactive_Earnings` | Filter |
| 2 | `exp_Initial` | Expression |
| 3 | `nrm_EMP_RETRO_EARN` | Normalizer |
| 4 | `exp_Convert` | Expression |
| 5 | `exp_Final` | Expression |
| 6 | `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | Source Qualifier |

<details><summary>Connector details (71 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RETRO_EARN_TBL` | 8 |
| `nrm_EMP_RETRO_EARN` | `fil_Remove_Blank_Retroactive_Earnings` | 7 |
| `fil_Remove_Blank_Retroactive_Earnings` | `exp_Convert` | 7 |
| `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | `exp_Initial` | 14 |
| `exp_Initial` | `nrm_EMP_RETRO_EARN` | 13 |
| `exp_Convert` | `exp_Final` | 8 |
| `LES_EMP_DETAIL_RECTYPE_R_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_R_TBL` | 14 |

</details>

### `m_LES_NIH_FILE`

**Data Flow:**

```
[SOURCE] LES_EMPLOYEE_DETAIL → [SOURCE] LES_NIH_EMPLOYEE_SUMMARY_TBL → [Source Qualifier] SQ_LES_EMPLOYEE_DETAIL
  ... → [Filter] fil_Header_Trailer → [Expression] exp_Initial → [Expression] exp_Flag_NIH_Record
  ... → [Lookup Procedure] lkp_PSEUDOSSN_TBL → [Filter] fil_NIH_EMPLOYEE_DETAIL → [Filter] fil_NIH_Records
  ... → [Expression] exp_Set_Curr_Flag → [TARGET] LES_NIH_EMPLOYEE_DETAIL → [Expression] exp_Final
  ... → [Lookup Procedure] lkp_Current_Pay_Period
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_NIH_EMPLOYEE_SUMMARY_TBL` | Target Definition |
| Source | `LES_EMPLOYEE_DETAIL` | Source Definition |
| Target | `LES_NIH_EMPLOYEE_DETAIL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 2 | `fil_NIH_Records` | Filter |
| 3 | `lkp_PSEUDOSSN_TBL` | Lookup Procedure |
| 4 | `exp_Initial` | Expression |
| 5 | `fil_Header_Trailer` | Filter |
| 6 | `exp_Flag_NIH_Record` | Expression |
| 7 | `SQ_LES_EMPLOYEE_DETAIL` | Source Qualifier |
| 8 | `fil_NIH_EMPLOYEE_DETAIL` | Filter |
| 9 | `exp_Final` | Expression |
| 10 | `exp_Set_Curr_Flag` | Expression |

<details><summary>Connector details (50 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `fil_NIH_Records` | `LES_NIH_EMPLOYEE_DETAIL` | 5 |
| `exp_Final` | `LES_NIH_EMPLOYEE_SUMMARY_TBL` | 4 |
| `exp_Set_Curr_Flag` | `lkp_Current_Pay_Period` | 1 |
| `lkp_Current_Pay_Period` | `exp_Final` | 2 |
| `exp_Flag_NIH_Record` | `fil_NIH_Records` | 6 |
| `LES_EMPLOYEE_DETAIL` | `SQ_LES_EMPLOYEE_DETAIL` | 5 |
| `exp_Initial` | `lkp_PSEUDOSSN_TBL` | 1 |
| `lkp_PSEUDOSSN_TBL` | `exp_Flag_NIH_Record` | 3 |
| `fil_Header_Trailer` | `exp_Initial` | 5 |
| `exp_Initial` | `exp_Flag_NIH_Record` | 5 |
| `SQ_LES_EMPLOYEE_DETAIL` | `fil_Header_Trailer` | 5 |
| `exp_Flag_NIH_Record` | `fil_NIH_EMPLOYEE_DETAIL` | 4 |
| `fil_NIH_EMPLOYEE_DETAIL` | `exp_Set_Curr_Flag` | 2 |
| `exp_Set_Curr_Flag` | `exp_Final` | 2 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_C_TBL → [Source Qualifier] SQ_LES_EMP_DETAIL_RECTYPE_C_TBL → [Expression] exp_Initial
  ... → [Normalizer] nrm_EMP_CURR_EARN → [Filter] fil_Remove_Blank_Current_Earnings → [Expression] exp_Convert
  ... → [Expression] exp_Final → [TARGET] LES_EMP_DETAIL_CURR_EARN_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_C_TBL` | Source Definition |
| Target | `LES_EMP_DETAIL_CURR_EARN_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | Source Qualifier |
| 3 | `exp_Initial` | Expression |
| 4 | `nrm_EMP_CURR_EARN` | Normalizer |
| 5 | `fil_Remove_Blank_Current_Earnings` | Filter |
| 6 | `exp_Convert` | Expression |

<details><summary>Connector details (71 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_CURR_EARN_TBL` | 8 |
| `exp_Convert` | `exp_Final` | 8 |
| `LES_EMP_DETAIL_RECTYPE_C_TBL` | `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | 14 |
| `SQ_LES_EMP_DETAIL_RECTYPE_C_TBL` | `exp_Initial` | 14 |
| `exp_Initial` | `nrm_EMP_CURR_EARN` | 13 |
| `nrm_EMP_CURR_EARN` | `fil_Remove_Blank_Current_Earnings` | 7 |
| `fil_Remove_Blank_Current_Earnings` | `exp_Convert` | 7 |

</details>

### `m_LES_Build_Message_Counters`

**Data Flow:**

```
[SOURCE] EMP_REC_TYPE_E → [SOURCE] ERROR_TBL → [SOURCE] LES_PRIMARY_DATA_TBL
  ... → [SOURCE] LES_NIH_EMPLOYEE_SUMMARY_TBL → [Normalizer] Norm_EMP_REC_TYPE_E → [Source Qualifier] SQ_ERROR_TBL
  ... → [Source Qualifier] SQ_LES_PRIMARY_DATA_TBL → [Source Qualifier] SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL → [Filter] fil_EMPLOYEE_DETAIL
  ... → [Expression] exp_Init_Errors → [Expression] exp_Init_Loaded_Records → [Expression] exp_Init_NIH
  ... → [Expression] exp_Init_Inputs → [Aggregator] agg_Count_Error_Records → [Aggregator] agg_Count_Loaded_Records
  ... → [Aggregator] agg_Count_NIH_Records → [Aggregator] agg_Count_Input_Records → [Expression] exp_Error_Count
  ... → [Expression] exp_Loaded_Counters → [Expression] exp_NIH_Counters → [Expression] exp_Input_Counters
  ... → [Joiner] jnr_Input_Loaded_NIH_Errors → [Joiner] jnr_Inputs_Loaded → [Joiner] jnr_Inputs_Loaded_NIH
  ... → [Expression] exp_Counters → [Expression] exp_Build_Message → [Expression] exp_Pay_Period
  ... → [Lookup Procedure] lkp_Current_Pay_Period → [Expression] exp_Final_Message → [Normalizer] nrm_Counters
  ... → [TARGET] LES_MESSAGE_FILE → [Expression] exp_Stage_Counters → [Expression] exp_Final_Counters
  ... → [TARGET] COUNTER_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_NIH_EMPLOYEE_SUMMARY_TBL` | Source Definition |
| Source | `ERROR_TBL` | Source Definition |
| Source | `EMP_REC_TYPE_E` | Source Definition |
| Source | `LES_PRIMARY_DATA_TBL` | Source Definition |
| Target | `LES_MESSAGE_FILE` | Target Definition |
| Target | `COUNTER_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `jnr_Input_Loaded_NIH_Errors` | Joiner |
| 2 | `exp_Counters` | Expression |
| 3 | `exp_Final_Counters` | Expression |
| 4 | `exp_Stage_Counters` | Expression |
| 5 | `exp_Pay_Period` | Expression |
| 6 | `SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL` | Source Qualifier |
| 7 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 8 | `nrm_Counters` | Normalizer |
| 9 | `SQ_ERROR_TBL` | Source Qualifier |
| 10 | `Norm_EMP_REC_TYPE_E` | Normalizer |
| 11 | `fil_EMPLOYEE_DETAIL` | Filter |
| 12 | `exp_Build_Message` | Expression |
| 13 | `exp_Final_Message` | Expression |
| 14 | `exp_Init_Inputs` | Expression |
| 15 | `agg_Count_Input_Records` | Aggregator |
| 16 | `SQ_LES_PRIMARY_DATA_TBL` | Source Qualifier |
| 17 | `exp_Init_Loaded_Records` | Expression |
| 18 | `agg_Count_Loaded_Records` | Aggregator |
| 19 | `exp_Init_Errors` | Expression |
| 20 | `agg_Count_Error_Records` | Aggregator |
| 21 | `exp_Input_Counters` | Expression |
| 22 | `exp_Loaded_Counters` | Expression |
| 23 | `exp_Init_NIH` | Expression |
| 24 | `agg_Count_NIH_Records` | Aggregator |
| 25 | `exp_NIH_Counters` | Expression |
| 26 | `exp_Error_Count` | Expression |
| 27 | `jnr_Inputs_Loaded` | Joiner |
| 28 | `jnr_Inputs_Loaded_NIH` | Joiner |

<details><summary>Connector details (201 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final_Message` | `LES_MESSAGE_FILE` | 2 |
| `exp_Final_Counters` | `COUNTER_TBL` | 6 |
| `jnr_Inputs_Loaded_NIH` | `jnr_Input_Loaded_NIH_Errors` | 4 |
| `exp_Error_Count` | `jnr_Input_Loaded_NIH_Errors` | 2 |
| `jnr_Input_Loaded_NIH_Errors` | `exp_Counters` | 4 |
| `exp_Counters` | `exp_Pay_Period` | 8 |
| `exp_Counters` | `lkp_Current_Pay_Period` | 1 |
| `exp_Counters` | `exp_Build_Message` | 8 |
| `exp_Stage_Counters` | `exp_Final_Counters` | 6 |
| `nrm_Counters` | `exp_Stage_Counters` | 4 |
| `lkp_Current_Pay_Period` | `exp_Pay_Period` | 2 |
| `exp_Pay_Period` | `nrm_Counters` | 10 |
| `LES_NIH_EMPLOYEE_SUMMARY_TBL` | `SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL` | 4 |
| `SQ_LES_NIH_EMPLOYEE_SUMMARY_TBL` | `exp_Init_NIH` | 2 |
| `lkp_Current_Pay_Period` | `exp_Build_Message` | 2 |
| `ERROR_TBL` | `SQ_ERROR_TBL` | 7 |
| `SQ_ERROR_TBL` | `exp_Init_Errors` | 2 |
| `EMP_REC_TYPE_E` | `Norm_EMP_REC_TYPE_E` | 7 |
| `Norm_EMP_REC_TYPE_E` | `fil_EMPLOYEE_DETAIL` | 6 |
| `fil_EMPLOYEE_DETAIL` | `exp_Init_Inputs` | 2 |
| `exp_Build_Message` | `exp_Final_Message` | 2 |
| `exp_Init_Inputs` | `agg_Count_Input_Records` | 1 |
| `agg_Count_Input_Records` | `exp_Input_Counters` | 1 |
| `LES_PRIMARY_DATA_TBL` | `SQ_LES_PRIMARY_DATA_TBL` | 90 |
| `SQ_LES_PRIMARY_DATA_TBL` | `exp_Init_Loaded_Records` | 3 |
| `exp_Init_Loaded_Records` | `agg_Count_Loaded_Records` | 1 |
| `agg_Count_Loaded_Records` | `exp_Loaded_Counters` | 1 |
| `exp_Init_Errors` | `agg_Count_Error_Records` | 1 |
| `agg_Count_Error_Records` | `exp_Error_Count` | 1 |
| `exp_Input_Counters` | `jnr_Inputs_Loaded` | 2 |
| `exp_Loaded_Counters` | `jnr_Inputs_Loaded` | 2 |
| `exp_Init_NIH` | `agg_Count_NIH_Records` | 1 |
| `agg_Count_NIH_Records` | `exp_NIH_Counters` | 1 |
| `exp_NIH_Counters` | `jnr_Inputs_Loaded_NIH` | 2 |
| `jnr_Inputs_Loaded` | `jnr_Inputs_Loaded_NIH` | 3 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_D_TBL → [SOURCE] EMP_REC_TYPE_D → [SOURCE] LES_EMP_DETAIL_TBL
  ... → [Normalizer] Norm_EMP_REC_TYPE_D → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Filter] fil_EMP_REC_TYPE_D_EMP_DETAIL
  ... → [Joiner] jnr_LES_NUMBER → [Expression] exp_Convert → [Expression] exp_Final
  ... → [Filter] fil_EMP_REC_TYPE_D
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_D_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_D` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `Norm_EMP_REC_TYPE_D` | Normalizer |
| 2 | `fil_EMP_REC_TYPE_D_EMP_DETAIL` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `fil_EMP_REC_TYPE_D` | Filter |
| 5 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 6 | `jnr_LES_NUMBER` | Joiner |
| 7 | `exp_Final` | Expression |

<details><summary>Connector details (85 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_D_TBL` | 13 |
| `EMP_REC_TYPE_D` | `Norm_EMP_REC_TYPE_D` | 10 |
| `Norm_EMP_REC_TYPE_D` | `fil_EMP_REC_TYPE_D_EMP_DETAIL` | 9 |
| `fil_EMP_REC_TYPE_D_EMP_DETAIL` | `exp_Convert` | 9 |
| `exp_Convert` | `fil_EMP_REC_TYPE_D` | 11 |
| `fil_EMP_REC_TYPE_D` | `jnr_LES_NUMBER` | 11 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 13 |

</details>

### `m_LES_Current_Pay_Period`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Build_Pay_Period
  ... → [Expression] exp_Final → [TARGET] LES_PAY_PERIOD_DATE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `LES_PAY_PERIOD_DATE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD` | Source Qualifier |
| 2 | `exp_Build_Pay_Period` | Expression |
| 3 | `exp_Final` | Expression |

<details><summary>Connector details (15 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_PAY_PERIOD_DATE_FILE` | 1 |
| `PAY_PERIOD` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Build_Pay_Period` | 2 |
| `exp_Build_Pay_Period` | `exp_Final` | 4 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL`

**Data Flow:**

```
[SOURCE] EMP_REC_TYPE_2 → [SOURCE] LES_EMP_DETAIL_TBL → [SOURCE] LES_EMP_DETAIL_RECTYPE_2_TBL
  ... → [Normalizer] Norm_EMP_REC_TYPE_2 → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Filter] fil_EMP_REC_TYPE_2_EMP_DETAIL
  ... → [Joiner] jnr_LES_NUMBER → [Expression] exp_Convert → [Expression] exp_Final
  ... → [Filter] fil_EMP_REC_TYPE_2
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_2_TBL` | Target Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |
| Source | `EMP_REC_TYPE_2` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_EMP_REC_TYPE_2_EMP_DETAIL` | Filter |
| 2 | `exp_Convert` | Expression |
| 3 | `fil_EMP_REC_TYPE_2` | Filter |
| 4 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 5 | `jnr_LES_NUMBER` | Joiner |
| 6 | `exp_Final` | Expression |
| 7 | `Norm_EMP_REC_TYPE_2` | Normalizer |

<details><summary>Connector details (118 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_2_TBL` | 17 |
| `Norm_EMP_REC_TYPE_2` | `fil_EMP_REC_TYPE_2_EMP_DETAIL` | 15 |
| `fil_EMP_REC_TYPE_2_EMP_DETAIL` | `exp_Convert` | 15 |
| `exp_Convert` | `fil_EMP_REC_TYPE_2` | 15 |
| `fil_EMP_REC_TYPE_2` | `jnr_LES_NUMBER` | 15 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 17 |
| `EMP_REC_TYPE_2` | `Norm_EMP_REC_TYPE_2` | 15 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_TBL → [SOURCE] LES_EMP_DETAIL_RECTYPE_T_TBL → [SOURCE] EMP_REC_TYPE_T
  ... → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Normalizer] Norm_EMP_REC_TYPE_T → [Joiner] jnr_LES_NUMBER
  ... → [Filter] fil_EMP_REC_TYPE_T_EMP_DETAIL → [Expression] exp_Final → [Expression] exp_Convert
  ... → [Filter] fil_EMP_REC_TYPE_T
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_T_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_T` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_EMP_REC_TYPE_T_EMP_DETAIL` | Filter |
| 2 | `exp_Convert` | Expression |
| 3 | `fil_EMP_REC_TYPE_T` | Filter |
| 4 | `jnr_LES_NUMBER` | Joiner |
| 5 | `exp_Final` | Expression |
| 6 | `Norm_EMP_REC_TYPE_T` | Normalizer |
| 7 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |

<details><summary>Connector details (49 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_T_TBL` | 8 |
| `Norm_EMP_REC_TYPE_T` | `fil_EMP_REC_TYPE_T_EMP_DETAIL` | 4 |
| `fil_EMP_REC_TYPE_T_EMP_DETAIL` | `exp_Convert` | 4 |
| `exp_Convert` | `fil_EMP_REC_TYPE_T` | 6 |
| `fil_EMP_REC_TYPE_T` | `jnr_LES_NUMBER` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 8 |
| `EMP_REC_TYPE_T` | `Norm_EMP_REC_TYPE_T` | 5 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |

</details>

### `m_LES_Load_LES_PRIMARY_DATA_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_1_TBL → [SOURCE] LES_EMP_DETAIL_TBL → [SOURCE] LES_EMP_DETAIL_RECTYPE_2_TBL
  ... → [SOURCE] LES_EMP_DETAIL_RECTYPE_5_TBL → [SOURCE] LES_EMP_DETAIL_RECTYPE_6_TBL → [SOURCE] LES_HEADER_TBL
  ... → [SOURCE] LES_PRIMARY_DATA_TBL → [SOURCE] LES_EMP_DETAIL_RECTYPE_3_TBL → [SOURCE] LES_EMP_DETAIL_RECTYPE_4_TBL
  ... → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Expression] exp_Initial → [Expression] exp_Stage
  ... → [Lookup Procedure] lkp_PSEUDOSSN → [Expression] exp_Final
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_PRIMARY_DATA_TBL` | Target Definition |
| Source | `LES_EMP_DETAIL_RECTYPE_4_TBL` | Source Definition |
| Source | `LES_EMP_DETAIL_RECTYPE_5_TBL` | Source Definition |
| Source | `LES_EMP_DETAIL_RECTYPE_6_TBL` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |
| Source | `LES_HEADER_TBL` | Source Definition |
| Source | `LES_EMP_DETAIL_RECTYPE_1_TBL` | Source Definition |
| Source | `LES_EMP_DETAIL_RECTYPE_2_TBL` | Source Definition |
| Source | `LES_EMP_DETAIL_RECTYPE_3_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Stage` | Expression |
| 2 | `lkp_PSEUDOSSN` | Lookup Procedure |
| 3 | `exp_Final` | Expression |
| 4 | `lkp_Pay_Period` | Lookup Procedure |
| 5 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 6 | `exp_Initial` | Expression |

<details><summary>Connector details (456 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_PRIMARY_DATA_TBL` | 89 |
| `LES_EMP_DETAIL_RECTYPE_4_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 15 |
| `LES_EMP_DETAIL_RECTYPE_5_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 16 |
| `LES_EMP_DETAIL_RECTYPE_6_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 6 |
| `exp_Stage` | `exp_Final` | 89 |
| `exp_Initial` | `exp_Stage` | 86 |
| `lkp_PSEUDOSSN` | `exp_Stage` | 3 |
| `exp_Initial` | `lkp_PSEUDOSSN` | 1 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `LES_HEADER_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 6 |
| `LES_EMP_DETAIL_RECTYPE_1_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 19 |
| `LES_EMP_DETAIL_RECTYPE_2_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 15 |
| `LES_EMP_DETAIL_RECTYPE_3_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 19 |
| `SQ_LES_EMP_DETAIL_TBL` | `exp_Initial` | 87 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL`

**Data Flow:**

```
[SOURCE] EMP_REC_TYPE_3 → [SOURCE] LES_EMP_DETAIL_RECTYPE_3_TBL → [SOURCE] LES_EMP_DETAIL_TBL
  ... → [Normalizer] Norm_EMP_REC_TYPE_3 → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Filter] fil_EMP_REC_TYPE_3_EMP_DETAIL
  ... → [Joiner] jnr_LES_NUMBER → [Expression] exp_Convert → [Expression] exp_Final
  ... → [Filter] fil_EMP_REC_TYPE_3
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_3_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_3` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `Norm_EMP_REC_TYPE_3` | Normalizer |
| 2 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 3 | `fil_EMP_REC_TYPE_3_EMP_DETAIL` | Filter |
| 4 | `exp_Convert` | Expression |
| 5 | `fil_EMP_REC_TYPE_3` | Filter |
| 6 | `jnr_LES_NUMBER` | Joiner |
| 7 | `exp_Final` | Expression |

<details><summary>Connector details (144 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_3_TBL` | 21 |
| `EMP_REC_TYPE_3` | `Norm_EMP_REC_TYPE_3` | 19 |
| `Norm_EMP_REC_TYPE_3` | `fil_EMP_REC_TYPE_3_EMP_DETAIL` | 18 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `fil_EMP_REC_TYPE_3_EMP_DETAIL` | `exp_Convert` | 18 |
| `exp_Convert` | `fil_EMP_REC_TYPE_3` | 19 |
| `fil_EMP_REC_TYPE_3` | `jnr_LES_NUMBER` | 19 |
| `jnr_LES_NUMBER` | `exp_Final` | 21 |

</details>

### `m_LES_Load_LES_HEADER_TBL`

**Data Flow:**

```
[SOURCE] LES_HEADER_TBL → [SOURCE] EMP_REC_TYPE_0 → [Normalizer] Norm_EMP_REC_TYPE_0
  ... → [Filter] fil_LES_HEADER → [Expression] exp_Convert → [Filter] fil_First_Header_Record
  ... → [Expression] exp_Stage → [Lookup Procedure] lkp_Pay_Period_Record_Date → [Expression] exp_Final
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_HEADER_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_0` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_Pay_Period_Record_Date` | Lookup Procedure |
| 2 | `fil_LES_HEADER` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `Norm_EMP_REC_TYPE_0` | Normalizer |
| 5 | `exp_Final` | Expression |
| 6 | `exp_Stage` | Expression |
| 7 | `fil_First_Header_Record` | Filter |

<details><summary>Connector details (59 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_HEADER_TBL` | 7 |
| `fil_First_Header_Record` | `lkp_Pay_Period_Record_Date` | 1 |
| `lkp_Pay_Period_Record_Date` | `exp_Stage` | 2 |
| `Norm_EMP_REC_TYPE_0` | `fil_LES_HEADER` | 9 |
| `fil_LES_HEADER` | `exp_Convert` | 8 |
| `exp_Convert` | `fil_First_Header_Record` | 7 |
| `EMP_REC_TYPE_0` | `Norm_EMP_REC_TYPE_0` | 10 |
| `exp_Stage` | `exp_Final` | 9 |
| `fil_First_Header_Record` | `exp_Stage` | 6 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_5_TBL → [SOURCE] LES_EMP_DETAIL_TBL → [SOURCE] EMP_REC_TYPE_5
  ... → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Normalizer] Norm_EMP_REC_TYPE_5 → [Joiner] jnr_LES_NUMBER
  ... → [Filter] fil_EMP_REC_TYPE_5_EMP_DETAIL → [Expression] exp_Final → [Expression] exp_Convert
  ... → [Filter] fil_EMP_REC_TYPE_5
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_5_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_5` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `Norm_EMP_REC_TYPE_5` | Normalizer |
| 2 | `fil_EMP_REC_TYPE_5_EMP_DETAIL` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `fil_EMP_REC_TYPE_5` | Filter |
| 5 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 6 | `jnr_LES_NUMBER` | Joiner |
| 7 | `exp_Final` | Expression |

<details><summary>Connector details (126 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_5_TBL` | 18 |
| `EMP_REC_TYPE_5` | `Norm_EMP_REC_TYPE_5` | 17 |
| `Norm_EMP_REC_TYPE_5` | `fil_EMP_REC_TYPE_5_EMP_DETAIL` | 16 |
| `fil_EMP_REC_TYPE_5_EMP_DETAIL` | `exp_Convert` | 16 |
| `exp_Convert` | `fil_EMP_REC_TYPE_5` | 16 |
| `fil_EMP_REC_TYPE_5` | `jnr_LES_NUMBER` | 16 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 18 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_1_TBL → [SOURCE] LES_EMP_DETAIL_TBL → [SOURCE] EMP_REC_TYPE_1
  ... → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Normalizer] Norm_EMP_REC_TYPE_1 → [Joiner] jnr_LES_NUMBER
  ... → [Filter] fil_EMP_REC_TYPE_1_EMP_DETAIL → [Expression] exp_Final → [Expression] exp_Convert
  ... → [Filter] fil_EMP_REC_TYPE_1
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_1_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_1` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_EMP_REC_TYPE_1_EMP_DETAIL` | Filter |
| 2 | `exp_Convert` | Expression |
| 3 | `Norm_EMP_REC_TYPE_1` | Normalizer |
| 4 | `fil_EMP_REC_TYPE_1` | Filter |
| 5 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 6 | `jnr_LES_NUMBER` | Joiner |
| 7 | `exp_Final` | Expression |

<details><summary>Connector details (145 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_1_TBL` | 21 |
| `Norm_EMP_REC_TYPE_1` | `fil_EMP_REC_TYPE_1_EMP_DETAIL` | 19 |
| `fil_EMP_REC_TYPE_1_EMP_DETAIL` | `exp_Convert` | 18 |
| `exp_Convert` | `fil_EMP_REC_TYPE_1` | 19 |
| `EMP_REC_TYPE_1` | `Norm_EMP_REC_TYPE_1` | 19 |
| `fil_EMP_REC_TYPE_1` | `jnr_LES_NUMBER` | 19 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 21 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_4_TBL → [SOURCE] EMP_REC_TYPE_4 → [SOURCE] LES_EMP_DETAIL_TBL
  ... → [Normalizer] Norm_EMP_REC_TYPE_4 → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Filter] fil_EMP_REC_TYPE_4_EMP_DETAIL
  ... → [Joiner] jnr_LES_NUMBER → [Expression] exp_Convert → [Expression] exp_Final
  ... → [Filter] fil_EMP_REC_TYPE_4
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_4_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_4` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `Norm_EMP_REC_TYPE_4` | Normalizer |
| 2 | `fil_EMP_REC_TYPE_4_EMP_DETAIL` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `fil_EMP_REC_TYPE_4` | Filter |
| 5 | `jnr_LES_NUMBER` | Joiner |
| 6 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 7 | `exp_Final` | Expression |

<details><summary>Connector details (119 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_4_TBL` | 17 |
| `EMP_REC_TYPE_4` | `Norm_EMP_REC_TYPE_4` | 16 |
| `Norm_EMP_REC_TYPE_4` | `fil_EMP_REC_TYPE_4_EMP_DETAIL` | 15 |
| `fil_EMP_REC_TYPE_4_EMP_DETAIL` | `exp_Convert` | 15 |
| `exp_Convert` | `fil_EMP_REC_TYPE_4` | 15 |
| `fil_EMP_REC_TYPE_4` | `jnr_LES_NUMBER` | 15 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 17 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_TBL`

**Data Flow:**

```
[SOURCE] LES_HEADER_TBL → [SOURCE] EMP_REC_TYPE_E → [SOURCE] LES_EMP_DETAIL_TBL
  ... → [SOURCE] ERROR_TBL → [Source Qualifier] SQ_LES_HEADER_TBL → [Normalizer] Norm_EMP_REC_TYPE_E
  ... → [Expression] exp_HEADER → [Filter] fil_EMPLOYEE_DETAIL → [Joiner] jnr_HEADER_EMP_DETAILS
  ... → [Expression] exp_Convert → [Expression] exp_STAGE → [Expression] exp_CHECK_ERRORS
  ... → [Lookup Procedure] lkp_PSEUDSSN_TBL → [Router] rtr_GOOD_BAD_RECORDS → [Expression] exp_FINAL
  ... → [Expression] exp_FINAL_ERRORS
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_TBL` | Target Definition |
| Source | `ERROR_TBL` | Target Definition |
| Source | `LES_HEADER_TBL` | Source Definition |
| Source | `EMP_REC_TYPE_E` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_HEADER_TBL` | Source Qualifier |
| 2 | `jnr_HEADER_EMP_DETAILS` | Joiner |
| 3 | `exp_HEADER` | Expression |
| 4 | `fil_EMPLOYEE_DETAIL` | Filter |
| 5 | `exp_FINAL` | Expression |
| 6 | `exp_Convert` | Expression |
| 7 | `Norm_EMP_REC_TYPE_E` | Normalizer |
| 8 | `lkp_PSEUDSSN_TBL` | Lookup Procedure |
| 9 | `exp_STAGE` | Expression |
| 10 | `exp_CHECK_ERRORS` | Expression |
| 11 | `rtr_GOOD_BAD_RECORDS` | Router |
| 12 | `exp_FINAL_ERRORS` | Expression |

<details><summary>Connector details (78 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_FINAL` | `LES_EMP_DETAIL_TBL` | 5 |
| `exp_FINAL_ERRORS` | `ERROR_TBL` | 6 |
| `LES_HEADER_TBL` | `SQ_LES_HEADER_TBL` | 7 |
| `SQ_LES_HEADER_TBL` | `exp_HEADER` | 3 |
| `exp_HEADER` | `jnr_HEADER_EMP_DETAILS` | 3 |
| `exp_Convert` | `jnr_HEADER_EMP_DETAILS` | 4 |
| `jnr_HEADER_EMP_DETAILS` | `exp_STAGE` | 5 |
| `Norm_EMP_REC_TYPE_E` | `fil_EMPLOYEE_DETAIL` | 6 |
| `fil_EMPLOYEE_DETAIL` | `exp_Convert` | 6 |
| `rtr_GOOD_BAD_RECORDS` | `exp_FINAL` | 5 |
| `EMP_REC_TYPE_E` | `Norm_EMP_REC_TYPE_E` | 7 |
| `exp_STAGE` | `lkp_PSEUDSSN_TBL` | 1 |
| `lkp_PSEUDSSN_TBL` | `exp_CHECK_ERRORS` | 1 |
| `exp_STAGE` | `exp_CHECK_ERRORS` | 5 |
| `exp_CHECK_ERRORS` | `rtr_GOOD_BAD_RECORDS` | 9 |
| `rtr_GOOD_BAD_RECORDS` | `exp_FINAL_ERRORS` | 5 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL`

**Data Flow:**

```
[SOURCE] EMP_REC_TYPE_R → [SOURCE] LES_EMP_DETAIL_RECTYPE_R_TBL → [SOURCE] LES_EMP_DETAIL_TBL
  ... → [Normalizer] Norm_EMP_REC_TYPE_R → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Filter] fil_EMP_REC_TYPE_R_EMP_DETAIL
  ... → [Joiner] jnr_LES_NUMBER → [Expression] exp_Convert → [Expression] exp_Final
  ... → [Filter] fil_EMP_REC_TYPE_R
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_R_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_R` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `Norm_EMP_REC_TYPE_R` | Normalizer |
| 2 | `fil_EMP_REC_TYPE_R_EMP_DETAIL` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `fil_EMP_REC_TYPE_R` | Filter |
| 5 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 6 | `jnr_LES_NUMBER` | Joiner |
| 7 | `exp_Final` | Expression |

<details><summary>Connector details (95 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_R_TBL` | 14 |
| `EMP_REC_TYPE_R` | `Norm_EMP_REC_TYPE_R` | 12 |
| `Norm_EMP_REC_TYPE_R` | `fil_EMP_REC_TYPE_R_EMP_DETAIL` | 11 |
| `fil_EMP_REC_TYPE_R_EMP_DETAIL` | `exp_Convert` | 11 |
| `exp_Convert` | `fil_EMP_REC_TYPE_R` | 12 |
| `fil_EMP_REC_TYPE_R` | `jnr_LES_NUMBER` | 12 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 14 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_U_TBL → [SOURCE] LES_EMP_DETAIL_TBL → [SOURCE] EMP_REC_TYPE_U
  ... → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Normalizer] Norm_EMP_REC_TYPE_U → [Joiner] jnr_LES_NUMBER
  ... → [Filter] fil_EMP_REC_TYPE_U_EMP_DETAIL → [Expression] exp_Final → [Expression] exp_Convert
  ... → [Filter] fil_EMP_REC_TYPE_U
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_U_TBL` | Target Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |
| Source | `EMP_REC_TYPE_U` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 2 | `fil_EMP_REC_TYPE_U_EMP_DETAIL` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `fil_EMP_REC_TYPE_U` | Filter |
| 5 | `jnr_LES_NUMBER` | Joiner |
| 6 | `exp_Final` | Expression |
| 7 | `Norm_EMP_REC_TYPE_U` | Normalizer |

<details><summary>Connector details (73 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_U_TBL` | 11 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `Norm_EMP_REC_TYPE_U` | `fil_EMP_REC_TYPE_U_EMP_DETAIL` | 8 |
| `fil_EMP_REC_TYPE_U_EMP_DETAIL` | `exp_Convert` | 8 |
| `exp_Convert` | `fil_EMP_REC_TYPE_U` | 9 |
| `fil_EMP_REC_TYPE_U` | `jnr_LES_NUMBER` | 8 |
| `jnr_LES_NUMBER` | `exp_Final` | 11 |
| `EMP_REC_TYPE_U` | `Norm_EMP_REC_TYPE_U` | 9 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL`

**Data Flow:**

```
[SOURCE] EMP_REC_TYPE_L → [SOURCE] LES_EMP_DETAIL_RECTYPE_L_TBL → [SOURCE] LES_EMP_DETAIL_TBL
  ... → [Normalizer] Norm_EMP_REC_TYPE_L → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Filter] fil_EMP_REC_TYPE_L_EMP_DETAIL
  ... → [Joiner] jnr_LES_NUMBER → [Expression] exp_Convert → [Expression] exp_Final
  ... → [Filter] fil_EMP_REC_TYPE_L
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_L_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_L` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `Norm_EMP_REC_TYPE_L` | Normalizer |
| 2 | `fil_EMP_REC_TYPE_L_EMP_DETAIL` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `fil_EMP_REC_TYPE_L` | Filter |
| 5 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 6 | `jnr_LES_NUMBER` | Joiner |
| 7 | `exp_Final` | Expression |

<details><summary>Connector details (100 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_L_TBL` | 15 |
| `EMP_REC_TYPE_L` | `Norm_EMP_REC_TYPE_L` | 12 |
| `Norm_EMP_REC_TYPE_L` | `fil_EMP_REC_TYPE_L_EMP_DETAIL` | 11 |
| `fil_EMP_REC_TYPE_L_EMP_DETAIL` | `exp_Convert` | 11 |
| `exp_Convert` | `fil_EMP_REC_TYPE_L` | 14 |
| `fil_EMP_REC_TYPE_L` | `jnr_LES_NUMBER` | 13 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 15 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_TBL → [SOURCE] EMP_REC_TYPE_6 → [SOURCE] LES_EMP_DETAIL_RECTYPE_6_TBL
  ... → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Normalizer] Norm_EMP_REC_TYPE_6 → [Joiner] jnr_LES_NUMBER
  ... → [Filter] fil_EMP_REC_TYPE_6_EMP_DETAIL → [Expression] exp_Final → [Expression] exp_Convert
  ... → [Filter] fil_EMP_REC_TYPE_6
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_6_TBL` | Target Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |
| Source | `EMP_REC_TYPE_6` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_EMP_REC_TYPE_6` | Filter |
| 2 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 3 | `jnr_LES_NUMBER` | Joiner |
| 4 | `exp_Final` | Expression |
| 5 | `Norm_EMP_REC_TYPE_6` | Normalizer |
| 6 | `fil_EMP_REC_TYPE_6_EMP_DETAIL` | Filter |
| 7 | `exp_Convert` | Expression |

<details><summary>Connector details (53 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_6_TBL` | 8 |
| `exp_Convert` | `fil_EMP_REC_TYPE_6` | 6 |
| `fil_EMP_REC_TYPE_6` | `jnr_LES_NUMBER` | 6 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 8 |
| `EMP_REC_TYPE_6` | `Norm_EMP_REC_TYPE_6` | 6 |
| `Norm_EMP_REC_TYPE_6` | `fil_EMP_REC_TYPE_6_EMP_DETAIL` | 5 |
| `fil_EMP_REC_TYPE_6_EMP_DETAIL` | `exp_Convert` | 5 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL`

**Data Flow:**

```
[SOURCE] EMP_REC_TYPE_M → [SOURCE] LES_EMP_DETAIL_RECTYPE_M_TBL → [SOURCE] LES_EMP_DETAIL_TBL
  ... → [Normalizer] Norm_EMP_REC_TYPE_M → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Filter] fil_EMP_REC_TYPE_M_EMP_DETAIL
  ... → [Joiner] jnr_LES_NUMBER → [Expression] exp_Convert → [Expression] exp_Final
  ... → [Filter] fil_EMP_REC_TYPE_M
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_M_TBL` | Target Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |
| Source | `EMP_REC_TYPE_M` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `Norm_EMP_REC_TYPE_M` | Normalizer |
| 2 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 3 | `fil_EMP_REC_TYPE_M_EMP_DETAIL` | Filter |
| 4 | `exp_Convert` | Expression |
| 5 | `exp_Final` | Expression |
| 6 | `fil_EMP_REC_TYPE_M` | Filter |
| 7 | `jnr_LES_NUMBER` | Joiner |

<details><summary>Connector details (35 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_M_TBL` | 6 |
| `EMP_REC_TYPE_M` | `Norm_EMP_REC_TYPE_M` | 3 |
| `Norm_EMP_REC_TYPE_M` | `fil_EMP_REC_TYPE_M_EMP_DETAIL` | 2 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `fil_EMP_REC_TYPE_M_EMP_DETAIL` | `exp_Convert` | 2 |
| `exp_Convert` | `fil_EMP_REC_TYPE_M` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 6 |
| `fil_EMP_REC_TYPE_M` | `jnr_LES_NUMBER` | 3 |

</details>

### `m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL`

**Data Flow:**

```
[SOURCE] LES_EMP_DETAIL_RECTYPE_C_TBL → [SOURCE] LES_EMP_DETAIL_TBL → [SOURCE] EMP_REC_TYPE_C
  ... → [Source Qualifier] SQ_LES_EMP_DETAIL_TBL → [Normalizer] Norm_EMP_REC_TYPE_C → [Joiner] jnr_LES_NUMBER
  ... → [Filter] fil_EMP_REC_TYPE_C_EMP_DETAIL → [Expression] exp_Final → [Expression] exp_Convert
  ... → [Filter] fil_EMP_REC_TYPE_C
```

| Direction | Object | Type |
|---|---|---|
| Source | `LES_EMP_DETAIL_RECTYPE_C_TBL` | Target Definition |
| Source | `EMP_REC_TYPE_C` | Source Definition |
| Source | `LES_EMP_DETAIL_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `Norm_EMP_REC_TYPE_C` | Normalizer |
| 2 | `fil_EMP_REC_TYPE_C_EMP_DETAIL` | Filter |
| 3 | `exp_Convert` | Expression |
| 4 | `fil_EMP_REC_TYPE_C` | Filter |
| 5 | `SQ_LES_EMP_DETAIL_TBL` | Source Qualifier |
| 6 | `jnr_LES_NUMBER` | Joiner |
| 7 | `exp_Final` | Expression |

<details><summary>Connector details (95 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `LES_EMP_DETAIL_RECTYPE_C_TBL` | 14 |
| `EMP_REC_TYPE_C` | `Norm_EMP_REC_TYPE_C` | 12 |
| `Norm_EMP_REC_TYPE_C` | `fil_EMP_REC_TYPE_C_EMP_DETAIL` | 11 |
| `fil_EMP_REC_TYPE_C_EMP_DETAIL` | `exp_Convert` | 11 |
| `exp_Convert` | `fil_EMP_REC_TYPE_C` | 12 |
| `fil_EMP_REC_TYPE_C` | `jnr_LES_NUMBER` | 12 |
| `LES_EMP_DETAIL_TBL` | `SQ_LES_EMP_DETAIL_TBL` | 5 |
| `SQ_LES_EMP_DETAIL_TBL` | `jnr_LES_NUMBER` | 4 |
| `jnr_LES_NUMBER` | `exp_Final` | 14 |

</details>

---

## Pay_Calendar

### `m_Pay_Calendar_Verify_Pay_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Check_Current_Flag → [Lookup Procedure] lkp_Current_Pay_Period → [TARGET] PAY_PERIOD_VERIFY_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `PAY_PERIOD_VERIFY_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 4 | `exp_Check_Current_Flag` | Expression |

<details><summary>Connector details (14 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Check_Current_Flag` | `PAY_PERIOD_VERIFY_FILE` | 1 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `exp_Initial` | `exp_Check_Current_Flag` | 1 |
| `lkp_Current_Pay_Period` | `exp_Check_Current_Flag` | 1 |

</details>

### `m_Pay_Calendar_Set_Pay_Calendar`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [SOURCE] PAY_PERIOD_PARAM → [SOURCE] PAY_PERIOD1
  ... → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial → [Expression] exp_Determine_Parameters_Exist
  ... → [Lookup Procedure] lkp_Existing_Pay_Period → [Router] rtr_Parameter_Non_Parameter → [Expression] exp_Set_Current_Pay_Period_Param
  ... → [Expression] exp_Set_Date → [Update Strategy] upd_Set_Current_PP_Param → [Lookup Procedure] lkp_New_Current_Pay_Period
  ... → [Expression] exp_Set_Current_Pay_Period_Non_Param → [Update Strategy] upd_Set_Current_PP_Non_Param
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Target Definition |
| Source | `PAY_PERIOD` | Target Definition |
| Source | `PAY_PERIOD` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `rtr_Parameter_Non_Parameter` | Router |
| 2 | `exp_Set_Date` | Expression |
| 3 | `exp_Set_Current_Pay_Period_Non_Param` | Expression |
| 4 | `lkp_Existing_Pay_Period` | Lookup Procedure |
| 5 | `exp_Determine_Parameters_Exist` | Expression |
| 6 | `lkp_New_Current_Pay_Period` | Lookup Procedure |
| 7 | `upd_Set_Current_PP_Non_Param` | Update Strategy |
| 8 | `upd_Set_Current_PP_Param` | Update Strategy |
| 9 | `SQ_PAY_PERIOD` | Source Qualifier |
| 10 | `exp_Initial` | Expression |
| 11 | `exp_Set_Current_Pay_Period_Param` | Expression |

<details><summary>Connector details (41 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `upd_Set_Current_PP_Param` | `PAY_PERIOD_PARAM` | 3 |
| `upd_Set_Current_PP_Non_Param` | `PAY_PERIOD` | 3 |
| `exp_Determine_Parameters_Exist` | `rtr_Parameter_Non_Parameter` | 5 |
| `rtr_Parameter_Non_Parameter` | `exp_Set_Date` | 1 |
| `rtr_Parameter_Non_Parameter` | `exp_Set_Current_Pay_Period_Param` | 2 |
| `exp_Set_Date` | `lkp_New_Current_Pay_Period` | 1 |
| `lkp_New_Current_Pay_Period` | `exp_Set_Current_Pay_Period_Non_Param` | 3 |
| `exp_Set_Current_Pay_Period_Non_Param` | `upd_Set_Current_PP_Non_Param` | 3 |
| `exp_Initial` | `lkp_Existing_Pay_Period` | 2 |
| `lkp_Existing_Pay_Period` | `exp_Determine_Parameters_Exist` | 1 |
| `exp_Initial` | `exp_Determine_Parameters_Exist` | 4 |
| `exp_Set_Current_Pay_Period_Param` | `upd_Set_Current_PP_Param` | 3 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 2 |

</details>

### `m_Pay_Calendar_Build_Message`

**Data Flow:**

```
[SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Initial
  ... → [Expression] exp_Final → [TARGET] PAY_PERIOD_MESSAGE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `PAY_PERIOD_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Final` | Expression |
| 2 | `SQ_PAY_PERIOD` | Source Qualifier |
| 3 | `exp_Initial` | Expression |

<details><summary>Connector details (18 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `PAY_PERIOD_MESSAGE_FILE` | 2 |
| `exp_Initial` | `exp_Final` | 2 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Initial` | 6 |

</details>

### `m_Pay_Calendar_Reset_Pay_Calendar`

**Data Flow:**

```
[SOURCE] RESET_PAY_PERIOD → [SOURCE] PAY_PERIOD1 → [Source Qualifier] SQ_PAY_PERIOD_RESET
  ... → [Expression] exp_Initial → [Update Strategy] upd_Reset_Current_PP
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Target Definition |
| Source | `PAY_PERIOD` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD_RESET` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `upd_Reset_Current_PP` | Update Strategy |

<details><summary>Connector details (17 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `upd_Reset_Current_PP` | `RESET_PAY_PERIOD` | 3 |
| `PAY_PERIOD1` | `SQ_PAY_PERIOD_RESET` | 8 |
| `SQ_PAY_PERIOD_RESET` | `exp_Initial` | 3 |
| `exp_Initial` | `upd_Reset_Current_PP` | 3 |

</details>

---

## Pseudossn

### `m_Pseudossn_Load_Pseudossn_From_SDA_Tbl`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_FILE_TK_NUM → [SOURCE] PSEUDOSSN_FROM_SDA_TBL → [Source Qualifier] SQ_PSEUDOSSN_FILE_TK_NUM
  ... → [Expression] exp_Determine_Record_Type → [Filter] fil_Detail_Records → [Sorter] srt_PSEUDOSSN_EFF_DT
  ... → [Expression] exp_Determine_Errors → [Expression] exp_Conversions → [Expression] exp_Final
  ... → [Lookup Procedure] lkp_Current_Pay_Period
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_FROM_SDA_TBL` | Target Definition |
| Source | `PSEUDOSSN_FILE_TK_NUM` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 2 | `exp_Final` | Expression |
| 3 | `fil_Detail_Records` | Filter |
| 4 | `exp_Determine_Record_Type` | Expression |
| 5 | `exp_Conversions` | Expression |
| 6 | `srt_PSEUDOSSN_EFF_DT` | Sorter |
| 7 | `exp_Determine_Errors` | Expression |
| 8 | `SQ_PSEUDOSSN_FILE_TK_NUM` | Source Qualifier |

<details><summary>Connector details (505 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `PSEUDOSSN_FROM_SDA_TBL` | 63 |
| `exp_Conversions` | `lkp_Current_Pay_Period` | 1 |
| `lkp_Current_Pay_Period` | `exp_Final` | 2 |
| `exp_Conversions` | `exp_Final` | 61 |
| `fil_Detail_Records` | `srt_PSEUDOSSN_EFF_DT` | 63 |
| `exp_Determine_Record_Type` | `fil_Detail_Records` | 64 |
| `SQ_PSEUDOSSN_FILE_TK_NUM` | `exp_Determine_Record_Type` | 61 |
| `exp_Determine_Errors` | `exp_Conversions` | 61 |
| `srt_PSEUDOSSN_EFF_DT` | `exp_Determine_Errors` | 62 |
| `PSEUDOSSN_FILE_TK_NUM` | `SQ_PSEUDOSSN_FILE_TK_NUM` | 67 |

</details>

### `m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_TBL → [SOURCE] PSEUDOSSN_FROM_SDA_TBL → [Source Qualifier] SQ_PSEUDOSSN_FROM_SDA_TBL
  ... → [Expression] exp_Initial → [Expression] exp_Determine_Inserts → [Lookup Procedure] lkp_PSEUDOSSN_TBL
  ... → [Filter] fil_Inserts
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_TBL` | Target Definition |
| Source | `PSEUDOSSN_FROM_SDA_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PSEUDOSSN_FROM_SDA_TBL` | Source Qualifier |
| 2 | `exp_Initial` | Expression |
| 3 | `lkp_PSEUDOSSN_TBL` | Lookup Procedure |
| 4 | `exp_Determine_Inserts` | Expression |
| 5 | `fil_Inserts` | Filter |

<details><summary>Connector details (318 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `fil_Inserts` | `PSEUDOSSN_TBL` | 63 |
| `PSEUDOSSN_FROM_SDA_TBL` | `SQ_PSEUDOSSN_FROM_SDA_TBL` | 63 |
| `SQ_PSEUDOSSN_FROM_SDA_TBL` | `exp_Initial` | 63 |
| `exp_Initial` | `lkp_PSEUDOSSN_TBL` | 1 |
| `exp_Initial` | `exp_Determine_Inserts` | 63 |
| `lkp_PSEUDOSSN_TBL` | `exp_Determine_Inserts` | 1 |
| `exp_Determine_Inserts` | `fil_Inserts` | 64 |

</details>

### `m_Pseudossn_Update_Timekeeper_Number`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_TBL → [SOURCE] PSEUDOSSN_TBL1 → [Source Qualifier] SQ_PSEUDOSSN_TBL
  ... → [Expression] exp_Initial → [Expression] exp_Determine_Updates → [Lookup Procedure] lkp_PSEUDOSSN_FROM_SDA_TBL
  ... → [Filter] fil_Updates → [Update Strategy] upd_Update_TK_NUM
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_TBL` | Target Definition |
| Source | `PSEUDOSSN_TBL` | Source Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PSEUDOSSN_TBL` | Source Qualifier |
| 2 | `upd_Update_TK_NUM` | Update Strategy |
| 3 | `exp_Initial` | Expression |
| 4 | `exp_Determine_Updates` | Expression |
| 5 | `fil_Updates` | Filter |
| 6 | `lkp_PSEUDOSSN_FROM_SDA_TBL` | Lookup Procedure |

<details><summary>Connector details (87 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `upd_Update_TK_NUM` | `PSEUDOSSN_TBL` | 2 |
| `PSEUDOSSN_TBL1` | `SQ_PSEUDOSSN_TBL` | 63 |
| `SQ_PSEUDOSSN_TBL` | `exp_Initial` | 14 |
| `fil_Updates` | `upd_Update_TK_NUM` | 2 |
| `exp_Initial` | `exp_Determine_Updates` | 1 |
| `exp_Initial` | `lkp_PSEUDOSSN_FROM_SDA_TBL` | 1 |
| `lkp_PSEUDOSSN_FROM_SDA_TBL` | `exp_Determine_Updates` | 1 |
| `exp_Determine_Updates` | `fil_Updates` | 3 |

</details>

### `m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_FILE_TK_NUM → [Source Qualifier] SQ_PSEUDOSSN_FILE_TK_NUM → [Expression] exp_Initial
  ... → [Expression] exp_Verify_Header_Date → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Pay_Period_Header_Date
  ... → [Filter] fil_Header → [Expression] exp_Final → [TARGET] PSEUDO_HDR_DATE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_FILE_TK_NUM` | Source Definition |
| Target | `PSEUDO_HDR_DATE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 2 | `lkp_Pay_Period_Header_Date` | Lookup Procedure |
| 3 | `exp_Initial` | Expression |
| 4 | `exp_Verify_Header_Date` | Expression |
| 5 | `fil_Header` | Filter |
| 6 | `exp_Final` | Expression |
| 7 | `SQ_PSEUDOSSN_FILE_TK_NUM` | Source Qualifier |

<details><summary>Connector details (86 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `PSEUDO_HDR_DATE_FILE` | 1 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `lkp_Current_Pay_Period` | `exp_Verify_Header_Date` | 2 |
| `exp_Initial` | `lkp_Pay_Period_Header_Date` | 1 |
| `lkp_Pay_Period_Header_Date` | `exp_Verify_Header_Date` | 3 |
| `SQ_PSEUDOSSN_FILE_TK_NUM` | `exp_Initial` | 3 |
| `exp_Initial` | `exp_Verify_Header_Date` | 3 |
| `exp_Verify_Header_Date` | `fil_Header` | 4 |
| `fil_Header` | `exp_Final` | 1 |
| `PSEUDOSSN_FILE_TK_NUM` | `SQ_PSEUDOSSN_FILE_TK_NUM` | 67 |

</details>

### `m_Pseudossn_Current_Pay_Period`

**Data Flow:**

```
[SOURCE] PAY_PERIOD → [Source Qualifier] SQ_PAY_PERIOD → [Expression] exp_Build_Pay_Period
  ... → [Expression] exp_Final → [TARGET] PAY_PERIOD_DATE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PAY_PERIOD` | Source Definition |
| Target | `PAY_PERIOD_DATE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `SQ_PAY_PERIOD` | Source Qualifier |
| 2 | `exp_Build_Pay_Period` | Expression |
| 3 | `exp_Final` | Expression |

<details><summary>Connector details (13 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `PAY_PERIOD_DATE_FILE` | 1 |
| `PAY_PERIOD` | `SQ_PAY_PERIOD` | 8 |
| `SQ_PAY_PERIOD` | `exp_Build_Pay_Period` | 2 |
| `exp_Build_Pay_Period` | `exp_Final` | 2 |

</details>

### `m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_TBL → [Source Qualifier] SQ_PSEUDOSSN_TBL → [Expression] exp_PSEUDOSSN_TBL
  ... → [TARGET] HI_ARCH_PSEUDOSSN_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_TBL` | Source Definition |
| Target | `HI_ARCH_PSEUDOSSN_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_PSEUDOSSN_TBL` | Expression |
| 2 | `SQ_PSEUDOSSN_TBL` | Source Qualifier |

<details><summary>Connector details (189 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_PSEUDOSSN_TBL` | `HI_ARCH_PSEUDOSSN_TBL` | 63 |
| `SQ_PSEUDOSSN_TBL` | `exp_PSEUDOSSN_TBL` | 63 |
| `PSEUDOSSN_TBL` | `SQ_PSEUDOSSN_TBL` | 63 |

</details>

### `m_Pseudossn_Load_Pseudossn_Tbl`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_TBL → [SOURCE] PSEUDOSSN_FILE → [Source Qualifier] SQ_PSEUDOSSN_FILE
  ... → [Expression] exp_Determine_Record_Type → [Filter] fil_Detail_Records → [Sorter] srt_PSEUDOSSN_EFF_DT
  ... → [Expression] exp_Determine_Errors → [Router] rtr_Good_Bad_Records → [Expression] exp_Conversions
  ... → [Normalizer] nrm_Errors → [Expression] exp_Final → [Lookup Procedure] lkp_Current_Pay_Period
  ... → [Filter] fil_Error_Message → [Expression] exp_Pay_Period → [Expression] exp_Final_Errors
  ... → [Lookup Procedure] lkp_Current_Pay_Period1 → [TARGET] ERROR_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_TBL` | Target Definition |
| Source | `PSEUDOSSN_FILE` | Source Definition |
| Target | `ERROR_TBL` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_Current_Pay_Period1` | Lookup Procedure |
| 2 | `exp_Determine_Record_Type` | Expression |
| 3 | `SQ_PSEUDOSSN_FILE` | Source Qualifier |
| 4 | `exp_Conversions` | Expression |
| 5 | `srt_PSEUDOSSN_EFF_DT` | Sorter |
| 6 | `exp_Determine_Errors` | Expression |
| 7 | `rtr_Good_Bad_Records` | Router |
| 8 | `fil_Error_Message` | Filter |
| 9 | `nrm_Errors` | Normalizer |
| 10 | `exp_Final_Errors` | Expression |
| 11 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 12 | `exp_Final` | Expression |
| 13 | `fil_Detail_Records` | Filter |
| 14 | `exp_Pay_Period` | Expression |

<details><summary>Connector details (591 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `PSEUDOSSN_TBL` | 62 |
| `exp_Final_Errors` | `ERROR_TBL` | 6 |
| `lkp_Current_Pay_Period1` | `exp_Final_Errors` | 2 |
| `exp_Pay_Period` | `lkp_Current_Pay_Period1` | 1 |
| `exp_Determine_Record_Type` | `fil_Detail_Records` | 62 |
| `SQ_PSEUDOSSN_FILE` | `exp_Determine_Record_Type` | 60 |
| `PSEUDOSSN_FILE` | `SQ_PSEUDOSSN_FILE` | 66 |
| `exp_Conversions` | `lkp_Current_Pay_Period` | 1 |
| `exp_Conversions` | `exp_Final` | 60 |
| `rtr_Good_Bad_Records` | `exp_Conversions` | 60 |
| `fil_Detail_Records` | `srt_PSEUDOSSN_EFF_DT` | 62 |
| `srt_PSEUDOSSN_EFF_DT` | `exp_Determine_Errors` | 61 |
| `exp_Determine_Errors` | `rtr_Good_Bad_Records` | 69 |
| `rtr_Good_Bad_Records` | `nrm_Errors` | 8 |
| `nrm_Errors` | `fil_Error_Message` | 3 |
| `fil_Error_Message` | `exp_Pay_Period` | 3 |
| `exp_Pay_Period` | `exp_Final_Errors` | 3 |
| `lkp_Current_Pay_Period` | `exp_Final` | 2 |

</details>

### `m_Pseudossn_Verify_Record_Count`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_FILE → [SOURCE] PSEUDOSSN_FILE1 → [Source Qualifier] SQ_PSEUDOSSN_FILE
  ... → [Source Qualifier] SQ_PSEUDOSSN_FILE1 → [Expression] exp_DETERMINE_HEADER_TRAILER → [Expression] exp_DETERMINE_DETAIL
  ... → [Filter] fil_TRAILER → [Filter] fil_DETAIL → [Joiner] jnr_RECORD_CONSTANTS
  ... → [Aggregator] agg_ALL_RECORDS → [Expression] exp_COMPARE → [TARGET] PSEUDO_RECORD_COUNT
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_FILE` | Source Definition |
| Source | `PSEUDOSSN_FILE` | Source Definition |
| Target | `PSEUDO_RECORD_COUNT` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `fil_DETAIL` | Filter |
| 2 | `exp_DETERMINE_DETAIL` | Expression |
| 3 | `SQ_PSEUDOSSN_FILE` | Source Qualifier |
| 4 | `exp_DETERMINE_HEADER_TRAILER` | Expression |
| 5 | `SQ_PSEUDOSSN_FILE1` | Source Qualifier |
| 6 | `fil_TRAILER` | Filter |
| 7 | `exp_COMPARE` | Expression |
| 8 | `jnr_RECORD_CONSTANTS` | Joiner |
| 9 | `agg_ALL_RECORDS` | Aggregator |

<details><summary>Connector details (167 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_COMPARE` | `PSEUDO_RECORD_COUNT` | 3 |
| `exp_DETERMINE_DETAIL` | `fil_DETAIL` | 4 |
| `fil_DETAIL` | `agg_ALL_RECORDS` | 4 |
| `SQ_PSEUDOSSN_FILE1` | `exp_DETERMINE_DETAIL` | 3 |
| `PSEUDOSSN_FILE` | `SQ_PSEUDOSSN_FILE` | 66 |
| `SQ_PSEUDOSSN_FILE` | `exp_DETERMINE_HEADER_TRAILER` | 3 |
| `exp_DETERMINE_HEADER_TRAILER` | `fil_TRAILER` | 4 |
| `PSEUDOSSN_FILE1` | `SQ_PSEUDOSSN_FILE1` | 66 |
| `fil_TRAILER` | `jnr_RECORD_CONSTANTS` | 3 |
| `jnr_RECORD_CONSTANTS` | `exp_COMPARE` | 6 |
| `agg_ALL_RECORDS` | `jnr_RECORD_CONSTANTS` | 5 |

</details>

### `m_Pseudossn_Counters`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_FILE → [Source Qualifier] SQ_PSEUDOSSN_FILE → [Expression] exp_Determine_Detail
  ... → [Filter] fil_Detail → [Aggregator] agg_ALL_RECORDS → [Expression] exp_Detail_Count
  ... → [Expression] exp_Counters → [Lookup Procedure] lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE → [Lookup Procedure] lkp_Count_PSEUDOSSN_TBL
  ... → [Lookup Procedure] lkp_PSEUDOSSN_TBL_Pay_Period → [Expression] exp_Build_Message → [Normalizer] nrm_Counters
  ... → [Expression] exp_Final_Message → [Expression] exp_Final → [TARGET] PSEUDOSSN_MESSAGE_FILE
  ... → [TARGET] COUNTER_TBL
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_FILE` | Source Definition |
| Target | `COUNTER_TBL` | Target Definition |
| Target | `PSEUDOSSN_MESSAGE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `lkp_PSEUDOSSN_TBL_Pay_Period` | Lookup Procedure |
| 2 | `exp_Final_Message` | Expression |
| 3 | `exp_Build_Message` | Expression |
| 4 | `fil_Detail` | Filter |
| 5 | `exp_Determine_Detail` | Expression |
| 6 | `SQ_PSEUDOSSN_FILE` | Source Qualifier |
| 7 | `agg_ALL_RECORDS` | Aggregator |
| 8 | `exp_Detail_Count` | Expression |
| 9 | `lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE` | Lookup Procedure |
| 10 | `exp_Counters` | Expression |
| 11 | `nrm_Counters` | Normalizer |
| 12 | `exp_Final` | Expression |
| 13 | `lkp_Count_PSEUDOSSN_TBL` | Lookup Procedure |

<details><summary>Connector details (110 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `COUNTER_TBL` | 4 |
| `exp_Final_Message` | `PSEUDOSSN_MESSAGE_FILE` | 2 |
| `lkp_PSEUDOSSN_TBL_Pay_Period` | `exp_Counters` | 2 |
| `exp_Detail_Count` | `lkp_PSEUDOSSN_TBL_Pay_Period` | 1 |
| `exp_Build_Message` | `exp_Final_Message` | 2 |
| `exp_Counters` | `exp_Build_Message` | 8 |
| `fil_Detail` | `agg_ALL_RECORDS` | 4 |
| `exp_Determine_Detail` | `fil_Detail` | 4 |
| `SQ_PSEUDOSSN_FILE` | `exp_Determine_Detail` | 3 |
| `PSEUDOSSN_FILE` | `SQ_PSEUDOSSN_FILE` | 66 |
| `agg_ALL_RECORDS` | `exp_Detail_Count` | 1 |
| `exp_Detail_Count` | `lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE` | 1 |
| `exp_Detail_Count` | `exp_Counters` | 1 |
| `exp_Detail_Count` | `lkp_Count_PSEUDOSSN_TBL` | 1 |
| `lkp_Count_PSEUDOSSN_Duplicates_ERROR_TABLE` | `exp_Counters` | 1 |
| `lkp_Count_PSEUDOSSN_TBL` | `exp_Counters` | 1 |
| `exp_Counters` | `nrm_Counters` | 6 |
| `nrm_Counters` | `exp_Final` | 2 |

</details>

### `m_Pseudossn_Verify_Header_Date_Current_Pay_Period`

**Data Flow:**

```
[SOURCE] PSEUDOSSN_FILE → [Source Qualifier] SQ_PSEUDOSSN_FILE → [Expression] exp_Initial
  ... → [Expression] exp_Verify_Header_Date → [Lookup Procedure] lkp_Current_Pay_Period → [Lookup Procedure] lkp_Pay_Period_Header_Date
  ... → [Filter] fil_Header → [Expression] exp_Final → [TARGET] PSEUDO_HDR_DATE_FILE
```

| Direction | Object | Type |
|---|---|---|
| Source | `PSEUDOSSN_FILE` | Source Definition |
| Target | `PSEUDO_HDR_DATE_FILE` | Target Definition |

**Transformation Steps:**

| # | Transformation | Type |
|---:|---|---|
| 1 | `exp_Initial` | Expression |
| 2 | `SQ_PSEUDOSSN_FILE` | Source Qualifier |
| 3 | `exp_Verify_Header_Date` | Expression |
| 4 | `fil_Header` | Filter |
| 5 | `exp_Final` | Expression |
| 6 | `lkp_Current_Pay_Period` | Lookup Procedure |
| 7 | `lkp_Pay_Period_Header_Date` | Lookup Procedure |

<details><summary>Connector details (85 field-level connections)</summary>

| From Instance | To Instance | Field Count |
|---|---|---:|
| `exp_Final` | `PSEUDO_HDR_DATE_FILE` | 1 |
| `exp_Initial` | `lkp_Current_Pay_Period` | 1 |
| `exp_Initial` | `lkp_Pay_Period_Header_Date` | 1 |
| `SQ_PSEUDOSSN_FILE` | `exp_Initial` | 3 |
| `exp_Initial` | `exp_Verify_Header_Date` | 3 |
| `PSEUDOSSN_FILE` | `SQ_PSEUDOSSN_FILE` | 66 |
| `lkp_Pay_Period_Header_Date` | `exp_Verify_Header_Date` | 3 |
| `lkp_Current_Pay_Period` | `exp_Verify_Header_Date` | 2 |
| `exp_Verify_Header_Date` | `fil_Header` | 4 |
| `fil_Header` | `exp_Final` | 1 |

</details>

---

## Overall Source-to-Target Lineage Summary

| XML Export | Mapping | Source(s) | Target(s) |
|---|---|---|---|
| COMPTIME | `m_COMPTIME_Build_Message_Counters` | `U0287D01` | `COUNTER_TBL`, `COMPTIME_MESSAGE_FILE` |
| COMPTIME | `m_COMPTIME_Load_COMP_TIME_DAILY_TBL` | `U0287D01` | `COMP_TIME_DAILY_TBL` |
| COMPTIME | `m_COMPTIME_Current_Pay_Period` | `PAY_PERIOD` | `COMP_TIME_DATE_FILE` |
| CPM | `m_CPM_Current_Pay_Period` | `PAY_PERIOD` | `CPM_PAY_PERIOD_DATE_FILE` |
| CPM | `m_CPM_Load_CPM_NEWPAY_STG_ALT_TBL` | `ERROR_TBL`, `CPM_PM3_STG_TBL` | `CPM_NEWPAY_STG_ALT_TBL` |
| CPM | `m_CPM_Load_CPM_YTD_Staging_Tables` | `CPM_YTD_DETAIL_STG_TBL`, `CPM_YTD_STATE_STG_TBL`, `YTD_FILE` | `CPM_YTD_HEADER_STG_TBL` |
| CPM | `m_CPM_Load_CPM_NEWPAY_STG_YTD_STATE_TBL` | `CPM_YTD_STATE_STG_TBL` | `CPM_NEWPAY_STG_YTD_STATE_TBL` |
| CPM | `m_CPM_Load_CPM_MER_Staging_Tables` | `MER_FILE` | `CPM_MER_DETAIL_STG_TBL`, `CPM_MER_HEADER_STG_TBL` |
| CPM | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_1_2_TBL` | `CPM_NEWPAY_STG_TYPE_1_2_TBL`, `ERROR_TBL`, `CPM_YTD_DETAIL_STG_TBL`, `PSEUDOSSN_TBL`, `CPM_PM1_STG_TBL`, `CPM_PM2_STG_TBL` | — |
| CPM | `m_CPM_Load_CPM_NEWPAY_STG_DETAIL_TBL` | `CPM_PM3_STG_TBL` | `CPM_NEWPAY_STG_DETAIL_TBL` |
| CPM | `m_CPM_Build_Message_Counters` | `CPM_NEWPAY_TBL`, `ERROR_TBL`, `PAYMASTER_THREE`, `CPM_NEWPAY_TBL` | `COUNTER_TBL`, `CPM_MESSAGE_FILE` |
| CPM | `m_CPM_Load_CPM_PMR_Staging_Tables` | `CPM_PM1_STG_TBL`, `CPM_PM2_STG_TBL`, `CPM_PM3_STG_TBL`, `PAYMASTER_FILE` | `CPM_PMH_STG_TBL` |
| CPM | `m_CPM_Load_CPM_PAD_Staging_Tables` | `PAD_FILE` | `CPM_PAD_DETAIL_STG_TBL`, `CPM_PAD_HEADER_STG_TBL` |
| CPM | `m_CPM_Load_PMR_To_CPM_NEWPAY_TBL` | `CPM_NEWPAY_TBL`, `CPM_NEWPAY_STG_TYPE_1_2_TBL`, `CPM_NEWPAY_STG_TYPE_3_TBL` | — |
| CPM | `m_Generic_Mapping` | `HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` |
| CPM | `m_CPM_Load_FDR_CPM_NEWPAY_TBL` | `CPM_NEWPAY_TBL`, `CPM_NEWPAY_STG_TYPE_1_2_TBL`, `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | — |
| CPM | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | `CPM_NEWPAY_STG_TYPE_3_FDR_TBL`, `CPM_PM3_STG_TBL` | — |
| CPM | `m_CPM_Load_CPM_NEWPAY_STG_TYPE_3_TBL` | `CPM_NEWPAY_STG_TYPE_3_TBL`, `CPM_NEWPAY_STG_TYPE_3_FDR_TBL` | — |
| CPM_AFPS | `m_CPM_AFPS_0100_Data_Seperate` | `HI_AFPS_FEEDER_TBL`, `CPM_NEWPAY_TBL`, `PAY_PERIOD` | — |
| CPM_AFPS | `m_CPM_AFPS_0300_Gross_Exp_Report` | `HI_GROSS_EXP_TBL`, `HI_AFPS_FEEDER_TBL` | — |
| CPM_AFPS | `m_CPM_AFPS_0720_Crossfoot_Message_Gross_Expend` | `HI_AFPS_FEEDER_TBL` | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0700_Crossfoot_Message_Summary_Counts` | `HI_AFPS_FEEDER_TBL`, `ERROR_TBL` | `CPM_AFPS_MESSAGE_COUNTS_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0800_Build_Message_Counters` | `CPM_NEWPAY_TBL`, `HI_AFPS_FEEDER_TBL` | `AFPS_COUNTER_TBL`, `CPM_AFPS_MESSAGE_COUNTS_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0900_Build_Message` | `PAY_PERIOD` | `CPM_AFPS_MESSAGE_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0760_Concatenate_Crossfoot_Files` | `HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` |
| CPM_AFPS | `m_CPM_AFPS_1000_Send_Report` | `HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0500_Crossfoot_Message_Header` | `PAY_PERIOD` | `CPM_AFPS_MESSAGE_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0820_Build_Message_Totals` | `HI_AFPS_FEEDER_TBL`, `CPM_NEWPAY_TBL` | `CPM_AFPS_MESSAGE_COUNTS_TOT_FILE`, `AFPS_COUNTER_TBL` |
| CPM_AFPS | `m_CPM_AFPS_0860_Concatenate_Counts_Files` | `HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0025_Set_Pay_Calendar` | `PAY_PERIOD` | `CPM_AFPS_PAY_PERIOD_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0600_Crossfoot_Message_Details` | `ERROR_TBL` | `CPM_AFPS_CROSSFOOT_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0050_Update_CPM_CYCLE_TBL` | `CPM_CYCLE_TBL`, `CPM_CYCLE_TBL` | — |
| CPM_AFPS | `m_CPM_AFPS_0010_Set_CPM_Calendar` | `PAY_PERIOD` | `CPM_AFPS_PAY_PERIOD_CAL_FILE` |
| CPM_AFPS | `m_CPM_AFPS_0200_Debridge_To_FEEDER_FLAT` | `HI_AFPS_FEEDER_TBL` | `feeder_FEEDER_RECORD` |
| CPM_AFPS | `m_CPM_AFPS_0400_Crossfoot_Errors` | `ERROR_TBL`, `HI_GROSS_EXP_TBL`, `CPM_PM3_STG_TBL`, `HI_GROSS_EXP_TBL` | — |
| CPM_CDC | `m_CPM_CDC_Load_CPM_CDC_Header_File` | `PAY_PERIOD` | `cdchdr_WS_CDC_HDR` |
| CPM_CDC | `m_CPM_CDC_Concatenate_Files` | `HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` |
| CPM_CDC | `m_CPM_CDC_Set_Pay_Calendar` | `PAY_PERIOD` | `CPM_CDC_PAY_PERIOD_FILE` |
| CPM_CDC | `m_CPM_CDC_Load_CPM_CDC_Data_File` | `CPM_NEWPAY_TBL` | `cdcskel_WS_PAY_OUT_REC` |
| CPM_CDC | `m_CPM_CDC_Set_CPM_Calendar` | `PAY_PERIOD` | `CPM_CDC_CPM_PAY_PERIOD_FILE` |
| CPM_CDC | `m_CPM_CDC_Build_Message` | `CPM_NEWPAY_TBL` | `CPM_CDC_MESSAGE_FILE` |
| CPM_NIH | `m_CPM_NIH_Build_Message` | `CPM_NEWPAY_TBL` | `CPM_NIH_MESSAGE_FILE` |
| CPM_NIH | `m_CPM_NIH_Load_CPM_NIH_Header_File` | `PAY_PERIOD` | `nihhdr_WS_NIH_HDR` |
| CPM_NIH | `m_CPM_NIH_Load_CPM_NIH_Data_File` | `CPM_NEWPAY_TBL` | `nihtest_NIH_PAYROLL_MASTER` |
| CPM_NIH | `m_CPM_NIH_Set_CPM_Calendar` | `PAY_PERIOD` | `CPM_NIH_CPM_PAY_PERIOD_FILE` |
| CPM_NIH | `m_CPM_NIH_Concatenate_Files` | `HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` |
| CPM_NIH | `m_CPM_NIH_Set_Pay_Calendar` | `PAY_PERIOD` | `CPM_NIH_PAY_PERIOD_FILE` |
| CPM_OIG | `m_CPM_OIG_Build_Message` | `CPM_NEWPAY_TBL` | `CPM_OIG_MESSAGE_FILE` |
| CPM_OIG | `m_CPM_OIG_Set_Pay_Calendar` | `PAY_PERIOD` | `CPM_OIG_PAY_PERIOD_FILE` |
| CPM_OIG | `m_CPM_OIG_Set_CPM_Calendar` | `PAY_PERIOD` | `CPM_OIG_CPM_PAY_PERIOD_FILE` |
| CPM_OIG | `m_CPM_OIG_Load_CPM_OIG_File` | `CPM_NEWPAY_TBL` | `oigsgndec_SKPAYROLL_MASTER` |
| EHRP2BIIS_UPDATE | `m_EHRP2BIIS_UPDATE` | `PS_GVT_JOB`, `NWK_NEW_EHRP_ACTIONS_TBL` | `NWK_ACTION_SECONDARY_TBL`, `NWK_ACTION_PRIMARY_TBL`, `EHRP_RECS_TRACKING_TBL` |
| FDA_Leave | `m_0150_PM_FDA_Error_Counter` | `ERROR_TBL`, `ERROR_TBL`, `ERROR_TBL`, `ERROR_TBL`, `HI_PM_FDA_TATRAN_TBL` | — |
| FDA_Leave | `m_0300_PM_FDA_Create_Output_File` | `HI_PM_FDA_TATRAN_FLAT`, `HI_PM_FDA_TATRAN_TBL` | — |
| FDA_Leave | `m_0020_PM_FDA_Set_CPM_Calendar` | `PAY_PERIOD` | `CPM_FDA_CPM_PAY_PERIOD_FILE` |
| FDA_Leave | `m_1100_PM_FDA_Send_Email` | `HI_GENERIC_SRC_TBL` | `GENERIC_TARGET_FILE` |
| FDA_Leave | `m_0200_PM_FDA_Create_Insert_200_Rows` | `HI_PM_FDA_TATRAN_TBL`, `HI_PM_FDA_TATRAN_TBL` | — |
| FDA_Leave | `m_0500_PM_FDA_IO_Counter` | `HI_PM_FDA_TATRAN_TBL`, `ERROR_TBL`, `PAY_PERIOD` | `COUNTER_TBL`, `FDA_EXTRACT_MESSAGE_FILE` |
| FDA_Leave | `m_0050_PM_FDA_Update_CPM_CYCLE_TBL_FDA` | `CPM_CYCLE_TBL`, `CPM_CYCLE_TBL` | — |
| FDA_Leave | `m_0010_PM_FDA_Verify_File` | `HI_PM_FDA_TATRAN_FLAT_FILE_NAME` | `CPM_FDA_PAY_PERIOD_FILE` |
| FDA_Leave | `m_0100_PM_FDA_Load_TATRAN_To_DB` | `HI_PM_FDA_TATRAN_TBL`, `HI_PM_FDA_TATRAN_FLAT` | — |
| FDA_Leave | `m_0025_PM_FDA_Set_Pay_Calendar` | `PAY_PERIOD` | `CPM_FDA_PAY_PERIOD_FILE` |
| LES | `m_LESRPT_Load_LESL` | `LES_EMP_DETAIL_LEAVE_TBL` | `LESL` |
| LES | `m_LESRPT_Load_LEST` | `LES_EMP_DETAIL_RECTYPE_T_TBL` | `LEST` |
| LES | `m_LESRPT_Load_LESM` | `LES_EMP_DETAIL_RECTYPE_M_TBL` | `LESM` |
| LES | `m_LESRPT_Load_LESD` | `LES_EMP_DETAIL_RECTYPE_D_TBL` | `LESD` |
| LES | `m_LESRPT_Load_LESS` | `LES_PRIMARY_DATA_TBL` | `LESS` |
| LES | `m_LESRPT_Load_LESU` | `LES_EMP_DETAIL_RECTYPE_U_TBL` | `LESU` |
| LES | `m_LESRPT_Load_LESC` | `LES_EMP_DETAIL_RECTYPE_C_TBL` | `LESC` |
| LES | `m_LESRPT_Load_LESR` | `LES_EMP_DETAIL_RECTYPE_R_TBL` | `LESR` |
| LES | `m_LES_Verify_Header` | `EMP_REC_TYPE_0` | `LES_HEADER_FILE` |
| LES | `m_LES_Verify_Record_Count` | `EMP_REC_TYPE_E` | `LES_TOTALS_FILE` |
| LES | `m_LES_Load_LES_EMP_DETAIL_LEAVE_TBL` | `LES_EMP_DETAIL_LEAVE_TBL`, `LES_EMP_DETAIL_RECTYPE_L_TBL` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RETRO_EARN_TBL` | `LES_EMP_DETAIL_RECTYPE_R_TBL` | `LES_EMP_DETAIL_RETRO_EARN_TBL` |
| LES | `m_LES_NIH_FILE` | `LES_NIH_EMPLOYEE_SUMMARY_TBL`, `LES_EMPLOYEE_DETAIL` | `LES_NIH_EMPLOYEE_DETAIL` |
| LES | `m_LES_Load_LES_EMP_DETAIL_CURR_EARN_TBL` | `LES_EMP_DETAIL_RECTYPE_C_TBL` | `LES_EMP_DETAIL_CURR_EARN_TBL` |
| LES | `m_LES_Build_Message_Counters` | `LES_NIH_EMPLOYEE_SUMMARY_TBL`, `ERROR_TBL`, `EMP_REC_TYPE_E`, `LES_PRIMARY_DATA_TBL` | `LES_MESSAGE_FILE`, `COUNTER_TBL` |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_D_TBL` | `LES_EMP_DETAIL_RECTYPE_D_TBL`, `EMP_REC_TYPE_D`, `LES_EMP_DETAIL_TBL` | — |
| LES | `m_LES_Current_Pay_Period` | `PAY_PERIOD` | `LES_PAY_PERIOD_DATE_FILE` |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_2_TBL` | `LES_EMP_DETAIL_RECTYPE_2_TBL`, `LES_EMP_DETAIL_TBL`, `EMP_REC_TYPE_2` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_T_TBL` | `LES_EMP_DETAIL_RECTYPE_T_TBL`, `EMP_REC_TYPE_T`, `LES_EMP_DETAIL_TBL` | — |
| LES | `m_LES_Load_LES_PRIMARY_DATA_TBL` | `LES_PRIMARY_DATA_TBL`, `LES_EMP_DETAIL_RECTYPE_4_TBL`, `LES_EMP_DETAIL_RECTYPE_5_TBL`, `LES_EMP_DETAIL_RECTYPE_6_TBL`, `LES_EMP_DETAIL_TBL`, `LES_HEADER_TBL`, `LES_EMP_DETAIL_RECTYPE_1_TBL`, `LES_EMP_DETAIL_RECTYPE_2_TBL`, `LES_EMP_DETAIL_RECTYPE_3_TBL` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_3_TBL` | `LES_EMP_DETAIL_RECTYPE_3_TBL`, `EMP_REC_TYPE_3`, `LES_EMP_DETAIL_TBL` | — |
| LES | `m_LES_Load_LES_HEADER_TBL` | `LES_HEADER_TBL`, `EMP_REC_TYPE_0` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_5_TBL` | `LES_EMP_DETAIL_RECTYPE_5_TBL`, `EMP_REC_TYPE_5`, `LES_EMP_DETAIL_TBL` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_1_TBL` | `LES_EMP_DETAIL_RECTYPE_1_TBL`, `EMP_REC_TYPE_1`, `LES_EMP_DETAIL_TBL` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_4_TBL` | `LES_EMP_DETAIL_RECTYPE_4_TBL`, `EMP_REC_TYPE_4`, `LES_EMP_DETAIL_TBL` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_TBL` | `LES_EMP_DETAIL_TBL`, `ERROR_TBL`, `LES_HEADER_TBL`, `EMP_REC_TYPE_E` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_R_TBL` | `LES_EMP_DETAIL_RECTYPE_R_TBL`, `EMP_REC_TYPE_R`, `LES_EMP_DETAIL_TBL` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_U_TBL` | `LES_EMP_DETAIL_RECTYPE_U_TBL`, `LES_EMP_DETAIL_TBL`, `EMP_REC_TYPE_U` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_L_TBL` | `LES_EMP_DETAIL_RECTYPE_L_TBL`, `EMP_REC_TYPE_L`, `LES_EMP_DETAIL_TBL` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_6_TBL` | `LES_EMP_DETAIL_RECTYPE_6_TBL`, `LES_EMP_DETAIL_TBL`, `EMP_REC_TYPE_6` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_M_TBL` | `LES_EMP_DETAIL_RECTYPE_M_TBL`, `LES_EMP_DETAIL_TBL`, `EMP_REC_TYPE_M` | — |
| LES | `m_LES_Load_LES_EMP_DETAIL_RECTYPE_C_TBL` | `LES_EMP_DETAIL_RECTYPE_C_TBL`, `EMP_REC_TYPE_C`, `LES_EMP_DETAIL_TBL` | — |
| Pay_Calendar | `m_Pay_Calendar_Verify_Pay_Calendar` | `PAY_PERIOD` | `PAY_PERIOD_VERIFY_FILE` |
| Pay_Calendar | `m_Pay_Calendar_Set_Pay_Calendar` | `PAY_PERIOD`, `PAY_PERIOD`, `PAY_PERIOD` | — |
| Pay_Calendar | `m_Pay_Calendar_Build_Message` | `PAY_PERIOD` | `PAY_PERIOD_MESSAGE_FILE` |
| Pay_Calendar | `m_Pay_Calendar_Reset_Pay_Calendar` | `PAY_PERIOD`, `PAY_PERIOD` | — |
| Pseudossn | `m_Pseudossn_Load_Pseudossn_From_SDA_Tbl` | `PSEUDOSSN_FROM_SDA_TBL`, `PSEUDOSSN_FILE_TK_NUM` | — |
| Pseudossn | `m_Pseudossn_Load_SDA_Records_Pseudossn_Tbl` | `PSEUDOSSN_TBL`, `PSEUDOSSN_FROM_SDA_TBL` | — |
| Pseudossn | `m_Pseudossn_Update_Timekeeper_Number` | `PSEUDOSSN_TBL`, `PSEUDOSSN_TBL` | — |
| Pseudossn | `m_Pseudossn_Verify_Header_Date_Current_Pay_Period_Pseudossn_From_SDA` | `PSEUDOSSN_FILE_TK_NUM` | `PSEUDO_HDR_DATE_FILE` |
| Pseudossn | `m_Pseudossn_Current_Pay_Period` | `PAY_PERIOD` | `PAY_PERIOD_DATE_FILE` |
| Pseudossn | `m_Pseudossn_Load_Archive_Pseudossn_Tbl_v1` | `PSEUDOSSN_TBL` | `HI_ARCH_PSEUDOSSN_TBL` |
| Pseudossn | `m_Pseudossn_Load_Pseudossn_Tbl` | `PSEUDOSSN_TBL`, `PSEUDOSSN_FILE` | `ERROR_TBL` |
| Pseudossn | `m_Pseudossn_Verify_Record_Count` | `PSEUDOSSN_FILE`, `PSEUDOSSN_FILE` | `PSEUDO_RECORD_COUNT` |
| Pseudossn | `m_Pseudossn_Counters` | `PSEUDOSSN_FILE` | `COUNTER_TBL`, `PSEUDOSSN_MESSAGE_FILE` |
| Pseudossn | `m_Pseudossn_Verify_Header_Date_Current_Pay_Period` | `PSEUDOSSN_FILE` | `PSEUDO_HDR_DATE_FILE` |

---

## Orchestration Context

The data pipelines documented above are orchestrated by a combination of:

1. **Informatica Workflows** — Each XML export contains a single workflow (`wf_<name>`) that sequences sessions in dependency order via `WORKFLOWLINK` elements.
2. **Pre/Post-Load Shell Scripts** — KornShell scripts (`ehrp2biis_preload`, `actstage_load`) invoke SQL*Plus to prepare staging tables before Informatica runs, and `ehrp2biis_afterload.sql` propagates staged records into production `_ALL` tables.
3. **Transfer Scripts** — After Informatica generates output files in `/data/BIISINT/data/int/out/{CPM,LES}/`, agency-specific KornShell scripts SFTP the files to `m1csv301.hhs.gov` dropbox paths for downstream consumers (AFPS, CDC, FDA, NIH, OIG).
4. **Maintenance Scripts** — `archive_files` renames outputs with pay-period suffixes for retention; `remove_file` cleans up transient artifacts.

### End-to-End Pipeline Flow

```
┌─────────────────┐    ┌───────────────────────────────┐    ┌──────────────────┐
│  ehrp2biis_      │───▶│  Informatica PowerCenter      │───▶│  Transfer Scripts │
│  preload (SQL)   │    │  Workflows & Sessions         │    │  (SFTP to agency) │
└─────────────────┘    └───────────────┬───────────────┘    └──────────────────┘
                                       │
                                       ▼
                       ┌───────────────────────────────┐
                       │  ehrp2biis_afterload.sql      │
                       │  (post-load SQL procedures)   │
                       └───────────────────────────────┘
```

