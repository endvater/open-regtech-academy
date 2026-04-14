#!/usr/bin/env python3
"""Generate synthetic DORA-style ICT incidents as JSON or SQL."""

from __future__ import annotations

import argparse
import json
import random
from pathlib import Path


SERVICES = [
    "payment-processing",
    "core-banking",
    "client-authentication",
    "monitoring",
    "api-gateway",
    "backup-system",
    "website",
]

COUNTRIES = ["DE", "AT", "FR", "NL", "IT", "ES"]


def build_incident(index: int, major: bool) -> dict:
    incident_id = f"INC-SYN-{index:04d}"
    affected_services = random.sample(SERVICES, k=1 if not major else random.randint(1, 2))
    affected_countries = random.sample(COUNTRIES, k=1 if not major else random.randint(2, 4))
    cascading = major and random.choice([True, False])

    if major:
        affected_clients = random.choice([12000, 18000, 35000])
        financial_impact = random.choice([120000, 250000, 500000])
        downtime_hours = random.choice([4.5, 6.0, 9.0])
        data_records = random.choice([0, 6000, 12000])
        severity = "major"
    else:
        affected_clients = random.choice([5, 50, 500])
        financial_impact = random.choice([500, 3000, 15000])
        downtime_hours = random.choice([0.1, 0.5, 1.5])
        data_records = random.choice([0, 10, 120])
        severity = "minor"

    if major and random.choice([True, False]):
        affected_services = ["payment-processing"]

    return {
        "incident": {
            "id": incident_id,
            "description": f"Synthetic {severity} ICT incident {incident_id}",
            "affected_clients": affected_clients,
            "financial_impact_eur": financial_impact,
            "downtime_hours": downtime_hours,
            "data_records_compromised": data_records,
            "affected_services": affected_services,
            "affected_countries": affected_countries,
            "cascading_to_other_institutions": cascading,
            "jurisdiction": random.choice(["DE", "AT", "FR", "NL"]),
        }
    }


def render_sql(incidents: list[dict]) -> str:
    lines = [
        "-- Synthetic ICT incidents generated for Open RegTech Academy",
        "INSERT INTO ict_incidents (incident_id, description, severity, affected_clients, financial_impact_eur, downtime_hours, data_records_compromised, affected_services, detected_at, reported_to_authority)",
        "VALUES",
    ]
    values = []
    for item in incidents:
        incident = item["incident"]
        severity = "critical" if incident["affected_clients"] >= 10000 else "low"
        services_literal = "'{%s}'" % ",".join(incident["affected_services"])
        values.append(
            "('%s', '%s', '%s', %d, %.2f, %.2f, %d, %s, NOW(), %s)"
            % (
                incident["id"],
                incident["description"].replace("'", "''"),
                severity,
                incident["affected_clients"],
                incident["financial_impact_eur"],
                incident["downtime_hours"],
                incident["data_records_compromised"],
                services_literal,
                "true" if incident["affected_clients"] >= 10000 else "false",
            )
        )
    return "\n".join(lines) + "\n" + ",\n".join(values) + ";"


def main() -> int:
    parser = argparse.ArgumentParser(description="Generate synthetic ICT incidents.")
    parser.add_argument("--count", type=int, default=5)
    parser.add_argument("--seed", type=int, default=42)
    parser.add_argument("--format", choices=["json", "sql"], default="json")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    random.seed(args.seed)
    incidents = [
        build_incident(index + 1, major=(index % 2 == 0))
        for index in range(args.count)
    ]

    if args.format == "json":
        rendered = json.dumps(incidents, indent=2)
    else:
        rendered = render_sql(incidents)

    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
