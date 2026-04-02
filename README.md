<p align="center">
  <strong>Open RegTech Engineering Academy</strong><br>
  <em>Open-Source-Zertifizierungsplattform für RegTech Engineers</em><br>
  <code>v0.1-beta · Modul 3: Compliance-as-Code</code>
</p>

<p align="center">
  <a href="#about">About</a> · <a href="#status">Status</a> · <a href="#module-3">Modul 3</a> · <a href="#getting-started">Getting Started</a> · <a href="#contributing">Contributing</a> · <a href="#roadmap">Roadmap</a>
</p>

---

## About

Die **Open RegTech Engineering Academy** ist eine community-getriebene, KI-gestützte Lernplattform für RegTech Engineers – Fachleute an der Schnittstelle von EU-Regulatorik, Daten und Software-Architektur.

**Warum Open Source?** Die Gesetze sind öffentlich, aber die technische Umsetzung findet hinter verschlossenen Türen statt. Jedes Unternehmen erfindet das Rad neu. Wir ändern das.

### Kernprinzipien

- **AI-First**: KI ist nicht nur Lerninhalt, sondern durchgängiges didaktisches Werkzeug
- **Compliance-as-Code**: Regulatorische Anforderungen werden zu testbarem, versionierbarem Code
- **Learning by Contributing**: Teilnehmende lernen, indem sie zum Repository beitragen

## Status

