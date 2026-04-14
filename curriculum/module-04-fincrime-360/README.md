# Modul 4: Fincrime 360

> **Wochen 12-15** · 4 Wochen · ca. 8-12h/Woche
> **Brueckenmodul** zwischen Regulatorik, Zahlungsverkehr, Detection
> Engineering und Investigation

## Warum dieses Modul existiert

Viele Ausbildungsprogramme behandeln `KYC`, `AML`, `Fraud`, `Sanktionen`,
`Payment Rails`, `Datenschutz` und `Regulatory Reporting` als getrennte
Themen. In der Praxis treffen sie jedoch in denselben Systemen, Datenmodellen
und Analysten-Workflows aufeinander.

`Modul 4` bringt diese Perspektiven in einem `Fincrime 360`-Ansatz zusammen:

- ein gemeinsamer Referenzfall statt isolierter Einzelfaelle
- mehrere Blickwinkel auf dieselben Daten und Ereignisse
- technische Labs, die echte Architekturfragen sichtbar machen
- reproduzierbare Open-Source-Artefakte statt Black-Box-Demos

## Lernziele

Nach Abschluss dieses Moduls koennen Teilnehmende:

1. Zahlungsverkehr, KYC-, Fraud- und AML-Signale in einem gemeinsamen Modell
   denken
2. den Unterschied zwischen `transaction screening`, `transaction monitoring`
   und `fraud detection` architektonisch erklaeren
3. Payment-Nachrichten und KYC-Signale in ein kanonisches Event- und
   Fallmodell ueberfuehren
4. Netzwerk-, Governance- und Investigator-Perspektiven in einem gemeinsamen
   Fallbild verbinden
5. Fincrime-Loesungen nicht nur nach Detection-Logik, sondern auch nach
   Betriebsfaehigkeit, Governance und Nutzwert fuer Ermittler bewerten

## Modulstruktur

### Woche 12: Rails, Customer and Risk

- Payment Rails und ISO 20022
- Kunde, Gegenpartei, UBO und Risk Context
- Referenzfall und erste Feldmappings

### Woche 13: Alerts, Typologies and Boundaries

- Unterschiede zwischen Screening, Monitoring und Fraud
- Typologien und Kontrollpunkte
- Alert-Design und False-Positive-Druck

### Woche 14: Investigation and Networks

- Triage, Case Building und Eskalation
- Netzwerk- und Beziehungssicht
- Analysten- und Reviewer-Pfade

### Woche 15: Governance and Operating Model

- Governance, Audit und Model Risk
- Betriebsmodell und Vendor-Evaluierung
- Bruecke zu `M5` und `M6`

## Die sechs Perspektiven

Jede groessere Lektion oder Uebung in diesem Modul soll sechs Perspektiven
adressieren:

1. **Regulatorisch**  
   Welche Pflichten, Grenzen und Definitionsfragen gelten?
2. **Technisch**  
   Welche Daten, Nachrichten, Regeln, Modelle und APIs sind beteiligt?
3. **Law Enforcement**  
   Welche Qualitaet muessen Alerts, Narrative und Meldungen fuer externe
   Stellen erreichen?
4. **Wirtschaftlich**  
   Welche Kosten verursachen False Positives, Kundenfriktion oder verzoegerte
   Zahlungen?
5. **Forensisch**  
   Wie wird aus Daten ein belastbarer Fall?
6. **Governance**  
   Wer entscheidet was, wie werden Regeln gepflegt und wie bleibt das System
   auditierbar?

## Lektionen

1. [Payment Rails for Compliance Engineers](lessons/01-payment-rails-for-compliance-engineers.md)
2. [Missing Perspectives & Deep Dives](lessons/02-missing-perspectives-and-deep-dives.md)
3. [Customer, UBO and Risk](lessons/03-customer-ubo-and-risk.md)
4. [Transactions, Alerts and Typologies](lessons/04-transactions-alerts-and-typologies.md)
5. [Investigations and Escalation](lessons/05-investigations-and-escalation.md)
6. [Network Analysis and Graph Thinking](lessons/06-network-analysis-and-graph-thinking.md)
7. [Governance, Audit and Model Risk](lessons/07-governance-audit-and-model-risk.md)
8. [Fincrime Operating Model and Vendor Evaluation](lessons/08-fincrime-operating-model-and-vendor-evaluation.md)

## Uebungen

1. [Customer and UBO Risk Mapping](exercises/01-customer-and-ubo-risk-mapping.md)
2. [Screening, Monitoring and Fraud Boundary Map](exercises/02-screening-monitoring-and-fraud-boundary-map.md)
3. [Alert to Case Narrative](exercises/03-alert-to-case-narrative.md)
4. [Network and Typology Review](exercises/04-network-and-typology-review.md)

## Referenzfall und Daten

Dieses Modul arbeitet mit einem synthetischen Referenzfall:

- [Synthetic Fincrime 360 Reference Case](../../synthetic-data/fincrime-360/README.md)

Der Referenzfall verbindet:

- Kunden- und UBO-Kontext
- mehrere Zahlungen
- Alerts und OSINT-Signale
- Beziehungskanten fuer Netzwerkanalyse

## Lab-Komponente

Das technische Einstiegslab fuer dieses Modul liegt unter:

- [Lab: Payment Rails Mapping](../../labs/lab-fincrime360-sandbox/README.md)

Es fuehrt in die Uebersetzung einer vereinfachten `pacs.008` in ein
kanonisches Payment-Event ein und bildet die Grundlage fuer spaetere Screening-,
Monitoring- und Fraud-Uebungen.

## Deep-Dive-Tracks

Die folgenden Bereiche gelten als Pflichtdimensionen des `fincrime 360`-
Ansatzes und verknuepfen `M4` mit `M5` und `M6`:

- `data privacy vs. fincrime`
- `web3 und on-chain fincrime`
- `osint und adverse media`
- `internal fraud und abc`
- `regulatory reporting`

## Dual-Track-Nutzung

### Track A: Compliance -> Tech

- erst Problemraum, dann Datenmodell und Lab
- staerkerer Fokus auf Erklaerbarkeit, Reporting und Governance

### Track B: Tech -> Compliance

- erst Nachricht, Datenfluss und Parsing
- danach regulatorische Pflichten, Eskalation und Investigator-Sicht

## Beitragspotenziale

Willkommene Community-Beitraege fuer dieses Modul:

- synthetische Fincrime-Szenarien
- Beispielnachrichten und Feldmappings
- OSINT- und Adverse-Media-Demos
- Privacy-Preserving-Analytics-Beispiele
- Reporting-Templates und Case-Narrative
