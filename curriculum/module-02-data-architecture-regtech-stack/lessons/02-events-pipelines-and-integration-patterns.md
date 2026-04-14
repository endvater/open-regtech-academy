# Lektion 2: Events, Pipelines and Integration Patterns

## Fokus

RegTech ist kein statischer Datenbestand, sondern ein Strom aus Aenderungen,
Events, Nachrichten und Folgeentscheidungen.

## Kernfragen

- Wann ist `batch` sinnvoll, wann `streaming` oder `event-driven`?
- Welche Integrationsmuster passen zu Payment, KYC, OSINT und Case-Management?
- Wie werden Idempotenz, Replays und Fehlertoleranz relevant?

## Warum das wichtig ist

Viele Kontrollsysteme scheitern nicht an der Erkennung, sondern am Timing.
Screening braucht oft eine Vorab-Entscheidung innerhalb von Millisekunden.
Monitoring darf historischer und schwergewichtiger arbeiten. Reporting und
Audit brauchen konsistente Folgeereignisse.

Deshalb muss die Architektur verstehen, wie Signale eintreffen und wie sie
weiterverarbeitet werden.

## Drei Grundmuster

### 1. Batch

Geeignet fuer:

- historische Analysen
- taegliche Aggregationen
- Backfills und Reconciliation

Risiken:

- spaete Erkennung
- schwierige Root-Cause-Analyse bei grossen Sammellaufen

### 2. Streaming

Geeignet fuer:

- near-real-time Fraud Signale
- laufende Enrichment-Pipelines
- schnelle Alert-Vorverarbeitung

Risiken:

- Komplexitaet bei Reihenfolge, Deduplizierung und Zustand

### 3. Event-driven

Geeignet fuer:

- explizite Domainenereignisse wie `alert_created`, `case_opened`,
  `payment_returned`
- klar verteilte Verantwortlichkeiten zwischen Systemen

Risiken:

- zu viele schlecht definierte Events
- fehlende Ownership fuer Nebenwirkungen

## Integrationsmuster, die in RegTech haeufig auftreten

- API Pull fuer Stammdaten oder Ad-hoc-Abfragen
- ETL / ELT fuer historisierte Bestandsdaten
- Message Parsing fuer Zahlungsnachrichten
- Event Bus fuer Folgeentscheidungen und Statuswechsel
- Reverse ETL oder Write-back fuer Alerts, Cases und Entscheidungen

## Wichtige technische Eigenschaften

- `idempotency`: dieselbe Nachricht darf nicht doppelt zaehlen
- `replayability`: Fehler muessen ohne Datenverlust erneut verarbeitet werden koennen
- `ordering assumptions`: besonders heikel bei Status- und Folgeereignissen
- `backpressure`: Echtzeitpfade brauchen definiertes Verhalten unter Last
- `dead-letter handling`: unparsebare oder unvollstaendige Events duerfen nicht verschwinden

## Typische Architekturfehler

- Echtzeit-SLA mit Batch-Denken planen
- Folgeevents wie `return`, `reject` oder `case_closed` nicht modellieren
- Case Management nur als UI betrachten statt als System mit eigener Ereignislogik
- OSINT- oder Listen-Updates nicht versioniert in die Pipeline aufnehmen

## Lernartefakt

Teilnehmende skizzieren einen Event-Flow mit mindestens:

- Eingangssignal
- Parsing oder Normalisierung
- Kontrollpunkt
- Alert oder Entscheidung
- menschlichem Review oder Folgeevent

## Bruecke zu M3 und M4

`M3` profitiert von klaren Kontrollpunkten fuer Policies. `M4` braucht
Lifecycle-Verstaendnis, damit aus Einzelereignissen belastbare Fincrime-Faelle
werden.
