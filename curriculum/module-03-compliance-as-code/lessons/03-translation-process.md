# Lektion 3: Der Übersetzungsprozess – Gesetzestext → Code

## Das Kernproblem

Regulierungen sind in natürlicher Sprache geschrieben. Sie sind absichtlich breit formuliert, enthalten Ausnahmen, Verweise auf andere Artikel und unbestimmte Rechtsbegriffe wie „angemessen", „geeignet" oder „unverzüglich". Code hingegen braucht Präzision: Ja/Nein, Schwellenwerte, konkrete Bedingungen.

Die Übersetzung von Gesetzestext in ausführbaren Code ist die zentrale Fähigkeit eines RegTech Engineers. Dieser Prozess ist nicht trivial – und genau hier liegt der Wert, den du als Engineer schaffst.

## Der 7-Schritte-Prozess

### Schritt 1: Gesetzestext lesen & verstehen

Lies den Artikel vollständig, inklusive:
- Verweise auf andere Artikel (insbesondere Ausnahmen)
- Erwägungsgründe (Recitals) – sie erklären die Intention
- Delegierte Rechtsakte und RTS (technische Standards)

**Beispiel:** DSGVO Art. 32 verweist implizit auf Art. 5 Abs. 1 lit. f (Integrität und Vertraulichkeit) und muss im Kontext von Art. 25 (Data Protection by Design) gelesen werden.

### Schritt 2: Kernanforderung extrahieren

Formuliere die Anforderung als einfachen Satz:

```
DSGVO Art. 32: "Personenbezogene Daten müssen durch geeignete technische
Massnahmen geschützt werden, insbesondere durch Verschlüsselung."
```

**Achtung:** „Geeignet" und „insbesondere" sind nicht direkt codierbar. Du brauchst eine Konkretisierung (siehe Schritt 3).

### Schritt 3: Konkretisieren – unbestimmte Begriffe auflösen

Unbestimmte Rechtsbegriffe müssen durch konkrete, prüfbare Kriterien ersetzt werden. Dafür nutzt du:

| Quelle | Beispiel |
|--------|----------|
| Technische Standards (RTS/ITS) | EBA-Leitlinien zu DORA |
| Behördliche Guidance | BaFin MaRisk, BAIT |
| Industriestandards | BSI TR-02102-1 (Kryptografie), ISO 27001 |
| Best Practice | NIST, ENISA-Empfehlungen |

```
"Geeignete Verschlüsselung" → Konkret:
1. Algorithmus aus BSI TR-02102-1 (AES-256, ChaCha20-Poly1305, ...)
2. Schlüssellänge ≥ 128 Bit
3. Key Rotation mindestens jährlich (BSI-Empfehlung)
```

**Dokumentiere deine Konkretisierung!** Bei einem Audit musst du erklären können, warum du bestimmte Schwellenwerte gewählt hast.

### Schritt 4: Entscheidungsbaum zeichnen

Übersetze die Anforderung in eine visuelle Logik:

```
Ressource enthält personenbezogene Daten?
├── Nein → Keine Prüfung nötig (PASS)
└── Ja → Verschlüsselung aktiviert?
    ├── Nein → VIOLATION: Nicht verschlüsselt
    └── Ja → Algorithmus akzeptiert?
        ├── Nein → VIOLATION: Schwacher Algorithmus
        └── Ja → Key Rotation aktuell (≤ 365 Tage)?
            ├── Nein → VIOLATION: Key Rotation überfällig
            └── Ja → COMPLIANT
```

### Schritt 5: Datenmodell definieren

Bevor du Code schreibst, definiere das Input-Schema. Was muss die Policy wissen?

```json
{
  "resources": [{
    "name": "string",
    "contains_personal_data": "boolean",
    "encryption": {
      "enabled": "boolean",
      "algorithm": "string",
      "key_rotation_date": "date (YYYY-MM-DD)"
    }
  }],
  "current_date": "date (YYYY-MM-DD)"
}
```

**Tipp:** Definiere das Datenmodell so, dass es zu deinen realen Datenquellen passt. Eine Policy nützt nichts, wenn die Eingabedaten nicht automatisiert geliefert werden können.

### Schritt 6: Rego-Policy schreiben

Jetzt erst kommt der Code. Wenn Schritte 1–5 sauber waren, schreibt sich die Policy fast von selbst:

```rego
package gdpr.article32.encryption

import rego.v1

# Schritt 3: Konkretisierung dokumentieren
# Quelle: BSI TR-02102-1 (2024), ENISA Algorithms Report
accepted_algorithms := {"AES-256", "AES-256-GCM", "ChaCha20-Poly1305"}

# Schritt 4: Entscheidungsbaum als Regeln
deny contains msg if {
    some r in input.resources
    r.contains_personal_data == true
    r.encryption.enabled != true
    msg := sprintf("Art. 32 DSGVO: '%s' nicht verschlüsselt", [r.name])
}
# ... weitere Regeln gemäss Entscheidungsbaum
```

### Schritt 7: Tests schreiben

Für jeden Pfad im Entscheidungsbaum ein Test. Plus Edge Cases:

- Was passiert bei fehlendem Feld (`encryption` nicht vorhanden)?
- Was bei leerem `resources`-Array?
- Was bei `null`-Werten?

```rego
test_empty_resources if {
    result := encryption.deny with input as {
        "resources": [],
        "current_date": "2026-04-01"
    }
    count(result) == 0  # Keine Ressourcen = keine Verstösse
}
```

## Anti-Patterns

### 1. „Zu wörtlich übersetzen"

```
❌ Gesetz: "...treffen geeignete Massnahmen..."
❌ Code:  is_adequate(measures) if { measures.suitable == true }
          → Das verlagert nur das Problem!

✅ Besser: Konkrete, prüfbare Kriterien definieren
```

### 2. „Ausnahmen ignorieren"

Fast jeder Artikel hat Ausnahmen (z.B. DSGVO Art. 17 Abs. 3: Recht auf Löschung gilt NICHT bei gesetzlicher Aufbewahrungspflicht). Ignoriere sie nicht – sie sind oft der komplexeste Teil.

### 3. „Eine Policy für alles"

Trenne verschiedene Anforderungen in separate Policies. Art. 32 (Verschlüsselung) und Art. 17 (Löschung) sind verschiedene Dateien, auch wenn beide die DSGVO betreffen.

## KI-gestützter Übersetzungsprozess

KI kann bei Schritten 1–4 signifikant helfen:

```
Prompt: "Ich arbeite an einer OPA-Policy für DORA Art. 17 Abs. 3
(ICT-Risikomanagement-Rahmenwerk). Bitte:
1. Extrahiere die konkreten, prüfbaren Anforderungen
2. Identifiziere unbestimmte Begriffe, die konkretisiert werden müssen
3. Schlage einen Entscheidungsbaum vor
4. Nenne relevante RTS/ITS, die die Anforderungen konkretisieren"
```

**Wichtig:** Die KI liefert einen Entwurf. Du verifizierst die juristische Korrektheit, identifizierst fehlende Edge Cases und trägst die Verantwortung für das Ergebnis.

## Übung

Wende den 7-Schritte-Prozess auf DORA Artikel 18 (Incident-Klassifizierung) an. Zeichne den Entscheidungsbaum, bevor du Code schreibst.

→ [Übung 2: DORA Incident-Klassifizierung](../exercises/02-dora-incident-classification.md)

---

→ [Lektion 4: Policy Testing & CI/CD](04-testing-cicd.md)
→ [Zurück zur Modulübersicht](../README.md)
