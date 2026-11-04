# Parity report: m_EHRP2BIIS_UPDATE (job ts_nwk_stage_load)

Dual run on deterministic synthetic input (seed 20261104, run date 2026-11-04).
The LEGACY side is an independent Python re-implementation of the PowerCenter mapping
semantics (`snowflake/legacy/pc_executor.py`); no PowerCenter host exists, so this is NOT a
real PowerCenter run. The SF side is the dbt project `snowflake/dbt/ehrp2biis_stage_load`.

- SRC (same input for both sides): `SFNFR_20261104.TS_NWK_SRC_SFNFR_20261104`
- LEGACY: `SFNFR_20261104.TS_NWK_LEGACY_SFNFR_20261104`
- SF: `SFNFR_20261104.TS_NWK_SF_SFNFR_20261104`

Canonical row form, checksums and row-level diff: `snowflake/parity/parity.py`
(results: `parity_results.json`, table: `parity_table.md`).
No target carries a KEYTYPE PRIMARY KEY in the XML, so the comparison key is every column
in target-definition order. rows in = total rows across the 11 SRC tables (27,263).

| output | rows in | legacy rows | new rows | mismatches | legacy checksum | new checksum |
|---|---|---|---|---|---|---|
| NWK_ACTION_PRIMARY_TBL | 27263 | 2574 | 2574 | 0 | 3652837735094350658 | 3652837735094350658 |
| NWK_ACTION_SECONDARY_TBL | 27263 | 2574 | 2574 | 0 | 3707054462389897087 | 3707054462389897087 |
| EHRP_RECS_TRACKING_TBL | 27263 | 2574 | 2574 | 0 | 591706083303637605 | 591706083303637605 |

Keyed full-outer-join hash mismatches, EXCEPT both directions and multiset difference are 0 for all three.

Explained mismatches: none.

## Declared semantics (both sides)
- The three marts are `table` materializations (re-created on every `dbt build`); the session is a Normal load with source rows treated as Insert and no upsert, so a rerun replaces the SF targets the same way the loader replaces SRC/LEGACY.
- SQ: inner join PS_GVT_JOB x NWK_NEW_EHRP_ACTIONS_TBL on EMPLID, EMPL_RCD, EFFDT, EFFSEQ; 3,090 joined rows
  (150 job keys and 60 NWK keys drop out; 40 duplicated NWK keys multiply rows).
- The SQ orders only by EFFDT; ties are undefined in Oracle, so both sides break ties by EMPLID, EMPL_RCD, EFFSEQ.
  EVENT_ID = EHRP_SEQ_NUMBER(year of EFFDT) + position in the contiguous year run (variable-port state).
- Lookups are "Use Any Value"; both sides pick the matching row with the smallest output-port values in port order (NULLs last). No match returns NULL.
- SYSDATE is pinned to the run date. AS_OF_DAY = date rendered with the session format `MM/DD/YYYY HH24:MI:SS.US`, truncated to varchar2(10).
- High precision is off (decimal ports are doubles; port scale not applied); the Oracle writer rounds to target scale, truncates strings to target length and stores '' as NULL.
- Rows with NULL in a NOT NULL target column are rejected per target: 516 rows per target (year 2022 has no SEQUENCE_NUM_TBL row, so EVENT_ID / BIIS_EVENT_ID is NULL).
- Shared between the two sides: only XML metadata parsing (`snowflake/mapping.py`: column types and connector wiring). Expression logic is written separately in Python and in SQL.

## Rerun idempotency (double-load root cause and proof)

Before: SF `NWK_ACTION_PRIMARY_TBL` and `EHRP_RECS_TRACKING_TBL` were observed at 5,148 rows each,
while the three LEGACY tables and SF `NWK_ACTION_SECONDARY_TBL` held 2,574.

