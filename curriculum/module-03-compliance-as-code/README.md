# Modul 3: Compliance-as-Code

> **Wochen 9–11** · 3 Wochen · ca. 8–12h/Woche
> **Kernmodul** des Certified RegTech Engineer (CRTE) Programms

## Lernziele

Nach Abschluss dieses Moduls können Teilnehmende:

1. Regulatorische Anforderungen systematisch in maschinenlesbaren Code übersetzen
2. Open Policy Agent (OPA) und die Rego-Sprache einsetzen, um Compliance-Checks zu automatisieren
3. Policies testen, versionieren und in CI/CD-Pipelines integrieren
4. KI-Tools nutzen, um den Übersetzungsprozess Gesetzestext → Code zu beschleunigen
5. Audit Trails und Compliance Evidence automatisiert erzeugen

## Modulstruktur

### Woche 9: Grundlagen

| Tag | Thema | Format |
|-----|-------|--------|
| Mo | Einführung: Was ist Compliance-as-Code? Warum? | Live-Seminar (2h) |
| Di–Mi | OPA & Rego: Syntax, Datenmodell, erste Policies | Selbstlernen + KI-Tutor |
| Do | Lab: Docker-Sandbox starten, erste DSGVO-Policy | Praxis-Lab (3h) |
| Fr | Peer-Review: Gegenseitiges Code-Review | Community-Session |

### Woche 10: Praxis & Integration

| Tag | Thema | Format |
|-----|-------|--------|
| Mo | Der Übersetzungsprozess: Gesetzestext → Entscheidungsbaum → Rego | Live-Seminar (2h) |
| Di–Mi | Policy Patterns: Admission Control, RBAC, Data Filtering | Selbstlernen + Copilot |
| Do | Lab: DORA-Policies schreiben & testen | Praxis-Lab (3h) |
| Fr | KI-Workshop: LLM-Translation (Natürliche Sprache → Rego) | Workshop (2h) |

### Woche 11: Advanced & Assessment

| Tag | Thema | Format |
|-----|-------|--------|
| Mo | CI/CD-Integration: OPA in Pipelines, GitHub Actions | Live-Seminar (2h) |
| Di–Mi | Audit Trail Automation, Compliance Evidence | Selbstlernen |
| Do | Lab: End-to-End Pipeline (Policy + Test + CI) | Praxis-Lab (4h) |
| Fr | Modulprüfung: Issue lösen + Peer-Review | Assessment |

## Lektionen

1. [Lektion 1: Einführung in Compliance-as-Code](lessons/01-introduction.md)
2. [Lektion 2: OPA & Rego Grundlagen](lessons/02-opa-rego-basics.md)
3. [Lektion 3: Der Übersetzungsprozess](lessons/03-translation-process.md)
4. [Lektion 4: Policy Testing & CI/CD](lessons/04-testing-cicd.md)

## Übungen

1. [Übung 1: DSGVO Art. 32 – Verschlüsselungsprüfung](exercises/01-gdpr-encryption-check.md) (Beginner)
2. [Übung 2: DORA – ICT-Incident-Klassifizierung](exercises/02-dora-incident-classification.md) (Intermediate)
3. [Übung 3: End-to-End Compliance Pipeline](exercises/03-e2e-pipeline.md) (Advanced)
4. [Übung 4: DSGVO Art. 25 – Privacy by Design & by Default](exercises/04-gdpr-privacy-by-design.md) (Intermediate)

## Lab-Umgebung

```bash
cd ../../labs/lab-opa-sandbox
docker compose up -d
# → OPA Server auf localhost:8181
# → Test-Datenbank auf localhost:5432
# → Grafana Dashboard auf localhost:3000
```

Beispiel-Inputs und Befehle:

- [`../../labs/lab-opa-sandbox/MODULE_03_RUNBOOK.md`](../../labs/lab-opa-sandbox/MODULE_03_RUNBOOK.md)
- [`../../labs/lab-opa-sandbox/examples/gdpr_article32_input.json`](../../labs/lab-opa-sandbox/examples/gdpr_article32_input.json)
- [`../../labs/lab-opa-sandbox/examples/dora_article18_input.json`](../../labs/lab-opa-sandbox/examples/dora_article18_input.json)

## KI-Integration

- **Coding Copilot**: Für alle Labs aktiviert – hilft beim Schreiben von Rego-Policies
- **LLM Translation**: Übung, Gesetzesartikel per Prompt in Rego zu übersetzen
- **Auto-Grading**: Eingereichte Übungen werden via GitHub Actions automatisch getestet
- **RegBot**: System Prompt in `../../ai-prompts/module-03-compliance-tutor.md`

## Voraussetzungen

- Module 1 & 2 abgeschlossen (oder äquivalentes Wissen)
- Docker Desktop installiert
- Git-Grundkenntnisse
- Python-Grundkenntnisse (Track A) oder Regulatorik-Grundlagen (Track B)
