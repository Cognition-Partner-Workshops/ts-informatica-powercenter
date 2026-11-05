#!/usr/bin/env python3
"""Generate dbt source, staging, lookup, and target projections from XML wiring."""

from __future__ import annotations

import sys
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from mapping import mapping_metadata, sql_type


PROJECT = Path(__file__).resolve().parent / "ehrp2biis_stage_load"
STAGING = PROJECT / "models" / "staging"
INTERMEDIATE = PROJECT / "models" / "intermediate"
MARTS = PROJECT / "models" / "marts"
TESTS = PROJECT / "tests"


def port(name: str) -> str:
    return f"PORT__{name.upper()}"


def wire(instance: str, field: str) -> str:
    return f"WIRE__{instance.upper()}__{field.upper()}"


def _sql_literal_concat(operands: list[str]) -> str:
    if len(operands) == 1:
        return operands[0]
    pieces = " || ".join(f"COALESCE(TO_VARCHAR({operand}), '')" for operand in operands)
    null_test = " AND ".join(f"{operand} IS NULL" for operand in operands)
    return f"CASE WHEN {null_test} THEN NULL ELSE {pieces} END"


def _is_spaces(name: str) -> str:
    value = port(name)
    return f"CASE WHEN {value} IS NULL THEN NULL ELSE TRIM({value}) = '' END"


def _run_date() -> str:
    return "TO_TIMESTAMP_NTZ('{{ var(\"run_date\", \"2026-11-04\") }}')"


