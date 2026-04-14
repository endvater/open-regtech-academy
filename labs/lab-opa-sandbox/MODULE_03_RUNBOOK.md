# Modul 3 Runbook

Dieses Runbook gibt die wichtigsten Befehle fuer die vorhandenen
Lehrbeispiele vor, damit Lernende `opa eval` und `opa test` ohne Raetselraten
starten koennen.

## Voraussetzungen

```bash
cd labs/lab-opa-sandbox
docker compose up -d
cd ../..
```

## 1. DSGVO Art. 32 - Verschluesselungspruefung

### Beispielinput

- `labs/lab-opa-sandbox/examples/gdpr_article32_input.json`

### Policy evaluieren

```bash
opa eval \
  -d compliance-as-code/gdpr/article32 \
  -i labs/lab-opa-sandbox/examples/gdpr_article32_input.json \
  "data.gdpr.article32.encryption.summary"
```

### Erwartung

- mindestens ein Verstoss fuer unverschluesselte oder unsichere Ressourcen
- `violation_count > 0`
- `resources_checked` entspricht der Anzahl der Input-Ressourcen

### Tests ausfuehren

```bash
opa test compliance-as-code/gdpr/article32 -v
```

## 2. DORA Art. 18 - Incident-Klassifizierung

### Beispielinput

- `labs/lab-opa-sandbox/examples/dora_article18_input.json`

### Policy evaluieren

```bash
opa eval \
  -d compliance-as-code/dora \
  -i labs/lab-opa-sandbox/examples/dora_article18_input.json \
  "data.dora.article18.incident_classification.classification"
```

### Erwartung

- `is_major = true`
- `notification.required = true`
- `decision_matrix` zeigt, welche Trigger gegriffen haben
- `explanation` ist fuer Reviewer nachvollziehbar

### Tests ausfuehren

```bash
opa test compliance-as-code/dora -v
```

## 3. DSGVO Art. 25 - Privacy by Design Preview

```bash
opa test compliance-as-code/gdpr/article25 -v
```

## 4. Grafana-Dashboard pruefen

1. `docker compose up -d`
2. in Grafana einloggen
3. Dashboard `Compliance Overview` oeffnen
4. pruefen, ob Tabellen und Kennzahlen aus `compliance_overview` geladen werden
