import importlib.util
import json
import re
import sys
from datetime import date, datetime
from decimal import Decimal
from pathlib import Path
from unittest.mock import Mock

import pytest
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import rsa

spec = importlib.util.spec_from_file_location("sfext_run", Path(__file__).with_name("run.py"))
run = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = run
spec.loader.exec_module(run)


def test_parameters():
    key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
    pem = key.private_bytes(serialization.Encoding.PEM, serialization.PrivateFormat.PKCS8,
                            serialization.NoEncryption()).decode()
    env = {"SNOWFLAKE_EXT_ACCOUNT": "account", "SNOWFLAKE_EXT_USER": "external",
           "SNOWFLAKE_EXT_PRIVATE_KEY": pem,
           "DEVIN_SESSION_URL": "https://app.devin.ai/sessions/" + "a" * 32}
    params = run.parameters(env, "a" * 40, run.sf.make_run_id("mig_pc", "dev"))
    assert "private_key_file" not in params
    assert params["user"] == "external"
    assert params["role"] == "DEVIN_EXT_ROLE"
    assert params["authenticator"] == "SNOWFLAKE_JWT"
    assert params["application"] == "Devin_Demo"
    assert params["warehouse"] == "WH_MIG_PC_STAGING"
    parsed = serialization.load_der_private_key(params["private_key"], None)
    assert parsed.private_numbers() == key.private_numbers()
    assert list(json.loads(params["session_parameters"]["QUERY_TAG"])) == [
        "csid", "workload", "phase", "commit", "run_id", "session_url"]


@pytest.mark.parametrize("pem", ["", "not a key"])
def test_bad_key(pem):
    with pytest.raises(ValueError):
        run.pem_to_der(pem)


def test_setup_order():
    sql = run.setup_sql()
    assert sql[0].startswith("CREATE WAREHOUSE IF NOT EXISTS WH_MIG_PC_STAGING")
    assert "INITIALLY_SUSPENDED = TRUE" in sql[0]
    assert "SET TAG" in sql[1]
    assert sql[2] == "SHOW WAREHOUSES LIKE 'WH_MIG_PC_STAGING'"
    assert len(sql) == 3
    assert not any(s.startswith(("USE ", "CREATE RESOURCE MONITOR")) for s in sql)
    log = Mock()
    log.data = {}
    log.execute.return_value.description = [("name",), ("state",), ("resource_monitor",)]
    log.execute.return_value.fetchall.return_value = [(run.WAREHOUSE, "SUSPENDED", None)]
    run.setup(Mock(), log)
    log.execute.return_value.fetchall.return_value = [(run.WAREHOUSE, "STARTED", None)]
    with pytest.raises(RuntimeError, match="SUSPENDED"):
        run.setup(Mock(), log)


@pytest.mark.parametrize("monitor,expected", [(run.MONITOR, "assignment verified"),
                                             (None, "control connection must attach"),
                                             ("OTHER", "control connection must attach")])
def test_setup_monitor_report(monitor, expected, capsys):
    log = Mock()
    log.data = {}
    log.execute.return_value.description = [("name",), ("state",), ("resource_monitor",)]
    log.execute.return_value.fetchall.return_value = [(run.WAREHOUSE, "SUSPENDED", monitor)]
    run.setup(Mock(), log)
    assert expected in capsys.readouterr().out
    assert [c.args[1] for c in log.execute.call_args_list] == run.setup_sql()


def test_database_ownership():
    for status, expected in [("Database successfully created.", True),
                             ("Database already exists, statement succeeded.", False)]:
        log = Mock()
        log.execute.return_value.fetchone.return_value = [status]
        run.create_objects(Mock(), log)
        statements = [c.args[1] for c in log.execute.call_args_list]
        assert any(s.startswith("ALTER DATABASE") for s in statements) == expected


@pytest.mark.parametrize("monitor", [None, "OTHER", run.MONITOR])
def test_monitor_guard(tmp_path, monitor):
    log = run.RunLog(tmp_path / "log.json", "run", "a" * 40)
    conn = Mock()
    cursor = conn.cursor.return_value
    cursor.sfqid = "show-query-id"
    cursor.description = [("name",), ("resource_monitor",)]
    cursor.fetchall.return_value = [(run.WAREHOUSE, monitor)]
    if monitor == run.MONITOR:
        run.check_monitor(conn, log)
    else:
        with pytest.raises(RuntimeError, match="Refusing compute"):
            run.check_monitor(conn, log)
    statements = [q["sql"] for q in log.data["queries"]]
    assert statements == [f"SHOW WAREHOUSES LIKE '{run.WAREHOUSE}'"]
    assert log.data["queries"][0]["query_id"] == "show-query-id"


