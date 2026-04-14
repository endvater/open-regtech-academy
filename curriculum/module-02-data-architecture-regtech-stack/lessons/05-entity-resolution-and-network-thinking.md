# Lektion 5: Entity Resolution and Network Thinking

## Fokus

RegTech- und Fincrime-Systeme muessen Personen, Organisationen, Konten,
Wallets, Geraete und Beziehungen ueber mehrere Quellen hinweg zusammenfuehren.

## Kernfragen

- Was ist eine Entitaet und wann ist ein Match belastbar?
- Wie verbinden sich UBO, Kunde, Konto, Device und Gegenpartei?
- Wann wird Graph-Denken dem relationalen Denken ueberlegen?

## Warum das wichtig ist

Fincrime-Risiko verteilt sich selten sauber entlang einzelner Kundendatensaetze.
Entscheidend sind Beziehungen: derselbe wirtschaftlich Berechtigte hinter
mehreren Firmen, gemeinsame Adressen, geteilte Geraete, wiederkehrende
Gegenparteien oder Wallet-Cluster.

## Kernideen

### 1. Keine perfekte Identitaet erwarten

Entity Resolution arbeitet mit Unsicherheit. Deshalb braucht das System:

- Match-Logik
- Match-Konfidenz
- Quellenreferenz
- Review-Moeglichkeit

### 2. Beziehungen sind First-Class Data

Nicht nur Knoten, auch Kanten sind relevant:

- `owns`
- `controls`
- `transacts_with`
- `uses_device`
- `shares_address`
- `reviewed_by`

### 3. Wann relational, wann graphisch?

Relationale Modelle reichen oft fuer:

- eindeutige Kunden-, Konto- und Eventtabellen
- Aggregationen und Regeln mit klaren Joins

Graphisches Denken hilft besonders bei:

- Multi-Hop-Fragen
- Netzwerk-Nachbarschaft
- UBO- und Gegenparteistrukturen
- komplexen Ermittlungs- und Investigation-Pfaden

## Typische Architekturfehler

- Beziehung nur als Attribut statt als eigenstaendige Information speichern
- Match-Ergebnis ohne Konfidenz oder Quelle materialisieren
- Graphen als "nice to have" behandeln, aber keine klaren Abfragen definieren
- Person, Organisation und Konto in einer flachen Tabelle vermischen

## Lernartefakt

Teilnehmende erstellen ein kleines Netzwerkmodell mit:

- mindestens drei Knotentypen
- mindestens vier Beziehungstypen
- einer kurzen Begruendung, welche Fragen dadurch beantwortbar werden
