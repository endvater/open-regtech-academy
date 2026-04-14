# Lektion 3: Customer, UBO and Risk

## Fokus

Fincrime-Systeme scheitern oft nicht an der Transaktion, sondern an einem zu
flachen Bild des Kunden. Diese Lektion erweitert den Blick von der einzelnen
Partei auf Organisationsstruktur, wirtschaftlich Berechtigte, Rollen und
laufende Risikoaenderungen.

## Kernfragen

- Welche Parteien und Rollen muessen wir neben dem formalen Kunden mitdenken?
- Wie unterscheiden sich `onboarding risk`, `ongoing risk` und `event-driven risk`?
- Wie verbinden sich UBO, Gegenpartei, Produkt, Korridor und externe Signale?

## Warum das wichtig ist

Ein formell sauberer Kunde kann operativ hochriskant sein, wenn:

- Gegenparteien sich mit demselben UBO oder Kontrollkreis verbinden
- Aktivitaeten nicht zum Geschaeftsprofil passen
- neue externe Signale das Bild veraendern
- der Kunde fuer Screening, Monitoring und Fraud jeweils andere Datenluecken hat

## Kernelemente eines belastbaren Risikobilds

### 1. Parteien und Rollen

Mindestens unterschieden werden sollten:

- Kunde oder Vertragspartei
- wirtschaftlich Berechtigte
- Directors oder Kontrollpersonen
- Gegenparteien
- beteiligte PSPs oder Intermediaere

### 2. Statische und dynamische Signale

Statisch:

- Land
- Produkt
- Rechtsform
- Branchennaehe

Dynamisch:

- neue Gegenparteien
- veraenderte Nutzungsmuster
- OSINT oder adverse media
- haeufige Ausnahmen oder manuelle Overrides

### 3. Perpetual KYC statt Einmalpruefung

Ein gutes System betrachtet `KYC` nicht als abgeschlossene Checkliste, sondern
als laufende Aktualisierung des Kunden- und Netzwerkbilds.

## Typische Architekturfehler

- UBO-Daten nur als PDF oder Freitext halten
- organisatorische Rollen nicht im Datenmodell ausdruecken
- denselben Risikowert fuer alle Kontrollpfade verwenden
- Review-Ausnahmen nicht in das kuenftige Risikobild zurueckspiegeln

## Erwartetes Artefakt

Teilnehmende skizzieren ein einfaches Risikomodell mit:

- `customer`
- `ubo`
- `counterparty`
- `risk_factors`
- `review_triggers`
