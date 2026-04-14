<p align="center">
  <strong>Open RegTech Engineering Academy</strong><br>
  <em>Open-Source-Zertifizierungsplattform für RegTech Engineers</em><br>
  <code>v0.1-beta · Modul 3 live, Modul 4 Foundations in Arbeit</code>
</p>

<p align="center">
  <a href="#about">About</a> · <a href="#status">Status</a> · <a href="#onboarding-preview">Onboarding</a> · <a href="#modul-1-preview">Modul 1</a> · <a href="#module-3">Modul 3</a> · <a href="#modul-4-preview">Modul 4</a> · <a href="#getting-started">Getting Started</a> · <a href="#contributing">Contributing</a> · <a href="#roadmap">Roadmap</a>
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
| **Dual-Track Onboarding** | 🧪 Preview | Zwei Einstiegspfade fuer Compliance- und Tech-Lernende |
| **Modul 1: EU-Regulatorik Skeleton** | 🧪 Preview | Lernziele, Lektionen und Reading Path |
| **Modul 3: Compliance-as-Code** | ✅ Verfügbar | 4 Lektionen, 4 Uebungen, Musterloesung |
| **Modul 4: Fincrime 360 Foundations** | 🧪 Preview | Payment-Rails-Lektion + erstes Parsing-Lab |
| **DSGVO-Policy (Art. 32)** | ✅ Verfügbar | OPA/Rego Policy + 8 Tests |
| **DSGVO-Policy (Art. 25)** | ✅ Verfügbar | Privacy-by-Design Lehrbeispiel + Tests |
| **DORA-Policy (Art. 18)** | ✅ Verfügbar | Incident-Klassifizierung (Lehrbeispiel) |
| **Lab-Umgebung** | ✅ Verfügbar | Docker-Compose (OPA + PostgreSQL + Grafana) |
| **KI-Tutor-Prompts** | ✅ Verfügbar | System Prompts für Modul 3 |
| **CI/CD Workflow** | ✅ Verfügbar | Auto-Grading via GitHub Actions |
| Module 1–2, 4–6 | 🔜 Geplant | Siehe Roadmap |
| Dual-Track Onboarding | 🔜 Geplant | Compliance→Tech / Tech→Compliance |

## Geplantes Curriculum (Vollausbau)

Das Zielprogramm umfasst 22 Wochen (berufsbegleitend, 8–12h/Woche):

| Modul | Thema | Status |
|-------|-------|--------|
| Onboarding | Dual-Track (Compliance→Tech / Tech→Compliance) | 🧪 Preview |
| M1 | Regulatorische Landschaft EU/DACH (DORA, MiCAR, AI Act, DSGVO) | 🧪 Skeleton |
| M2 | Data Architecture & RegTech Stack | 🔜 Geplant |
| **M3** | **Compliance-as-Code (OPA, Rego, Policy Testing)** | **✅ Verfügbar** |
| M4 | Fincrime 360: KYC, AML, Fraud, Sanctions & Payment Rails | 🧪 Foundations |
| M5 | AI Governance, Audit, Privacy & Open-Source Intelligence | 🔜 Geplant |
| M6 | Cybersecurity, Regulatory Reporting & Capstone | 🔜 Geplant |

## Onboarding Preview

Das Dual-Track-Onboarding ist der Einstieg fuer beide Hauptzielgruppen der
Academy:

1. **Compliance -> Tech**  
   fuer Fachleute mit starkem regulatorischem Wissen und technischem
   Aufholbedarf
2. **Tech -> Compliance**  
   fuer Engineers mit Software- und Datenhintergrund, die die regulatorische
   Logik sauber aufbauen wollen

Der aktuelle Preview liegt hier:

- [Dual-Track Onboarding](curriculum/onboarding-dual-track/README.md)

## Modul 1 Preview

`Modul 1` schafft den gemeinsamen regulatorischen Wortschatz fuer die spaeteren
Coding-, Data- und Lab-Module. Der aktuelle Skeleton enthaelt Lernziele,
Lektionstitel und eine erste Einordnung von `DORA`, `MiCAR`, `AI Act` und
`DSGVO`.

- [Modul 1: EU Regulatory Landscape](curriculum/module-01-eu-regulatory-landscape/README.md)

## Fincrime 360 als Curriculum-Linse

Die Academy erweitert den klassischen AML/KYC-Blick schrittweise zu einem
`Fincrime 360`-Ansatz. Ziel ist nicht, einzelne Disziplinen additiv
nebeneinanderzustellen, sondern technische, regulatorische und operative
Perspektiven in einem gemeinsamen Lernmodell zu verbinden.

### Die sechs Perspektiven

Jedes groessere Fincrime-Szenario soll kuenftig aus sechs Blickwinkeln
bearbeitet werden:

1. **Regulatorische Perspektive**  
   Was verlangen AMLR, DSGVO, DORA, Sanktionen, MiCAR oder lokale Vorgaben?
2. **Technische Perspektive**  
   Wie werden Daten, Regeln, Modelle, APIs und Workflows implementiert?
3. **Law-Enforcement-Perspektive**  
   Welche Daten- und Berichtsqualitaet brauchen FIU, Ermittler und Aufsicht?
4. **Wirtschaftliche Perspektive**  
   Welche Kosten verursachen False Positives, Friktion, Verzugs- oder
   Liquiditaetsschaeden?
5. **Forensische Perspektive**  
   Wie entsteht aus Alerts, Beziehungen und Ereignissen ein belastbares Fallbild?
6. **Governance-Perspektive**  
   Welche Kontrollen, Verantwortlichkeiten, Audit Trails und kulturellen
   Voraussetzungen machen das System tragfaehig?

### Fehlende, aber zentrale Deep-Dive-Dimensionen

