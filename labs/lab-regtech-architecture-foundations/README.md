# Lab: RegTech Architecture Foundations

Dieses Lab uebersetzt die Kernideen aus `Modul 2` in ein kleines,
zusammenhaengendes Architekturpaket. Es ist absichtlich leichtgewichtig: Ziel
ist nicht eine lauffaehige Plattform, sondern ein belastbares Referenzmodell
fuer weitere Module.

## Dateien

- `canonical_regtech_bundle.json` - minimales Beispiel fuer Entitaeten, Events,
  Alert und Case
- `review_scorecard.md` - kompaktes Bewertungsraster fuer Architektur-Reviews

## Lernziele

- ein kanonisches Modell mit Event- und Case-Bezug lesen und erweitern
- erkennen, welche Kontrollpunkte spaeter in `M3` oder `M4` anschliessen
- Architekturentscheidungen mit Review-Kriterien bewerten

## Arbeitsauftrag

1. Lies das Beispielbundle und markiere, welche Objekte stabil referenziert sind.
2. Identifiziere mindestens zwei moegliche Kontrollpunkte.
3. Entscheide, welche Teile spaeter eher `rules`, `sql`, `graph` oder `ml`
   brauchen.
4. Nutze die Scorecard, um Risiken, Luecken und Folgefragen zu dokumentieren.

## Weiterfuehrung

Dieses Lab bildet die Bruecke zu:

- `M3`, wenn aus dem Modell testbare Policies werden
- `M4`, wenn Payment- und Investigation-Flows auf denselben Objekten aufsetzen
- `M5`, wenn Zugriff, Privacy und Audit vertieft werden
- `M6`, wenn Reporting und Capstone daraus entstehen
