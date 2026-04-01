# Contributing to Open RegTech Engineering Academy

Vielen Dank für dein Interesse an der Open RegTech Academy! Dieses Dokument erklärt, wie du beitragen kannst.

## Verhaltenskodex

Bitte lies unseren [Code of Conduct](CODE_OF_CONDUCT.md) bevor du beiträgst. Wir erwarten respektvollen, konstruktiven Umgang.

## Wie kann ich beitragen?

### 1. Regulatory Logic (compliance-as-code/)

Übersetze regulatorische Anforderungen in maschinenlesbaren Code:

```
Gesetzestext → Entscheidungsbaum → Rego-Policy → Tests
```

**Anforderungen:**
- Quellenangabe zum Gesetzesartikel als Kommentar im Code
- Mindestens 3 Unit Tests pro Policy
- Klare Beschreibung, welche Anforderung abgedeckt wird
- Peer-Review durch mindestens 1 Person mit regulatorischem UND 1 Person mit technischem Hintergrund

### 2. Curriculum Content (curriculum/)

- Ergänzungen zu Lernmaterial (neue Beispiele, aktuelle Case Studies)
- Korrekturen bei regulatorischen Änderungen
- Neue Übungen und Aufgaben
- Alle Inhalte auf Deutsch, optional zusätzlich auf Englisch

### 3. Lab Environments (labs/)

- Docker-Labs verbessern oder neue erstellen
- Terraform-Skripte für Cloud-Labs
- Jedes Lab muss mit `docker-compose up` in max. 2 Minuten starten

### 4. AI Prompts (ai-prompts/)

- System Prompts für Compliance-LLM-Assistenten
- Getestet mit mindestens 2 verschiedenen LLMs
- Inklusive Beispiel-Interaktionen

### 5. Synthetic Data (synthetic-data/)

- Testdatengeneratoren (Python)
- DSGVO-konform: keine echten Personendaten
- Dokumentation der Datenstruktur

## Workflow

### Für Academy-Teilnehmende

1. **Issue finden**: Suche ein Issue mit dem Label `good-first-issue` oder `help-wanted`
2. **Issue claimen**: Kommentiere „Ich arbeite daran" im Issue
3. **Branch erstellen**: `feature/issue-{nummer}-kurzbeschreibung`
4. **Code schreiben**: Befolge die Style Guides (siehe unten)
5. **Tests schreiben**: Alle neuen Policies brauchen Tests
6. **PR erstellen**: Nutze das PR-Template
7. **Review**: Mindestens 1 Approval erforderlich
8. **Merge**: Maintainer mergen nach Approval

### Für Community-Contributors

Gleicher Workflow, aber ohne Issue-Claim-Pflicht. Fork das Repository und erstelle PRs aus deinem Fork.

## Style Guides

### Rego-Policies (OPA)

```rego
# DSGVO Art. 32 - Verschlüsselung personenbezogener Daten
# Quelle: https://eur-lex.europa.eu/...
# Autor: @github-username
# Datum: 2026-04-01

package gdpr.article32

import rego.v1

# Beschreibung: Prüft ob personenbezogene Daten verschlüsselt gespeichert werden
deny contains msg if {
    some resource in input.resources
    resource.contains_personal_data == true
    resource.encryption.enabled != true
    msg := sprintf("Ressource '%s' enthält personenbezogene Daten ohne Verschlüsselung (Art. 32 DSGVO)", [resource.name])
}
```

### Python

- Python 3.11+
- Type Hints verwenden
- Docstrings für alle öffentlichen Funktionen
- Black Formatter, Ruff Linter

### Markdown (Curriculum)

- Überschriften: H1 für Modultitel, H2 für Lektionen, H3 für Abschnitte
- Code-Blöcke mit Sprachkennung (```python, ```rego)
- Regulatorische Verweise immer mit Artikel-Nummer und Quelle

## Labels

| Label | Beschreibung |
|-------|-------------|
| `good-first-issue` | Einsteigerfreundlich |
| `help-wanted` | Hilfe gesucht |
| `module/m1`...`module/m6` | Modulzuordnung |
| `type/policy` | OPA-Policy / Compliance-Code |
| `type/curriculum` | Lernmaterial |
| `type/lab` | Lab-Umgebung |
| `type/test` | Tests |
| `difficulty/beginner` | Einsteiger |
| `difficulty/intermediate` | Fortgeschritten |
| `difficulty/advanced` | Experte |
| `regulatory/gdpr` | DSGVO-bezogen |
| `regulatory/dora` | DORA-bezogen |
| `regulatory/ai-act` | EU AI Act-bezogen |
| `regulatory/micar` | MiCAR-bezogen |

## Zertifizierungspunkte

Academy-Teilnehmende erhalten Punkte für Community-Beiträge:

| Aktivität | Punkte |
|-----------|--------|
| Issue lösen (beginner) | 5 |
| Issue lösen (intermediate) | 10 |
| Issue lösen (advanced) | 20 |
| Peer-Review durchführen | 5 |
| Neue Übung erstellen | 15 |
| Bug in Policy finden & fixen | 10 |
| Regulatory Update einpflegen | 15 |

**Für die Foundation-Zertifizierung werden mindestens 50 Community-Punkte benötigt.**

## Fragen?

- Öffne eine GitHub Discussion
- Tagge `@maintainers` in deinem Issue oder PR

Danke, dass du die Open RegTech Community stärker machst!
