# Übung 2: DORA Art. 18 – ICT-Incident-Klassifizierung

> **Schwierigkeit:** Intermediate · **Dauer:** 2–3 Stunden · **Punkte:** 10
> **Regulatorischer Bezug:** DORA Artikel 18-19, RTS zur Incident-Klassifizierung

## Kontext

Du arbeitest im Incident-Response-Team einer Universalbank. Nach einem Systemausfall musst du schnell entscheiden: Ist das ein meldepflichtiger Vorfall gemäss DORA? Wenn ja, welche Fristen gelten?

Deine Aufgabe: Baue eine OPA-Policy, die ICT-Incidents automatisch klassifiziert und die Meldepflichten bestimmt.

## Gesetzestext (vereinfacht)

> **DORA Artikel 18 – Klassifizierung von IKT-bezogenen Vorfällen**
>
> Finanzunternehmen klassifizieren IKT-bezogene Vorfälle anhand folgender Kriterien:
> a) Anzahl der betroffenen Kunden
> b) Dauer des Vorfalls
> c) Geografische Ausdehnung
> d) Datenverluste
> e) Kritikalität der betroffenen Dienste
> f) Wirtschaftliche Auswirkungen

> **DORA Artikel 19 – Meldung schwerwiegender Vorfälle**
>
> Erstmeldung: 4 Stunden nach Klassifizierung als schwerwiegend
> Folgemeldung: 72 Stunden
> Abschlussbericht: 1 Monat

## Aufgabe

### Teil 1: Klassifizierungspolicy

Erweitere die bestehende DORA-Policy (`compliance-as-code/dora/incident_classification.rego`):

1. **Geografische Ausdehnung**: Mehr als 3 betroffene EU-Länder → schwerwiegend
2. **Kaskaden-Erkennung**: Wenn ein Incident andere Finanzunternehmen betrifft → automatisch schwerwiegend
3. **Severity-Scoring**: Implementiere ein Punktesystem (0–100), das die verschiedenen Kriterien gewichtet

### Teil 2: Meldepflicht-Engine

Baue eine Policy, die automatisch bestimmt:
- An welche nationale zuständige Behörde (NCA) gemeldet werden muss. DORA gilt als EU-Verordnung direkt in allen Mitgliedstaaten; die Meldung geht an die jeweilige NCA (z.B. BaFin in DE, FMA in AT). **Achtung:** Die FINMA (CH) fällt nicht unter DORA – die Schweiz ist kein EU-Mitgliedstaat. Modelliere dies korrekt im Code.
- Welche Fristen gelten (Erstmeldung, Folgemeldung, Abschlussbericht) gemäss Art. 19 DORA und Durchführungsverordnung (EU) 2024/1774
- Welche Pflichtfelder die Meldung enthalten muss (gemäss Meldeformular der ESAs)

### Teil 3: Tests

Mindestens 6 Testfälle:
- ✅ Minor Incident (kein Kriterium überschritten)
- ❌ Major: Viele betroffene Kunden
- ❌ Major: Kritischer Dienst betroffen
- ❌ Major: Mehrere Kriterien gleichzeitig
- ❌ Major: Kaskadeneffekt auf andere Institute
- Grenzfall: Genau an der Schwelle

## Datenmodell

```json
{
  "incident": {
    "id": "INC-2026-006",
    "description": "...",
    "affected_clients": 50000,
    "financial_impact_eur": 300000,
    "downtime_hours": 8,
    "data_records_compromised": 0,
    "affected_services": ["payment-processing", "client-authentication"],
    "affected_countries": ["DE", "AT", "NL", "FR"],
    "cascading_to_other_institutions": true,
    "jurisdiction": "DE"
  }
}
```

## KI-Hinweis

Nutze den KI-Tutor, um:
- Die DORA-Meldepflichten im Detail zu verstehen
- Ein geeignetes Scoring-Modell zu entwerfen
- Edge Cases für deine Tests zu generieren

Prompt-Vorschlag:
```
Ich implementiere eine DORA Art. 18 Incident-Klassifizierung als OPA-Policy.
Wie würdest du die Kriterien (Kunden, Finanzen, Downtime, Daten, Kritikalität)
zu einem Severity-Score (0-100) gewichten? Berücksichtige die RTS-Vorgaben.
```

## Abgabe

Branch: `exercise/02-dora-incident-{dein-github-name}`
Dateien in: `compliance-as-code/dora/`
Label: `academy-submission`, `module/m3`, `regulatory/dora`

---

→ [Nächste Übung: End-to-End Compliance Pipeline](03-e2e-pipeline.md)
