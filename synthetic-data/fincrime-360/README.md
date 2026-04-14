# Synthetic Fincrime 360 Reference Case

Dieser synthetische Referenzfall dient als gemeinsamer Fallkern fuer `M4`.
Er verbindet Kunden-, UBO-, Zahlungs-, OSINT- und Alert-Kontext in einem
kompakten Bundle.

## Dateien

- `reference_case_bundle.json` - Parteien, Beziehungen, Zahlungen, Alerts und
  externe Signale in einem Datensatz

## Didaktischer Zweck

Der Fall ist bewusst klein genug fuer Uebungen, aber reich genug fuer mehrere
Perspektiven:

- `customer and ubo risk`
- `screening vs monitoring vs fraud`
- `alert to case`
- `network analysis`
- `governance and escalation`

## Nutzung in der Academy

- `M4`: Kernfall fuer Lektionen und Uebungen
- `lab-fincrime360-sandbox`: Verbindung von Payment-Event und Fallkontext
- `M5` und `M6`: Bruecke zu Governance, Reviewability und spaeterem Reporting