def expression_sql() -> dict[str, str]:
    values = {name: port(name) for name in (
        "COMPANY", "GVT_SUB_AGENCY", "GVT_XFER_FROM_AGCY", "HE_AL_RED_CRED",
        "HE_AL_BALANCE", "HE_LUMP_HRS", "HE_AL_CARRYOVER", "HE_RES_LASTYR",
        "HE_RES_BALANCE", "HE_RES_TWOYRS", "HE_RES_THREEYRS", "HE_AL_ACCRUAL",
        "HE_AL_TOTAL", "HE_AWOP_SEP", "GVT_WORK_SCHED", "STD_HOURS",
        "GVT_PAR_AUTH_D1", "GVT_PAR_AUTH_D1_2", "GVT_PAR_AUTH_D2",
        "GVT_PAR_AUTH_D2_2", "HE_AWOP_WIGI", "GVT_ANNUITY_OFFSET",
        "HE_SL_RED_CRED", "HE_SL_BALANCE", "HE_FROZEN_SL", "HE_SL_CARRYOVER",
        "HE_SL_ACCRUAL", "HE_SL_TOTAL", "UNION_CD", "CITY", "STATE",
        "GVT_NOA_CODE", "ERNCD", "GOAL_AMT", "GVT_TANG_BEN_AMT", "HE_NOA_EXT",
        "OTH_HRS", "CITIZENSHIP_STATUS_IN", "GVT_RETIRE_PLAN", "GVT_TYPE_OF_APPT",
        "GVT_DATE_WRK", "ACTION_DT", "EARNINGS_END_DT", "GVT_CURR_APT_AUTH1",
        "GVT_CURR_APT_AUTH2", "EFFDT", "ACTION", "BUSINESS_TITLE",
        "GVT_APPT_LIMIT_HRS", "JPM_INTEGER_2", "PROBATION_DT", "EFFSEQ",
    )}
    cash_codes = "'840','841','842','843','844','845','848','849','873','874','875','876','877','878','879'"
    severance_codes = "'304','312','356','357'"
    run_date = _run_date()
    load_date = f"DATE_TRUNC('DAY', {run_date})"
    concat = _sql_literal_concat
    prior_agency = concat([values["GVT_XFER_FROM_AGCY"], "'00'"])
    legal_auth_1 = concat([
        values["GVT_PAR_AUTH_D1"],
        f"NULLIF(RTRIM({values['GVT_PAR_AUTH_D1_2']}), '')",
    ])
    legal_auth_2 = concat([
        values["GVT_PAR_AUTH_D2"],
        f"NULLIF(RTRIM({values['GVT_PAR_AUTH_D2_2']}), '')",
    ])
    return {
        "o_AGCY_ASSIGN_CD": concat([values["COMPANY"], values["GVT_SUB_AGENCY"]]),
        "o_AGCY_SUBELEMENT_PRIOR_CD": (
            f"IFF(({_is_spaces('GVT_XFER_FROM_AGCY')}) OR "
            f"{values['GVT_XFER_FROM_AGCY']} IS NULL, NULL, "
            f"{prior_agency})"
        ),
        "o_HE_AL_RED_CRED": f"IFF({values['HE_AL_RED_CRED']} = 0, NULL, {values['HE_AL_RED_CRED']})",
        "o_HE_AL_BALANCE": f"IFF({values['HE_AL_BALANCE']} = 0, NULL, {values['HE_AL_BALANCE']})",
        "o_HE_LUMP_HRS": f"IFF({values['HE_LUMP_HRS']} = 0, NULL, {values['HE_LUMP_HRS']})",
        "o_HE_AL_CARRYOVER": f"IFF({values['HE_AL_CARRYOVER']} = 0, NULL, {values['HE_AL_CARRYOVER']})",
        "o_HE_RES_LASTYR": f"IFF({values['HE_RES_LASTYR']} = 0, NULL, {values['HE_RES_LASTYR']})",
        "o_HE_RES_BALANCE": f"IFF({values['HE_RES_BALANCE']} = 0, NULL, {values['HE_RES_BALANCE']})",
        "o_HE_RES_TWOYRS": f"IFF({values['HE_RES_TWOYRS']} = 0, NULL, {values['HE_RES_TWOYRS']})",
        "o_HE_RES_THREEYRS": f"IFF({values['HE_RES_THREEYRS']} = 0, NULL, {values['HE_RES_THREEYRS']})",
        "o_HE_AL_ACCRUAL": f"IFF({values['HE_AL_ACCRUAL']} = 0, NULL, {values['HE_AL_ACCRUAL']})",
        "o_HE_AL_TOTAL": f"IFF({values['HE_AL_TOTAL']} = 0, NULL, {values['HE_AL_TOTAL']})",
        "o_HE_AWOP_SEP": f"IFF({values['HE_AWOP_SEP']} = 0, NULL, {values['HE_AWOP_SEP']})",
        "o_BASE_HOURS": f"IFF({values['GVT_WORK_SCHED']} = 'I', {values['STD_HOURS']}, {values['STD_HOURS']} * 2)",
        "o_LEG_AUTH_TXT_1": f"UPPER({legal_auth_1})",
        "o_LEG_AUTH_TXT_2": f"UPPER({legal_auth_2})",
        "o_HE_AWOP_WIGI": f"IFF({values['HE_AWOP_WIGI']} = 0, NULL, {values['HE_AWOP_WIGI']})",
        "o_PERM_TEMP_POSITION_CD": (
            f"IFF({values['STD_HOURS']} < 40, 3, IFF({values['STD_HOURS']} >= 40, 1, 0))"
        ),
        "o_GVT_ANNUITY_OFFSET": (
            f"IFF({values['GVT_ANNUITY_OFFSET']} = 0, NULL, {values['GVT_ANNUITY_OFFSET']})"
        ),
        "o_HE_SL_RED_CRED": f"IFF({values['HE_SL_RED_CRED']} = 0, NULL, {values['HE_SL_RED_CRED']})",
        "o_HE_SL_BALANCE": f"IFF({values['HE_SL_BALANCE']} = 0, NULL, {values['HE_SL_BALANCE']})",
        "o_HE_FROZEN_SL": f"IFF({values['HE_FROZEN_SL']} = 0, NULL, {values['HE_FROZEN_SL']})",
        "o_HE_SL_CARRYOVER": f"IFF({values['HE_SL_CARRYOVER']} = 0, NULL, {values['HE_SL_CARRYOVER']})",
        "o_HE_SL_ACCRUAL": f"IFF({values['HE_SL_ACCRUAL']} = 0, NULL, {values['HE_SL_ACCRUAL']})",
        "o_HE_SL_TOTAL": f"IFF({values['HE_SL_TOTAL']} = 0, NULL, {values['HE_SL_TOTAL']})",
        "o_UNION_CD": f"IFF({_is_spaces('UNION_CD')}, NULL, {values['UNION_CD']})",
        "o_EMP_RESID_CITY_STATE_NAME": concat([
            values["CITY"], "',  '", values["STATE"],
        ]),
        "o_EFFSEQ": values["EFFSEQ"],
        "o_LOAD_ID": (
            f"'NK' || TO_CHAR(YEAR({run_date})) || "
            f"LPAD(TO_CHAR(MONTH({run_date})), 2, '0') || LPAD(TO_CHAR(DAY({run_date})), 2, '0')"
        ),
        "o_LOAD_DATE": load_date,
        "o_CASH_AWARD_AMT": (
            f"CASE WHEN ({values['GVT_NOA_CODE']} IN ({cash_codes}) AND "
            f"NOT ({values['ERNCD']} IN ('RCR','RLC'))) THEN {values['GOAL_AMT']} "
            f"WHEN {values['GVT_NOA_CODE']} IN ('817','889') THEN {values['GOAL_AMT']} "
            "ELSE NULL END"
        ),
        "o_CASH_AWARD_BNFT_AMT": (
            f"IFF({values['GVT_NOA_CODE']} IN ({cash_codes}) AND "
            f"NOT ({values['ERNCD']} IN ('RCR','RLC')), "
            f"{values['GVT_TANG_BEN_AMT']}, NULL)"
        ),
        "o_RECRUITMENT_BONUS_AMT": (
            f"IFF({values['GVT_NOA_CODE']} = '815' OR "
            f"({values['GVT_NOA_CODE']} = '948' AND {values['HE_NOA_EXT']} = '0'), "
            f"{values['GOAL_AMT']}, NULL)"
        ),
        "o_RELOCATION_BONUS_AMT": (
            f"IFF({values['GVT_NOA_CODE']} IN ('816'), {values['GOAL_AMT']}, NULL)"
        ),
        "o_TIME_OFF_AWARD_AMT": (
            f"IFF({values['GVT_NOA_CODE']} IN ('846','847'), {values['OTH_HRS']}, NULL)"
        ),
        "o_TIME_OFF_GRANTED_HRS": (
            f"IFF({values['GVT_NOA_CODE']} IN ('846','847'), {values['OTH_HRS']}, NULL)"
        ),
        "o_CITIZENSHIP_STATUS": (
            f"IFF({values['CITIZENSHIP_STATUS_IN']} IN ('1','2'), '1', '8')"
        ),
        "o_TSP_VESTING_CD": (
            f"IFF({values['GVT_RETIRE_PLAN']} IN ('K','M'), "
            f"IFF({values['GVT_TYPE_OF_APPT']} IN ('55','34','36','46','44'), 2, 3), 0)"
        ),
        "o_EVENT_SUBMITTED_DTE": (
            f"IFF({values['GVT_DATE_WRK']} IS NULL, {values['ACTION_DT']}, {values['GVT_DATE_WRK']})"
        ),
        "o_RECRUITMENT_EXP_DTE": (
            f"IFF({values['GVT_NOA_CODE']} = '815' OR "
            f"({values['GVT_NOA_CODE']} = '948' AND {values['HE_NOA_EXT']} = '0'), "
            f"{values['EARNINGS_END_DT']}, NULL)"
        ),
        "o_RELOCATION_EXP_DTE": (
            f"IFF({values['GVT_NOA_CODE']} = '816' OR "
            f"({values['GVT_NOA_CODE']} = '948' AND {values['HE_NOA_EXT']} = '1'), "
            f"{values['EARNINGS_END_DT']}, NULL)"
        ),
        "o_GVT_CURR_APT_AUTH1": (
            f"IFF({_is_spaces('GVT_CURR_APT_AUTH1')}, NULL, {values['GVT_CURR_APT_AUTH1']})"
        ),
        "o_GVT_CURR_APT_AUTH2": (
            f"IFF({_is_spaces('GVT_CURR_APT_AUTH2')}, NULL, {values['GVT_CURR_APT_AUTH2']})"
        ),
        "LWOP_START_DATE": (
            f"IFF({values['GVT_NOA_CODE']} IN ('460','473'), {values['EFFDT']}, NULL)"
        ),
        "BUYOUT_EFFDT": (
            f"IFF({values['GVT_NOA_CODE']} = '825', {values['EFFDT']}, NULL)"
        ),
        "o_BUSINESS_TITLE": f"UPPER({values['BUSINESS_TITLE']})",
        "o_BUYOUT_AMT": (
            f"IFF({values['GVT_NOA_CODE']} = '825' AND {values['ACTION']} = 'BON', "
            f"{values['GOAL_AMT']}, NULL)"
        ),
        "o_APPT_LIMIT_NTE_HRS": (
            f"IFF({values['GVT_APPT_LIMIT_HRS']} = 0, NULL, {values['GVT_APPT_LIMIT_HRS']})"
        ),
        "YEAR_DEGREE": (
            f"IFF({values['JPM_INTEGER_2']} = 0, NULL, {values['JPM_INTEGER_2']})"
        ),
        "o_SEVERANCE_PAY_AMT": (
            f"IFF({values['GVT_NOA_CODE']} IN ({severance_codes}), "
            f"{port('OTH_PAY')}, NULL)"
        ),
        "o_SEVERANCE_TOTAL_AMT": (
            f"IFF({values['GVT_NOA_CODE']} IN ({severance_codes}), "
            f"{values['GOAL_AMT']}, NULL)"
        ),
        "o_SEVERANCE_PAY_START_DTE": (
            f"IFF({values['GVT_NOA_CODE']} IN ({severance_codes}), {values['EFFDT']}, NULL)"
        ),
        "o_PROBATION_DT": (
            f"IFF({values['PROBATION_DT']} IS NULL, NULL, DATEADD(MONTH, -12, {values['PROBATION_DT']}))"
        ),
    }


