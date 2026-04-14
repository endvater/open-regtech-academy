# Lektion 5: Investigations and Escalation

## Fokus

Ein Alert ist noch kein Fall. Diese Lektion behandelt den Uebergang von
Detection zu Investigation, also Triage, Evidenz, Narrative und Eskalation.

## Kernfragen

- Welche Mindestinformationen braucht ein Analyst fuer eine erste Triage?
- Wann wird aus einem Alert ein Fall, und wann ist Eskalation gerechtfertigt?
- Wie verbinden sich strukturierte Daten und kurze Narrative?

## Warum das wichtig ist

Fincrime-Systeme werden in der Praxis nicht an Modellguete allein gemessen,
sondern daran, ob Analysten mit vertretbarem Aufwand zu belastbaren
Entscheidungen kommen.

## Ein minimaler Investigation-Flow

1. Eingang und Priorisierung des Alerts
2. Sichtung von Kernkontext und verwandten Ereignissen
3. Plausibilisierung oder Eskalation
4. Dokumentation von Entscheidung, Evidenz und offenen Fragen

## Wichtige Fallbausteine

- Zeitleiste
- beteiligte Parteien
- relevante Zahlungen oder Netzwerke
- externe Signale
- Analystenentscheidung und Reviewer-Pfad

## Typische Architekturfehler

- Alerts ohne Zusammenhang zum Quellereignis
- kein fester Platz fuer offene Unsicherheit
- Kommentar- und Evidenzlogik nur in Freitext
- fehlende Trennung zwischen Analyst und Reviewer

## Erwartetes Artefakt

Teilnehmende formulieren ein kurzes `case note` mit:

- Zusammenfassung
- wichtigsten Evidenzpunkten
- offener Unsicherheit
- naechstem Eskalationsschritt
