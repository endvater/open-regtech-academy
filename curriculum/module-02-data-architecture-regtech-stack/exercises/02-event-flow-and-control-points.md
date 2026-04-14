# Uebung 2: Event Flow and Control Points

> **Schwierigkeit:** Intermediate
> **Dauer:** 90-120 Minuten

## Kontext

Eine Organisation will besser verstehen, an welchen Stellen ihres Flows
Kontrollen inline, near-real-time oder batch stattfinden muessen.

## Aufgabe

Skizziere einen Event-Flow fuer einen der beiden Faelle:

- `payment -> screening -> alert -> case`
- `onboarding -> kyc_review -> decision -> periodic_refresh`

## Erwartete Arbeitsschritte

1. Zeichne den Ablauf als Mermaid, Tabelle oder Sequenz.
2. Markiere alle Kontrollpunkte.
3. Kennzeichne, wo Deduplizierung, Replay oder manuelle Review noetig werden.
4. Beschreibe zwei Failure Modes und ihren operativen Effekt.

## Bewertungskriterien

- realistischer Ablauf statt linearem Wunschbild
- gute Trennung von Eingangssignal, Kontrolle und Folgeereignis
- erkennbare Betriebs- und Review-Perspektive
