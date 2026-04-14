#!/usr/bin/env python3
"""Parse a simplified pacs.008 into a canonical payment event JSON object."""

from __future__ import annotations

import argparse
import json
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path


def _strip_namespaces(elem: ET.Element) -> None:
    """Remove XML namespaces in-place to simplify ElementTree lookups."""
    for node in elem.iter():
        if "}" in node.tag:
            node.tag = node.tag.split("}", 1)[1]


def _detect_message_type(root: ET.Element) -> str:
    namespace_match = re.search(r"(pain|pacs|camt)\.\d{3}\.\d{3}\.\d{2}", root.tag)
    if namespace_match:
        return namespace_match.group(0)
    return "pacs.008.unknown"


def _message_family(message_type: str) -> str:
    if "." in message_type:
        return message_type.split(".", 1)[0]
    return "unknown"


def _find_text(parent: ET.Element, path: str) -> str | None:
    node = parent.find(path)
    if node is None or node.text is None:
        return None
    value = node.text.strip()
    return value or None


def _iban_country(iban: str | None) -> str | None:
    if iban and len(iban) >= 2:
        return iban[:2]
    return None


def parse_pacs008(xml_path: Path) -> dict:
    tree = ET.parse(xml_path)
    root = tree.getroot()
    message_type = _detect_message_type(root)
    _strip_namespaces(root)

    group_header = root.find("./FIToFICstmrCdtTrf/GrpHdr")
    tx = root.find("./FIToFICstmrCdtTrf/CdtTrfTxInf")
    if group_header is None or tx is None:
        raise ValueError("Input XML does not look like a supported pacs.008 message.")

    debtor_iban = _find_text(tx, "./DbtrAcct/Id/IBAN")
    creditor_iban = _find_text(tx, "./CdtrAcct/Id/IBAN")

    amount_node = tx.find("./IntrBkSttlmAmt")
    if amount_node is None or amount_node.text is None:
        raise ValueError("IntrBkSttlmAmt is required.")

    canonical = {
        "rail": "SEPA_SCT",
        "message_family": _message_family(message_type),
        "message_type": message_type,
        "payment_ids": {
            "msg_id": _find_text(group_header, "./MsgId"),
            "instr_id": _find_text(tx, "./PmtId/InstrId"),
            "end_to_end_id": _find_text(tx, "./PmtId/EndToEndId"),
            "uetr": _find_text(tx, "./PmtId/UETR"),
        },
        "parties": {
            "debtor": {
                "name": _find_text(tx, "./Dbtr/Nm"),
                "iban": debtor_iban,
                "account_id": debtor_iban,
                "country": _iban_country(debtor_iban),
                "lei": None,
            },
            "creditor": {
                "name": _find_text(tx, "./Cdtr/Nm"),
                "iban": creditor_iban,
                "account_id": creditor_iban,
                "country": _iban_country(creditor_iban),
                "lei": None,
            },
            "ultimate_debtor": None,
            "ultimate_creditor": None,
        },
        "agents": {
            "debtor_agent_bic": _find_text(tx, "./DbtrAgt/FinInstnId/BICFI"),
            "creditor_agent_bic": _find_text(tx, "./CdtrAgt/FinInstnId/BICFI"),
            "instructing_agent_bic": None,
            "instructed_agent_bic": None,
            "intermediary_agent_bics": [],
        },
        "amounts": {
            "instructed_amount": None,
            "interbank_settlement_amount": float(amount_node.text),
            "currency": amount_node.attrib.get("Ccy", "EUR"),
            "fee_amount": None,
        },
        "timing": {
            "created_at": _find_text(group_header, "./CreDtTm"),
            "interbank_settlement_date": _find_text(tx, "./IntrBkSttlmDt"),
            "booked_at": None,
        },
        "status": {
            "current_status": "RECEIVED",
            "status_source_message": "pacs.008",
        },
        "context": {
            "purpose_code": _find_text(tx, "./Purp/Cd"),
            "remittance_unstructured": _find_text(tx, "./RmtInf/Ustrd"),
            "channel": None,
            "source_system": "payment_rail_import",
            "customer_risk_rating": None,
            "beneficiary_risk_rating": None,
        },
        "risk_hints": [],
    }

    if canonical["parties"]["creditor"]["country"] in {"CY", "MT"}:
        canonical["risk_hints"].append("creditor_in_higher_attention_jurisdiction_example")
    if canonical["amounts"]["interbank_settlement_amount"] >= 10000:
        canonical["risk_hints"].append("amount_at_or_above_manual_review_example_threshold")

    return canonical


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(
        description="Parse a simplified pacs.008 into a canonical payment event."
    )
    parser.add_argument(
        "xml_path",
        nargs="?",
        default="sample_pacs008.xml",
        help="Path to the input pacs.008 XML file.",
    )
    args = parser.parse_args(argv)

    xml_path = Path(args.xml_path)
    event = parse_pacs008(xml_path)
    print(json.dumps(event, indent=2, sort_keys=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
