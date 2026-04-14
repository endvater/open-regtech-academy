# Modul 4: Fincrime 360

> **Wochen 12–15** · 4 Wochen · ca. 8–12h/Woche
> **Brückenmodul** zwischen Regulatorik, Zahlungsverkehr, Detection Engineering
> und Investigation

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
2. den Unterschied zwischen `Transaction Screening`, `Transaction Monitoring`
   und `Fraud Detection` architektonisch erklaeren
3. Payment-Nachrichten in ein kanonisches Eventmodell ueberfuehren
4. fehlende Perspektiven wie `Privacy`, `Web3`, `OSINT`, `Internal Fraud` und
   `Regulatory Reporting` technisch einordnen
5. Fincrime-Loesungen nicht nur nach Detection-Logik, sondern auch nach
   Betriebsfaehigkeit, Governance und Nutzwert fuer Ermittler bewerten

## Die sechs Perspektiven

Jede groessere Lektion oder Uebung in diesem Modul soll kuenftig sechs
Perspektiven adressieren:

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

## Geplante Struktur

### Foundations

1. [Payment Rails for Compliance Engineers](lessons/01-payment-rails-for-compliance-engineers.md)
2. [Missing Perspectives & Deep Dives](lessons/02-missing-perspectives-and-deep-dives.md)

### Geplante weitere Lektionen

3. `Customer, UBO & Risk`
4. `Transactions, Alerts & Typologies`
5. `Investigations & Escalation`
6. `Network Analysis & Graph Thinking`
7. `Governance, Audit & Model Risk`
8. `SAR/STR Reporting from Structured Data`

## Deep-Dive-Tracks

Die folgenden Bereiche gelten als Pflichtdimensionen des `Fincrime 360`-Ansatzes:

### 1. Data Privacy vs. Fincrime

Wie lassen sich Muster ueber Silos, Jurisdiktionen oder Institute hinweg
erkennen, ohne Rohdaten unkontrolliert zusammenzufuehren?

Beispielthemen:

- Zweckbindung und Datenminimierung
- Privacy Enhancing Technologies
- Federated Learning
- verschluesseltes Rechnen
- Trennung von Trainings-, Ermittlungs- und Auditdaten

### 2. Web3 und On-Chain Fincrime

Wie werden Blockchain-, Wallet- und Off-Ramp-Daten in klassische AML- und
Fraud-Workflows eingebunden?

Beispielthemen:

- Wallet-Cluster
- Bridges und Mixer
- DEX-Kontext
- VASP-Schnittstellen
- Krypto-zu-Fiat-Off-Ramps

### 3. OSINT und Adverse Media

Wie werden externe, oft unstrukturierte Daten als Risiko- und Kontextsignale
nutzbar?

Beispielthemen:

- Transparenzregister
- UBO-Kontext
- adverse media
- Entity Resolution
- Quellenbewertung und Datenqualitaet

### 4. Internal Fraud und ABC

Wie ueberwacht man nicht nur Zahlungen, sondern auch die Systeme und
Mitarbeiterhandlungen, die Zahlungen moeglich machen?

Beispielthemen:

- Segregation of Duties
- Maker-Checker-Kontrollen
- auffaellige Zugriffe
- PEP-bezogene Mitarbeiteraktivitaeten
- Anti-Bribery-and-Corruption-Muster

### 5. Regulatory Reporting

Wie werden aus strukturierten Signalen belastbare, vollstaendige und
zeitgerechte Behoerdenmeldungen?

Beispielthemen:

- SAR/STR-Narrative
- Feldmapping fuer Meldungen
- Qualitaet von Verdachtsmeldungen
- LLM-Assistenz fuer Entwuerfe
- Human-in-the-loop-Freigaben

## Lab-Komponente

Das erste technische Lab fuer dieses Modul liegt unter:

- [`../../labs/lab-fincrime360-sandbox/`](../../labs/lab-fincrime360-sandbox/)

Es fuehrt in die Uebersetzung einer vereinfachten `pacs.008` in ein
kanonisches Payment-Event ein und bildet die Grundlage fuer spaetere Screening-,
Monitoring- und Fraud-Uebungen.

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
