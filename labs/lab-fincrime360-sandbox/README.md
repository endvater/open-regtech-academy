# Lab: Payment Rails Mapping

Dieses Mini-Lab zeigt, wie eine vereinfachte `pacs.008`-Nachricht in ein
kanonisches internes Zahlungsmodell ueberfuehrt werden kann.

## Dateien

- `sample_pacs008.xml` - vereinfachte Beispielnachricht
- `payment_event.schema.json` - Zielschema fuer das kanonische Event
- `parse_pacs008.py` - einfacher Parser ohne Fremdbibliotheken

## Schnellstart

```bash
cd labs/lab-fincrime360-sandbox
python3 parse_pacs008.py sample_pacs008.xml
```

## Lernziele

- Unterschiede zwischen Nachrichtenstruktur und internem Zielmodell verstehen
- erkennen, welche Felder fuer Screening, Monitoring und Fraud relevant sind
- auf einem kleinen Beispiel den Schritt `ISO 20022 -> internes Event` ueben

## Weiterfuehrende Uebungen

1. Erweitere das Schema um `ultimate_debtor` und `ultimate_creditor`.
2. Parse zusaetzlich eine `pacs.002`-Statusnachricht.
3. Fuege einen simplen Screening-Schritt auf Basis des Debtor- und
   Creditor-Namens hinzu.
