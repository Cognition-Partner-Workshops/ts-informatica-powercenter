#!/usr/bin/env python3
"""Independent re-implementation of mapping semantics; this is not a PowerCenter run."""

from __future__ import annotations

import argparse
import calendar
import json
import sys
from collections import Counter, defaultdict
from datetime import date, datetime, time
from decimal import Decimal, ROUND_HALF_UP
from pathlib import Path
from typing import Any

import pandas as pd

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from mapping import mapping_metadata, sql_type


ROOT = Path(__file__).resolve().parents[1]
KEY_FIELDS = ["EMPLID", "EMPL_RCD", "EFFDT", "EFFSEQ"]
REQUIRED_TARGET_FIELDS = {
    "NWK_ACTION_PRIMARY_TBL": ["EVENT_ID", "LOAD_ID"],
    "NWK_ACTION_SECONDARY_TBL": ["EVENT_ID"],
    "EHRP_RECS_TRACKING_TBL": ["BIIS_EVENT_ID"],
}
CASH_AWARD_NOAS = {
    "840", "841", "842", "843", "844", "845", "848", "849",
    "873", "874", "875", "876", "877", "878", "879",
}
SEVERANCE_NOAS = {"304", "312", "356", "357"}


def _parse_value(value: str, field: dict[str, Any]) -> Any:
    if value == "":
        return None
    data_type = str(field["type"]).lower()
    if data_type in {"date", "date/time", "datetime"}:
        return datetime.fromisoformat(value)
    if data_type in {"number", "decimal", "integer"} or data_type.startswith(
        ("number(", "decimal(", "integer(")
    ):
        return Decimal(value)
    return value


def _read_table(path: Path, fields: list[dict[str, Any]]) -> list[dict[str, Any]]:
    frame = pd.read_csv(path, dtype=str, keep_default_na=False)
    columns = [field["name"] for field in fields]
    frame = frame.reindex(columns=columns)
    return [
        {
            field["name"]: _parse_value(str(row[field["name"]]), field)
            for field in fields
        }
        for row in frame.to_dict(orient="records")
    ]


def _key(row: dict[str, Any]) -> tuple[Any, ...]:
    return tuple(row.get(name) for name in KEY_FIELDS)


def _sort_output(row: dict[str, Any], outputs: list[str]) -> tuple[Any, ...]:
    return tuple((row.get(name) is None, row.get(name)) for name in outputs)