def _write(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text.rstrip() + "\n", encoding="utf-8")


def _model_name(table: str) -> str:
    return f"stg_ehrp2biis__{table.lower()}"


def _lookup_model(table: str) -> str:
    return f"int_ehrp2biis__lkp_{table.lower()}"


def _lookup_sql(table: str, lookup: dict[str, Any], metadata: dict[str, Any]) -> str:
    columns = [field["name"] for field in lookup["ports"]]
    outputs = list(lookup["outputs"])
    if table == "SEQUENCE_NUM_TBL":
        source = f"{{{{ ref('{_model_name(table)}') }}}}"
        partition = "EHRP_YEAR"
    elif table == "PS_GVT_EE_DATA_TRK":
        source = (
            "(SELECT DISTINCT GVT_DATE_WRK, EMPLID, EMPL_RCD, EFFDT, EFFSEQ, GVT_WIP_STATUS "
            f"FROM {{{{ ref('{_model_name(table)}') }}}})"
        )
        columns = ["GVT_DATE_WRK", "EMPLID", "EMPL_RCD", "EFFDT", "EFFSEQ", "GVT_WIP_STATUS"]
        partition = "EMPLID, EMPL_RCD, EFFDT, EFFSEQ"
    elif table == "PS_GVT_PERS_DATA":
        keys = ["EMPLID", "EMPL_RCD", "EFFDT", "EFFSEQ"]
        source = (
            "(SELECT p.* FROM "
            f"{{{{ ref('{_model_name(table)}') }}}} p "
            "INNER JOIN (SELECT DISTINCT EMPLID, EMPL_RCD, EFFDT, EFFSEQ "
            f"FROM {{{{ ref('{_model_name('NWK_NEW_EHRP_ACTIONS_TBL')}') }}}}) n "
            "ON p.EMPLID = n.EMPLID AND p.EMPL_RCD = n.EMPL_RCD "
            "AND p.EFFDT = n.EFFDT AND p.EFFSEQ = n.EFFSEQ)"
        )
        partition = ", ".join(keys)
    elif table == "PS_JPM_JP_ITEMS":
        source = (
            f"(SELECT * FROM {{{{ ref('{_model_name(table)}') }}}} "
            "WHERE JPM_CAT_TYPE = 'DEG' AND EFF_STATUS = 'A')"
        )
        columns = [
            "JPM_CAT_TYPE", "JPM_CAT_ITEM_ID", "JPM_CAT_ITEM_QUAL2", "EFFDT",
            "EFF_STATUS", "JPM_INTEGER_2", "MAJOR_CODE", "MAJOR_DESCR",
            "LASTUPDOPRID", "JPM_PROFILE_ID",
        ]
        partition = "JPM_PROFILE_ID"
    else:
        source = f"{{{{ ref('{_model_name(table)}') }}}}"
        partition = "EMPLID, EMPL_RCD, EFFDT, EFFSEQ"

    output_order = ", ".join(f"{name} ASC NULLS LAST" for name in outputs)
    selected = ", ".join(columns)
    if table == "PS_GVT_PERS_DATA":
        selected = ", ".join([
            "EMPLID", "EMPL_RCD", "EFFDT", "EFFSEQ", "BIRTHDATE", "FIRST_NAME",
            "LAST_NAME", "MIDDLE_NAME", "ADDRESS1", "CITY", "STATE", "POSTAL",
            "GEO_CODE", "SEX", "MILITARY_STATUS", "GVT_CRED_MIL_SVCE",
            "GVT_MILITARY_COMP", "GVT_MIL_RESRVE_CAT", "GVT_VET_PREF_APPT",
            "ETHNIC_GROUP", "GVT_DISABILITY_CD",
        ])
    return (
        f"SELECT {selected}\n"
        f"FROM {source}\n"
        f"QUALIFY ROW_NUMBER() OVER (\n"
        f"    PARTITION BY {partition}\n"
        f"    ORDER BY {output_order}\n"
        f") = 1\n"
    )


