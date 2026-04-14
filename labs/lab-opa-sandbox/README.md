# Open RegTech Academy - OPA Lab Sandbox

Dieses Lab stellt die praktische Umgebung fuer `Modul 3` bereit:

- `OPA` fuer Policy-Entscheidungen und Tests
- `PostgreSQL` fuer synthetische Lehrdaten
- `Grafana` fuer eine automatisch provisionierte `compliance_overview`

## Schnellstart

```bash
cd labs/lab-opa-sandbox
docker compose up -d
```

Danach:

- `OPA`: http://localhost:8181
- `Grafana`: http://localhost:3000
  - User: `admin`
  - Password: `regtech2026`

## Was automatisch bereitsteht

- Datenbankschema aus `init-db.sql`
- View `compliance_overview`
- Grafana-Datasource auf PostgreSQL
- vorkonfiguriertes Dashboard `Compliance Overview`

## Modul-3-Hilfen

- [Runbook](MODULE_03_RUNBOOK.md)
- [GDPR Art. 32 Beispielinput](examples/gdpr_article32_input.json)
- [DORA Art. 18 Beispielinput](examples/dora_article18_input.json)
