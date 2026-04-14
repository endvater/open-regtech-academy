# Traceability: GDPR Article 25 Privacy by Design

## 1. Policy-Identitaet

- **Policy-Pack:** `gdpr/article25`
- **Regulierung / Artikel:** DSGVO Art. 25
- **Status:** Stable teaching example
- **Maintainer:** Open RegTech Academy

## 2. Quelle

- **Primaerquelle:** Verordnung (EU) 2016/679, Art. 25
- **Technische Referenzen:** Privacy by Design, Datenminimierung, Logging,
  Retention und sichere Standardwerte

## 3. Ziel der Policy

Das Lehrbeispiel operationalisiert `Privacy by Design` und `Privacy by Default`
ueber nachvollziehbare technische Konfigurationen in Systemen.

## 4. Interpretationsannahmen

- `purpose_defined` wird als dokumentierter Zweck abstrahiert
- Datenminimierung wird an `required_fields` gegen
  `default_collected_fields` illustriert
- `default_visibility`, `default_analytics_enabled`, `retention_days_default`
  und `access_logging` werden als zentrale Default-Kontrollen verwendet

## 5. Datenmodell

Pro System werden unter anderem erwartet:

- `processes_personal_data`
- `purpose_defined`
- `required_fields`
- `default_collected_fields`
- `default_visibility`
- `default_analytics_enabled`
- `retention_days_default`
- `retention_days_required`
- `privacy_controls.access_logging`

## 6. Entscheidungslogik

| Regel | Beschreibung | Input-Felder | Ergebnis |
|-------|--------------|--------------|----------|
| `deny` | kein dokumentierter Zweck | `purpose_defined` | Verstoss |
| `deny` | zu viele Felder per Default | `required_fields`, `default_collected_fields` | Verstoss |
| `deny` | nicht datenschutzfreundliche Sichtbarkeit | `default_visibility` | Verstoss |
| `deny` | Tracking standardmaessig aktiv | `default_analytics_enabled` | Verstoss |
| `deny` | ueberlange Default-Aufbewahrung | `retention_days_default`, `retention_days_required` | Verstoss |
| `deny` | kein Default-Access-Logging | `privacy_controls.access_logging` | Verstoss |

## 7. Teststrategie

- positiver Volltreffer ohne Verstoss
- fehlender Zweck
- verletzte Datenminimierung
- zu offene Defaults
- Tracking plus ueberlange Aufbewahrung
- fehlendes Logging

## 8. Reviewer-Hinweise

- regulatorisch: ist klar genug markiert, dass Art. 25 breiter ist als dieses
  Lehrbeispiel?
- technisch: sind die Defaults und Kontrollfelder fuer Lernende nachvollziehbar?

## 9. Offene Grenzen des Lehrbeispiels

- keine Abbildung einer vollstaendigen TOM-Landschaft
- keine Risikoabstufung je Verarbeitungsvorgang
- keine Verknuepfung zu Einwilligung, Rechtsgrundlage oder DSFA