Neben den "Klassikern" `KYC`, `AML`, `Fraud` und `Sanctions` adressiert die
Academy kuenftig auch die Perspektiven, die in der Praxis oft die groessten
Architekturprobleme verursachen:

- **Data Privacy vs. Fincrime**  
  DSGVO, Bankgeheimnis, Datenminimierung, Privacy Enhancing Technologies,
  Federated Learning und verschluesseltes Rechnen
- **Web3 und On-Chain Fincrime**  
  Wallet-Tracing, Bridges, Mixer, DEX-Kontext und Off-Ramp-Risiken
- **OSINT und Adverse Media**  
  Transparenzregister, UBO-Kontext, externe Signale, NLP-gestuetzte
  Negativmeldungen
- **Internal Fraud und ABC**  
  Mitarbeiterzugriffe, Segregation of Duties, Maker-Checker-Umgehungen,
  Anti-Bribery-and-Corruption-Kontrollen
- **Regulatory Reporting**  
  SAR/STR-Erstellung, Narrative aus strukturierten Daten, Qualitaet und
  Vollstaendigkeit von Behoerdenmeldungen

Diese Deep Dives sollen nicht als Randthemen laufen, sondern als integraler
Bestandteil von `M4`, `M5` und `M6`.

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

### Compliance-as-Code Library

- [`compliance-as-code/gdpr/article32/`](compliance-as-code/gdpr/article32/) – DSGVO Verschlüsselungsprüfung (Policy + Tests)
- [`compliance-as-code/gdpr/article25/`](compliance-as-code/gdpr/article25/) – DSGVO Privacy by Design & by Default
- [`compliance-as-code/dora/`](compliance-as-code/dora/) – DORA Incident-Klassifizierung

## Modul 4 Preview

`Modul 4` befindet sich noch im Aufbau. Die ersten Foundations sind bereits als
offener Preview im Repository angelegt:

### Lernartefakte

1. [Modul 4: Fincrime 360](curriculum/module-04-fincrime-360/README.md)
2. [Lektion 1: Payment Rails for Compliance Engineers](curriculum/module-04-fincrime-360/lessons/01-payment-rails-for-compliance-engineers.md)
3. [Lektion 2: Missing Perspectives & Deep Dives](curriculum/module-04-fincrime-360/lessons/02-missing-perspectives-and-deep-dives.md)

### Lab

- [`labs/lab-fincrime360-sandbox/`](labs/lab-fincrime360-sandbox/) – Parsing einer vereinfachten `pacs.008` in ein kanonisches Payment-Event

## Getting Started

### Voraussetzungen

- Grundkenntnisse in Python oder SQL
- GitHub-Account
- Docker Desktop installiert

### Schnellstart

```bash
# Repository klonen
git clone https://github.com/endvater/open-regtech-academy.git
cd open-regtech-academy

# Lab-Umgebung starten
cd labs/lab-opa-sandbox
docker compose up -d
# → OPA auf localhost:8181
# → PostgreSQL auf localhost:5432
# → Grafana auf localhost:3000

# Runbook fuer Modul 3 oeffnen
open MODULE_03_RUNBOOK.md
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
│   ├── onboarding-dual-track/           # 🧪 Preview
│   ├── module-01-eu-regulatory-landscape/ # 🧪 Skeleton
│   ├── module-03-compliance-as-code/  # ✅ Verfügbar
│   │   ├── lessons/       (4 Lektionen)
│   │   ├── exercises/     (4 Uebungen)
│   │   └── solutions/     (Musterlösungen)
│   └── module-04-fincrime-360/        # 🧪 Foundations / Preview
│       └── lessons/       (erste Lektionen)
├── compliance-as-code/
│   ├── gdpr/article32/    # ✅ Policy + Tests
│   ├── gdpr/article25/    # ✅ Privacy by Design Beispiel
│   └── dora/              # ✅ Incident-Klassifizierung
├── labs/
│   ├── lab-opa-sandbox/         # ✅ Docker-Compose
│   └── lab-fincrime360-sandbox/ # 🧪 Payment Rails Parsing
├── ai-prompts/            # ✅ LLM System Prompts
├── scripts/               # ✅ Repo-Checks und Hilfsskripte
├── synthetic-data/        # 🔜 In Entwicklung
└── .github/               # ✅ Issue Templates, PR-Template, CI/CD
```

## Contributing

Wir freuen uns über Beiträge! Siehe [CONTRIBUTING.md](CONTRIBUTING.md) für Details.

Besonders gesucht:
- **OPA-Policies** für weitere DSGVO-Artikel, DORA-Anforderungen, EU AI Act
- **Curriculum-Beiträge** für Module 1–2 und 4–6
- **Lab-Verbesserungen** und neue Testdaten
- **Fincrime-360-Szenarien** zu Privacy, Web3, OSINT, Internal Fraud und SAR/STR-Automatisierung
- **Prompt-Eval-Laeufe** fuer Tutor-Qualitaet und Failure-Case-Dokumentation
- **Reviews** der bestehenden Policies durch Compliance-Experten

## Roadmap

| Phase | Zeitrahmen | Inhalt |
|-------|-----------|--------|
| **v0.1 (jetzt)** | — | Modul 3 komplett, Lab, CI/CD, DSGVO+DORA-Policies |
| v0.2 | +2 Monate | Module 1 (Regulatorik) + 2 (Architektur), Dual-Track Onboarding, Payment-Rails-Basics |
| v0.3 | +4 Monate | Modul 4 (Fincrime 360), Synthetic Incident Generator, erste Deep Dives zu Privacy/Web3/OSINT |
| v1.0 | +6 Monate | Alle 6 Module, Zertifizierungspruefung, Regulatory Reporting, erste Kohorte |

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
