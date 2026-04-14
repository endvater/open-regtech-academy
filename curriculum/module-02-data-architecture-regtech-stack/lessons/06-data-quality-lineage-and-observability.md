# Lektion 6: Data Quality, Lineage and Observability

## Fokus

Ein Kontrollsystem ist nur so gut wie seine Eingabedaten und seine
Nachvollziehbarkeit.

## Kernfragen

- Wie messen wir Missing-Field-Rates, Timeliness und Konsistenz?
- Wie wird `lineage` fuer Audit und Root Cause Analysis relevant?
- Was sollte ein RegTech-Observability-Stack sichtbar machen?

## Warum das wichtig ist

In regulierten Umgebungen ist nicht nur entscheidend, ob eine Kontrolle
ausloest. Ebenso wichtig ist, ob man spaeter zeigen kann:

- welche Datenlage vorlag
- welche Regel- oder Modellversion genutzt wurde
- welche Verarbeitungsschritte stattgefunden haben
- warum ein Alert oder ein Nicht-Alert entstanden ist

## Drei Qualitaetsebenen

### 1. Datenqualitaet

Messbar etwa ueber:

- Vollstaendigkeit
- Gueltigkeit
- Aktualitaet
- Konsistenz
- Duplikatrate

### 2. Lineage

Lineage beantwortet:

- woher kam ein Feld
- welche Transformationen fanden statt
- welche Version galt zum Bewertungszeitpunkt

### 3. Observability

Operational wichtig sind etwa:

- Pipeline-Latenz
- Queue-Laengen
- Fehler- und Retry-Raten
- Alert-Volumen
- Drift oder Coverage-Aenderungen

## Typische Architekturfehler

- nur technische Logs speichern, aber keine fachliche Lineage
- Regel- oder Prompt-Version nicht mit dem Ergebnis verknuepfen
- Missing Fields erst bei der Investigation bemerken
- keine Populationen oder Baselines fuer Alarmvolumen pflegen

## Lernartefakt

Teilnehmende definieren fuer einen Beispiel-Flow:

- drei Data-Quality-Metriken
- zwei Observability-Metriken
- ein minimales Lineage-Schema
