#!/usr/bin/env python3
"""Attributed dual run. All generated data, results and logs must live outside git.

Comparison uses fetched typed values, not CSV text. A row is a JSON array of
tagged scalars (unambiguous framing). NULL is ["null"], strings remain verbatim;
fixed-point numbers use non-exponential decimal with insignificant trailing zeros
removed; floats use Python's exact float.hex (including signed zero, inf/nan).
Dates are ISO; timestamps have six fractional digits, timezone offsets retained.
SHA256 is over sorted row SHA256 hex lines, repeated once per occurrence.
Counters preserve duplicate multiplicity in both directions.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import importlib.util
import json
import os
import re
import subprocess
import sys
from collections import Counter
from collections.abc import Mapping, Sequence
from datetime import date, datetime, time
from decimal import Decimal
from pathlib import Path
from threading import RLock
from typing import Any
from unittest.mock import patch

from cryptography.hazmat.primitives import serialization

ROOT = Path(__file__).resolve().parents[1]
REPO = ROOT.parent
sys.path.insert(0, str(ROOT / "attribution"))
sys.path.insert(0, str(ROOT))
import sf_attribution as sf  # noqa: E402
from mapping import sql_type  # noqa: E402

EP = sf.ENDPOINTS["cs_mig_pc_staging"]
DATABASE = sf.database_name("mig_pc")
WAREHOUSE = sf.warehouse_name("mig_pc_staging")
MONITOR = sf.resource_monitor_name("mig_pc")
TABLES = ("NWK_ACTION_PRIMARY_TBL", "NWK_ACTION_SECONDARY_TBL", "EHRP_RECS_TRACKING_TBL")
PROJECT = ROOT / "dbt/ehrp2biis_stage_load"
LOAD_CHUNK_SIZE = 5000


def outside(path: Path) -> Path:
    path = path.expanduser().resolve()
    if path == REPO or REPO in path.parents:
        raise ValueError("generated files must be outside the repository")
    return path


def head_commit(*, require_origin: bool = True) -> str:
    commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=REPO, text=True).strip()
    if not re.fullmatch(r"[0-9a-f]{40}", commit):
        raise ValueError("HEAD must be a full commit SHA")
    if require_origin:
        refs = subprocess.check_output(
            ["git", "for-each-ref", f"--contains={commit}", "--format=%(refname)", "refs/remotes/origin"],
            cwd=REPO, text=True,
        )
        if not refs.strip():
            raise ValueError("HEAD must exist on origin before any Snowflake connection (fetch/push first)")
    return commit


def pem_to_der(pem: str) -> bytes:
    key = serialization.load_pem_private_key(pem.encode(), password=None)
    return key.private_bytes(serialization.Encoding.DER, serialization.PrivateFormat.PKCS8,
                             serialization.NoEncryption())


def parameters(env: Mapping[str, str], commit: str, run_id: str) -> dict[str, Any]:
    params = sf.connection_params(
        EP, phase="dev", account=env["SNOWFLAKE_EXT_ACCOUNT"], private_key_file="in-memory",
        commit=commit, run_id=run_id, session_url=env["DEVIN_SESSION_URL"], role="DEVIN_EXT_ROLE",
        schema="EHRP2BIIS_SRC",
    )
    params.pop("private_key_file")
    params.update(private_key=pem_to_der(env["SNOWFLAKE_EXT_PRIVATE_KEY"]),
                  user=env["SNOWFLAKE_EXT_USER"], warehouse=WAREHOUSE)
    return params


def setup_sql() -> list[str]:
    comment = sf.sql_string(sf.external_comment(csid=EP.csid))
    return [
        f"CREATE WAREHOUSE IF NOT EXISTS {WAREHOUSE} WAREHOUSE_SIZE = 'XSMALL' "
        f"AUTO_SUSPEND = 60 AUTO_RESUME = TRUE INITIALLY_SUSPENDED = TRUE COMMENT = {comment}",
        f"ALTER WAREHOUSE {WAREHOUSE} SET TAG {sf.TAG_FQN} = '{EP.csid}'",
        f"SHOW WAREHOUSES LIKE '{WAREHOUSE}'",
    ]


def object_sql() -> list[str]:
    comment = sf.sql_string(sf.external_comment(csid=EP.csid))
    return [
        f"CREATE DATABASE IF NOT EXISTS {DATABASE} COMMENT = {comment}",
        *[f"CREATE SCHEMA IF NOT EXISTS {DATABASE}.EHRP2BIIS_{s} COMMENT = {comment}"
          for s in ("SRC", "LEGACY", "TGT")],
    ]


class RunLog:
    def __init__(self, path: Path, run_id: str, commit: str):
        self.path = outside(path)
        self.lock = RLock()
        self.data: dict[str, Any] = {"run_id": run_id, "commit": commit, "queries": [],
                                     "application": sf.APPLICATION,
                                     "application_registration": sf.APPLICATION_REGISTRATION}
        self.save()

    def save(self) -> None:
        with self.lock:
            self.path.parent.mkdir(parents=True, exist_ok=True)
            self.path.write_text(json.dumps(self.data, indent=2, default=str) + "\n")

    def execute(self, conn: Any, sql: str, params: Any = None, *, many: bool = False) -> Any:
        cursor = conn.cursor()
        try:
            if many:
                cursor.executemany(sql, params)
            else:
                cursor.execute(sql, params)
        except Exception as exc:
            self.data["queries"].append({"sql": sql, "query_id": getattr(exc, "sfqid", None) or cursor.sfqid,
                                          "error": str(exc)})
            self.save()
            raise
        else:
            self.data["queries"].append({"sql": sql, "query_id": cursor.sfqid})
            self.save()
        return cursor


def warehouse_state(cursor: Any) -> dict[str, Any]:
    names = [column[0].lower() for column in cursor.description]
    records = [dict(zip(names, row)) for row in cursor.fetchall()]
    return next((row for row in records if row.get("name") == WAREHOUSE), {})


def check_monitor(conn: Any, log: RunLog) -> None:
    cursor = log.execute(conn, f"SHOW WAREHOUSES LIKE '{WAREHOUSE}'")
    state = warehouse_state(cursor)
    log.data["warehouse"] = state
    log.save()
    if state.get("resource_monitor") != MONITOR:
        raise RuntimeError(f"Refusing compute: {WAREHOUSE} must be attached to {MONITOR}; "
                           f"observed {state.get('resource_monitor')!r}. Ask ACCOUNTADMIN to attach it.")


def setup(conn: Any, log: RunLog) -> None:
    for sql in setup_sql():
        cursor = log.execute(conn, sql)
    state = warehouse_state(cursor)
    log.data["warehouse"] = state
    log.save()
    print(json.dumps({"warehouse": WAREHOUSE, "state": state.get("state"),
                      "resource_monitor": state.get("resource_monitor")}))
    if state.get("resource_monitor") == MONITOR:
        print(f"Resource monitor assignment verified: {MONITOR}")
    else:
        print(f"The control connection must attach resource monitor {MONITOR} to {WAREHOUSE}.")
    if state.get("state") != "SUSPENDED":
        raise RuntimeError("Setup requires warehouse state=SUSPENDED; no compute was requested")


def create_objects(conn: Any, log: RunLog) -> None:
    for index, sql in enumerate(object_sql()):
        cursor = log.execute(conn, sql)
        if index == 0:
            status = str(cursor.fetchone()[0]).lower()
            if "already exists" not in status and "successfully created" in status:
                log.execute(conn, f"ALTER DATABASE {DATABASE} SET TAG {sf.TAG_FQN} = '{EP.csid}'")


def module(path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(path.stem, path)
    assert spec and spec.loader
    loaded = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(loaded)
    return loaded


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def freeze(directory: Path) -> dict[str, Any]:
    directory = outside(directory)
    directory.mkdir(parents=True, exist_ok=True)
    generator = module(ROOT / "synthetic/generate.py")
    generator.DATA_DIR = directory
    generator.main()
    files = {p.name: sha(p) for p in sorted(directory.iterdir())
             if p.is_file() and p.name != "manifest.json"}
    sources = [ROOT / "legacy/pc_executor.py", ROOT / "synthetic/generate.py", ROOT / "mapping.py",
               ROOT / "dbt/generate_models.py",
               *sorted((PROJECT / "models").rglob("*.sql"))]
    manifest = {
        "inputs": files,
        "input_digest": hashlib.sha256("".join(f"{name} {digest}\n" for name, digest in sorted(files.items())).encode()).hexdigest(),
        "xml_sha256": sha(REPO / "XML/EHRP2BIIS_UPDATE"),
        "transformations": {str(p.relative_to(REPO)): sha(p) for p in sources},
        "source_commit": head_commit(require_origin=False), "business_date": "2026-11-04",
        "seed": generator.SEED, "row_counts": json.loads((directory / "schema.json").read_text())["tables"],
    }
    (directory / "manifest.json").write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    return manifest


def verify_frozen(directory: Path) -> dict[str, Any]:
    manifest = json.loads((directory / "manifest.json").read_text())
    for name, digest in manifest["inputs"].items():
        if sha(directory / name) != digest:
            raise ValueError(f"frozen input changed: {name}")
    return manifest


def load(conn: Any, log: RunLog, directory: Path, *, legacy: bool = False,
         frozen: Path | None = None) -> None:
    schema = json.loads(((frozen or directory) / "schema.json").read_text())
    tables = schema["targets"] if legacy else {
        **schema["sources"], **{k: v["columns"] for k, v in schema["lookups"].items()}}
    target = "EHRP2BIIS_LEGACY" if legacy else "EHRP2BIIS_SRC"
    comment = sf.external_comment(csid=EP.csid, purpose=(
        "pc_executor emulator, not a PowerCenter run" if legacy else "frozen synthetic input"))
    for table, fields in tables.items():
        fqn = f'{DATABASE}.{target}."{table}"'
        columns = ", ".join(f'"{f["name"]}" {sql_type(f)}' for f in fields)
        log.execute(conn, f"CREATE OR REPLACE TABLE {fqn} ({columns}) COMMENT = {sf.sql_string(comment)}")
        with (directory / f"{table}.csv").open(newline="") as stream:
            rows = list(csv.DictReader(stream))
        insert = f"INSERT INTO {fqn} VALUES ({', '.join(['%s'] * len(fields))})"
        # Both accepted CSV writers encode NULL as empty; the accepted loader also
        # maps literal empty strings to NULL, preserving spaces and strings like NA.
        values = [tuple(None if row[f["name"]] == "" else row[f["name"]] for f in fields)
                  for row in rows]
        for offset in range(0, len(values), LOAD_CHUNK_SIZE):
            log.execute(conn, insert, values[offset:offset + LOAD_CHUNK_SIZE], many=True)


def canonical(value: Any) -> list[str]:
    if value is None:
        return ["null"]
    if isinstance(value, bool):
        return ["bool", str(value).lower()]
    if isinstance(value, (int, Decimal)):
        number = format(Decimal(value), "f")
        if "." in number:
            number = number.rstrip("0").rstrip(".")
        return ["number", "0" if Decimal(value) == 0 else number]
    if isinstance(value, float):
        return ["float", value.hex()]
    if isinstance(value, datetime):
        return ["timestamp", value.isoformat(timespec="microseconds")]
    if isinstance(value, date):
        return ["date", value.isoformat()]
    if isinstance(value, time):
        return ["time", value.isoformat(timespec="microseconds")]
    if isinstance(value, bytes):
        return ["binary", value.hex()]
    if isinstance(value, str):
        return ["string", value]
    raise TypeError(f"unsupported canonical type: {type(value).__name__}")


def multiset(rows: Sequence[Sequence[Any]]) -> Counter[str]:
    return Counter(json.dumps([canonical(v) for v in row], separators=(",", ":"), ensure_ascii=False)
                   for row in rows)


def checksum(rows: Counter[str]) -> str:
    hashes = sorted(hashlib.sha256(row.encode()).hexdigest() for row, n in rows.items() for _ in range(n))
    return hashlib.sha256("".join(h + "\n" for h in hashes).encode()).hexdigest()


def compare(conn: Any, log: RunLog) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for table in TABLES:
        sides: list[dict[str, Any]] = []
        for schema in ("EHRP2BIIS_LEGACY", "EHRP2BIIS_TGT"):
            columns = log.execute(conn, f"SELECT COLUMN_NAME, DATA_TYPE, NUMERIC_PRECISION, NUMERIC_SCALE, "
                                  f"CHARACTER_MAXIMUM_LENGTH, DATETIME_PRECISION FROM {DATABASE}.INFORMATION_SCHEMA.COLUMNS "
                                  "WHERE TABLE_SCHEMA = %s AND TABLE_NAME = %s ORDER BY ORDINAL_POSITION",
                                  (schema, table)).fetchall()
            if not columns:
                sides.append({"columns": [], "error": "table missing or inaccessible"})
                continue
            count = log.execute(conn, f'SELECT COUNT(*) FROM {DATABASE}.{schema}."{table}"').fetchone()[0]
            rows = multiset(log.execute(conn, f'SELECT * FROM {DATABASE}.{schema}."{table}"').fetchall())
            sides.append({"columns": columns, "count": count, "checksum": checksum(rows), "rows": rows})
        left, right = sides
        entry = {"legacy": {k: v for k, v in left.items() if k != "rows"},
                 "target": {k: v for k, v in right.items() if k != "rows"},
                 "columns_match": bool(left["columns"]) and left["columns"] == right["columns"]}
        if "rows" in left and "rows" in right:
            entry.update(legacy_not_target=dict(left["rows"] - right["rows"]),
                         target_not_legacy=dict(right["rows"] - left["rows"]))
        result[table] = entry
    return {"tables": result, "queries": log.data["queries"]}


def dbt_build(params: dict[str, Any], work: Path, log: RunLog) -> None:
    from dbt.cli.main import dbtRunner
    import snowflake.connector
    from snowflake.connector.cursor import SnowflakeCursor

    os.environ.update(SFEXT_DATABASE=DATABASE, SFEXT_WAREHOUSE=WAREHOUSE,
                      SFEXT_QUERY_TAG=params["session_parameters"]["QUERY_TAG"],
                      DBT_ENV_SECRET_SFEXT_PRIVATE_KEY=os.environ["SNOWFLAKE_EXT_PRIVATE_KEY"])
    original_connect = snowflake.connector.connect
    original_execute = SnowflakeCursor.execute

    def connect(**kwargs: Any) -> Any:
        kwargs.update(params)
        kwargs["schema"] = "EHRP2BIIS_TGT"
        return original_connect(**kwargs)

    def execute(cursor: Any, command: str, *args: Any, **kwargs: Any) -> Any:
        try:
            return original_execute(cursor, command, *args, **kwargs)
        finally:
            log.data["queries"].append({"sql": command, "query_id": cursor.sfqid})
            log.save()

    with patch.object(snowflake.connector, "connect", connect), patch.object(SnowflakeCursor, "execute", execute):
        result = dbtRunner().invoke(["build", "--project-dir", str(PROJECT), "--profiles-dir", str(PROJECT),
                                    "--target-path", str(work / "dbt-target"), "--log-path", str(work / "dbt-logs")])
    if not result.success:
        raise RuntimeError("dbt build failed")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("setup", "check-monitor", "create-objects", "freeze", "load-src", "legacy", "dbt", "compare"))
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--directory", type=Path, default=Path.home() / "work/ehrp2biis_frozen")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--log", type=Path, default=Path.home() / "work/ehrp2biis_run.json")
    args = parser.parse_args()
    if args.output is None:
        args.output = Path.home() / "work" / (
            "ehrp2biis_legacy" if args.command == "legacy" else "ehrp2biis_compare.json")
    if args.output.expanduser().resolve() == args.log.expanduser().resolve():
        parser.error("--output and --log must resolve to different paths")
    return args


def main() -> None:
    args = parse_args()
    directory = outside(args.directory)
    if args.command == "freeze":
        print("input_digest=" + freeze(directory)["input_digest"])
        return
    if args.dry_run:
        if args.command != "setup":
            raise ValueError("--dry-run applies to setup only")
        print(";\n".join(setup_sql()) + ";")
        return
    commit = head_commit()
    run_id = sf.make_run_id("mig_pc", "dev")
    params = parameters(os.environ, commit, run_id)
    log = RunLog(args.log, run_id, commit)
    import snowflake.connector

    # Begin metadata-only, even for compute commands, until the monitor guard passes.
    connect_params = dict(params)
    for key in ("warehouse", "database", "schema"):
        connect_params.pop(key)
    conn = snowflake.connector.connect(**connect_params)
    try:
        if args.command == "setup":
            setup(conn, log)
            return
        check_monitor(conn, log)
        if args.command == "check-monitor":
            return
        if args.command == "create-objects":
            create_objects(conn, log)
            return
        log.execute(conn, f"USE WAREHOUSE {WAREHOUSE}")
        if args.command in ("load-src", "legacy"):
            verify_frozen(directory)
            if args.command == "legacy":
                output = outside(args.output)
                module(ROOT / "legacy/pc_executor.py").run(directory, output, date(2026, 11, 4))
                load(conn, log, output, legacy=True, frozen=directory)
            else:
                load(conn, log, directory)
        elif args.command == "dbt":
            dbt_build(params, outside(args.log).parent, log)
        elif args.command == "compare":
            output = outside(args.output)
            output.parent.mkdir(parents=True, exist_ok=True)
            output.write_text(json.dumps(compare(conn, log), indent=2) + "\n")
    finally:
        conn.close()


if __name__ == "__main__":
    main()
