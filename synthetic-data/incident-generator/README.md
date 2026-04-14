# Synthetic Incident Generator

Erster CLI-Generator fuer synthetische ICT-Incidents im DORA-Kontext.

## Ziel

- realistischere Inputs fuer Policies, Labs und Dashboards
- `minor` und `major` Faelle ohne echte Personendaten
- Ausgabe als `json` oder `sql`

## Schnellstart

```bash
python3 generate_ict_incidents.py --count 5 --format json
python3 generate_ict_incidents.py --count 5 --format sql
```

## Optionen

- `--count` Anzahl der Faelle
- `--seed` reproduzierbare Zufallsbasis
- `--format` `json` oder `sql`
- `--output` optionaler Dateipfad

## Abdeckung

Der Generator erzeugt unter anderem:

- `minor` incidents mit niedriger Wirkung
- `major` incidents ueber Kunden-, Impact- oder Downtime-Schwellen
- Faelle mit kritischen Diensten
- Faelle mit geografischer Ausdehnung
- Faelle mit `cascading_to_other_institutions = true`
