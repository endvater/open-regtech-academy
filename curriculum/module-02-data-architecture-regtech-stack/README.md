# Modul 2: Data Architecture & RegTech Stack

> **Wochen 4-8** · 5 Wochen · ca. 8-12h/Woche
> **Prioritaetsmodul** zwischen Regulatorik, Datenmodellen und
> Compliance-as-Code

## Warum dieses Modul wichtig ist

Viele RegTech-Projekte scheitern nicht daran, dass Teams die Regulierung nicht
lesen koennen. Sie scheitern daran, dass sie aus regulatorischen Anforderungen
kein tragfaehiges Daten- und Systemmodell ableiten.

`Modul 2` ist deshalb die technische Bruecke der Academy:

- `M1` erklaert die regulatorische Landschaft
- `M2` baut das technische Zielbild aus Daten, Events, APIs und Controls
- `M3` operationalisiert einzelne Anforderungen als Policy-Code
- `M4` bringt Fincrime-, Payment- und Investigation-Perspektiven zusammen

Ohne `M2` bleiben Policy-Beispiele schnell isoliert. Mit `M2` wird sichtbar,
wie ein belastbarer RegTech-Stack zusammenspielt.

## Lernziele

Nach Abschluss dieses Moduls koennen Teilnehmende:

1. ein kanonisches Datenmodell fuer RegTech- und Fincrime-Use-Cases entwerfen
2. `batch`, `streaming` und `event-driven` Architektur fuer Compliance-Kontexte
   unterscheiden
3. entscheiden, wann `SQL`, `Rules`, `Graphs`, `APIs` oder `ML` die passende
   technische Form sind
4. Datenqualitaet, Lineage, Auditierbarkeit und Access Controls als
   Architekturthemen benennen
5. Payment-, KYC-, Case- und External-Data-Signale in einem gemeinsamen
   Analysebild denken

## Modulstruktur

### Woche 4: Foundations

| Tag | Thema | Format |
|-----|-------|--------|
| Mo | Was ist ein RegTech-Stack? | Live-Seminar |
| Di-Mi | Kanonische Modelle, Entitaeten, Events | Selbstlernen |
| Do | Lab-Skizze: Datenfluss vom Input bis zur Entscheidung | Architektur-Workshop |
| Fr | Review: typische Architekturfehler | Community-Session |

### Woche 5: Systems & Flow

| Tag | Thema | Format |
|-----|-------|--------|
| Mo | Batch, Streaming, Event-Driven | Live-Seminar |
| Di-Mi | Integrationsmuster und Datenpipelines | Selbstlernen |
| Do | Mapping-Workshop fuer Payment/KYC/Alert-Daten | Praxis |
| Fr | Architektur-Review | Peer-Session |

### Woche 6: Detection Substrates

| Tag | Thema | Format |
|-----|-------|--------|
| Mo | Rule Engines, SQL, Graphs, ML | Live-Seminar |
| Di-Mi | Entscheidung, welches Werkzeug fuer welchen Use Case passt | Selbstlernen |
| Do | Datenmodell gegen Kontrolllogik spiegeln | Praxis |
| Fr | Design Review | Community |

### Woche 7: Quality & Governance

| Tag | Thema | Format |
|-----|-------|--------|
| Mo | Data Quality, Lineage, Explainability | Live-Seminar |
| Di-Mi | Access Controls, Privacy, Logging | Selbstlernen |
| Do | Observability im RegTech-Kontext | Praxis |
| Fr | Architektur-Reflexion | Review |

### Woche 8: Readiness for M3/M4

| Tag | Thema | Format |
|-----|-------|--------|
| Mo | Vom Datenmodell zur Policy | Live-Seminar |
| Di-Mi | Vom Datenmodell zum Fincrime Case | Selbstlernen |
| Do | Abschlussuebung: Zielarchitektur skizzieren | Assessment |
| Fr | Uebergang in M3/M4 | Community |

## Lektionen

1. [Canonical Data Models for RegTech](lessons/01-canonical-data-models.md)
2. [Events, Pipelines and Integration Patterns](lessons/02-events-pipelines-and-integration-patterns.md)
3. [Rules, SQL, Graphs and ML](lessons/03-rules-sql-graphs-and-ml.md)
4. [Payment Rails and Domain Boundaries](lessons/04-payment-rails-and-domain-boundaries.md)
5. [Entity Resolution and Network Thinking](lessons/05-entity-resolution-and-network-thinking.md)
6. [Data Quality, Lineage and Observability](lessons/06-data-quality-lineage-and-observability.md)
7. [Privacy, Access and Governance Controls](lessons/07-privacy-access-and-governance-controls.md)
8. [Target Architecture Workshop](lessons/08-target-architecture-workshop.md)

## Uebungen

1. [Canonical RegTech Model](exercises/01-canonical-regtech-model.md)
2. [Event Flow and Control Points](exercises/02-event-flow-and-control-points.md)
3. [Detection Substrate Decision Matrix](exercises/03-detection-substrate-decision-matrix.md)
4. [Target Architecture Review](exercises/04-target-architecture-review.md)

## Lab

- [Lab: RegTech Architecture Foundations](../../labs/lab-regtech-architecture-foundations/README.md)

## Architekturfragen, die dieses Modul beantworten soll

- Was ist eine `Entitaet`, was ist ein `Event`, was ist ein `Case`?
- Wann brauchen wir ein `kanonisches Modell`, wann reichen Source-Schemata?
- Welche Signale gehoeren in Echtzeit, welche in Batch?
- Wo wird `Versionierung` relevant: Datenmodell, Regelwerk, Prompt, Case?
- Wie verhindern wir, dass regulatorische Kontrollen als unverbundene
  Einzelskripte enden?

## Kernbausteine eines RegTech-Stacks

### 1. Source Systems

- Core Banking
- CRM / KYC
- Payment Hub
- External Data / OSINT
- Case Management
- Identity and Access Logs

### 2. Integration Layer

- APIs
- ETL / ELT
- Event Bus
- Message Parsing
- Schema Mapping

### 3. Detection & Decision Layer

- Rules / Policies
- SQL Checks
- Graph Analysis
- ML / Scoring
- Human Review Queues

### 4. Evidence & Control Layer

- Audit Trail
- Reporting
- Lineage
- Logging
- Explainability
- Access Governance

## Wiederkehrende Artefakte in M2

Jede groessere Lerneinheit in `M2` endet mit mindestens einem konkreten
Artefakt:

- ein Datenmodell oder Mapping
- ein Event- oder Kontrollfluss
- eine begruendete Architekturentscheidung
- ein Review mit Failure Modes, offenen Risiken und Betriebsannahmen

## Anschluss an andere Module

- `M3`: Regeln aus dem Datenmodell ableiten
- `M4`: Payment, Fincrime und Investigation auf diese Architektur legen
- `M5`: Privacy, AI Governance, OSINT und Audit Controls vertiefen
- `M6`: Cyber-/Reporting- und Capstone-Szenarien auf dem Stack aufbauen

## Empfohlene Uebungsformate

- Datenmodell in JSON oder Tabellenform entwerfen
- Event-Flows als Sequenz oder Mermaid skizzieren
- Domain Boundaries definieren
- passende Detection-Substrate begruenden
- Architektur-Reviews mit Failure Modes dokumentieren
