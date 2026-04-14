# Lektion 1: Canonical Data Models for RegTech

## Fokus

Diese Lektion erklaert, warum RegTech-Systeme ein gemeinsames internes Modell
fuer Entitaeten, Events und Cases brauchen.

## Warum das wichtig ist

Fast jede produktive RegTech-Landschaft startet mit heterogenen Quellsystemen:
CRM, KYC, Payment Hub, Core Banking, Case Management, OSINT-Feeds oder
Access-Logs. Wenn jedes Team nur im eigenen Schema denkt, entstehen
unvergleichbare IDs, doppelte Regeln und unklare Evidenzpfade.

Ein kanonisches Modell ist keine akademische Uebung. Es ist die Voraussetzung
fuer:

- stabile Referenzen ueber mehrere Systeme hinweg
- wiederverwendbare Kontrollen und Policies
- nachvollziehbare Alert- und Case-Bildung
- spaetere Reporting-, Audit- und Explainability-Anforderungen

## Kernfragen

- Welche Objekte tauchen in fast jedem RegTech-System wieder auf?
- Wie unterscheiden sich Source-Schema und kanonisches Zielmodell?
- Welche Felder muessen fuer Audit, Detection und Reporting stabil bleiben?

## Kernideen

### 1. Drei Grundobjekte

- `entity`: Kunde, Organisation, Konto, Wallet, Device, Mitarbeiter, Gegenpartei
- `event`: Onboarding, Login, Zahlung, Alert, Regel-Entscheidung, Listen-Treffer
- `case`: strukturierte Sammlung von Evidenz, Bewertung, Eskalation und Outcome

### 2. Source-Systeme bleiben erhalten

Ein kanonisches Modell ersetzt die Herkunftssysteme nicht. Es bildet eine
stabile interne Sprache, in die relevante Signale abgebildet werden.

### 3. IDs sind Produktentscheidungen

Besonders wichtig sind:

- `source_id`: Referenz auf das Ursprungssystem
- `canonical_id`: stabile interne Referenz
- `event_id` und `correlation_id`: Verknuepfung von Folgeschritten
- `case_id`: dauerhafte Referenz fuer Analysten, Audit und Reporting

### 4. Pflichtfelder fuer spaetere Kontrolle

Mindestens diese Kategorien sollten im Zielmodell mitgedacht werden:

- Identitaet und Rollen
- Zeitbezug
- Quelle und Vertrauensniveau
- Status und Version
- Evidenz und Begruendung

## Typische Architekturfehler

- Payment-Nachrichten direkt als "Transaktion" abspeichern und Lifecycle verlieren
- Kunden, Konten und Gegenparteien nicht sauber trennen
- Alerts ohne Referenz auf Datenstand, Regelversion und Evidenz erzeugen
- Freitextfelder spaeter fuer Audit ueberfrachten, weil strukturierte Felder fehlen

## Mini-Beispiel

Ein `payment_event` allein reicht nicht. Fuer eine spaetere Bewertung braucht
man oft zusaetzlich:

- den zugeordneten `customer`
- das `account`
- die beteiligten `agents`
- die `rule_execution`, die zu einem Alert fuehrte
- den `case`, in dem das Ereignis spaeter eskaliert wurde

## Lernartefakt

Am Ende der Lektion sollen Teilnehmende ein erstes kanonisches Modell mit
folgenden Bausteinen skizzieren:

- `party`
- `account`
- `payment_event`
- `alert`
- `case`

## Bruecke zu M3 und M4

`M3` braucht stabile Inputs fuer Policies. `M4` braucht stabile Beziehungen
zwischen Payment, Kunde, Alert und Investigation. Das kanonische Modell ist der
gemeinsame Unterbau fuer beides.