def _event_sql() -> str:
    return f"""WITH keyed AS (
    SELECT
        s.*,
        l.EHRP_SEQ_NUMBER
    FROM {{{{ ref('int_ehrp2biis__sq_ps_gvt_job') }}}} s
    LEFT JOIN {{{{ ref('{_lookup_model('SEQUENCE_NUM_TBL')}') }}}} l
        ON l.EHRP_YEAR = YEAR(s.EFFDT)
), ordered AS (
    SELECT
        keyed.*,
        ROW_NUMBER() OVER (
            PARTITION BY YEAR(EFFDT)
            ORDER BY EFFDT, EMPLID, EMPL_RCD, EFFSEQ
        ) AS EVENT_SEQUENCE
    FROM keyed
)
SELECT
    ordered.*,
    EHRP_SEQ_NUMBER + EVENT_SEQUENCE AS O_EVENT_ID
FROM ordered
"""


def _main_model_sql(metadata: dict[str, Any]) -> str:
    expressions = expression_sql()
    lookups = metadata["lookups"]
    transform_lookup = {value["transform"]: table for table, value in lookups.items()}
    connectors = metadata["connectors"]
    inputs = [item for item in connectors if item["to_instance"] == "exp_MAIN2BIIS"]
    target_wires = [
        item for item in connectors
        if item["to_instance"] in metadata["targets"]
        and item["from_instance"] != "exp_MAIN2BIIS"
    ]

    joins = []
    alias_for: dict[str, str] = {"exp_GET_EFFDT_YEAR": "b", "SQ_PS_GVT_JOB": "b"}
    for transform, table in transform_lookup.items():
        if table == "SEQUENCE_NUM_TBL":
            alias_for[transform] = "b"
            continue
        alias = f"l_{table.lower()}"
        alias_for[transform] = alias
        if table == "PS_JPM_JP_ITEMS":
            joins.append(
                f"LEFT JOIN {{{{ ref('{_lookup_model(table)}') }}}} {alias}\n"
                "    ON {alias}.JPM_PROFILE_ID = SUBSTR(b.EMPLID, 1, 10)".replace("{alias}", alias)
            )
        else:
            joins.append(
                f"LEFT JOIN {{{{ ref('{_lookup_model(table)}') }}}} {alias}\n"
                f"    ON {alias}.EMPLID = b.EMPLID\n"
                f"    AND {alias}.EMPL_RCD = b.EMPL_RCD\n"
                f"    AND {alias}.EFFDT = b.EFFDT\n"
                f"    AND {alias}.EFFSEQ = b.EFFSEQ"
            )
    alias_for["exp_PERS_DATA"] = "pers"
    joins.append(
        f"LEFT JOIN {{{{ ref('int_ehrp2biis__exp_pers_data') }}}} pers\n"
        "    ON pers.EMPLID = b.EMPLID AND pers.EMPL_RCD = b.EMPL_RCD\n"
        "    AND pers.EFFDT = b.EFFDT AND pers.EFFSEQ = b.EFFSEQ"
    )

    projections = [
        "    b.O_EVENT_ID AS PORT__O_EVENT_ID",
        "    b.EHRP_SEQ_NUMBER AS PORT__EHRP_SEQ_NUMBER",
    ]
    aliases: set[str] = {"PORT__O_EVENT_ID", "PORT__EHRP_SEQ_NUMBER"}
    for item in inputs:
        name = f"PORT__{item['to_field'].upper()}"
        if name in aliases:
            continue
        from_alias = alias_for.get(item["from_instance"])
        if from_alias is None:
            continue
        projections.append(
            f"    {from_alias}.{item['from_field']} AS {name}"
        )
        aliases.add(name)
    for item in target_wires:
        name = wire(item["from_instance"], item["from_field"])
        if name in aliases:
            continue
        from_alias = alias_for.get(item["from_instance"])
        if from_alias is None:
            continue
        projections.append(f"    {from_alias}.{item['from_field']} AS {name}")
        aliases.add(name)

    output_ports = {
        item["from_field"]
        for item in connectors
        if item["from_instance"] == "exp_MAIN2BIIS"
        and item["to_instance"] in metadata["targets"]
    }
    base = (
        "WITH input_ports AS (\n"
        "    SELECT\n" + ",\n".join(projections) + "\n"
        f"    FROM {{{{ ref('int_ehrp2biis__exp_get_effdt_year') }}}} b\n"
        + "\n".join(joins)
        + "\n)\n"
        "SELECT\n    input_ports.*"
    )
    computed = []
    for name in sorted(output_ports):
        if name in expressions:
            computed.append(f"    {expressions[name]} AS {name.upper()}")
        elif name.upper() == "O_EVENT_ID":
            computed.append(f"    PORT__O_EVENT_ID AS {name.upper()}")
        else:
            computed.append(f"    PORT__{name.upper()} AS {name.upper()}")
    return base + (",\n" + ",\n".join(computed) if computed else "") + "\nFROM input_ports\n"


