# DORA Artikel 18 – Klassifizierung von IKT-bezogenen Vorfällen
# Quelle: Verordnung (EU) 2022/2554 (Digital Operational Resilience Act)
# RTS: Delegierte Verordnung (EU) 2024/1772 (Klassifizierung IKT-Vorfälle)
#      Durchführungsverordnung (EU) 2024/1774 (Meldeformulare)
#
# HINWEIS: Diese Policy ist ein Lehrbeispiel. Die Schwellenwerte sind
# vereinfacht und müssen für den produktiven Einsatz an die konkreten
# RTS-Vorgaben und das Proportionalitätsprinzip angepasst werden.
#
# Diese Policy klassifiziert ICT-Incidents nach DORA-Kriterien und
# bestimmt die Meldepflicht an die zuständige nationale Behörde (NCA).

package dora.article18.incident_classification

import rego.v1

# ============================================================
# Schwellenwerte gemäss DORA RTS (vereinfacht für Lehrzwecke)
# ============================================================

# Kriterien für "schwerwiegende" Vorfälle (Art. 18 Abs. 1)
severity_thresholds := {
    "affected_clients_major": 10000,        # Betroffene Kunden
    "financial_impact_major": 100000,        # EUR
    "downtime_hours_major": 4,               # Stunden
    "data_records_compromised_major": 5000,  # Datensätze
    "critical_services_affected": 1,         # Anzahl kritischer Services
}

# Kritische Dienste (Art. 18 Abs. 1 lit. e)
critical_service_types := {
    "payment-processing",
    "core-banking",
    "trading-platform",
    "client-authentication",
    "regulatory-reporting",
}

# ============================================================
# Klassifizierungsregeln
# ============================================================

# Schwerwiegender Vorfall: Meldepflicht an Aufsichtsbehörde
major_incident if {
    input.incident.affected_clients >= severity_thresholds.affected_clients_major
}

major_incident if {
    input.incident.financial_impact_eur >= severity_thresholds.financial_impact_major
}

major_incident if {
    input.incident.downtime_hours >= severity_thresholds.downtime_hours_major
}

major_incident if {
    input.incident.data_records_compromised >= severity_thresholds.data_records_compromised_major
}

major_incident if {
    some service in input.incident.affected_services
    service in critical_service_types
}

# ============================================================
# Meldepflichten (Art. 19 DORA)
# ============================================================

# Erstmeldung: innerhalb von 4 Stunden nach Klassifizierung
notification_required if {
    major_incident
}

notification_deadline_hours := 4 if {
    major_incident
}

# Folgemeldung: innerhalb von 72 Stunden
followup_deadline_hours := 72 if {
    major_incident
}

# Abschlussbericht: innerhalb von 1 Monat
final_report_deadline_days := 30 if {
    major_incident
}

# ============================================================
# Zusammenfassung für Incident Response Team
# ============================================================

classification := {
    "incident_id": input.incident.id,
    "is_major": major_incident,
    "notification_required": notification_required,
    "deadlines": {
        "initial_notification_hours": notification_deadline_hours,
        "followup_hours": followup_deadline_hours,
        "final_report_days": final_report_deadline_days,
    },
    "triggers": triggers,
    "regulation": "DORA",
    "article": "Art. 18-19",
}

# Welche Schwellenwerte wurden überschritten?
triggers contains "affected_clients" if {
    input.incident.affected_clients >= severity_thresholds.affected_clients_major
}

triggers contains "financial_impact" if {
    input.incident.financial_impact_eur >= severity_thresholds.financial_impact_major
}

triggers contains "downtime" if {
    input.incident.downtime_hours >= severity_thresholds.downtime_hours_major
}

triggers contains "data_breach" if {
    input.incident.data_records_compromised >= severity_thresholds.data_records_compromised_major
}

triggers contains "critical_service" if {
    some service in input.incident.affected_services
    service in critical_service_types
}
