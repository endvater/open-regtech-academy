# Lektion 8: Target Architecture Workshop

## Fokus

Die Abschlusslektion fuehrt die Bausteine des Moduls in ein gemeinsames
Zielbild zusammen.

## Kernfragen

- Wie sieht eine minimal tragfaehige Academy-Referenzarchitektur aus?
- Welche Komponenten muessen fuer `M3` und `M4` bereits vorhanden sein?
- Wo liegen offene Architekturentscheidungen fuer spaetere Deep Dives?

## Ziel der Abschlusslektion

Diese Lektion ist kein weiteres Theoriekapitel, sondern ein Architektur-Review.
Die Teilnehmenden sollen ein kleines, aber belastbares Zielbild formulieren,
das spaeter fuer `M3`, `M4`, `M5` und `M6` erweitert werden kann.

## Erwartete Bausteine der Zielarchitektur

- definierte Quellsysteme
- kanonisches Modell fuer Kernobjekte
- ein Integrationspfad fuer Events oder Nachrichten
- mindestens zwei Kontrolltypen
- ein Analysten- oder Review-Pfad
- Audit Trail und Reporting-Anschluss

## Leitfragen fuer den Workshop

- Wo entstehen und enden Verantwortlichkeiten zwischen Domaenen?
- Welche Artefakte muessen versioniert werden?
- Welche Entscheidungen muessen inline, near-real-time oder batch erfolgen?
- Welche Failure Modes waeren fuer Aufsicht oder Betrieb besonders kritisch?

## Bewertungsraster

Eine gute Abschlussarchitektur zeigt:

- klare Domain Boundaries
- saubere Daten- und Eventverknuepfung
- realistische Betriebsannahmen
- kontrollierte Zugriffs- und Audit-Pfade
- eine nachvollziehbare Bruecke zu Policy-Code und Fincrime-Cases

## Deliverable

Das Abschlussartefakt besteht aus:

- einer Architektur-Skizze
- einer kurzen Komponentenbeschreibung
- drei groessten Risiken
- drei offenen Folgefragen fuer `M3` bis `M6`
