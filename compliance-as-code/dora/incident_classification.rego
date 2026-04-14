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

default major_incident := false
default notification_required := false
default notification_deadline_hours := null
default followup_deadline_hours := null
default final_report_deadline_days := null
default classification_level := "minor"

# ============================================================
# Schwellenwerte gemäss DORA RTS (vereinfacht für Lehrzwecke)
# ============================================================

# Kriterien für "schwerwiegende" Vorfälle (Art. 18 Abs. 1)
severity_thresholds := {
    "affected_clients_major": 10000,        # Betroffene Kunden
    "financial_impact_major": 100000,        # EUR
    "downtime_hours_major": 4,               # Stunden
    "data_records_compromised_major": 5000,  # Datensätze
    "affected_countries_major": 4,           # > 3 betroffene EU-Laender
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

# Zustaendige NCAs fuer das Lehrbeispiel
nca_by_jurisdiction := {
    "DE": "BaFin",
    "AT": "FMA",
    "NL": "AFM/DNB",
    "FR": "ACPR",
}

incident := object.get(input, "incident", {})

affected_services := object.get(incident, "affected_services", [])
affected_countries := object.get(incident, "affected_countries", [])
affected_clients := object.get(incident, "affected_clients", 0)
financial_impact_eur := object.get(incident, "financial_impact_eur", 0)
downtime_hours := object.get(incident, "downtime_hours", 0)
data_records_compromised := object.get(incident, "data_records_compromised", 0)
jurisdiction := object.get(incident, "jurisdiction", null)
cascading_to_other_institutions := object.get(incident, "cascading_to_other_institutions", false)

# ============================================================
# Trigger-Regeln
# ============================================================

triggered_rules contains "affected_clients" if {
    affected_clients >= severity_thresholds.affected_clients_major
}

triggered_rules contains "financial_impact" if {
    financial_impact_eur >= severity_thresholds.financial_impact_major
}

triggered_rules contains "downtime" if {
    downtime_hours >= severity_thresholds.downtime_hours_major
}

triggered_rules contains "data_breach" if {
    data_records_compromised >= severity_thresholds.data_records_compromised_major
}

triggered_rules contains "critical_service" if {
    some service in affected_services
    service in critical_service_types
}

triggered_rules contains "geographical_extent" if {
    count(affected_countries) >= severity_thresholds.affected_countries_major
}

triggered_rules contains "cascading_effect" if {
    cascading_to_other_institutions == true
}

# ============================================================
# Klassifizierungsregeln
# ============================================================

# Schwerwiegender Vorfall: Meldepflicht an Aufsichtsbehörde
major_incident if {
    count(triggered_rules) > 0
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
# Severity-Score und Entscheidungsmatrix
# ============================================================

default score_affected_clients := 0
default score_financial_impact := 0
default score_downtime := 0
default score_data_breach := 0
default score_critical_service := 0
default score_geographical_extent := 0
default score_cascading_effect := 0

classification_level := "major" if {
    major_incident
}

score_affected_clients := 20 if {
    affected_clients >= severity_thresholds.affected_clients_major
}

score_financial_impact := 20 if {
    financial_impact_eur >= severity_thresholds.financial_impact_major
}

score_downtime := 15 if {
    downtime_hours >= severity_thresholds.downtime_hours_major
}

score_data_breach := 15 if {
    data_records_compromised >= severity_thresholds.data_records_compromised_major
}

score_critical_service := 15 if {
    "critical_service" in triggered_rules
}

score_geographical_extent := 5 if {
    count(affected_countries) >= severity_thresholds.affected_countries_major
}

score_cascading_effect := 10 if {
    cascading_to_other_institutions == true
}

score_components := {
    "affected_clients": score_affected_clients,
    "financial_impact": score_financial_impact,
    "downtime": score_downtime,
    "data_breach": score_data_breach,
    "critical_service": score_critical_service,
    "geographical_extent": score_geographical_extent,
    "cascading_effect": score_cascading_effect,
}

severity_score := sum([
    score_components.affected_clients,
    score_components.financial_impact,
    score_components.downtime,
    score_components.data_breach,
    score_components.critical_service,
    score_components.geographical_extent,
    score_components.cascading_effect,
])

decision_matrix := [
    {
        "criterion": "affected_clients",
        "value": affected_clients,
        "threshold": severity_thresholds.affected_clients_major,
        "met": affected_clients >= severity_thresholds.affected_clients_major,
        "reason": "Anzahl betroffener Kunden",
    },
    {
        "criterion": "financial_impact",
        "value": financial_impact_eur,
        "threshold": severity_thresholds.financial_impact_major,
        "met": financial_impact_eur >= severity_thresholds.financial_impact_major,
        "reason": "Finanzieller Schaden in EUR",
    },
    {
        "criterion": "downtime",
        "value": downtime_hours,
        "threshold": severity_thresholds.downtime_hours_major,
        "met": downtime_hours >= severity_thresholds.downtime_hours_major,
        "reason": "Ausfalldauer in Stunden",
    },
    {
        "criterion": "data_breach",
        "value": data_records_compromised,
        "threshold": severity_thresholds.data_records_compromised_major,
        "met": data_records_compromised >= severity_thresholds.data_records_compromised_major,
        "reason": "Kompromittierte Datensaetze",
    },
    {
        "criterion": "critical_service",
        "value": affected_services,
        "threshold": critical_service_types,
        "met": score_critical_service > 0,
        "reason": "Betroffene kritische Dienste",
    },
    {
        "criterion": "geographical_extent",
        "value": count(affected_countries),
        "threshold": severity_thresholds.affected_countries_major,
        "met": count(affected_countries) >= severity_thresholds.affected_countries_major,
        "reason": "Betroffene Laender",
    },
    {
        "criterion": "cascading_effect",
        "value": cascading_to_other_institutions,
        "threshold": true,
        "met": cascading_to_other_institutions == true,
        "reason": "Kaskadeneffekt auf andere Institute",
    },
]

trigger_reasons := [entry.reason |
    entry := decision_matrix[_]
    entry.met == true
]

classification_explanation := sprintf(
    "Incident %s wurde als %s klassifiziert. Ausgeloeste Trigger: %v. Severity-Score: %d.",
    [
        object.get(incident, "id", "unknown"),
        classification_level,
        trigger_reasons,
        severity_score,
    ],
) if {
    true
}

# ============================================================
# Zusammenfassung für Incident Response Team
# ============================================================

classification := {
    "incident_id": object.get(incident, "id", "unknown"),
    "is_major": major_incident,
    "notification": {
        "required": notification_required,
        "nca": object.get(nca_by_jurisdiction, jurisdiction, null),
        "deadlines": {
            "initial_notification_hours": notification_deadline_hours,
            "followup_hours": followup_deadline_hours,
            "final_report_days": final_report_deadline_days,
        },
    },
    "triggers": triggered_rules,
    "trigger_count": count(triggered_rules),
    "decision_matrix": decision_matrix,
    "severity_score": severity_score,
    "explanation": classification_explanation,
    "regulation": "DORA",
    "article": "Art. 18-19",
}

triggers := triggered_rules
