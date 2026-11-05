"""Read the mapping's non-secret schema and wiring metadata from its XML export."""

from __future__ import annotations

from functools import lru_cache
from pathlib import Path
from xml.etree import ElementTree as ET


REPOSITORY = Path(__file__).resolve().parents[1]
XML_PATH = REPOSITORY / "XML" / "EHRP2BIIS_UPDATE"


def sql_type(field: dict[str, object]) -> str:
    data_type = str(field["type"]).lower()
    precision = int(field["precision"])
    scale = int(field["scale"])
    if data_type in {"varchar2", "string", "text", "char"} or data_type.startswith(
        ("varchar2", "string", "text", "char")
    ):
        return f"VARCHAR({precision})"
    if data_type in {"number", "decimal", "integer"} or data_type.startswith(
        ("number(", "decimal(", "integer(")
    ):
        return f"NUMBER({precision},{scale})"
    if data_type in {"date", "date/time", "datetime"}:
        return "TIMESTAMP_NTZ(0)"
    raise ValueError(f"Unsupported mapping type: {data_type}")


def _field(element: ET.Element, nullable_default: bool = True) -> dict[str, object]:
    return {
        "name": element.attrib["NAME"],
        "type": element.attrib["DATATYPE"],
        "precision": int(element.attrib.get("PRECISION") or "0"),
        "scale": int(element.attrib.get("SCALE") or "0"),
        "nullable": element.attrib.get("NULLABLE", "NULL" if nullable_default else "NOTNULL")
        != "NOTNULL",
    }


@lru_cache(maxsize=1)
def mapping_metadata() -> dict[str, object]:
    root = ET.parse(XML_PATH).getroot()
    sources = {
        table.attrib["NAME"]: [_field(column) for column in table.findall("SOURCEFIELD")]
        for table in root.findall(".//SOURCE")
    }
    targets = {
        table.attrib["NAME"]: [_field(column) for column in table.findall("TARGETFIELD")]
        for table in root.findall(".//TARGET")
    }
    lookups: dict[str, dict[str, object]] = {}
    transformations: dict[str, dict[str, object]] = {}
    for transform in root.findall(".//TRANSFORMATION"):
        name = transform.attrib["NAME"]
        fields = transform.findall("TRANSFORMFIELD")
        transformations[name] = {
            "type": transform.attrib["TYPE"],
            "fields": [_field(column) for column in fields],
        }
        if transform.attrib["TYPE"] != "Lookup Procedure":
            continue
        attributes = {
            item.attrib.get("NAME"): item.attrib.get("VALUE")
            for item in transform.findall("TABLEATTRIBUTE")
        }
        table_name = attributes.get("Lookup table name")
        if not table_name:
            continue
        ports = [
            _field(column)
            for column in fields
            if column.attrib.get("PORTTYPE") in {"LOOKUP", "LOOKUP/OUTPUT"}
        ]
        outputs = [
            column.attrib["NAME"]
            for column in fields
            if column.attrib.get("PORTTYPE") == "LOOKUP/OUTPUT"
        ]
        inputs = [
            column.attrib["NAME"]
            for column in fields
            if column.attrib.get("PORTTYPE") == "INPUT"
        ]
        lookups[table_name] = {
            "transform": name,
            "ports": ports,
            "outputs": outputs,
            "inputs": inputs,
            "override": attributes.get("Lookup Sql Override", ""),
        }

    mapping = root.find(".//MAPPING[@NAME='m_EHRP2BIIS_UPDATE']")
    if mapping is None:
        raise ValueError("Mapping m_EHRP2BIIS_UPDATE was not found")
    instances = {
        item.attrib["NAME"]: {
            "transformation": item.attrib.get("TRANSFORMATION_NAME"),
            "type": item.attrib.get("TRANSFORMATION_TYPE"),
        }
        for item in mapping.findall("INSTANCE")
    }
    connectors = [
        {
            "from_instance": item.attrib["FROMINSTANCE"],
            "from_field": item.attrib["FROMFIELD"],
            "to_instance": item.attrib["TOINSTANCE"],
            "to_field": item.attrib["TOFIELD"],
        }
        for item in mapping.findall("CONNECTOR")
    ]
    return {
        "sources": sources,
        "targets": targets,
        "lookups": lookups,
        "transformations": transformations,
        "instances": instances,
        "connectors": connectors,
    }