def _target_expr(source_instance: str, source_field: str) -> str:
    if source_instance == "exp_MAIN2BIIS":
        return source_field.upper()
    return wire(source_instance, source_field)


def _mart_sql(
    table: str,
    columns: list[dict[str, Any]],
    connectors: list[dict[str, str]],
    metadata: dict[str, Any],
) -> str:
    direct = {
        item["to_field"]: item
        for item in connectors
        if item["to_instance"] == table
    }
    expressions: dict[str, str] = {}
    for field in columns:
        name = str(field["name"])
        item = direct.get(name)
        if item is None:
            raw = "NULL"
        else:
            raw = _target_expr(item["from_instance"], item["from_field"])
        target_type = sql_type(field)
        if target_type.startswith("VARCHAR("):
            length = int(field["precision"])
            if table == "NWK_ACTION_PRIMARY_TBL" and name == "AS_OF_DAY":
                expression = f"TO_CHAR(CAST({raw} AS TIMESTAMP_NTZ), 'MM/DD/YYYY')"
            else:
                expression = f"NULLIF(LEFT(CAST({raw} AS VARCHAR), {length}), '')"
            expression = f"CAST({expression} AS {target_type})"
        elif target_type == "TIMESTAMP_NTZ(0)":
            expression = f"CAST({raw} AS TIMESTAMP_NTZ(0))"
        else:
            expression = f"CAST({raw} AS {target_type})"
        expressions[name] = expression

    projections = [f"    {expression} AS {name}" for name, expression in expressions.items()]
    required = {
        "NWK_ACTION_PRIMARY_TBL": ["EVENT_ID", "LOAD_ID"],
        "NWK_ACTION_SECONDARY_TBL": ["EVENT_ID"],
        "EHRP_RECS_TRACKING_TBL": ["BIIS_EVENT_ID"],
    }[table]
    filters = " AND ".join(f"{field} IS NOT NULL" for field in required)
    select = (
        "SELECT\n" + ",\n".join(projections) + "\n"
        "FROM {{ ref('int_ehrp2biis__exp_main2biis') }}\n"
        f"WHERE {filters}\n"
    )
    return select


