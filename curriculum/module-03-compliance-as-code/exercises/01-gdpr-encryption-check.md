# Übung 1: DSGVO Art. 32 – Verschlüsselungsprüfung

> **Schwierigkeit:** Beginner · **Dauer:** 1–2 Stunden · **Punkte:** 5
> **Regulatorischer Bezug:** DSGVO Artikel 32 Abs. 1 lit. a

## Kontext

Du bist RegTech Engineer bei einem mittelgrossen Finanzdienstleister. Der CISO bittet dich, einen automatisierten Check zu bauen, der sicherstellt, dass alle Datenspeicher mit personenbezogenen Daten verschlüsselt sind – gemäss DSGVO Art. 32.

## Gesetzestext

> **DSGVO Artikel 32 – Sicherheit der Verarbeitung**
>
> (1) Unter Berücksichtigung des Stands der Technik, der Implementierungskosten und der Art, des Umfangs, der Umstände und der Zwecke der Verarbeitung sowie der unterschiedlichen Eintrittswahrscheinlichkeit und Schwere des Risikos für die Rechte und Freiheiten natürlicher Personen treffen der Verantwortliche und der Auftragsverarbeiter geeignete technische und organisatorische Maßnahmen, um ein dem Risiko angemessenes Schutzniveau zu gewährleisten; diese Maßnahmen schließen gegebenenfalls unter anderem Folgendes ein:
>
> a) die Pseudonymisierung und Verschlüsselung personenbezogener Daten;

## Aufgabe

### Teil 1: Policy schreiben

Erstelle eine OPA-Policy in Rego, die prüft:

1. **Verschlüsselung aktiv**: Jede Ressource mit `contains_personal_data: true` muss `encryption.enabled: true` haben
2. **Algorithmus-Stärke**: Der Verschlüsselungsalgorithmus muss in einer Liste akzeptierter Algorithmen sein (mindestens AES-256, ChaCha20-Poly1305)
3. **Key Rotation**: Der Verschlüsselungsschlüssel muss innerhalb der letzten 365 Tage rotiert worden sein

### Teil 2: Tests schreiben

Schreibe mindestens 5 Testfälle:

- ✅ Korrekt verschlüsselte Ressource (alle Kriterien erfüllt)
- ❌ Nicht verschlüsselte Ressource mit personenbezogenen Daten
- ❌ Schwacher Algorithmus (z.B. DES, RC4)
- ❌ Abgelaufene Key Rotation (>365 Tage)
- ✅ Ressource ohne personenbezogene Daten (keine Verschlüsselung nötig)

### Teil 3: Dokumentation

Füge Code-Kommentare hinzu, die:
- Den Bezug zu DSGVO Art. 32 Abs. 1 lit. a herstellen
- Erklären, warum bestimmte Algorithmen akzeptiert/abgelehnt werden
- Beschreiben, wie die Policy in der Praxis eingesetzt wird

## Datenmodell (Input-Schema)

```json
{
  "resources": [
    {
      "name": "string",
      "type": "database | storage | cache | file-system",
      "contains_personal_data": true,
      "encryption": {
        "enabled": true,
        "algorithm": "AES-256",
        "key_rotation_date": "2026-01-15"
      }
    }
  ],
  "current_date": "2026-04-01"
}
```

## Starthilfe

```rego
package gdpr.article32.encryption

import rego.v1

# Akzeptierte Verschlüsselungsalgorithmen (Stand der Technik)
accepted_algorithms := {
    # TODO: Definiere die Liste
}

# Maximale Tage seit letzter Key Rotation
max_key_age_days := 365

# TODO: Implementiere die deny-Regeln
```

## Lab-Umgebung

```bash
# Sandbox starten
cd labs/lab-opa-sandbox
docker-compose up -d

# Policy testen
opa test compliance-as-code/gdpr/ -v

# Policy gegen Input evaluieren
opa eval -d compliance-as-code/gdpr/article32/ \
         -i exercises/01-test-input.json \
         "data.gdpr.article32.encryption"
```

## KI-Hinweis

Du kannst einen KI-Assistenten verwenden, um:
- Den Gesetzestext in technische Anforderungen zu zerlegen
- Rego-Syntax zu erklären und Fehler zu debuggen
- Zusätzliche Edge Cases für Tests vorzuschlagen

**Aber:** Schreibe den finalen Code selbst und verstehe jede Zeile. KI ist dein Copilot, nicht dein Autopilot.

## Abgabe

1. Forke das Repository
2. Erstelle einen Branch: `exercise/01-gdpr-encryption-{dein-github-name}`
3. Lege deine Lösung in `compliance-as-code/gdpr/article32/` ab
4. Erstelle einen Pull Request mit dem Label `academy-submission`
5. GitHub Actions prüft deine Lösung automatisch

## Bewertungskriterien

| Kriterium | Gewichtung |
|-----------|-----------|
| Policy-Funktionalität (alle 3 Checks) | 40% |
| Testabdeckung (mind. 5 Testfälle) | 30% |
| Code-Qualität & Dokumentation | 20% |
| Regulatorischer Bezug in Kommentaren | 10% |

---

→ [Musterlösung](../solutions/01-gdpr-encryption-check/) (erst nach Abgabe einsehen!)
→ [Nächste Übung: DORA Incident-Klassifizierung](02-dora-incident-classification.md)