def test_manifest_determinism(tmp_path, monkeypatch):
    monkeypatch.setattr(run, "head_commit", lambda **kw: "a" * 40)
    first = run.freeze(tmp_path / "one")
    second = run.freeze(tmp_path / "two")
    assert first == second
    assert first["seed"] == 20261104
    assert first["row_counts"]["PS_GVT_JOB"] == 3200
    run.verify_frozen(tmp_path / "one")
    (tmp_path / "one/schema.json").write_text("changed")
    with pytest.raises(ValueError, match="frozen input changed"):
        run.verify_frozen(tmp_path / "one")


def test_canonical_multiset():
    assert run.canonical(None) != run.canonical("") != run.canonical("\\N")
    assert run.canonical(Decimal("1.000")) == run.canonical(1)
    assert run.canonical(date(2026, 11, 4)) == ["date", "2026-11-04"]
    assert run.canonical(datetime(2026, 11, 4)) == ["timestamp", "2026-11-04T00:00:00.000000"]
    assert run.canonical(0.1) == ["float", float(0.1).hex()]
    a = run.multiset([(None, ""), (None, ""), ("", None)])
    b = run.multiset([(None, ""), ("", None)])
    assert sum((a - b).values()) == 1
    assert run.checksum(a) != run.checksum(b)
    assert run.checksum(a) == run.checksum(run.multiset([("", None), (None, ""), (None, "")]))
    assert run.multiset([]) == {}
    with pytest.raises(TypeError):
        run.canonical(object())


def test_query_ids_on_error(tmp_path):
    log = run.RunLog(tmp_path / "log.json", "test", "a" * 40)
    conn = Mock()
    conn.cursor.return_value.sfqid = "query-id"
    conn.cursor.return_value.execute.side_effect = RuntimeError("failure")
    with pytest.raises(RuntimeError):
        log.execute(conn, "SELECT 1")
    assert json.loads(log.path.read_text())["queries"] == [
        {"sql": "SELECT 1", "query_id": "query-id", "error": "failure"}]


def test_repo_outputs_rejected():
    with pytest.raises(ValueError, match="outside"):
        run.outside(run.REPO / "data")


@pytest.mark.parametrize("missing,mismatch", [(False, False), (False, True), (True, False)])
def test_compare_reports_columns_counts_and_duplicates(missing, mismatch):
    log = Mock()
    log.data = {"queries": []}
    columns = [("X", "TEXT", None, None, 10, None)]
    other = [("X", "NUMBER", 38, 0, None, None)] if mismatch else columns
    def execute(conn, sql, params=None):
        cursor = Mock()
        if "INFORMATION_SCHEMA" in sql:
            cursor.fetchall.return_value = [] if missing else (other if params[0].endswith("TGT") else columns)
        elif "COUNT(*)" in sql:
            cursor.fetchone.return_value = [1 if "TGT" in sql else 2]
        else:
            cursor.fetchall.return_value = [("a",)] if "TGT" in sql else [("a",), ("a",)]
        return cursor
    log.execute.side_effect = execute
    result = run.compare(Mock(), log)
    for table in run.TABLES:
        entry = result["tables"][table]
        assert entry["columns_match"] == (not missing and not mismatch)
        if missing:
            assert "error" in entry["legacy"]
        else:
            assert entry["legacy"]["count"] == 2
            assert sum(entry["legacy_not_target"].values()) == 1
            assert entry["target_not_legacy"] == {}


