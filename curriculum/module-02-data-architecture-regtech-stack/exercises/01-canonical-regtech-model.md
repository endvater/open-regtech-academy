# Uebung 1: Canonical RegTech Model

> **Schwierigkeit:** Beginner to Intermediate
> **Dauer:** 90-120 Minuten

## Kontext

Ein Team will Kunden-, Payment- und Alert-Daten in einem gemeinsamen
Kontrollsystem auswerten. Aktuell existieren nur Quellschemata aus CRM,
Payment Hub und Case Management.

## Aufgabe

Entwirf ein minimales kanonisches Modell mit mindestens:

- `party`
- `account`
- `payment_event`
- `alert`
- `case`

## Erwartete Arbeitsschritte

1. Definiere pro Objekt die wichtigsten Felder.
2. Lege stabile IDs und Fremdreferenzen fest.
3. Markiere, welche Felder fuer Audit und welche fuer Detection unverzichtbar sind.
4. Dokumentiere drei Felder, die bewusst nicht ins Zielmodell gehoeren.

## Bewertungskriterien

- klare Trennung von Entitaet, Event und Case
- nachvollziehbare Identifikatoren
- brauchbare Referenzen fuer spaetere Policy- und Investigation-Flows
- begruendete Scope-Grenzen
