# EHRP2BIIS synthetic dbt migration

The run uses seed `20261104` and run date `2026-11-04`. The mapping XML is read at runtime for schemas, lookup ports, mapping instances, and connectors. Synthetic CSVs and executor output are written under ignored data/output directories.

From the repository root, regenerate and execute the local reference:

```sh
~/sfenv/bin/python snowflake/synthetic/generate.py
~/sfenv/bin/python snowflake/dbt/generate_models.py
~/sfenv/bin/python snowflake/legacy/pc_executor.py
```

For every Snowflake command below, bind the `SFNFR_*` org secrets in that `exec` call's environment without printing them:

```json
{
  "SFNFR_ACCOUNT": "secret:org:SFNFR_ACCOUNT",
  "SFNFR_USER": "secret:org:SFNFR_USER",
  "SFNFR_ROLE": "secret:org:SFNFR_ROLE",
  "SFNFR_PRIVATE_KEY": "secret:org:SFNFR_PRIVATE_KEY"
}
```

Load the synthetic sources, then the independent Python reference outputs:

```sh
~/sfenv/bin/python snowflake/load/load_snowflake.py src
~/sfenv/bin/python snowflake/load/load_snowflake.py legacy
```

Run the dbt build with the project-local profile:

```sh
DBT_PROFILES_DIR=snowflake/dbt/ehrp2biis_stage_load \
  ~/dbtenv/bin/dbt deps --project-dir snowflake/dbt/ehrp2biis_stage_load &&
DBT_PROFILES_DIR=snowflake/dbt/ehrp2biis_stage_load \
  ~/dbtenv/bin/dbt build --project-dir snowflake/dbt/ehrp2biis_stage_load --target sfnfr
```

The loader replaces only tables in `TS_NWK_SRC_SFNFR_20261104` and `TS_NWK_LEGACY_SFNFR_20261104`. dbt models write only to `TS_NWK_SF_SFNFR_20261104`; all use warehouse `WH_TS_NWK`. The mapping semantics are reimplemented locally and in SQL; no PowerCenter session is run.
The three dbt marts are `table` materializations: each `dbt build` re-creates them (CREATE OR REPLACE), which matches the session's Normal target load with source rows treated as Insert and no upsert. A rerun therefore replaces the SF targets, the same way the loader replaces the SRC and LEGACY tables. Only `dbt build` writes the SF schema.

The profile uses `snowflake_jwt` (key-pair JWT). If the Snowflake adapter rejects that authenticator setting, remove only the `authenticator` line from `profiles.yml` and rerun.

Recompute parity (canonical form, checksums, keyed + EXCEPT diff) into `snowflake/parity/`:

```sh
~/sfenv/bin/python snowflake/parity/parity.py
```

The PowerCenter wrappers `actstage_load` and `ehrp2biis_preload` call SQL*Plus scripts `action_stage_load` and `step01`, which are not in this repository; they were not reconstructed.

Rerun-idempotency evidence: after each full dual run, capture per-table counts and audit SF writes (same env binding):

```sh
~/sfenv/bin/python snowflake/parity/rerun_counts.py --label run1 --out snowflake/parity/rerun/counts_run1.json
~/sfenv/bin/python snowflake/parity/sf_write_audit.py --since-utc "<UTC start of the reruns>" --out snowflake/parity/rerun/after_sf_write_audit.json
```
