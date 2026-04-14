# Tests für DORA Art. 18 – ICT-Incident-Klassifizierung
# Ausführen: opa test compliance-as-code/dora/ -v

package dora.article18.incident_classification_test

import rego.v1
import data.dora.article18.incident_classification

# ============================================================
# Test 1: Minor Incident – kein Schwellenwert überschritten
# ============================================================
test_minor_incident_no_notification if {
    not incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-001",
            "affected_clients": 50,
            "financial_impact_eur": 2000,
            "downtime_hours": 0.5,
            "data_records_compromised": 10,
            "affected_services": ["monitoring"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

# ============================================================
# Test 2: Major – viele betroffene Kunden
# ============================================================
test_major_many_affected_clients if {
    incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-002",
            "affected_clients": 50000,
            "financial_impact_eur": 1000,
            "downtime_hours": 0.5,
            "data_records_compromised": 0,
            "affected_services": ["website"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

# ============================================================
# Test 3: Major – kritischer Dienst betroffen
# ============================================================
test_major_critical_service if {
    incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-003",
            "affected_clients": 100,
            "financial_impact_eur": 5000,
            "downtime_hours": 1,
            "data_records_compromised": 0,
            "affected_services": ["payment-processing"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

# ============================================================
# Test 4: Major – hoher finanzieller Schaden
# ============================================================
test_major_financial_impact if {
    incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-004",
            "affected_clients": 200,
            "financial_impact_eur": 500000,
            "downtime_hours": 1,
            "data_records_compromised": 0,
            "affected_services": ["api-gateway"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

# ============================================================
# Test 5: Major – langer Ausfall
# ============================================================
test_major_long_downtime if {
    incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-005",
            "affected_clients": 500,
            "financial_impact_eur": 10000,
            "downtime_hours": 8,
            "data_records_compromised": 0,
            "affected_services": ["email"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

# ============================================================
# Test 6: Major – Datenverlust
# ============================================================
test_major_data_breach if {
    incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-006",
            "affected_clients": 100,
            "financial_impact_eur": 5000,
            "downtime_hours": 0,
            "data_records_compromised": 10000,
            "affected_services": ["backup-system"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

# ============================================================
# Test 7: Meldepflicht wird korrekt ausgelöst
# ============================================================
test_notification_required_for_major if {
    incident_classification.notification_required with input as {
        "incident": {
            "id": "INC-TEST-007",
            "affected_clients": 50000,
            "financial_impact_eur": 250000,
            "downtime_hours": 6,
            "data_records_compromised": 0,
            "affected_services": ["core-banking"],
            "affected_countries": ["DE", "AT"],
            "cascading_to_other_institutions": true,
            "jurisdiction": "DE"
        }
    }
}

# ============================================================
# Test 8: Fristen korrekt gesetzt
# ============================================================
test_deadlines_for_major_incident if {
    incident_classification.notification_deadline_hours == 4 with input as {
        "incident": {
            "id": "INC-TEST-008",
            "affected_clients": 50000,
            "financial_impact_eur": 0,
            "downtime_hours": 0,
            "data_records_compromised": 0,
            "affected_services": ["website"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
    incident_classification.followup_deadline_hours == 72 with input as {
        "incident": {
            "id": "INC-TEST-008",
            "affected_clients": 50000,
            "financial_impact_eur": 0,
            "downtime_hours": 0,
            "data_records_compromised": 0,
            "affected_services": ["website"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
    incident_classification.final_report_deadline_days == 30 with input as {
        "incident": {
            "id": "INC-TEST-008",
            "affected_clients": 50000,
            "financial_impact_eur": 0,
            "downtime_hours": 0,
            "data_records_compromised": 0,
            "affected_services": ["website"],
            "cascading_to_other_institutions": false,
            "affected_countries": ["DE"],
            "jurisdiction": "DE"
        }
    }
}

# ============================================================
# Test 9: Triggers korrekt identifiziert
# ============================================================
test_multiple_triggers if {
    triggers := incident_classification.triggers with input as {
        "incident": {
            "id": "INC-TEST-009",
            "affected_clients": 50000,
            "financial_impact_eur": 200000,
            "downtime_hours": 6,
            "data_records_compromised": 0,
            "affected_services": ["core-banking"],
            "affected_countries": ["DE", "AT", "FR", "NL"],
            "cascading_to_other_institutions": true,
            "jurisdiction": "DE"
        }
    }
    "affected_clients" in triggers
    "financial_impact" in triggers
    "downtime" in triggers
    "critical_service" in triggers
    "geographical_extent" in triggers
    "cascading_effect" in triggers
}

# ============================================================
# Test 10: Grenzwert – exakt an der Schwelle
# ============================================================
test_boundary_exactly_at_threshold if {
    incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-010",
            "affected_clients": 10000,
            "financial_impact_eur": 0,
            "downtime_hours": 0,
            "data_records_compromised": 0,
            "affected_services": ["website"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

test_boundary_just_below_threshold if {
    not incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-011",
            "affected_clients": 9999,
            "financial_impact_eur": 99999,
            "downtime_hours": 3.9,
            "data_records_compromised": 4999,
            "affected_services": ["website"],
            "affected_countries": ["DE", "AT", "FR"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

test_geographical_extent_trigger if {
    incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-012",
            "affected_clients": 100,
            "financial_impact_eur": 5000,
            "downtime_hours": 0.5,
            "data_records_compromised": 0,
            "affected_services": ["website"],
            "affected_countries": ["DE", "AT", "NL", "FR"],
            "cascading_to_other_institutions": false,
            "jurisdiction": "DE"
        }
    }
}

test_cascading_trigger if {
    incident_classification.major_incident with input as {
        "incident": {
            "id": "INC-TEST-013",
            "affected_clients": 100,
            "financial_impact_eur": 1000,
            "downtime_hours": 0.25,
            "data_records_compromised": 0,
            "affected_services": ["website"],
            "affected_countries": ["DE"],
            "cascading_to_other_institutions": true,
            "jurisdiction": "DE"
        }
    }
}

test_decision_matrix_and_explanation if {
    c := incident_classification.classification with input as {
        "incident": {
            "id": "INC-TEST-014",
            "affected_clients": 10000,
            "financial_impact_eur": 100000,
            "downtime_hours": 4,
            "data_records_compromised": 5000,
            "affected_services": ["payment-processing"],
            "affected_countries": ["DE", "AT", "NL", "FR"],
            "cascading_to_other_institutions": true,
            "jurisdiction": "DE"
        }
    }
    c.is_major == true
    c.notification.nca == "BaFin"
    c.severity_score > 0
    count(c.decision_matrix) == 7
    contains(c.explanation, "major")
}
