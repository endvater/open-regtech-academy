# DORA Incident Decision Matrix

Diese Matrix dokumentiert die vereinfachte Lehrlogik hinter
`incident_classification.rego`.

## Ziel

Lernende sollen nicht nur sehen, **dass** ein Incident als `major` oder
`minor` eingestuft wird, sondern **warum**.

## Kriterien und Schwellenwerte

| Kriterium | Trigger fuer `major` | Didaktische Bedeutung |
|-----------|----------------------|------------------------|
| Betroffene Kunden | `>= 10000` | Wirkung auf Kundenbasis sichtbar machen |
| Finanzieller Schaden | `>= 100000 EUR` | oekonomische Relevanz des Vorfalls |
| Ausfalldauer | `>= 4 Stunden` | operative Belastung und Resilienz |
| Kompromittierte Datensaetze | `>= 5000` | Daten- und Vertraulichkeitsbezug |
| Kritischer Dienst | ein Dienst aus der kritischen Liste | Bedeutung zentraler Services |
| Geografische Ausdehnung | `>= 4` betroffene Laender | grenzueberschreitender Impact |
| Kaskadeneffekt | `true` | Auswirkungen auf andere Institute |

## Boundary Tests

Die begleitenden Tests decken zwei Arten von Grenzfaellen ab:

1. **Exakt an der Schwelle**  
   Beispiel: `affected_clients = 10000` muss als `major` klassifiziert werden.
2. **Knapp unter der Schwelle**  
   Beispiel: `affected_clients = 9999` darf nicht allein durch dieses Kriterium
   `major` werden.

## Ausgabestruktur fuer Reviewer

Die Policy gibt in `classification` zusaetzlich aus:

- `triggers`
- `trigger_count`
- `decision_matrix`
- `severity_score`
- `explanation`

So koennen Reviewer nachvollziehen, welche Kriterien gegriffen haben und wie
die Lehrlogik aufgebaut ist.
