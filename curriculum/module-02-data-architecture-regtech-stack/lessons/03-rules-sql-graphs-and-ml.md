# Lektion 3: Rules, SQL, Graphs and ML

## Fokus

Nicht jede Compliance- oder Fincrime-Frage braucht dieselbe technische Form.

## Kernfragen

- Wann ist eine Regel als `Rego` oder SQL gut modellierbar?
- Wann braucht man Netzwerk- oder Graph-Denken?
- Wo helfen Scores oder ML, und wo wird das gefaehrlich oder unnoetig?

## Warum das wichtig ist

RegTech-Teams verlieren viel Zeit, wenn sie jede Fragestellung mit demselben
Werkzeug beantworten wollen. Manche Kontrollen sind deterministisch und gut
testbar. Andere leben von Aggregation, Historie oder Netzwerkbeziehungen. Wieder
andere profitieren von Priorisierung statt harter Block-Entscheidung.

## Entscheidungshilfe nach Substrat

### `rules / policies`

Gut geeignet fuer:

- klare Normanforderungen
- Gate-Entscheidungen
- versionierbare Ja/Nein-Checks

### `sql`

Gut geeignet fuer:

- Aggregationen
- Schwellenwerte ueber Zeitfenster
- Datenqualitaets- und Coverage-Pruefungen

### `graph`

Gut geeignet fuer:

- Beziehungsnetzwerke
- UBO- und Gegenparteiverbindungen
- Multi-Hop-Muster

### `ml / scoring`

Gut geeignet fuer:

- Priorisierung
- Anomalie- oder Verhaltensmuster
- Fraud-Szenarien mit vielen weichen Signalen

Risiken:

- schlechte Erklaerbarkeit
- Datendrift
- unfair verteilte Fehlerraten
- Modellnutzung ausserhalb des trainierten Kontexts

## Kombinationsmuster

In guten Systemen arbeiten die Substrate zusammen:

- `sql` erzeugt Features oder Aggregationen
- `rules` definieren harte Gate- oder Governance-Bedingungen
- `graph` erweitert die Sicht auf Beziehungen
- `ml` priorisiert innerhalb definierter Leitplanken

## Typische Architekturfehler

- ML als Ersatz fuer fehlende Datenmodellierung einsetzen
- alles in Rules pressen, obwohl Historie oder Netzwerkstruktur gebraucht wird
- SQL-Schwellen nicht nach Population oder Produkt segmentieren
- Graphen bauen, ohne klares Entity-Resolution-Modell

## Lernartefakt

Teilnehmende ordnen mindestens vier Beispielkontrollen dem passenden Substrat
zu und begruenden:

- welches Werkzeug primaer genutzt wird
- welche Zusatzdaten dafuer noetig sind
- welche Grenzen und Audit-Fragen bleiben
