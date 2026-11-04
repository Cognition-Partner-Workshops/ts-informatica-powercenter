"""Dual-run parity for ts_nwk_stage_load (LEGACY vs SF), canonical row form.

canonical = target columns in LEGACY target order joined by '|':
  NULL -> '\\N'; numbers -> to_varchar(round(x::number(38,6), 6));
  dates -> 'YYYY-MM-DD'; timestamps -> 'YYYY-MM-DD HH24:MI:SS.FF6'; strings -> trim(x).
row hash = md5(canonical); checksum = hash_agg(canonical) + count(*).
row diff = keyed full outer join on the business key comparing row hashes (no target
has KEYTYPE PRIMARY KEY, so the key is all columns in target order) + multiset EXCEPT
both directions on the canonical string.
"""
import argparse, json, os, sys
from pathlib import Path

import snowflake.connector
from cryptography.hazmat.primitives import serialization

DB = "SFNFR_20261104"
LEGACY = "TS_NWK_LEGACY_SFNFR_20261104"
SF = "TS_NWK_SF_SFNFR_20261104"
SRC = "TS_NWK_SRC_SFNFR_20261104"
TABLES = ["NWK_ACTION_PRIMARY_TBL", "NWK_ACTION_SECONDARY_TBL", "EHRP_RECS_TRACKING_TBL"]


def connect():
    key = serialization.load_pem_private_key(os.environ["SFNFR_PRIVATE_KEY"].encode(), password=None)
    der = key.private_bytes(serialization.Encoding.DER, serialization.PrivateFormat.PKCS8,
                            serialization.NoEncryption())
    return snowflake.connector.connect(
        account=os.environ["SFNFR_ACCOUNT"], user=os.environ["SFNFR_USER"], role=os.environ["SFNFR_ROLE"],
        private_key=der, authenticator="SNOWFLAKE_JWT", warehouse="WH_TS_NWK", database=DB)


def q(cur, sql):
    cur.execute(sql)
    return cur.fetchall()


def columns(cur, schema, table):
    return q(cur, f"""select column_name, data_type from {DB}.information_schema.columns
                      where table_schema='{schema}' and table_name='{table}' order by ordinal_position""")


def canon_expr(cols):
    parts = []
    for name, dtype in cols:
        c = f'"{name}"'
        if dtype in ("NUMBER", "FLOAT", "DECIMAL", "INTEGER"):
            v = f"to_varchar(round({c}::number(38,6), 6))"
        elif dtype == "DATE":
            v = f"to_char({c}, 'YYYY-MM-DD')"
        elif dtype.startswith("TIMESTAMP"):
            v = f"to_char({c}, 'YYYY-MM-DD HH24:MI:SS.FF6')"
        else:
            v = f"trim({c})"
        parts.append(f"coalesce({v}, '\\\\N')")
    return " || '|' || ".join(parts)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=str(Path(__file__).resolve().parent))
    args = ap.parse_args()
    con = connect()
    cur = con.cursor()
    src_tables = [r[0] for r in q(cur, f"select table_name from {DB}.information_schema.tables "
                                       f"where table_schema='{SRC}' and table_type='BASE TABLE' order by 1")]
    rows_in_by_table = {t: q(cur, f'select count(*) from {DB}.{SRC}."{t}"')[0][0] for t in src_tables}
    rows_in = sum(rows_in_by_table.values())
    results = []
    for t in TABLES:
        lcols = columns(cur, LEGACY, t)
        ncols = columns(cur, SF, t)
        if [c[0] for c in lcols] != [c[0] for c in ncols]:
            sys.exit(f"column order/name mismatch for {t}")
        key_cols = [c[0] for c in lcols]
        # canonical expression built per side from that side's own column types
        lexpr, nexpr = canon_expr(lcols), canon_expr(ncols)
        L = f'{DB}.{LEGACY}."{t}"'
        N = f'{DB}.{SF}."{t}"'
        lc, lck = q(cur, f"select count(*), to_varchar(hash_agg({lexpr})) from {L}")[0]
        nc, nck = q(cur, f"select count(*), to_varchar(hash_agg({nexpr})) from {N}")[0]
        key_l = " || '|' || ".join(f"coalesce(to_varchar(\"{k}\"), '\\\\N')" for k in key_cols)
        # keyed full outer join on business key (all columns), occurrence-numbered for duplicate keys
        keyed = q(cur, f"""
            with l as (select md5({lexpr}) h, {key_l} k from {L}),
                 n as (select md5({nexpr}) h, {key_l} k from {N}),
                 l2 as (select k, h, row_number() over (partition by k order by h) o from l),
                 n2 as (select k, h, row_number() over (partition by k order by h) o from n)
            select count(*) from l2 full outer join n2 on l2.k = n2.k and l2.o = n2.o
            where l2.h is distinct from n2.h""")[0][0]
        l_minus_n = q(cur, f"select count(*) from (select {lexpr} c from {L} except select {nexpr} c from {N})")[0][0]
        n_minus_l = q(cur, f"select count(*) from (select {nexpr} c from {N} except select {lexpr} c from {L})")[0][0]
        # multiset difference (duplicate-aware)
        mset = q(cur, f"""
            with l as (select {lexpr} c, count(*) n from {L} group by 1),
                 r as (select {nexpr} c, count(*) n from {N} group by 1)
            select coalesce(sum(abs(coalesce(l.n,0) - coalesce(r.n,0))), 0)
            from l full outer join r on l.c = r.c where coalesce(l.n,0) <> coalesce(r.n,0)""")[0][0]
        results.append(dict(table=t, legacy_fqn=f"{DB}.{LEGACY}.{t}", new_fqn=f"{DB}.{SF}.{t}",
                            key_columns=key_cols, rows_in=rows_in, legacy_rows=lc, new_rows=nc,
                            mismatches=int(max(keyed, mset)), keyed_hash_mismatches=int(keyed),
                            except_legacy_minus_new=int(l_minus_n), except_new_minus_legacy=int(n_minus_l),
                            multiset_diff_rows=int(mset), legacy_checksum=lck, new_checksum=nck))
    out = Path(args.out)
    (out / "parity_results.json").write_text(json.dumps(
        dict(src_rows=rows_in_by_table, rows_in=rows_in, outputs=results), indent=2) + "\n")
    lines = ["| output | rows in | legacy rows | new rows | mismatches | legacy checksum | new checksum |",
             "|---|---|---|---|---|---|---|"]
    for r in results:
        lines.append(f"| {r['table']} | {r['rows_in']} | {r['legacy_rows']} | {r['new_rows']} | {r['mismatches']} "
                     f"| {r['legacy_checksum']} | {r['new_checksum']} |")
    (out / "parity_table.md").write_text("\n".join(lines) + "\n")
    print("\n".join(lines))
    for r in results:
        print(r["table"], "keyed", r["keyed_hash_mismatches"], "L-N", r["except_legacy_minus_new"],
              "N-L", r["except_new_minus_legacy"], "multiset", r["multiset_diff_rows"])


if __name__ == "__main__":
    main()
