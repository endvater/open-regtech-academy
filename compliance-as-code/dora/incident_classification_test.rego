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
            "affected_services": ["monitoring"]
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
            "affected_services": ["website"]
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
            "affected_services": ["payment-processing"]
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
            "affected_services": ["api-gateway"]
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
            "affected_services": ["email"]
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
            "affected_services": ["backup-system"]
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
            "affected_services": ["core-banking"]
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
            "affected_services": ["website"]
        }
    }
    incident_classification.followup_deadline_hours == 72 with input as {
        "incident": {
            "id": "INC-TEST-008",
            "affected_clients": 50000,
            "financial_impact_eur": 0,
            "downtime_hours": 0,
            "data_records_compromised": 0,
            "affected_services": ["website"]
        }
    }
    incident_classification.final_report_deadline_days == 30 with input as {
        "incident": {
            "id": "INC-TEST-008",
            "affected_clients": 50000,
            "financial_impact_eur": 0,
            "downtime_hours": 0,
            "data_records_compromised": 0,
            "affected_services": ["website"]
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
            "affected_services": ["core-banking"]
        }
    }
    "affected_clients" in triggers
    "financial_impact" in triggers
    "downtime" in triggers
    "critical_service" in triggers
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
            "affected_services": ["website"]
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
            "affected_services": ["website"]
        }
    }
}