@pytest.mark.parametrize("command", ["check-monitor", "create-objects", "load-src", "legacy", "dbt", "compare"])
def test_cli_refuses_compute_without_monitor(command, tmp_path, monkeypatch):
    import snowflake.connector

    monkeypatch.setattr(sys, "argv", ["run.py", command, "--log", str(tmp_path / "run.json")])
    monkeypatch.setattr(run, "head_commit", lambda: "a" * 40)
    monkeypatch.setattr(run, "parameters", lambda *args: {
        "warehouse": run.WAREHOUSE, "database": run.DATABASE, "schema": "EHRP2BIIS_SRC"})
    conn = Mock()
    cursor = conn.cursor.return_value
    cursor.sfqid = "show-id"
    cursor.description = [("name",), ("resource_monitor",)]
    cursor.fetchall.return_value = [(run.WAREHOUSE, None)]
    connect = Mock(return_value=conn)
    monkeypatch.setattr(snowflake.connector, "connect", connect)
    with pytest.raises(RuntimeError, match="Refusing compute"):
        run.main()
    assert connect.call_args.kwargs == {}
    assert cursor.execute.call_count == 1
    assert cursor.execute.call_args.args[0] == f"SHOW WAREHOUSES LIKE '{run.WAREHOUSE}'"
    conn.close.assert_called_once()


@pytest.mark.parametrize("legacy", [False, True])
@pytest.mark.parametrize("size", [0, 7])
def test_load_csv_encoding_and_chunk_query_ids(tmp_path, monkeypatch, legacy, size):
    import pandas as pd

    fields = [{"name": name, "type": "string", "precision": 40, "scale": 0, "nullable": True}
              for name in ["NULL_VALUE", "EMPTY", "SPACE", "NA_TEXT", "ZERO_TEXT", "SENTINEL"]]
    rows = [dict(zip([f["name"] for f in fields], [None, "", " ", "NA", "0", "\\N"]))
            for _ in range(size)]
    schema = {"sources": {"TEST": fields}, "lookups": {}, "targets": {"TEST": fields}}
    (tmp_path / "schema.json").write_text(json.dumps(schema))
    csv_path = tmp_path / "TEST.csv"
    if legacy:
        pd.DataFrame(rows, columns=[f["name"] for f in fields]).to_csv(csv_path, index=False, na_rep="")
    else:
        run.module(run.ROOT / "synthetic/generate.py")._write_table(csv_path, fields, rows)
    accepted = pd.read_csv(csv_path, dtype=str, keep_default_na=False).astype(object).replace("", None)
    expected = list(accepted.itertuples(index=False, name=None))
    if size:
        assert expected[0] == (None, None, " ", "NA", "0", "\\N")
    monkeypatch.setattr(run, "LOAD_CHUNK_SIZE", 3)
    conn = Mock()
    chunks = []
    def cursor_factory():
        cursor = Mock()
        cursor.sfqid = f"query-{len(chunks)}"
        chunks.append(cursor)
        return cursor
    conn.cursor.side_effect = cursor_factory
    log = run.RunLog(tmp_path / "log.json", "test", "a" * 40)
    run.load(conn, log, tmp_path, legacy=legacy)
    batches = [c.executemany.call_args.args[1] for c in chunks if c.executemany.called]
    assert [row for batch in batches for row in batch] == expected
    assert [len(batch) for batch in batches] == ([3, 3, 1] if size else [])
    assert len(log.data["queries"]) == 1 + len(batches)
    assert [q["query_id"] for q in log.data["queries"]] == [c.sfqid for c in chunks]


def test_executemany_failure_logged(tmp_path):
    log = run.RunLog(tmp_path / "log.json", "test", "a" * 40)
    conn = Mock()
    conn.cursor.return_value.sfqid = "batch-failed"
    conn.cursor.return_value.executemany.side_effect = RuntimeError("batch failed")
    with pytest.raises(RuntimeError, match="batch failed"):
        log.execute(conn, "INSERT INTO TEST VALUES (%s)", [(None,)], many=True)
    assert log.data["queries"] == [{"sql": "INSERT INTO TEST VALUES (%s)",
                                    "query_id": "batch-failed", "error": "batch failed"}]


