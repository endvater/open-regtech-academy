# Lektion 4: Payment Rails and Domain Boundaries

## Fokus

Payment-Daten duerfen nicht als flache Transaktion missverstanden werden.

## Kernfragen

- Wie trennen wir `scheme`, `messaging`, `settlement` und `bankinterne daten`?
- Wo liegen sinnvolle Domain Boundaries zwischen Payment Hub, Screening,
  Monitoring und Fraud?
- Wie vermeiden wir redundante oder widerspruechliche Kontrollpfade?

## Warum das wichtig ist

Gerade im Zahlungsverkehr fuehren unklare Begriffe schnell zu Architekturfehlern:
`SWIFT` ist Messaging, `SEPA` ist ein Scheme, `T2` und `TIPS` sind
Settlement-Infrastrukturen. Die eigene Bank sieht ausserdem nie die komplette
Welt, sondern nur ihren Ausschnitt aus Nachrichten, Kontoereignissen,
Statuswechseln und Kanalinformationen.

## Vier Ebenen, die getrennt werden muessen

- `scheme`: fachliche Regeln wie `SCT`, `SCT Inst` oder Lastschrift
- `messaging`: `MT`, `MX`, `pain`, `pacs`, `camt`
- `settlement`: `T2`, `TIPS` oder bankinterne Buchungslogik
- `internal context`: Kunde, Konto, Device, Risiko, Case, Freigabeprozess

## Sinnvolle Domain Boundaries

### Payment Domain

Verantwortet:

- Parsing und Normalisierung
- Lifecycle und Referenzen
- Status wie `accepted`, `rejected`, `returned`

### Screening Domain

Verantwortet:

- Listenabgleich
- Match-Erklaerung
- Inline-Entscheidung und Repair Queue

### Monitoring Domain

Verantwortet:

- historische Muster
- Segmentierung
- Szenario-Logik und Fallbildung

### Fraud Domain

Verantwortet:

- Kanal- und Device-Signale
- Empfaenger-Risiko
- Friction- oder Block-Entscheidungen in Echtzeit

## Latenz und Ownership

Nicht jede Kontrolle gehoert in denselben Verarbeitungspfad:

- `inline`: nur fuer Entscheidungen, die vor Ausfuehrung fallen muessen
- `near-real-time`: fuer schnelle Folgekontrollen und Case-Priorisierung
- `batch`: fuer historische Muster, Reconciliation und Qualitaetsmetriken

## Typische Architekturfehler

- Payment, Screening und Fraud in einem unklaren Monolithen verschmelzen
- dieselbe Logik in mehreren Systemen duplizieren
- `pacs.002`-, `return`- oder `recall`-Folgeevents ignorieren
- bankinterne Freigabe- oder Analystenentscheidungen nicht in den Lifecycle integrieren

## Lernartefakt

Teilnehmende zeichnen eine Boundary Map fuer mindestens vier Domaenen und
markieren:

- welches Team oder System welches Artefakt besitzt
- wo Daten repliziert werden
- wo Echtzeit-SLAs gelten
