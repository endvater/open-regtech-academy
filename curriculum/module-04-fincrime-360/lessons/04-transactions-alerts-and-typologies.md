# Lektion 4: Transactions, Alerts and Typologies

## Fokus

Diese Lektion verbindet Zahlungsereignisse mit Kontrolllogik. Im Zentrum steht
nicht nur die einzelne Alert-Regel, sondern die Frage, welche Typologien auf
welcher Zeitebene und mit welchem Substrat ueberhaupt sichtbar werden.

## Kernfragen

- Was unterscheidet `screening`, `monitoring` und `fraud detection` operativ?
- Welche Typologien lassen sich aus Einzelereignissen erkennen, welche nur ueber Zeit oder Netzwerke?
- Wie entstehen gute Alerts statt nur hoher Alert-Mengen?

## Warum das wichtig ist

Viele Fincrime-Programme erzeugen Alerts, aber keine priorisierbaren Faelle.
Die Gruende sind haeufig:

- fehlende Trennung der Kontrollpfade
- schlechte Feldqualitaet
- unklare Typologieannahmen
- keine Segmentierung nach Produkt, Kunde oder Rail

## Drei Kontrollpfade

### 1. Transaction Screening

- Fokus auf einzelne Nachricht oder Partei
- typischerweise inline
- besonders sensitiv fuer Namens- und Datenqualitaet

### 2. Transaction Monitoring

- Fokus auf Verhalten ueber Zeit
- arbeitet mit Aggregation, Historie und Szenarien
- braucht Populationen und Segmentierung

### 3. Fraud Detection

- kombiniert Payment- und Channel-Signale
- stark echtzeit- und verhaltensorientiert
- balanciert Verlustpraevention gegen Kundenfriktion

## Typologiefamilien

- Structuring oder Smurfing
- Funnel Accounts und Mule-Muster
- Hochrisiko-Gegenparteien oder Korridore
- unplausible Geschaeftszwecke
- Account Takeover und beneficiary risk

## Was einen guten Alert ausmacht

- klare Referenz auf Ereignis oder Population
- nachvollziehbarer Trigger
- sichtbarer Kontext statt nackter Schwellenverletzung
- brauchbare Priorisierung fuer Analysten

## Erwartetes Artefakt

Teilnehmende entwerfen fuer zwei Typologien:

- das primaere Kontrollsubstrat
- den Trigger oder das Signal
- den erwarteten Alert-Kontext