def test_mart_projection_types_match_xml_targets():
    generator = run.module(run.ROOT / "dbt/generate_models.py")
    metadata = generator.mapping_metadata()
    for table, fields in metadata["targets"].items():
        sql = generator._mart_sql(table, fields, metadata["connectors"], metadata)
        assert (generator.MARTS / f"{table}.sql").read_text().strip() == sql.strip()
        projections = re.findall(
            r"^    CAST\(.+ AS (VARCHAR\(\d+\)|NUMBER\(\d+,\d+\)|TIMESTAMP_NTZ\(0\))\) AS (\w+),?$",
            sql, flags=re.MULTILINE)
        assert {name: kind for kind, name in projections} == {
            field["name"]: run.sql_type(field) for field in fields}
        for field in fields:
            if run.sql_type(field).startswith("VARCHAR("):
                projection = next(line for line in sql.splitlines()
                                  if line.rstrip(",").endswith(f' AS {field["name"]}'))
                if table == "NWK_ACTION_PRIMARY_TBL" and field["name"] == "AS_OF_DAY":
                    assert "TO_CHAR(CAST(" in projection and "'MM/DD/YYYY'" in projection
                else:
                    assert "CAST(NULLIF(LEFT(CAST(" in projection
                    assert f', {field["precision"]}), \'\')' in projection


@pytest.mark.parametrize("alias", [False, True])
def test_output_log_collision_rejected_before_writing(tmp_path, monkeypatch, capsys, alias):
    path = tmp_path / "compare.json"
    path.write_text("existing log")
    other = tmp_path / "alias.json"
    if alias:
        other.symlink_to(path)
    else:
        other = tmp_path / "." / "compare.json"
    monkeypatch.setattr(sys, "argv", ["run.py", "compare", "--output", str(other), "--log", str(path)])
    monkeypatch.setattr(run, "head_commit", Mock(side_effect=AssertionError("must reject before connecting")))
    with pytest.raises(SystemExit) as exc:
        run.main()
    assert exc.value.code == 2
    assert "--output and --log must resolve to different paths" in capsys.readouterr().err
    assert path.read_text() == "existing log"


def test_default_outputs_are_distinct(tmp_path, monkeypatch):
    monkeypatch.setattr(Path, "home", lambda: tmp_path)
    monkeypatch.setattr(sys, "argv", ["run.py", "legacy"])
    legacy = run.parse_args().output
    monkeypatch.setattr(sys, "argv", ["run.py", "compare"])
    compare = run.parse_args().output
    assert legacy != compare
    legacy.mkdir(parents=True)
    compare.write_text("{}")
    assert legacy.is_dir() and compare.is_file()
    explicit = tmp_path / "custom"
    monkeypatch.setattr(sys, "argv", ["run.py", "legacy", "--output", str(explicit)])
    assert run.parse_args().output == explicit


def test_full_regeneration_matches_committed_models(tmp_path, monkeypatch):
    generator = run.module(run.ROOT / "dbt/generate_models.py")
    project = run.ROOT / "dbt/ehrp2biis_stage_load"
    for name, relative in [("STAGING", "models/staging"), ("INTERMEDIATE", "models/intermediate"),
                           ("MARTS", "models/marts"), ("TESTS", "tests")]:
        monkeypatch.setattr(generator, name, tmp_path / relative)
    generator.main()
    generated = sorted(path.relative_to(tmp_path) for path in tmp_path.rglob("*") if path.is_file())
    committed = sorted(path.relative_to(project) for directory in (project / "models", project / "tests")
                       for path in directory.rglob("*") if path.is_file())
    assert generated == committed
    for relative in generated:
        assert (tmp_path / relative).read_bytes() == (project / relative).read_bytes(), relative


@pytest.mark.parametrize("commands", [("setup", "compare"), ("compare", "compare")])
def test_default_logs_preserve_sequential_command_queries(tmp_path, monkeypatch, commands):
    monkeypatch.setattr(Path, "home", lambda: tmp_path)
    logs = []
    for command in commands:
        monkeypatch.setattr(sys, "argv", ["run.py", command])
        args = run.parse_args()
        assert args.log.name == f"{command}-{args.run_id}.json"
        assert args.log.parent == tmp_path / "work/runs"
        log = run.RunLog(args.log, args.run_id, "a" * 40)
        conn = Mock()
        conn.cursor.return_value.sfqid = f"query-{len(logs)}"
        log.execute(conn, "SELECT 1")
        logs.append(log)
    assert logs[0].path != logs[1].path
    for index, log in enumerate(logs):
        assert json.loads(log.path.read_text())["queries"] == [
            {"sql": "SELECT 1", "query_id": f"query-{index}"}]
    explicit = tmp_path / "explicit.json"
    monkeypatch.setattr(sys, "argv", ["run.py", "compare", "--log", str(explicit)])
    assert run.parse_args().log == explicit
