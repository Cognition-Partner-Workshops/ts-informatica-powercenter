#!/usr/bin/env python3
"""Create deterministic synthetic source and lookup extracts for the dual run."""

from __future__ import annotations

import csv
import calendar
import json
import random
import sys
from collections import Counter
from datetime import date, datetime, time, timedelta
from decimal import Decimal
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from mapping import mapping_metadata, sql_type


SEED = 20261104
ROOT = Path(__file__).resolve().parents[1]
DATA_DIR = Path(__file__).resolve().parent / "data"
KEY_FIELDS = ["EMPLID", "EMPL_RCD", "EFFDT", "EFFSEQ"]
NOA_VALUES = [
    "815", "816", "817", "825", "846", "847", "889", "948",
    *[f"{code:03d}" for code in range(840, 880)],
    "304", "312", "356", "357", "460", "473", "999",
]
AWARD_NOAS = {
    "840", "841", "842", "843", "844", "845", "848", "849",
    "873", "874", "875", "876", "877", "878", "879",
}
ZERO_NULL_FIELDS = [
    "HE_AL_RED_CRED", "HE_AL_BALANCE", "HE_LUMP_HRS", "HE_AL_CARRYOVER",
    "HE_RES_LASTYR", "HE_RES_BALANCE", "HE_RES_TWOYRS", "HE_RES_THREEYRS",
    "HE_AL_ACCRUAL", "HE_AL_TOTAL", "HE_AWOP_SEP", "HE_AWOP_WIGI",
    "GVT_ANNUITY_OFFSET", "HE_SL_RED_CRED", "HE_SL_BALANCE", "HE_FROZEN_SL",
    "HE_SL_CARRYOVER", "HE_SL_ACCRUAL", "HE_SL_TOTAL",
]


def _iso(value: Any) -> str:
    if isinstance(value, datetime):
        return value.isoformat(sep=" ", timespec="seconds")
    if isinstance(value, date):
        return datetime.combine(value, time()).isoformat(sep=" ", timespec="seconds")
    if isinstance(value, Decimal):
        return format(value, "f")
    return str(value)


def _key(row: dict[str, Any]) -> tuple[Any, ...]:
    return tuple(row[field] for field in KEY_FIELDS)


def _row_key(row: dict[str, Any]) -> tuple[Any, ...]:
    return tuple(row[field] for field in KEY_FIELDS)


def _date_for(index: int) -> datetime:
    year = 2021 + index % 6
    day = 2 + (index * 7) % 25
    month = 1 + (index * 5) % 12
    return datetime(year, month, day, (index * 3) % 24, (index * 7) % 60, index % 60)


