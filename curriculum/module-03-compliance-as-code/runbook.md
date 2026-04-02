# Modul 3 Runbook

> Schneller Einstieg für lokale Tests, Beispiel-Inputs und typische OPA-Kommandos.

## Voraussetzungen

- Repository lokal geklont
- OPA CLI installiert
- Optional: Docker Desktop für das Lab

## 1. Rego-Tests ausführen

Aus dem Repository-Root:

```bash
# Alle vorhandenen Policies testen
opa test compliance-as-code/... -v

# Nur DSGVO Art. 32 testen
opa test compliance-as-code/gdpr/article32 -v

# Nur DORA Art. 18 testen
opa test compliance-as-code/dora -v
```

## 2. DSGVO Art. 32 evaluieren

```bash
opa eval -d compliance-as-code/gdpr/article32 \
  -i curriculum/module-03-compliance-as-code/examples/gdpr-article32-input.json \
  "data.gdpr.article32.encryption.summary"
```

Erwartung:
- `compliant` ist `false`
- mindestens ein Verstoss wird für eine unverschlüsselte Ressource gemeldet
- `resources_checked` ist `3`

## 3. DORA Art. 18 evaluieren

```bash
opa eval -d compliance-as-code/dora \
  -i curriculum/module-03-compliance-as-code/examples/dora-article18-input.json \
  "data.dora.article18.incident_classification.classification"
```

Erwartung:
- `is_major` ist `true`
- `notification_required` ist `true`
- `triggers` enthält mindestens `affected_clients`, `financial_impact`, `downtime` und `critical_service`

## 4. Optional: Lab-Umgebung starten

```bash
cd labs/lab-opa-sandbox
docker-compose up -d
```

Services:
- OPA API auf `http://localhost:8181`
- PostgreSQL auf `localhost:5432`
- Grafana auf `http://localhost:3000`

## 5. Häufige Stolpersteine

- `rego_type_error`: Prüfe Package-Namen und den genauen Data-Pfad im `opa eval`-Befehl.
- Keine Treffer bei `deny`: Vergleiche den Input mit dem erwarteten Schema aus der jeweiligen Übung.
- Lab startet nicht: Prüfe, ob Docker Desktop läuft und die Ports `8181`, `5432` und `3000` frei sind.

## 6. Dokumentationschecks

```bash
python3 scripts/check_markdown_links.py
```

GitHub Actions führt zusätzlich Markdown-Linting und Rego-Tests auf Pull Requests aus.