Root cause (from `information_schema.query_history_by_warehouse`, see `rerun/before_sf_write_audit.json`):
the extra rows came from dbt itself, not from a loader, post-hook or helper script.
A review fix had switched the marts to `incremental` / `append`. Every INSERT into the SF targets
carries the dbt query comment and is dbt's append statement (`insert into <mart> (...) select ... from <mart>__dbt_tmp`).
Each plain `dbt build` appended to the previous result:
- 21:16:44-45 UTC (13:16 PT): appended 2,574 to PRIMARY, TRACKING and also SECONDARY (5,148 each until the 21:17:13 CTAS re-created them).
- 21:26:03-08 UTC (13:26 PT): a build with a new `run_date` appended 2,574 to PRIMARY and TRACKING. SECONDARY has no load-date
  column, so its batch was identical to the stored rows; the `MINUS {{ this }}` guard dropped it (0 rows). The 21:26:36 CTAS re-created all three.
- Non-dbt statements writing the SF targets: 0. The loader writes only SRC and LEGACY, using CREATE OR REPLACE TABLE plus INSERT.

Fix: the marts are `table` materializations again, so every `dbt build` re-creates them with CREATE OR REPLACE.
That matches the session `s_m_EHRP2BIIS_UPDATE`: Target load type = Normal, Treat source rows as = Insert,
Truncate target table option = NO, Update else Insert = NO, Update as Insert = NO. No upsert is configured, so no MERGE is used.
The SRC and LEGACY loaders already replace their tables. The SF schema is written only by `dbt build`.

Proof: the whole dual run was executed twice back to back: generate, generate_models, pc_executor, load src, load legacy, dbt build (no `--full-refresh`), parity.
Counts after each run are in `rerun/counts_run1.json` and `rerun/counts_run2.json` (`rerun_counts.py`):

| schema | table | before | after run 1 | after run 2 |
|---|---|---|---|---|
| SRC | NWK_NEW_EHRP_ACTIONS_TBL | 3150 | 3150 | 3150 |
| SRC | PS_GVT_AWD_DATA | 2613 | 2613 | 2613 |
| SRC | PS_GVT_CITIZENSHIP | 2613 | 2613 | 2613 |
| SRC | PS_GVT_EE_DATA_TRK | 2614 | 2614 | 2614 |
| SRC | PS_GVT_EMPLOYMENT | 2613 | 2613 | 2613 |
| SRC | PS_GVT_JOB | 3200 | 3200 | 3200 |
| SRC | PS_GVT_PERS_DATA | 2613 | 2613 | 2613 |
| SRC | PS_GVT_PERS_NID | 2613 | 2613 | 2613 |
| SRC | PS_HE_FILL_POS | 2613 | 2613 | 2613 |
| SRC | PS_JPM_JP_ITEMS | 2615 | 2615 | 2615 |
| SRC | SEQUENCE_NUM_TBL | 6 | 6 | 6 |
| LEGACY | EHRP_RECS_TRACKING_TBL | 2574 | 2574 | 2574 |
| LEGACY | NWK_ACTION_PRIMARY_TBL | 2574 | 2574 | 2574 |
| LEGACY | NWK_ACTION_SECONDARY_TBL | 2574 | 2574 | 2574 |
| SF | EHRP_RECS_TRACKING_TBL | 5148 | 2574 | 2574 |
| SF | NWK_ACTION_PRIMARY_TBL | 5148 | 2574 | 2574 |
| SF | NWK_ACTION_SECONDARY_TBL | 2574 (5148 briefly at 21:16:45 UTC) | 2574 | 2574 |

"Before" is the observed double-loaded state. The SRC/LEGACY values are the counts captured just before the reruns.
Query history since the reruns started (21:31:33 UTC, `rerun/after_sf_write_audit.json`, `sf_write_audit.py`) shows only
dbt CREATE_TABLE_AS_SELECT on the SF targets: 6 statements (3 per run, 2,574 rows each). INSERT statements: 0. Non-dbt statements: 0.
Parity after run 2 matches the table above: 0 mismatches, and both checksums are unchanged.