def _unique_test(table: str, columns: list[dict[str, Any]]) -> str:
    names = [field["name"] for field in columns]
    selected = ", ".join(names)
    return (
        f"SELECT {selected}, COUNT(*) AS ROW_COUNT\n"
        f"FROM {{{{ ref('{table}') }}}}\n"
        "GROUP BY ALL\n"
        "HAVING COUNT(*) > 1\n"
    )


def main() -> None:
    metadata = mapping_metadata()
    sources = {**metadata["sources"]}
    for table, lookup in metadata["lookups"].items():
        sources[table] = lookup["ports"]

    source_yaml = [
        "version: 2",
        "sources:",
        "  - name: src_tables",
        "    database: SFNFR_20261104",
        "    schema: TS_NWK_SRC_SFNFR_20261104",
        "    tables:",
    ]
    for table in sources:
        source_yaml.extend([f"      - name: {table}", f"        identifier: {table}"])
    _write(STAGING / "sources.yml", "\n".join(source_yaml))

    for table, fields in sources.items():
        cols = ",\n".join(
            f"    CAST({field['name']} AS {sql_type(field)}) AS {field['name']}"
            for field in fields
        )
        _write(
            STAGING / f"{_model_name(table)}.sql",
            f"SELECT\n{cols}\nFROM {{{{ source('src_tables', '{table}') }}}}",
        )

    sq = """SELECT j.*
FROM {{ ref('stg_ehrp2biis__ps_gvt_job') }} j
INNER JOIN {{ ref('stg_ehrp2biis__nwk_new_ehrp_actions_tbl') }} n
    ON j.EMPLID = n.EMPLID
    AND j.EMPL_RCD = n.EMPL_RCD
    AND j.EFFDT = n.EFFDT
    AND j.EFFSEQ = n.EFFSEQ
"""
    _write(INTERMEDIATE / "int_ehrp2biis__sq_ps_gvt_job.sql", sq)

    for table, lookup in metadata["lookups"].items():
        _write(
            INTERMEDIATE / f"{_lookup_model(table)}.sql",
            _lookup_sql(table, lookup, metadata),
        )
    _write(
        INTERMEDIATE / "int_ehrp2biis__exp_get_effdt_year.sql",
        _event_sql(),
    )
    _write(
        INTERMEDIATE / "int_ehrp2biis__exp_pers_data.sql",
        "SELECT *\nFROM {{ ref('" + _lookup_model("PS_GVT_PERS_DATA") + "') }}",
    )
    _write(INTERMEDIATE / "int_ehrp2biis__exp_main2biis.sql", _main_model_sql(metadata))

    for table, columns in metadata["targets"].items():
        _write(
            MARTS / f"{table}.sql",
            _mart_sql(table, columns, metadata["connectors"], metadata),
        )
        required = {
            "NWK_ACTION_PRIMARY_TBL": ["EVENT_ID", "LOAD_ID"],
            "NWK_ACTION_SECONDARY_TBL": ["EVENT_ID"],
            "EHRP_RECS_TRACKING_TBL": ["BIIS_EVENT_ID"],
        }[table]
        yaml = [
            "version: 2",
            "models:",
            f"  - name: {table}",
            "    columns:",
        ]
        for column in required:
            yaml.extend([
                f"      - name: {column}",
                "        data_tests:",
                "          - not_null:",
                "              arguments: {}",
            ])
        _write(TESTS / f"{table.lower()}_schema.yml", "\n".join(yaml))
        _write(TESTS / f"{table.lower()}_unique.sql", _unique_test(table, columns))


if __name__ == "__main__":
    main()
