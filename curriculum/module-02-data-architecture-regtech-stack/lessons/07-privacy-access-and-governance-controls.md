# Lektion 7: Privacy, Access and Governance Controls

## Fokus

Datenschutz, Zugriff und Audit sind keine Spaetfolgen, sondern Kernteil der
Architektur.

## Kernfragen

- Welche Daten brauchen wir wirklich?
- Wie gestalten wir Rollen, Zugriff, Logging und Default-Schutz?
- Wo treffen Datenschutz und Fincrime-Analytik aufeinander?

## Warum das wichtig ist

RegTech-Systeme arbeiten fast immer mit sensiblen Daten. Die schwierige Frage
lautet nicht nur, welche Kontrolle technisch moeglich ist, sondern auch:

- wer welche Daten in welcher Form sehen darf
- fuer welchen Zweck Daten verarbeitet werden
- wie Ausnahmen genehmigt und protokolliert werden

## Kernprinzipien

- `data minimization`: nicht mehr sammeln oder spiegeln als noetig
- `purpose limitation`: Verarbeitungszweck explizit benennen
- `least privilege`: Rollen eng und nachvollziehbar schneiden
- `segregation of duties`: keine unkontrollierte Kombination kritischer Rechte
- `default protection`: Maskierung, Tokenisierung, Freigabe- und Review-Pfade

## Wichtige Architekturentscheidungen

- Rohdaten vs. abgeleitete Merkmale fuer Analyse und Reporting
- Zugriff auf Produktionsdaten vs. synthetische Trainings- und Testdaten
- getrennte Pfade fuer Analysten, Engineering und Audit
- Nachvollziehbarkeit von Overrides, Exports und manuellen Anreicherungen

## Privacy Enhancing Technologies

Diese Lektion bereitet `M5` vor und fuehrt in Themen ein wie:

- Pseudonymisierung und Tokenisierung
- datenschutzfreundliche Feature-Bildung
- vertrauliche Berechnung
- foederierte oder verteilte Analytik

## Typische Architekturfehler

- Vollzugriff fuer Analysten aus Bequemlichkeit
- Testumgebungen mit produktionsnahen Rohdaten
- fehlende Zweck- oder Rechtsgrundlagen-Dokumentation
- Ausnahmen nur informell und ohne Audit Trail behandeln

## Lernartefakt

Teilnehmende erstellen eine einfache Zugriffs- und Governance-Matrix fuer:

- Engineering
- Analysten
- Reviewer
- Audit oder Aufsicht
