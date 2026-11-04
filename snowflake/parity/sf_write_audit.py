"""List every successful DML/CTAS against the SF schema's NWK_/EHRP_ targets on WH_TS_NWK since a UTC time,
classifying each statement as dbt-issued (dbt query comment) or not."""
import argparse, datetime, json, os
import snowflake.connector
from cryptography.hazmat.primitives import serialization

SF = "TS_NWK_SF_SFNFR_20261104"


def connect():
    key = serialization.load_pem_private_key(os.environ["SFNFR_PRIVATE_KEY"].encode(), password=None)
    der = key.private_bytes(serialization.Encoding.DER, serialization.PrivateFormat.PKCS8, serialization.NoEncryption())
    return snowflake.connector.connect(
        account=os.environ["SFNFR_ACCOUNT"], user=os.environ["SFNFR_USER"], role=os.environ["SFNFR_ROLE"],
        private_key=der, authenticator="SNOWFLAKE_JWT", warehouse="WH_TS_NWK", database="SFNFR_20261104")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--since-utc", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()
    since = datetime.datetime.strptime(args.since_utc, "%Y-%m-%d %H:%M:%S")
    cur = connect().cursor()
    cur.execute(f"""
select to_char(convert_timezone('UTC', start_time), 'YYYY-MM-DD HH24:MI:SS') as start_utc, query_type, rows_inserted,
       case when contains(query_text, 'NWK_ACTION_PRIMARY_TBL') then 'NWK_ACTION_PRIMARY_TBL'
            when contains(query_text, 'NWK_ACTION_SECONDARY_TBL') then 'NWK_ACTION_SECONDARY_TBL'
            when contains(query_text, 'EHRP_RECS_TRACKING_TBL') then 'EHRP_RECS_TRACKING_TBL' end as target,
       contains(query_text, '"app": "dbt"') as dbt_issued,
       contains(lower(query_text), '__dbt_tmp') as reads_dbt_tmp
from table(information_schema.query_history_by_warehouse(
       warehouse_name => 'WH_TS_NWK',
       end_time_range_start => to_timestamp_ltz(%(since)s, 'YYYY-MM-DD HH24:MI:SS TZH:TZM'),
       result_limit => 10000))
where execution_status = 'SUCCESS'
  and query_type in ('INSERT', 'CREATE_TABLE_AS_SELECT', 'MERGE', 'DELETE', 'UPDATE', 'TRUNCATE_TABLE', 'COPY')
  and contains(upper(query_text), '{SF}.')
  and (contains(query_text, 'NWK_ACTION_PRIMARY_TBL') or contains(query_text, 'NWK_ACTION_SECONDARY_TBL')
       or contains(query_text, 'EHRP_RECS_TRACKING_TBL'))
order by start_time""", {"since": since.strftime("%Y-%m-%d %H:%M:%S +00:00")})
    cols = [d[0].lower() for d in cur.description]
    rows = [dict(zip(cols, r)) for r in cur.fetchall()]
    with open(args.out, "w") as f:
        json.dump({"since_utc": args.since_utc, "statements": rows}, f, indent=1, default=str)
    for r in rows:
        print(r["start_utc"], r["query_type"], r["target"], r["rows_inserted"], "dbt" if r["dbt_issued"] else "NON-DBT",
              "reads __dbt_tmp" if r["reads_dbt_tmp"] else "")
    print("INSERT statements:", sum(r["query_type"] == "INSERT" for r in rows),
          "non-dbt statements:", sum(not r["dbt_issued"] for r in rows))


if __name__ == "__main__":
    main()
