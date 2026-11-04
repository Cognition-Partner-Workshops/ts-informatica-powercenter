#!/usr/bin/env python3
"""Load synthetic source or independent legacy-result tables into scoped schemas."""

from __future__ import annotations

import argparse
import json
import os
import sys
from pathlib import Path
from typing import Any

import pandas as pd
import snowflake.connector
from cryptography.hazmat.primitives import serialization

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from mapping import sql_type


ROOT = Path(__file__).resolve().parents[1]
DATABASE = "SFNFR_20261104"
WAREHOUSE = "WH_TS_NWK"
SCHEMAS = {
    "src": "TS_NWK_SRC_SFNFR_20261104",
    "legacy": "TS_NWK_LEGACY_SFNFR_20261104",
}


def _private_key_bytes() -> bytes:
    value = os.environ["SFNFR_PRIVATE_KEY"]
    key = serialization.load_pem_private_key(value.encode("utf-8"), password=None)
    return key.private_bytes(
        encoding=serialization.Encoding.DER,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=serialization.NoEncryption(),
    )


def _connect() -> snowflake.connector.SnowflakeConnection:
    return snowflake.connector.connect(
        account=os.environ["SFNFR_ACCOUNT"],
        user=os.environ["SFNFR_USER"],
        role=os.environ["SFNFR_ROLE"],
        warehouse=WAREHOUSE,
        database=DATABASE,
        private_key=_private_key_bytes(),
    )


def _create_table(
    cursor: snowflake.connector.cursor.SnowflakeCursor,
    schema: str,
    table: str,
    fields: list[dict[str, Any]],
) -> None:
    definitions = []
    for field in fields:
        constraint = "" if field["nullable"] else " NOT NULL"
        definitions.append(
            f'"{field["name"]}" {sql_type(field)}{constraint}'
        )
    ddl = (
        f'CREATE OR REPLACE TABLE "{DATABASE}"."{schema}"."{table}" '
        f"({', '.join(definitions)})"
    )
    cursor.execute(ddl)


def _load_tables(kind: str, data_dir: Path, output_dir: Path) -> None:
    schema_data = json.loads((data_dir / "schema.json").read_text(encoding="utf-8"))
    if kind == "src":
        tables = {
            **schema_data["sources"],
            **{
                name: lookup["columns"]
                for name, lookup in schema_data["lookups"].items()
            },
        }
        input_dir = data_dir
    else:
        tables = schema_data["targets"]
        input_dir = output_dir
    snowflake_schema = SCHEMAS[kind]
    connection = _connect()
    try:
        cursor = connection.cursor()
        try:
            cursor.execute(f'CREATE SCHEMA IF NOT EXISTS "{DATABASE}"."{snowflake_schema}"')
            for table, fields in tables.items():
                _create_table(cursor, snowflake_schema, table, fields)
                frame = pd.read_csv(
                    input_dir / f"{table}.csv",
                    dtype=str,
                    keep_default_na=False,
                )
                frame = frame.reindex(columns=[field["name"] for field in fields])
                frame = frame.astype(object).replace("", None)
                if len(frame):
                    column_sql = ", ".join(f'"{field["name"]}"' for field in fields)
                    placeholders = ", ".join(["%s"] * len(fields))
                    insert_sql = (
                        f'INSERT INTO "{DATABASE}"."{snowflake_schema}"."{table}" '
                        f"({column_sql}) VALUES ({placeholders})"
                    )
                    values = list(frame.itertuples(index=False, name=None))
                    for offset in range(0, len(values), 500):
                        cursor.executemany(insert_sql, values[offset : offset + 500])
                    row_count = len(values)
                else:
                    row_count = 0
                print(f"{kind} {table}: rows={row_count}")
        finally:
            cursor.close()
    finally:
        connection.close()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="kind", required=True)
    source = subparsers.add_parser("src")
    source.add_argument("--data-dir", type=Path, default=ROOT / "synthetic" / "data")
    legacy = subparsers.add_parser("legacy")
    legacy.add_argument("--data-dir", type=Path, default=ROOT / "synthetic" / "data")
    legacy.add_argument("--output-dir", type=Path, default=ROOT / "legacy" / "output")
    args = parser.parse_args()
    _load_tables(args.kind, args.data_dir, getattr(args, "output_dir", ROOT / "legacy" / "output"))


if __name__ == "__main__":
    main()
