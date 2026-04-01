# Lektion 4: Policy Testing & CI/CD-Integration

## Warum Testing für Compliance-Code besonders wichtig ist

Ein Bug in einer Web-App ist ärgerlich. Ein Bug in einer Compliance-Policy kann bedeuten: Verstösse werden nicht erkannt, Meldepflichten verpasst, Bussgelder riskiert. Policy-Code braucht daher mindestens die gleiche Testdisziplin wie produktionskritischer Code – eher mehr.

## OPA-Tests: Grundlagen

OPA hat ein eingebautes Test-Framework. Testdateien liegen im selben Verzeichnis wie die Policies und werden automatisch erkannt.

### Konventionen

```
compliance-as-code/gdpr/article32/
├── encryption.rego          # Die Policy
├── encryption_test.rego     # Die Tests
└── testdata/                # Optional: Grössere Test-Inputs als JSON
    ├── compliant.json
    └── non-compliant.json
```

- Testfunktionen beginnen mit `test_`
- Tests importieren das zu testende Package
- Jeder Test nutzt `with input as {...}` für isolierte Eingabedaten

### Anatomie eines Tests

```rego
package gdpr.article32.encryption_test

import rego.v1
import data.gdpr.article32.encryption

# GUTER Test: Beschreibender Name, klarer Input, klare Assertion
test_unencrypted_personal_data_triggers_violation if {
    result := encryption.deny with input as {
        "resources": [{
            "name": "test-db",
            "type": "database",
            "contains_personal_data": true,
            "encryption": {"enabled": false}
        }],
        "current_date": "2026-04-01"
    }
    count(result) == 1
    some msg in result
    contains(msg, "ohne aktive Verschlüsselung")
}
```

### Tests ausführen

```bash
# Alle Tests im Verzeichnis (rekursiv)
opa test compliance-as-code/ -v

# Nur bestimmte Tests
opa test compliance-as-code/gdpr/ -v --run "test_compliant"

# Mit Coverage-Report
opa test compliance-as-code/ -v --coverage
```

## Test-Strategien für Compliance-Policies

### 1. Positive Tests (Happy Path)

Konforme Eingaben müssen als konform erkannt werden.

```rego
test_fully_compliant_resource if {
    result := encryption.deny with input as compliant_input
    count(result) == 0
}
```

### 2. Negative Tests (Violation Path)

Jede Deny-Regel braucht mindestens einen Test, der sie auslöst.

```rego
test_weak_algorithm_detected if {
    result := encryption.deny with input as weak_algo_input
    count(result) > 0
    some msg in result
    contains(msg, "unsicheren Algorithmus")
}
```

### 3. Grenzwert-Tests (Boundary)

Teste exakt an der Schwelle – ein Tag vor Ablauf, ein Tag nach Ablauf:

```rego
test_key_rotation_exactly_365_days if {
    # Genau 365 Tage → sollte noch PASS sein
    result := encryption.deny with input as {
        "resources": [{
            "name": "boundary-test",
            "contains_personal_data": true,
            "encryption": {
                "enabled": true,
                "algorithm": "AES-256",
                "key_rotation_date": "2025-04-02"  # Exakt 365 Tage
            }
        }],
        "current_date": "2026-04-01"
    }
    count(result) == 0
}
```

### 4. Edge Case Tests

Was passiert bei unerwarteten Inputs?

```rego
test_empty_resources_no_violation if {
    result := encryption.deny with input as {
        "resources": [],
        "current_date": "2026-04-01"
    }
    count(result) == 0
}

test_mixed_compliant_and_noncompliant if {
    result := encryption.deny with input as mixed_input
    count(result) == 1  # Genau ein Verstoss
}
```

### 5. Regressions-Tests

Wenn ein Bug gefunden wird, schreibe zuerst den Test, dann den Fix. So stellst du sicher, dass der Bug nie wieder auftritt.

## CI/CD-Integration

### GitHub Actions Workflow

Die Academy nutzt GitHub Actions, um eingereichte Policies automatisch zu testen (siehe `.github/workflows/policy-tests.yml`):

```yaml
# Ausschnitt – läuft bei jedem PR in compliance-as-code/
- name: Setup OPA
  uses: open-policy-agent/setup-opa@v2
  with:
    version: latest

- name: Run Policy Tests
  run: opa test compliance-as-code/ -v
```

### Automatisiertes Grading

Für Academy-Submissions (Label `academy-submission`) läuft zusätzlich ein Grading-Job, der:

1. Alle Tests ausführt
2. Pass/Fail-Quote berechnet
3. Ergebnis als PR-Kommentar postet

### Policy-Gating in Produktivsystemen

In der Praxis werden OPA-Policies als Gate in Deployment-Pipelines eingesetzt:

```
Code Push → Build → Unit Tests → OPA Policy Check → Deploy
                                     ↓
                              Policy verletzt?
                              → Deploy blockiert
                              → Alert an Compliance
```

**Beispiel:** Bevor ein neuer Microservice deployed wird, prüft OPA:
- Hat er Verschlüsselung für personenbezogene Daten? (DSGVO)
- Ist er im CMDB als kritisch markiert? (DORA)
- Ist das verwendete AI-Modell klassifiziert? (AI Act)

## Audit Trail Automation

Jeder Policy-Check sollte einen auditierbaren Nachweis erzeugen:

```rego
audit_record := {
    "timestamp": input.current_date,
    "policy": "gdpr.article32.encryption",
    "regulation": "DSGVO Art. 32 Abs. 1 lit. a",
    "result": compliant,
    "violations": deny,
    "input_hash": crypto.sha256(json.marshal(input)),
    "policy_version": "1.2.0"
}
```

Dieser Record wird gespeichert und kann bei Audits vorgelegt werden: „Am 1.4.2026 um 14:00 Uhr war Ressource X konform. Hier ist der Nachweis."

## Übung

Integriere die DSGVO-Policy in eine GitHub Actions Pipeline:

1. Forke das Repository
2. Erstelle einen Branch mit einer absichtlich fehlerhaften Policy
3. Beobachte, wie der CI/CD-Workflow den Fehler erkennt
4. Fixe den Fehler und sieh, wie die Pipeline grün wird

→ [Übung 3: End-to-End Compliance Pipeline](../exercises/03-e2e-pipeline.md)

---

→ [Zurück zur Modulübersicht](../README.md)
