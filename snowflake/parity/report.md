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
