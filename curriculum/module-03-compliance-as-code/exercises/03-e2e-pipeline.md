# Übung 3: End-to-End Compliance Pipeline

> **Schwierigkeit:** Advanced · **Dauer:** 3–4 Stunden · **Punkte:** 20
> **Regulatorischer Bezug:** DSGVO Art. 32 + DORA Art. 18 (kombiniert)

## Kontext

Du bist Lead RegTech Engineer. Das Management will ein automatisiertes Compliance-Gate: Bevor ein System-Change in Produktion geht, müssen DSGVO- und DORA-Policies automatisch geprüft werden. Dein Job: die Pipeline bauen.

## Aufgabe

Baue eine vollständige Compliance-as-Code-Pipeline, die drei Stufen umfasst:

### Teil 1: Multi-Policy Evaluation

Schreibe ein Python-Skript (`evaluate.py`), das:

1. Systemdaten aus der Lab-Datenbank (PostgreSQL) liest
2. Diese Daten in das OPA-Inputformat transformiert
3. Sowohl die DSGVO- als auch die DORA-Policy gegen die Daten evaluiert
4. Einen konsolidierten Compliance-Report ausgibt

```python
# Erwartete Struktur (Pseudocode)
def main():
    resources = fetch_from_database()      # PostgreSQL
    input_data = transform_to_opa_input(resources)
    gdpr_result = evaluate_opa("gdpr.article32.encryption", input_data)
    dora_result = evaluate_opa("dora.article18.incident_classification", ...)
    report = generate_report(gdpr_result, dora_result)
    output_report(report)
```

### Teil 2: GitHub Actions Integration

Erstelle einen Workflow (`.github/workflows/compliance-gate.yml`), der:

1. Bei jedem Push auf `main` läuft
2. Die Lab-Umgebung (Docker) startet
3. Dein `evaluate.py` ausführt
4. Den Report als Workflow-Artefakt speichert
5. Bei Verstössen den Workflow als „failed" markiert

### Teil 3: Compliance Report

Der ausgegebene Report muss enthalten:

- Zeitstempel der Prüfung
- Geprüfte Regulierungen und Artikel
- Gesamtstatus (COMPLIANT / NON-COMPLIANT)
- Liste aller Verstösse mit Schweregrad und Handlungsempfehlung
- Policy-Version (aus dem Git-Commit-Hash)

Format: JSON (maschinenlesbar) + Markdown-Summary (menschenlesbar)

## Lab-Umgebung

```bash
cd labs/lab-opa-sandbox
docker-compose up -d
# PostgreSQL: localhost:5432 (user: regtech, pass: lab-password-2026)
# OPA: localhost:8181
```

Die Datenbank enthält bereits Testdaten (siehe `init-db.sql`): 10 Ressourcen mit verschiedenen Compliance-Status und 5 ICT-Incidents.

## Bewertungskriterien

| Kriterium | Gewichtung |
|-----------|-----------|
| Pipeline funktioniert end-to-end | 30% |
| Korrekte OPA-Integration (API-Calls) | 20% |
| Report-Qualität (JSON + Markdown) | 20% |
| GitHub Actions Workflow | 15% |
| Code-Qualität & Fehlerbehandlung | 10% |
| Dokumentation | 5% |

## KI-Hinweis

Diese Übung ist bewusst umfangreich. Nutze KI strategisch:
- Boilerplate-Code (DB-Connection, HTTP-Calls) per Copilot generieren lassen
- Report-Template mit LLM entwerfen
- Aber: Verstehe die OPA-API und die Datenflüsse selbst

## Abgabe

Branch: `exercise/03-e2e-pipeline-{dein-github-name}`
Label: `academy-submission`, `module/m3`, `difficulty/advanced`

---

→ [Zurück zur Modulübersicht](../README.md)