def _synthetic_employee_id(index: int) -> str:
    if index % 20 == 0:
        prefix = ("9", "91", "912")[(index // 20) % 3]
        return f"{prefix}{index:08d}"
    return f"{90_000_000 + index:08d}"


def _noa_for(index: int) -> tuple[str, str]:
    special = ["815", "816", "817", "825", "846", "847", "889", "948"]
    if index < len(special) * 3:
        return special[index // 3], ("0", "1", "X")[index % 3]
    offset = index - len(special) * 3
    if offset < 40:
        return f"{840 + offset:03d}", ("0", "1", "X")[offset % 3]
    tail = ["304", "312", "356", "357", "460", "473", "999"]
    return tail[(index - len(special) * 3 - 40) % len(tail)], ("0", "1", "X")[index % 3]


def _numeric_value(field: dict[str, Any], index: int, special: str | None = None) -> Decimal:
    scale = int(field["scale"])
    if special == "zero":
        return Decimal(0)
    if special == "nonzero":
        return Decimal("1.37") if scale >= 2 else Decimal("1.3") if scale == 1 else Decimal(1)
    if scale == 0:
        return Decimal((index % 7) + 1)
    if scale == 1:
        return Decimal("0.3") if index % 2 == 0 else Decimal("1.7")
    return Decimal("0.37") if index % 2 == 0 else Decimal("1.62")


def _default_value(field: dict[str, Any], index: int, rng: random.Random) -> Any:
    if field["nullable"] and index % 11 == 0:
        return None
    kind = str(field["type"]).lower()
    name = str(field["name"])
    if kind in {"date", "date/time", "datetime"}:
        return _date_for(index)
    if kind in {"number", "decimal", "integer"} or kind.startswith(
        ("number(", "decimal(", "integer(")
    ):
        return _numeric_value(field, index)
    if name in {"FIRST_NAME", "MIDDLE_NAME", "LAST_NAME"}:
        stem = name.removesuffix("_NAME")
        return f"SYN_{stem}_{index:04d}"
    if name in {"EMPLID", "SUPERVISOR_ID", "REPORTS_TO", "GVT_CONT_EMPLID", "GVT_ROUTE_NEXT"}:
        return _synthetic_employee_id(index)
    if name in {"NATIONAL_ID"}:
        return f"SYN{index:09d}"
    if name in {"LASTUPDOPRID", "OPRID"}:
        return "SYN_OPR"
    if name == "GVT_SPEP":
        return str(index % 10)
    if name in {"STATE", "CITY", "ADDRESS1", "POSTAL", "GEO_CODE"}:
        return f"SYN_{name}_{index:04d}"
    if name == "COMMENTS":
        return "SYNTHETIC"
    return "S"


def _enforce_not_null(
    row: dict[str, Any],
    columns: list[dict[str, Any]],
    index: int,
) -> dict[str, Any]:
    for field in columns:
        name = field["name"]
        if row.get(name) is not None or field["nullable"]:
            continue
        kind = str(field["type"]).lower()
        if kind in {"varchar2", "string", "text"}:
            row[name] = " "
        elif kind in {"number", "decimal", "integer"} or kind.startswith(
            ("number(", "decimal(", "integer(")
        ):
            row[name] = Decimal(0)
        else:
            row[name] = _date_for(index)
    return row


def _job_rows(columns: list[dict[str, Any]], count: int, rng: random.Random) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    field_map = {field["name"]: field for field in columns}
    for index in range(count):
        row = {field["name"]: _default_value(field, index, rng) for field in columns}
        row["EMPLID"] = _synthetic_employee_id(index)
        row["EMPL_RCD"] = index % 4
        row["EFFDT"] = _date_for(index)
        row["EFFSEQ"] = index % 3
        row["GVT_NOA_CODE"], row["HE_NOA_EXT"] = _noa_for(index)
        row["ACTION"] = "BON" if index % 2 == 0 else "HIR"
        row["GVT_WORK_SCHED"] = ("I", "F", "P", "X")[index % 4]
        row["STD_HOURS"] = (Decimal("39.25"), Decimal("40.00"), Decimal("40.75"))[index % 3]
        row["GVT_RETIRE_PLAN"] = ("K", "M", "X")[index % 3]
        row["GVT_TYPE_OF_APPT"] = (
            ("55", "34", "36", "46", "44")[index % 5]
            if index % 2 == 0
            else "ZZ"
        )
        row["GVT_XFER_FROM_AGCY"] = (" ", "ab", None, "AB")[index % 4]
        row["GVT_XFER_TO_AGCY"] = "CD" if index % 2 == 0 else " "
        row["UNION_CD"] = (" ", "U", None)[index % 3]
        for field_name in ("GVT_PAR_AUTH_D1", "GVT_PAR_AUTH_D1_2", "GVT_PAR_AUTH_D2", "GVT_PAR_AUTH_D2_2"):
            values = ("syn lower ", " ", "MIXED ", "syn")
            row[field_name] = values[(index + len(field_name)) % len(values)]
        for field_name in ZERO_NULL_FIELDS:
            field = field_map[field_name]
            row[field_name] = _numeric_value(field, index, "zero" if index % 2 == 0 else "nonzero")
        rows.append(_enforce_not_null(row, columns, index))
    return rows


def _new_actions(job_rows: list[dict[str, Any]], count: int) -> tuple[list[dict[str, Any]], set[tuple[Any, ...]]]:
    matched = job_rows[:-150]
    rows = [{field: job[field] for field in KEY_FIELDS} for job in matched]
    for job in matched[:40]:
        rows.append({field: job[field] for field in KEY_FIELDS})
    first = len(job_rows) + 5000
    for index in range(60):
        rows.append({
            "EMPLID": f"990{index:07d}",
            "EMPL_RCD": index % 4,
            "EFFDT": _date_for(first + index),
            "EFFSEQ": index % 3,
        })
    if len(rows) != count:
        raise ValueError(f"Expected {count} synthetic NWK rows, generated {len(rows)}")
    return rows, {_key(row) for row in rows}


def _lookup_columns(metadata: dict[str, Any]) -> dict[str, list[dict[str, Any]]]:
    return {
        table: lookup["ports"]
        for table, lookup in metadata["lookups"].items()
    }


def _make_lookup_row(
    columns: list[dict[str, Any]],
    key_fields: list[str],
    key_row: dict[str, Any],
    index: int,
    candidate: int,
    rng: random.Random,
) -> dict[str, Any]:
    row = {field["name"]: _default_value(field, index + candidate * 13, rng) for field in columns}
    for name in key_fields:
        if name in key_row:
            row[name] = key_row[name]
    if "NATIONAL_ID" in row:
        row["NATIONAL_ID"] = f"SYN{index:09d}"
    if "GVT_DATE_WRK" in row:
        row["GVT_DATE_WRK"] = None if index % 4 == 0 else datetime(
            2026, 10, 27 + index % 3, 9, 15, index % 60
        )
    if "ERNCD" in row:
        row["ERNCD"] = ("RCR", "RLC", "X", None)[index % 4]
    if "GVT_WIP_STATUS" in row and "GVT_DATE_WRK" in row:
        row["GVT_WIP_STATUS"] = ("WIP", "APR", "FIN")[candidate % 3]
    if "CITIZENSHIP_STATUS" in row:
        row["CITIZENSHIP_STATUS"] = ("1", "2", "X", None)[index % 4]
    if "GVT_SPEP" in row:
        row["GVT_SPEP"] = str(index % 10)
    if "GVT_APPT_LIMIT_HRS" in row:
        row["GVT_APPT_LIMIT_HRS"] = 0 if index % 2 == 0 else 8
    if "GVT_APPT_LIMIT_DYS" in row:
        row["GVT_APPT_LIMIT_DYS"] = 0 if index % 2 == 0 else 7
    if "PROBATION_DT" in row:
        row["PROBATION_DT"] = (
            None,
            datetime(2024, 2, 29, 12, 30, 0),
            datetime(2025, 1, 31, 8, 0, 0),
            datetime(2025, 2, 28, 23, 15, 0),
        )[index % 4]
    if "BUSINESS_TITLE" in row:
        row["BUSINESS_TITLE"] = f"syn title {index:04d}"
    if "GVT_CURR_APT_AUTH1" in row:
        row["GVT_CURR_APT_AUTH1"] = (" ", "a1", "b2", None)[index % 4]
    if "GVT_CURR_APT_AUTH2" in row:
        row["GVT_CURR_APT_AUTH2"] = (" ", "c3", "d4", None)[index % 4]
    if "CITY" in row and "STATE" in row:
        city_state = ((None, None), ("SYN_CITY", None), (None, "ZZ"), ("SYN_CITY", "ZZ"))
        row["CITY"], row["STATE"] = city_state[index % 4]
    for name in ("GVT_PAR_AUTH_D1", "GVT_PAR_AUTH_D1_2"):
        if name in row:
            row[name] = ("syn lower ", " ", "MIXED ", "syn")[index % 4]
    if "JPM_PROFILE_ID" in row:
        row["JPM_PROFILE_ID"] = str(key_row["EMPLID"])[:10]
        row["JPM_CAT_TYPE"] = "DEG"
        row["EFF_STATUS"] = "A"
        row["JPM_CAT_ITEM_ID"] = f"{candidate:04d}"
        row["JPM_CAT_ITEM_QUAL2"] = f"Q{candidate:03d}"
        row["JPM_INTEGER_2"] = (None, 0, 2024 + index % 3)[index % 3]
        row["MAJOR_CODE"] = f"M{candidate:03d}"
        row["MAJOR_DESCR"] = f"SYN_MAJOR_{candidate:03d}"
        row["LASTUPDOPRID"] = "SYN_OPR"
    return _enforce_not_null(row, columns, index)


def _lookup_rows(
    table: str,
    columns: list[dict[str, Any]],
    nwk_rows: list[dict[str, Any]],
    rng: random.Random,
) -> list[dict[str, Any]]:
    if table == "SEQUENCE_NUM_TBL":
        return [
            {"EHRP_YEAR": 2021, "EHRP_SEQ_NUMBER": 100},
            {"EHRP_YEAR": 2023, "EHRP_SEQ_NUMBER": 300},
            {"EHRP_YEAR": 2024, "EHRP_SEQ_NUMBER": 40},
            {"EHRP_YEAR": 2024, "EHRP_SEQ_NUMBER": 20},
            {"EHRP_YEAR": 2025, "EHRP_SEQ_NUMBER": 500},
            {"EHRP_YEAR": 2026, "EHRP_SEQ_NUMBER": 600},
        ]
    unique_keys: dict[tuple[Any, ...], dict[str, Any]] = {}
    key_fields = KEY_FIELDS if table != "PS_JPM_JP_ITEMS" else ["JPM_PROFILE_ID"]
    for row in nwk_rows:
        unique_keys.setdefault(_key(row), row)
    rows: list[dict[str, Any]] = []
    for index, key_row in enumerate(unique_keys.values()):
        if index % 5 == 0:
            continue
        match_key = key_row
        if table == "PS_JPM_JP_ITEMS":
            match_key = {"EMPLID": str(key_row["EMPLID"])[:10]}
        rows.append(_make_lookup_row(columns, key_fields, match_key, index, 0, rng))
        if index % 25 == 1:
            rows.append(_make_lookup_row(columns, key_fields, match_key, index, 1, rng))
    if table == "PS_JPM_JP_ITEMS":
        if columns:
            rejected = {field["name"]: _default_value(field, 99_999, rng) for field in columns}
            rejected["JPM_PROFILE_ID"] = "9900000000"
            rejected["JPM_CAT_TYPE"] = "OTH"
            rejected["EFF_STATUS"] = "A"
            rows.append(rejected)
            rejected = dict(rejected)
            rejected["JPM_CAT_TYPE"] = "DEG"
            rejected["EFF_STATUS"] = "I"
            rows.append(rejected)
    elif table == "PS_GVT_EE_DATA_TRK" and rows:
        duplicate = dict(rows[0])
        duplicate["GVT_DATE_WRK"] = datetime(2026, 12, 1, 10, 15, 0)
        rows.append(duplicate)
    return rows


def _write_table(path: Path, columns: list[dict[str, Any]], rows: list[dict[str, Any]]) -> None:
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=[field["name"] for field in columns])
        writer.writeheader()
        for row in rows:
            values = {}
            for field in columns:
                name = field["name"]
                value = row.get(name)
                if value is None:
                    values[name] = ""
                else:
                    text = _iso(value)
                    if str(field["type"]).lower() in {"varchar2", "string", "text"}:
                        text = text[: int(field["precision"])]
                    values[name] = text
            writer.writerow(values)


def _coverage(
    job_rows: list[dict[str, Any]],
    nwk_rows: list[dict[str, Any]],
    lookup_rows: dict[str, list[dict[str, Any]]],
) -> dict[str, Any]:
    by_noa = Counter(row["GVT_NOA_CODE"] for row in job_rows)
    by_suffix = Counter((row["GVT_NOA_CODE"], row["HE_NOA_EXT"]) for row in job_rows)
    joined_keys = {_key(row) for row in job_rows}.intersection({_key(row) for row in nwk_rows})
    lookup_coverage: dict[str, dict[str, int]] = {}
    for table, rows in lookup_rows.items():
        if table == "SEQUENCE_NUM_TBL":
            input_keys = {key[2].year for key in joined_keys}
            source_keys = [row.get("EHRP_YEAR") for row in rows]
        elif table == "PS_JPM_JP_ITEMS":
            input_keys = {
                next(row["EMPLID"] for row in job_rows if _key(row) == key)[:10]
                for key in joined_keys
            }
            source_keys = [row.get("JPM_PROFILE_ID") for row in rows]
        else:
            input_keys = joined_keys
            source_keys = [_key(row) for row in rows]
        counts = Counter(source_keys)
        hits = sum(counts[key] > 0 for key in input_keys)
        lookup_coverage[table] = {
            "hit": hits,
            "miss": len(input_keys) - hits,
            "multiple": sum(counts[key] > 1 for key in input_keys),
        }
    counts: dict[str, Any] = {
        "noa_code": dict(sorted(by_noa.items())),
        "noa_suffix": {f"{code}/{suffix}": by_suffix[(code, suffix)] for code in sorted(by_noa) for suffix in ("0", "1", "X")},
        "earnings_code": dict(Counter(
            lookup.get("ERNCD") for lookup in lookup_rows.get("PS_GVT_AWD_DATA", [])
        )),
        "action": dict(Counter(row["ACTION"] for row in job_rows)),
        "work_schedule": dict(Counter(row["GVT_WORK_SCHED"] for row in job_rows)),
        "std_hours": {
            "below_40": sum(row["STD_HOURS"] < 40 for row in job_rows),
            "equal_40": sum(row["STD_HOURS"] == 40 for row in job_rows),
            "above_40": sum(row["STD_HOURS"] > 40 for row in job_rows),
        },
        "retirement_plan_appointment_type": dict(Counter(
            f"{row['GVT_RETIRE_PLAN']}/{row['GVT_TYPE_OF_APPT']}" for row in job_rows
        )),
        "citizenship_status": dict(Counter(
            row.get("CITIZENSHIP_STATUS") for row in lookup_rows.get("PS_GVT_CITIZENSHIP", [])
        )),
        "is_spaces_inputs": {
            "GVT_XFER_FROM_AGCY": dict(Counter(
                "null" if row.get("GVT_XFER_FROM_AGCY") is None
                else "spaces" if row["GVT_XFER_FROM_AGCY"].strip() == ""
                else "value"
                for row in job_rows
            )),
            "UNION_CD": dict(Counter(
                "null" if row.get("UNION_CD") is None
                else "spaces" if row["UNION_CD"].strip() == ""
                else "value"
                for row in job_rows
            )),
            **{
                name: dict(Counter(
                    "null" if row.get(name) is None
                    else "spaces" if row[name].strip() == ""
                    else "value"
                    for row in lookup_rows.get("PS_GVT_EMPLOYMENT", [])
                ))
                for name in ("GVT_CURR_APT_AUTH1", "GVT_CURR_APT_AUTH2")
            },
        },
        "legacy_authority_text": {
            name: dict(Counter(
                "null" if row.get(name) is None
                else "spaces" if row[name].strip() == ""
                else "lowercase_trailing_space" if row[name] != row[name].rstrip() and row[name].islower()
                else "value"
                for row in job_rows
            ))
            for name in (
                "GVT_PAR_AUTH_D1", "GVT_PAR_AUTH_D1_2",
                "GVT_PAR_AUTH_D2", "GVT_PAR_AUTH_D2_2",
            )
        },
        "event_tracking_date": {
            "null": sum(row.get("GVT_DATE_WRK") is None for row in lookup_rows.get("PS_GVT_EE_DATA_TRK", [])),
            "with_time_of_day": sum(
                row.get("GVT_DATE_WRK") is not None
                and row["GVT_DATE_WRK"].time() != datetime.min.time()
                for row in lookup_rows.get("PS_GVT_EE_DATA_TRK", [])
            ),
        },
        "probation_dates": {
            "null": sum(row.get("PROBATION_DT") is None for row in lookup_rows.get("PS_GVT_EMPLOYMENT", [])),
            "february_29": sum(
                row.get("PROBATION_DT") is not None
                and row["PROBATION_DT"].month == 2
                and row["PROBATION_DT"].day == 29
                for row in lookup_rows.get("PS_GVT_EMPLOYMENT", [])
            ),
            "month_end": sum(
                row.get("PROBATION_DT") is not None
                and row["PROBATION_DT"].day
                == calendar.monthrange(
                    row["PROBATION_DT"].year, row["PROBATION_DT"].month
                )[1]
                for row in lookup_rows.get("PS_GVT_EMPLOYMENT", [])
            ),
        },
        "jpm_integer_2": dict(Counter(
            "null" if row.get("JPM_INTEGER_2") is None
            else "zero" if row["JPM_INTEGER_2"] == 0
            else "year"
            for row in lookup_rows.get("PS_JPM_JP_ITEMS", [])
        )),
        "city_state_null_combinations": dict(Counter(
            f"CITY_{'null' if row.get('CITY') is None else 'value'}__STATE_{'null' if row.get('STATE') is None else 'value'}"
            for row in lookup_rows.get("PS_GVT_PERS_DATA", [])
        )),
        "sequence_years": dict(Counter(
            row.get("EHRP_YEAR") for row in lookup_rows.get("SEQUENCE_NUM_TBL", [])
        )),
        "zero_nonzero_inputs": {
            name: {
                "zero": sum(row[name] == 0 for row in job_rows),
                "nonzero": sum(row[name] != 0 for row in job_rows),
            }
            for name in ZERO_NULL_FIELDS
        },
        "zero_nonzero_lookup_inputs": {
            "GVT_APPT_LIMIT_HRS": {
                "zero": sum(row.get("GVT_APPT_LIMIT_HRS") == 0 for row in lookup_rows.get("PS_GVT_EMPLOYMENT", [])),
                "nonzero": sum(row.get("GVT_APPT_LIMIT_HRS") not in {None, 0} for row in lookup_rows.get("PS_GVT_EMPLOYMENT", [])),
                "null": sum(row.get("GVT_APPT_LIMIT_HRS") is None for row in lookup_rows.get("PS_GVT_EMPLOYMENT", [])),
            }
        },
        "lookup_source_rows": {name: len(rows) for name, rows in lookup_rows.items()},
        "lookup_hit_miss_multiple": lookup_coverage,
    }
    return counts


def main() -> None:
    rng = random.Random(SEED)
    metadata = mapping_metadata()
    DATA_DIR.mkdir(parents=True, exist_ok=True)
    job_columns = metadata["sources"]["PS_GVT_JOB"]
    nwk_columns = metadata["sources"]["NWK_NEW_EHRP_ACTIONS_TBL"]
    job_rows = _job_rows(job_columns, 3200, rng)
    nwk_rows, nwk_key_set = _new_actions(job_rows, 3150)
    lookup_columns = _lookup_columns(metadata)
    lookups = {
        table: _lookup_rows(table, columns, nwk_rows, rng)
        for table, columns in lookup_columns.items()
    }
    schema = {
        "seed": SEED,
        "sources": metadata["sources"],
        "lookups": {
            table: {"columns": lookup["ports"]}
            for table, lookup in metadata["lookups"].items()
        },
        "targets": metadata["targets"],
        "tables": {
            "PS_GVT_JOB": len(job_rows),
            "NWK_NEW_EHRP_ACTIONS_TBL": len(nwk_rows),
            **{table: len(rows) for table, rows in lookups.items()},
        },
    }
    for table, rows in (
        ("PS_GVT_JOB", job_rows),
        ("NWK_NEW_EHRP_ACTIONS_TBL", nwk_rows),
        *lookups.items(),
    ):
        columns = (
            metadata["sources"][table]
            if table in metadata["sources"]
            else metadata["lookups"][table]["ports"]
        )
        _write_table(DATA_DIR / f"{table}.csv", columns, rows)
    coverage = _coverage(job_rows, nwk_rows, lookups)
    schema["coverage"] = coverage
    (DATA_DIR / "schema.json").write_text(json.dumps(schema, indent=2, default=_iso) + "\n")

    joined_keys = {_key(row) for row in job_rows}.intersection(nwk_key_set)
    print(f"seed={SEED} PS_GVT_JOB={len(job_rows)} NWK_NEW_EHRP_ACTIONS_TBL={len(nwk_rows)}")
    print(
        f"coverage job_without_NWK={len(job_rows) - len(joined_keys)} "
        f"NWK_without_job={len(nwk_key_set - {_key(row) for row in job_rows})} "
        f"duplicated_NWK_keys={len(nwk_rows) - len(nwk_key_set)}"
    )
    print("coverage counts:")
    print(json.dumps(coverage, indent=2, default=_iso))


if __name__ == "__main__":
    main()
