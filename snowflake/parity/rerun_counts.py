"""Row counts of every base table in the job's SRC, LEGACY and SF schemas (rerun idempotency evidence)."""
import argparse, json, os
import snowflake.connector
from cryptography.hazmat.primitives import serialization

DB = "SFNFR_20261104"
SCHEMAS = {"SRC": "TS_NWK_SRC_SFNFR_20261104", "LEGACY": "TS_NWK_LEGACY_SFNFR_20261104", "SF": "TS_NWK_SF_SFNFR_20261104"}


def connect():
    key = serialization.load_pem_private_key(os.environ["SFNFR_PRIVATE_KEY"].encode(), password=None)
    der = key.private_bytes(serialization.Encoding.DER, serialization.PrivateFormat.PKCS8, serialization.NoEncryption())
    return snowflake.connector.connect(
        account=os.environ["SFNFR_ACCOUNT"], user=os.environ["SFNFR_USER"], role=os.environ["SFNFR_ROLE"],
        private_key=der, authenticator="SNOWFLAKE_JWT", warehouse="WH_TS_NWK", database=DB)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--label", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()
    cur = connect().cursor()
    rows = []
    for role, schema in SCHEMAS.items():
        cur.execute(f"select table_name from {DB}.information_schema.tables "
                    f"where table_schema = '{schema}' and table_type = 'BASE TABLE' order by table_name")
        for (table,) in cur.fetchall():
            cur.execute(f'select count(*) from {DB}."{schema}"."{table}"')
            rows.append({"role": role, "fqn": f"{DB}.{schema}.{table}", "table": table, "rows": cur.fetchone()[0]})
    cur.execute("select to_char(convert_timezone('UTC', current_timestamp()), 'YYYY-MM-DD HH24:MI:SS')")
    result = {"label": args.label, "captured_utc": cur.fetchone()[0], "tables": rows}
    with open(args.out, "w") as f:
        json.dump(result, f, indent=1)
    for r in rows:
        print(args.label, r["role"], r["table"], r["rows"])


if __name__ == "__main__":
    main()