> **Dieses Repository ist ein MVP (v0.1-beta).** Aktuell ist Modul 3 (Compliance-as-Code) als vollständige Lerneinheit verfügbar. Die weiteren Module befinden sich in Planung. Siehe [Roadmap](#roadmap).

### Was ist verfügbar

| Bereich | Status | Inhalt |
|---------|--------|--------|
| **Modul 3: Compliance-as-Code** | ✅ Verfügbar | 4 Lektionen, 3 Übungen, Musterlösung |
| **DSGVO-Policy (Art. 32)** | ✅ Verfügbar | OPA/Rego Policy + 8 Tests |
| **DORA-Policy (Art. 18)** | ✅ Verfügbar | Incident-Klassifizierung (Lehrbeispiel) |
| **Lab-Umgebung** | ✅ Verfügbar | Docker-Compose (OPA + PostgreSQL + Grafana) |
| **KI-Tutor-Prompts** | ✅ Verfügbar | System Prompts für Modul 3 |
| **Beispiel-Inputs & Runbook** | ✅ Verfügbar | Eval-Inputs + Modul-3-Runbook |
| **CI/CD Workflow** | ✅ Verfügbar | Rego-Tests + Markdown Checks via GitHub Actions |
| Module 1–2, 4–6 | 🔜 Geplant | Siehe Roadmap |
| Dual-Track Onboarding | 🔜 Geplant | Compliance→Tech / Tech→Compliance |

## Geplantes Curriculum (Vollausbau)

Das Zielprogramm umfasst 22 Wochen (berufsbegleitend, 8–12h/Woche):

| Modul | Thema | Status |
|-------|-------|--------|
| Onboarding | Dual-Track (Compliance→Tech / Tech→Compliance) | 🔜 Geplant |
| M1 | Regulatorische Landschaft EU/DACH (DORA, MiCAR, AI Act, DSGVO) | 🔜 Geplant |
| M2 | Data Architecture & RegTech Stack | 🔜 Geplant |
| **M3** | **Compliance-as-Code (OPA, Rego, Policy Testing)** | **✅ Verfügbar** |
| M4 | KYC, AML & Transaction Monitoring | 🔜 Geplant |
| M5 | AI Governance, Audit & Ethics | 🔜 Geplant |
| M6 | Cybersecurity, Reporting & Capstone | 🔜 Geplant |

## Module 3

Modul 3 ist die erste vollständige Lerneinheit und das Herzstück des MVP.

### Lektionen

1. [Einführung in Compliance-as-Code](curriculum/module-03-compliance-as-code/lessons/01-introduction.md)
2. [OPA & Rego Grundlagen](curriculum/module-03-compliance-as-code/lessons/02-opa-rego-basics.md)
3. [Der Übersetzungsprozess: Gesetzestext → Code](curriculum/module-03-compliance-as-code/lessons/03-translation-process.md)
4. [Policy Testing & CI/CD-Integration](curriculum/module-03-compliance-as-code/lessons/04-testing-cicd.md)

### Übungen

1. [DSGVO Art. 32 – Verschlüsselungsprüfung](curriculum/module-03-compliance-as-code/exercises/01-gdpr-encryption-check.md) (Beginner)
2. [DORA Art. 18 – ICT-Incident-Klassifizierung](curriculum/module-03-compliance-as-code/exercises/02-dora-incident-classification.md) (Intermediate)
3. [End-to-End Compliance Pipeline](curriculum/module-03-compliance-as-code/exercises/03-e2e-pipeline.md) (Advanced)

### Runbook & Beispiel-Inputs

- [Modul-3-Runbook](curriculum/module-03-compliance-as-code/runbook.md)
- [GDPR Art. 32 Beispiel-Input](curriculum/module-03-compliance-as-code/examples/gdpr-article32-input.json)
- [DORA Art. 18 Beispiel-Input](curriculum/module-03-compliance-as-code/examples/dora-article18-input.json)

### Compliance-as-Code Library

- [`compliance-as-code/gdpr/article32/`](compliance-as-code/gdpr/article32/) – DSGVO Verschlüsselungsprüfung (Policy + Tests)
- [`compliance-as-code/dora/`](compliance-as-code/dora/) – DORA Incident-Klassifizierung

## Getting Started

### Voraussetzungen

- Grundkenntnisse in Python oder SQL
- GitHub-Account
- Docker Desktop installiert
- OPA CLI (optional, für lokale Policy-Tests)

### Schnellstart

```bash
# Repository klonen
git clone https://github.com/endvater/open-regtech-academy.git
cd open-regtech-academy

# Erste Lektion und Runbook lesen
less curriculum/module-03-compliance-as-code/lessons/01-introduction.md
less curriculum/module-03-compliance-as-code/runbook.md

# Beispiel-Policy evaluieren (OPA CLI)
opa eval -d compliance-as-code/gdpr/article32 \
  -i curriculum/module-03-compliance-as-code/examples/gdpr-article32-input.json \
  "data.gdpr.article32.encryption.summary"

# Optional: Lab-Umgebung starten
cd labs/lab-opa-sandbox
docker-compose up -d
# → OPA auf localhost:8181
# → PostgreSQL auf localhost:5432
# → Grafana auf localhost:3000
```

### KI-Tutor einrichten

```bash
# System Prompt für allgemeinen RegTech-Tutor:
cat ai-prompts/regtech-tutor-system-prompt.md

# Modulspezifischer Compliance-as-Code Tutor:
cat ai-prompts/module-03-compliance-tutor.md

# → In deinen bevorzugten LLM-Client kopieren
```

## Repository-Struktur

```
open-regtech-academy/
├── curriculum/
│   └── module-03-compliance-as-code/  # ✅ Verfügbar
│       ├── examples/      (Beispiel-Inputs)
│       ├── lessons/       (4 Lektionen)
│       ├── exercises/     (3 Übungen)
│       ├── solutions/     (Musterlösungen)
│       └── runbook.md
├── compliance-as-code/
│   ├── gdpr/article32/    # ✅ Policy + Tests
│   └── dora/              # ✅ Incident-Klassifizierung
├── labs/
│   └── lab-opa-sandbox/   # ✅ Docker-Compose
├── ai-prompts/            # ✅ LLM System Prompts
├── scripts/               # ✅ Repo-Checks (z.B. Markdown-Links)
├── synthetic-data/        # 🔜 In Entwicklung
└── .github/               # ✅ Issue Templates, CI/CD
```

## Contributing

Wir freuen uns über Beiträge! Siehe [CONTRIBUTING.md](CONTRIBUTING.md) für Details.

Besonders gesucht:
- **OPA-Policies** für weitere DSGVO-Artikel, DORA-Anforderungen, EU AI Act
- **Curriculum-Beiträge** für Module 1–2 und 4–6
- **Lab-Verbesserungen** und neue Testdaten
- **Reviews** der bestehenden Policies durch Compliance-Experten

## Roadmap

| Phase | Zeitrahmen | Inhalt |
|-------|-----------|--------|
| **v0.1 (jetzt)** | — | Modul 3 komplett, Lab, CI/CD, DSGVO+DORA-Policies |
| v0.2 | +2 Monate | Module 1 (Regulatorik) + 2 (Architektur), Dual-Track Onboarding |
| v0.3 | +4 Monate | Module 4 (KYC/AML) + 5 (AI Governance), Synthetische Datengeneratoren |
| v1.0 | +6 Monate | Alle 6 Module, Zertifizierungsprüfung, erste Kohorte |

Langfristige Vision: Community Hub, Corporate Labs, Continuous Certification. Das vollständige Gesamtkonzept (Studienplan, Geschäftsmodell, Academy-Vision) wird separat gepflegt.

## Lizenz

- **Code & Policies**: [Apache 2.0](LICENSE)
- **Curriculum Content**: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

## Disclaimer

Dieses Repository stellt Bildungsmaterial und Beispielcode bereit. Es ersetzt keine rechtliche Beratung. Die finale Verantwortung für Compliance-Entscheidungen liegt beim Anwender bzw. Unternehmen. Regulatorische Informationen entsprechen dem Stand April 2026. Lehrbeispiel-Policies (insbesondere die DORA-Schwellenwerte) sind vereinfacht und müssen für den produktiven Einsatz an die konkreten RTS/ITS-Vorgaben angepasst werden.

---

<p align="center">
  <em>Built with care by the Open RegTech Community</em>
</p>