def _lookup_source(
    table: str,
    rows: list[dict[str, Any]],
    nwk_rows: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    if table == "PS_GVT_EE_DATA_TRK":
        distinct_fields = [
            "GVT_DATE_WRK", "EMPLID", "EMPL_RCD", "EFFDT", "EFFSEQ", "GVT_WIP_STATUS",
        ]
        distinct = {}
        for row in rows:
            distinct[tuple(row.get(name) for name in distinct_fields)] = row
        return list(distinct.values())
    if table == "PS_GVT_PERS_DATA":
        eligible = {_key(row) for row in nwk_rows}
        return [row for row in rows if _key(row) in eligible]
    if table == "PS_JPM_JP_ITEMS":
        return [
            row for row in rows
            if row.get("JPM_CAT_TYPE") == "DEG" and row.get("EFF_STATUS") == "A"
        ]
    return rows


def _lookup_key(table: str, row: dict[str, Any]) -> tuple[Any, ...]:
    if table == "SEQUENCE_NUM_TBL":
        return (row.get("EHRP_YEAR"),)
    if table == "PS_JPM_JP_ITEMS":
        return (row.get("JPM_PROFILE_ID"),)
    return _key(row)


def _input_lookup_key(table: str, row: dict[str, Any]) -> tuple[Any, ...]:
    if table == "SEQUENCE_NUM_TBL":
        effdt = row.get("EFFDT")
        return (effdt.year if effdt is not None else None,)
    if table == "PS_JPM_JP_ITEMS":
        emplid = row.get("EMPLID")
        return (str(emplid)[:10] if emplid is not None else None,)
    return _key(row)


def _select_lookup(
    table: str,
    key: tuple[Any, ...],
    rows: list[dict[str, Any]],
    outputs: list[str],
) -> tuple[dict[str, Any] | None, int]:
    if any(value is None for value in key):
        return None, 0
    matches = [row for row in rows if _lookup_key(table, row) == key]
    if not matches:
        return None, 0
    return min(matches, key=lambda row: _sort_output(row, outputs)), len(matches)


def _and(left: bool | None, right: bool | None) -> bool | None:
    if left is False or right is False:
        return False
    if left is None or right is None:
        return None
    return True


def _or(left: bool | None, right: bool | None) -> bool | None:
    if left is True or right is True:
        return True
    if left is None or right is None:
        return None
    return False


def _in(value: Any, choices: set[str]) -> bool | None:
    if value is None:
        return None
    return str(value) in choices


def _is_spaces(value: Any) -> bool | None:
    if value is None:
        return None
    return str(value).strip() == ""


def _concat(*values: Any) -> str | None:
    if all(value is None for value in values):
        return None
    return "".join("" if value is None else str(value) for value in values)


def _iif(condition: bool | None, when_true: Any, when_false: Any = None) -> Any:
    return when_true if condition is True else when_false


def _subtract_year(value: datetime) -> datetime:
    year = value.year - 1
    day = min(value.day, calendar.monthrange(year, value.month)[1])
    return value.replace(year=year, day=day)


def _event_rows(
    joined: list[dict[str, Any]],
    sequence_rows: list[dict[str, Any]],
    sequence_outputs: list[str],
) -> list[dict[str, Any]]:
    sequence_by_year: dict[int, dict[str, Any] | None] = {}
    years = {row["EFFDT"].year for row in joined}
    for year in years:
        sequence_by_year[year] = _select_lookup(
            "SEQUENCE_NUM_TBL",
            (year,),
            sequence_rows,
            sequence_outputs,
        )[0]
    result = []
    previous_year: int | None = None
    event_id: Decimal | None = None
    for source_row in sorted(
        joined,
        key=lambda row: (
            row["EFFDT"], row["EMPLID"], row["EMPL_RCD"], row["EFFSEQ"],
        ),
    ):
        row = dict(source_row)
        current_year = row["EFFDT"].year
        if current_year == previous_year:
            event_id = None if event_id is None else event_id + 1
        else:
            sequence = sequence_by_year[current_year]
            value = sequence.get("EHRP_SEQ_NUMBER") if sequence else None
            event_id = None if value is None else Decimal(value) + 1
        row["EHRP_SEQ_NUMBER"] = (
            sequence_by_year[current_year].get("EHRP_SEQ_NUMBER")
            if sequence_by_year[current_year]
            else None
        )
        row["O_EVENT_ID"] = event_id
        result.append(row)
        previous_year = current_year
    return result


def _expression_outputs(
    ports: dict[str, Any],
    event_id: Decimal | None,
    run_date: date,
) -> dict[str, Any]:
    value = lambda name: ports.get(name)
    noa = value("GVT_NOA_CODE")
    extension = value("HE_NOA_EXT")
    earnings = value("ERNCD")
    cash_condition = _and(_in(noa, CASH_AWARD_NOAS), None if _in(earnings, {"RCR", "RLC"}) is None else not _in(earnings, {"RCR", "RLC"}))
    cash_award = (
        value("GOAL_AMT")
        if cash_condition is True
        else value("GOAL_AMT")
        if _in(noa, {"817", "889"}) is True
        else None
    )
    recruitment = _or(
        _in(noa, {"815"}) is True,
        _and(_in(noa, {"948"}), _in(extension, {"0"})),
    )
    relocation_expiry = _or(
        _in(noa, {"816"}) is True,
        _and(_in(noa, {"948"}), _in(extension, {"1"})),
    )
    cash_codes_condition = _and(
        _in(noa, CASH_AWARD_NOAS),
        None if _in(earnings, {"RCR", "RLC"}) is None else not _in(earnings, {"RCR", "RLC"}),
    )
    xfer_from = value("GVT_XFER_FROM_AGCY")
    d1 = value("GVT_PAR_AUTH_D1")
    d1_2 = value("GVT_PAR_AUTH_D1_2")
    d2 = value("GVT_PAR_AUTH_D2")
    d2_2 = value("GVT_PAR_AUTH_D2_2")
    city = value("CITY")
    state = value("STATE")
    run_datetime = datetime.combine(run_date, time())
    return {
        "o_EVENT_ID": event_id,
        "o_AGCY_ASSIGN_CD": _concat(value("COMPANY"), value("GVT_SUB_AGENCY")),
        "o_AGCY_SUBELEMENT_PRIOR_CD": _iif(
            _or(_is_spaces(xfer_from), xfer_from is None),
            None,
            _concat(xfer_from, "00"),
        ),
        "o_HE_AL_RED_CRED": _iif(
            None if value("HE_AL_RED_CRED") is None else value("HE_AL_RED_CRED") == 0,
            None,
            value("HE_AL_RED_CRED"),
        ),
        "o_HE_AL_BALANCE": _iif(
            None if value("HE_AL_BALANCE") is None else value("HE_AL_BALANCE") == 0,
            None,
            value("HE_AL_BALANCE"),
        ),
        "o_HE_LUMP_HRS": _iif(
            None if value("HE_LUMP_HRS") is None else value("HE_LUMP_HRS") == 0,
            None,
            value("HE_LUMP_HRS"),
        ),
        "o_HE_AL_CARRYOVER": _iif(
            None if value("HE_AL_CARRYOVER") is None else value("HE_AL_CARRYOVER") == 0,
            None,
            value("HE_AL_CARRYOVER"),
        ),
        "o_HE_RES_LASTYR": _iif(
            None if value("HE_RES_LASTYR") is None else value("HE_RES_LASTYR") == 0,
            None,
            value("HE_RES_LASTYR"),
        ),
        "o_HE_RES_BALANCE": _iif(
            None if value("HE_RES_BALANCE") is None else value("HE_RES_BALANCE") == 0,
            None,
            value("HE_RES_BALANCE"),
        ),
        "o_HE_RES_TWOYRS": _iif(
            None if value("HE_RES_TWOYRS") is None else value("HE_RES_TWOYRS") == 0,
            None,
            value("HE_RES_TWOYRS"),
        ),
        "o_HE_RES_THREEYRS": _iif(
            None if value("HE_RES_THREEYRS") is None else value("HE_RES_THREEYRS") == 0,
            None,
            value("HE_RES_THREEYRS"),
        ),
        "o_HE_AL_ACCRUAL": _iif(
            None if value("HE_AL_ACCRUAL") is None else value("HE_AL_ACCRUAL") == 0,
            None,
            value("HE_AL_ACCRUAL"),
        ),
        "o_HE_AL_TOTAL": _iif(
            None if value("HE_AL_TOTAL") is None else value("HE_AL_TOTAL") == 0,
            None,
            value("HE_AL_TOTAL"),
        ),
        "o_HE_AWOP_SEP": _iif(
            None if value("HE_AWOP_SEP") is None else value("HE_AWOP_SEP") == 0,
            None,
            value("HE_AWOP_SEP"),
        ),
        "o_BASE_HOURS": (
            value("STD_HOURS")
            if value("GVT_WORK_SCHED") == "I"
            else value("STD_HOURS") * 2
            if value("STD_HOURS") is not None
            else None
        ),
        "o_LEG_AUTH_TXT_1": (
            _concat(d1, None if d1_2 is None else str(d1_2).rstrip(" ")).upper()
            if _concat(d1, None if d1_2 is None else str(d1_2).rstrip(" ")) is not None
            else None
        ),
        "o_LEG_AUTH_TXT_2": (
            _concat(d2, None if d2_2 is None else str(d2_2).rstrip(" ")).upper()
            if _concat(d2, None if d2_2 is None else str(d2_2).rstrip(" ")) is not None
            else None
        ),
        "o_HE_AWOP_WIGI": _iif(
            None if value("HE_AWOP_WIGI") is None else value("HE_AWOP_WIGI") == 0,
            None,
            value("HE_AWOP_WIGI"),
        ),
        "o_PERM_TEMP_POSITION_CD": (
            3 if value("STD_HOURS") is not None and value("STD_HOURS") < 40
            else 1 if value("STD_HOURS") is not None and value("STD_HOURS") >= 40
            else 0
        ),
        "o_GVT_ANNUITY_OFFSET": _iif(
            None if value("GVT_ANNUITY_OFFSET") is None else value("GVT_ANNUITY_OFFSET") == 0,
            None,
            value("GVT_ANNUITY_OFFSET"),
        ),
        "o_HE_SL_RED_CRED": _iif(
            None if value("HE_SL_RED_CRED") is None else value("HE_SL_RED_CRED") == 0,
            None,
            value("HE_SL_RED_CRED"),
        ),
        "o_HE_SL_BALANCE": _iif(
            None if value("HE_SL_BALANCE") is None else value("HE_SL_BALANCE") == 0,
            None,
            value("HE_SL_BALANCE"),
        ),
        "o_HE_FROZEN_SL": _iif(
            None if value("HE_FROZEN_SL") is None else value("HE_FROZEN_SL") == 0,
            None,
            value("HE_FROZEN_SL"),
        ),
        "o_HE_SL_CARRYOVER": _iif(
            None if value("HE_SL_CARRYOVER") is None else value("HE_SL_CARRYOVER") == 0,
            None,
            value("HE_SL_CARRYOVER"),
        ),
        "o_HE_SL_ACCRUAL": _iif(
            None if value("HE_SL_ACCRUAL") is None else value("HE_SL_ACCRUAL") == 0,
            None,
            value("HE_SL_ACCRUAL"),
        ),
        "o_HE_SL_TOTAL": _iif(
            None if value("HE_SL_TOTAL") is None else value("HE_SL_TOTAL") == 0,
            None,
            value("HE_SL_TOTAL"),
        ),
        "o_UNION_CD": _iif(_is_spaces(value("UNION_CD")), None, value("UNION_CD")),
        "o_EMP_RESID_CITY_STATE_NAME": _concat(city, ",  ", state),
        "o_EFFSEQ": value("EFFSEQ"),
        "o_LOAD_ID": f"NK{run_date.year:04d}{run_date.month:02d}{run_date.day:02d}",
        "o_LOAD_DATE": run_datetime,
        "o_CASH_AWARD_AMT": cash_award,
        "o_CASH_AWARD_BNFT_AMT": _iif(cash_codes_condition, value("GVT_TANG_BEN_AMT")),
        "o_RECRUITMENT_BONUS_AMT": _iif(recruitment, value("GOAL_AMT")),
        "o_RELOCATION_BONUS_AMT": _iif(_in(noa, {"816"}), value("GOAL_AMT")),
        "o_TIME_OFF_AWARD_AMT": _iif(_in(noa, {"846", "847"}), value("OTH_HRS")),
        "o_TIME_OFF_GRANTED_HRS": _iif(_in(noa, {"846", "847"}), value("OTH_HRS")),
        "o_CITIZENSHIP_STATUS": _iif(
            _or(_in(value("CITIZENSHIP_STATUS_IN"), {"1"}), _in(value("CITIZENSHIP_STATUS_IN"), {"2"})),
            "1",
            "8",
        ),
        "o_TSP_VESTING_CD": _iif(
            _in(value("GVT_RETIRE_PLAN"), {"K", "M"}),
            _iif(
                _in(value("GVT_TYPE_OF_APPT"), {"55", "34", "36", "46", "44"}),
                2,
                3,
            ),
            0,
        ),
        "o_EVENT_SUBMITTED_DTE": (
            value("ACTION_DT") if value("GVT_DATE_WRK") is None else value("GVT_DATE_WRK")
        ),
        "o_RECRUITMENT_EXP_DTE": _iif(recruitment, value("EARNINGS_END_DT")),
        "o_RELOCATION_EXP_DTE": _iif(relocation_expiry, value("EARNINGS_END_DT")),
        "o_GVT_CURR_APT_AUTH1": _iif(
            _is_spaces(value("GVT_CURR_APT_AUTH1")), None, value("GVT_CURR_APT_AUTH1")
        ),
        "o_GVT_CURR_APT_AUTH2": _iif(
            _is_spaces(value("GVT_CURR_APT_AUTH2")), None, value("GVT_CURR_APT_AUTH2")
        ),
        "LWOP_START_DATE": _iif(_in(noa, {"460", "473"}), value("EFFDT")),
        "BUYOUT_EFFDT": _iif(
            None if noa is None else noa == "825",
            value("EFFDT"),
        ),
        "o_BUSINESS_TITLE": (
            None if value("BUSINESS_TITLE") is None else str(value("BUSINESS_TITLE")).upper()
        ),
        "o_BUYOUT_AMT": _iif(
            _and(
                None if noa is None else noa == "825",
                None if value("ACTION") is None else value("ACTION") == "BON",
            ),
            value("GOAL_AMT"),
        ),
        "o_APPT_LIMIT_NTE_HRS": _iif(
            None if value("GVT_APPT_LIMIT_HRS") is None else value("GVT_APPT_LIMIT_HRS") == 0,
            None,
            value("GVT_APPT_LIMIT_HRS"),
        ),
        "YEAR_DEGREE": _iif(
            None if value("JPM_INTEGER_2") is None else value("JPM_INTEGER_2") == 0,
            None,
            value("JPM_INTEGER_2"),
        ),
        "o_SEVERANCE_PAY_AMT": _iif(_in(noa, SEVERANCE_NOAS), value("OTH_PAY")),
        "o_SEVERANCE_TOTAL_AMT": _iif(_in(noa, SEVERANCE_NOAS), value("GOAL_AMT")),
        "o_SEVERANCE_PAY_START_DTE": _iif(_in(noa, SEVERANCE_NOAS), value("EFFDT")),
        "o_PROBATION_DT": (
            None if value("PROBATION_DT") is None else _subtract_year(value("PROBATION_DT"))
        ),
    }


def _target_value(value: Any, field: dict[str, Any], field_name: str) -> Any:
    if value is None:
        return None
    target_type = sql_type(field)
    if target_type.startswith("VARCHAR("):
        if isinstance(value, datetime) and field_name == "AS_OF_DAY":
            text = value.strftime("%m/%d/%Y")
        elif isinstance(value, Decimal):
            text = format(value, "f")
        else:
            text = str(value)
        if text == "":
            return None
        return text[: int(field["precision"])]
    if target_type.startswith("NUMBER("):
        number = value if isinstance(value, Decimal) else Decimal(str(value))
        scale = int(field["scale"])
        quantum = Decimal(1).scaleb(-scale)
        return number.quantize(quantum, rounding=ROUND_HALF_UP)
    if target_type == "TIMESTAMP_NTZ(0)":
        if isinstance(value, date) and not isinstance(value, datetime):
            value = datetime.combine(value, time())
        if isinstance(value, str):
            value = datetime.fromisoformat(value)
        return value.replace(microsecond=0)
    raise ValueError(f"Unsupported target type {target_type}")


def _write_target(
    table: str,
    target_fields: list[dict[str, Any]],
    connectors: list[dict[str, Any]],
    event_rows: list[dict[str, Any]],
    lookup_instances: dict[str, str],
    lookup_rows: dict[str, list[dict[str, Any]]],
    lookup_outputs: dict[str, list[str]],
    metadata: dict[str, Any],
    run_date: date,
    output_dir: Path,
) -> tuple[int, int]:
    target_connectors = {
        connector["to_field"]: connector
        for connector in connectors
        if connector["to_instance"] == table
    }
    accepted = []
    null_event_rejects = 0
    other_rejects = Counter()
    for event in event_rows:
        lookup_results: dict[str, dict[str, Any] | None] = {}
        input_ports: dict[str, Any] = {}
        for connector in connectors:
            if connector["to_instance"] != "exp_MAIN2BIIS":
                continue
            instance = connector["from_instance"]
            field = connector["from_field"]
            if instance == "SQ_PS_GVT_JOB":
                result = event.get(field)
            elif instance == "exp_GET_EFFDT_YEAR":
                result = event.get("O_EVENT_ID") if field == "o_EVENT_ID" else event.get(field)
            elif instance in lookup_instances:
                lookup_table = lookup_instances[instance]
                if lookup_table not in lookup_results:
                    key = _input_lookup_key(lookup_table, event)
                    lookup_results[lookup_table] = _select_lookup(
                        lookup_table,
                        key,
                        lookup_rows[lookup_table],
                        lookup_outputs[lookup_table],
                    )[0]
                lookup = lookup_results[lookup_table]
                result = lookup.get(field) if lookup else None
            elif instance == "exp_PERS_DATA":
                lookup_table = "PS_GVT_PERS_DATA"
                if lookup_table not in lookup_results:
                    key = _input_lookup_key(lookup_table, event)
                    lookup_results[lookup_table] = _select_lookup(
                        lookup_table,
                        key,
                        lookup_rows[lookup_table],
                        lookup_outputs[lookup_table],
                    )[0]
                lookup = lookup_results[lookup_table]
                result = lookup.get(field) if lookup else None
            else:
                result = None
            input_ports[connector["to_field"]] = result
        computed = _expression_outputs(input_ports, event.get("O_EVENT_ID"), run_date)
        output_row = {}
        for field in target_fields:
            name = field["name"]
            connector = target_connectors.get(name)
            if connector is None:
                value = None
            else:
                source_instance = connector["from_instance"]
                source_field = connector["from_field"]
                if source_instance == "exp_MAIN2BIIS":
                    value = computed.get(source_field, input_ports.get(source_field))
                elif source_instance == "SQ_PS_GVT_JOB":
                    value = event.get(source_field)
                elif source_instance in lookup_instances:
                    lookup_table = lookup_instances[source_instance]
                    if lookup_table not in lookup_results:
                        key = _input_lookup_key(lookup_table, event)
                        lookup_results[lookup_table] = _select_lookup(
                            lookup_table,
                            key,
                            lookup_rows[lookup_table],
                            lookup_outputs[lookup_table],
                        )[0]
                    lookup = lookup_results[lookup_table]
                    value = lookup.get(source_field) if lookup else None
                elif source_instance == "exp_PERS_DATA":
                    lookup = lookup_results.get("PS_GVT_PERS_DATA")
                    value = lookup.get(source_field) if lookup else None
                else:
                    value = None
            output_row[name] = _target_value(value, field, name)
        rejected_fields = [
            name for name in REQUIRED_TARGET_FIELDS[table]
            if output_row.get(name) is None
        ]
        if rejected_fields:
            event_field = "BIIS_EVENT_ID" if table == "EHRP_RECS_TRACKING_TBL" else "EVENT_ID"
            if event_field in rejected_fields:
                null_event_rejects += 1
            for name in rejected_fields:
                other_rejects[name] += 1
            continue
        accepted.append(output_row)
    columns = [field["name"] for field in target_fields]
    pd.DataFrame(accepted, columns=columns).to_csv(
        output_dir / f"{table}.csv",
        index=False,
        na_rep="",
    )
    print(
        f"target {table}: accepted={len(accepted)} "
        f"null_EVENT_ID_rejected={null_event_rejects} "
        f"other_not_null_rejections={dict(other_rejects)}"
    )
    return len(accepted), null_event_rejects


def _coverage_report(
    event_rows: list[dict[str, Any]],
    raw_lookups: dict[str, list[dict[str, Any]]],
    lookup_rows: dict[str, list[dict[str, Any]]],
    lookup_outputs: dict[str, list[str]],
) -> None:
    coverage = {}
    for table, rows in lookup_rows.items():
        metrics = Counter()
        for event in event_rows:
            key = _input_lookup_key(table, event)
            _, count = _select_lookup(table, key, rows, lookup_outputs[table])
            metrics["probes"] += 1
            if count == 0:
                metrics["miss"] += 1
            else:
                metrics["hit"] += 1
                if count > 1:
                    metrics["multiple"] += 1
        coverage[table] = dict(metrics)
    print("coverage lookup_hit_miss_multiple:")
    print(json.dumps(coverage, indent=2, sort_keys=True))


def run(data_dir: Path, output_dir: Path, run_date: date) -> None:
    metadata = mapping_metadata()
    schema = json.loads((data_dir / "schema.json").read_text(encoding="utf-8"))
    source_fields = schema["sources"]
    raw_lookups = {
        table: _read_table(data_dir / f"{table}.csv", lookup["columns"])
        for table, lookup in schema["lookups"].items()
    }
    nwk_rows = _read_table(
        data_dir / "NWK_NEW_EHRP_ACTIONS_TBL.csv",
        source_fields["NWK_NEW_EHRP_ACTIONS_TBL"],
    )
    job_rows = _read_table(
        data_dir / "PS_GVT_JOB.csv",
        source_fields["PS_GVT_JOB"],
    )
    lookup_outputs = {
        table: list(lookup["outputs"])
        for table, lookup in metadata["lookups"].items()
    }
    lookup_rows = {
        table: _lookup_source(table, rows, nwk_rows)
        for table, rows in raw_lookups.items()
    }

    nwk_index: dict[tuple[Any, ...], list[dict[str, Any]]] = defaultdict(list)
    for row in nwk_rows:
        nwk_index[_key(row)].append(row)
    joined = [
        dict(job)
        for job in job_rows
        for nwk in nwk_index.get(_key(job), [])
    ]
    joined.sort(key=lambda row: (row["EFFDT"], row["EMPLID"], row["EMPL_RCD"], row["EFFSEQ"]))
    print(
        f"SQ rows={len(joined)} unmatched_PS_GVT_JOB="
        f"{sum(not nwk_index.get(_key(row)) for row in job_rows)} "
        f"duplicate_NWK_multiplier_rows={len(joined) - len({_key(row) for row in job_rows if nwk_index.get(_key(row))})}"
    )

    event_rows = _event_rows(
        joined,
        lookup_rows["SEQUENCE_NUM_TBL"],
        lookup_outputs["SEQUENCE_NUM_TBL"],
    )
    lookup_instances = {}
    for instance, definition in metadata["instances"].items():
        transformation = definition.get("transformation")
        for table, lookup in metadata["lookups"].items():
            if transformation == lookup["transform"]:
                lookup_instances[instance] = table
                break
    output_dir.mkdir(parents=True, exist_ok=True)
    totals = {}
    for table, fields in metadata["targets"].items():
        accepted, rejected = _write_target(
            table,
            fields,
            metadata["connectors"],
            event_rows,
            lookup_instances,
            lookup_rows,
            lookup_outputs,
            metadata,
            run_date,
            output_dir,
        )
        totals[table] = {"accepted": accepted, "null_EVENT_ID_rejected": rejected}
    _coverage_report(event_rows, raw_lookups, lookup_rows, lookup_outputs)
    print("target row summary:")
    print(json.dumps(totals, indent=2, sort_keys=True))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-dir", type=Path, default=ROOT / "synthetic" / "data")
    parser.add_argument("--output-dir", type=Path, default=ROOT / "legacy" / "output")
    parser.add_argument("--run-date", type=date.fromisoformat, default=date(2026, 11, 4))
    args = parser.parse_args()
    run(args.data_dir, args.output_dir, args.run_date)


if __name__ == "__main__":
    main()
