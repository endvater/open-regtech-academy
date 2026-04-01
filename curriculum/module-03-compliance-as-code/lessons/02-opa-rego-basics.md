# Lektion 2: OPA & Rego Grundlagen

## Was ist OPA?

Open Policy Agent (OPA) ist eine Open-Source-Policy-Engine der Cloud Native Computing Foundation (CNCF). OPA entkoppelt Policy-Entscheidungen von der Anwendungslogik: deine Anwendung fragt OPA „Darf X passieren?", und OPA antwortet auf Basis deklarativer Regeln.

```
+-------------------+       +-----+       +------------+
| Deine Anwendung   | ----> | OPA | ----> | Entscheidung |
| "Darf User X auf  |       |     |       | allow: true  |
|  Ressource Y?"    |       |     |       | reason: "..."|
+-------------------+       +-----+       +------------+
                                ^
                                |
                          +----------+
                          | Policies |
                          | (Rego)   |
                          +----------+
```

### Warum OPA für Compliance?

OPA wurde für Infrastruktur-Policies entwickelt (Kubernetes Admission Control, API-Autorisierung), aber das Grundprinzip ist identisch mit Compliance: **Entscheide auf Basis von Regeln, ob ein Zustand erlaubt ist.**

Der regulatorische Kontext macht es sogar einfacher: Die Regeln sind bereits geschrieben – sie stehen im Gesetz. Unsere Aufgabe ist die Übersetzung.

## Rego: Die Policy-Sprache

Rego (ausgesprochen „ray-go") ist eine deklarative Sprache, die speziell für Policy-Entscheidungen entwickelt wurde.

### Grundkonzepte

**1. Packages – Organisation von Policies**

```rego
package gdpr.article32.encryption
```

Packages organisieren Policies in einem Namensraum. Für RegTech empfehlen wir: `{regulierung}.{artikel}.{thema}`.

**2. Rules – Die eigentlichen Regeln**

```rego
import rego.v1

# Einfache Regel: Ergebnis ist true wenn alle Bedingungen erfüllt
encryption_required if {
    input.resource.contains_personal_data == true
}

# Default-Wert: Was gilt, wenn keine Regel greift?
default allow := false

allow if {
    input.resource.encryption.enabled == true
}
```

**3. deny-Pattern – Das Compliance-Muster**

Das wichtigste Pattern für Compliance-Policies: sammle alle Verstösse.

```rego
# deny ist eine Menge (Set) von Fehlermeldungen
deny contains msg if {
    # Bedingung: Wann liegt ein Verstoss vor?
    some resource in input.resources
    resource.contains_personal_data == true
    resource.encryption.enabled != true

    # Fehlermeldung mit Kontext
    msg := sprintf("Verstoss: '%s' nicht verschlüsselt", [resource.name])
}

# compliant = true wenn deny leer ist
compliant if {
    count(deny) == 0
}
```

**4. Iteration – Über Daten iterieren**

```rego
# "some" iteriert über Elemente
deny contains msg if {
    some resource in input.resources       # Für jede Ressource...
    resource.type == "database"            # ...vom Typ database...
    not resource.backup_enabled            # ...ohne Backup...
    msg := sprintf("Kein Backup für '%s'", [resource.name])
}
```

**5. Hilfsfunktionen**

```rego
# Wiederverwendbare Logik auslagern
is_strong_algorithm(algo) if {
    algo in {"AES-256", "AES-256-GCM", "ChaCha20-Poly1305"}
}

deny contains msg if {
    some r in input.resources
    r.encryption.enabled == true
    not is_strong_algorithm(r.encryption.algorithm)
    msg := sprintf("Schwacher Algorithmus '%s' bei '%s'",
                   [r.encryption.algorithm, r.name])
}
```

## Hands-on: OPA in der Lab-Umgebung

### OPA starten

```bash
cd labs/lab-opa-sandbox
docker-compose up -d

# OPA läuft auf http://localhost:8181
# Healthcheck:
curl http://localhost:8181/health
```

### Policy laden & evaluieren

```bash
# Policy direkt evaluieren (ohne Server)
opa eval \
  -d compliance-as-code/gdpr/article32/encryption.rego \
  -i testdata/gdpr-sample-input.json \
  "data.gdpr.article32.encryption.deny"

# Über die REST-API (OPA Server)
curl -X POST http://localhost:8181/v1/data/gdpr/article32/encryption/deny \
  -H "Content-Type: application/json" \
  -d @testdata/gdpr-sample-input.json
```

### Tests ausführen

```bash
# Alle Tests im Verzeichnis
opa test compliance-as-code/gdpr/ -v

# Einzelne Testdatei
opa test compliance-as-code/gdpr/article32/ -v --run "test_compliant"
```

## Die wichtigsten Rego-Patterns für RegTech

| Pattern | Verwendung | Beispiel |
|---------|-----------|----------|
| `deny contains msg if {...}` | Verstösse sammeln | Verschlüsselungsprüfung |
| `default allow := false` | Deny-by-Default | Zugriffskontrolle |
| `some x in collection` | Über Daten iterieren | Alle Ressourcen prüfen |
| `not condition` | Negation | „Nicht verschlüsselt" |
| `x in set` | Mitgliedschaft prüfen | Algorithmus-Whitelist |
| `sprintf(fmt, args)` | Nachrichten formatieren | Audit-Meldungen |
| `count(set) == 0` | Leere Menge prüfen | Compliance-Status |

## Häufige Fehler

1. **Vergessen von `import rego.v1`** – ohne diesen Import gelten ältere Rego-Konventionen
2. **`=` vs. `:=`** – `=` ist Unifikation (bidirektional), `:=` ist Zuweisung (unidirektional)
3. **Fehlende `some`-Deklaration** – ab Rego v1 muss jede Iterationsvariable mit `some` deklariert werden
4. **Strings vergleichen** – Rego ist case-sensitive; `"AES-256" != "aes-256"`

## KI-Übung

Öffne deinen KI-Tutor (siehe `ai-prompts/module-03-compliance-tutor.md`) und stelle folgende Frage:

> „Erkläre mir den Unterschied zwischen einer Rego-Rule die `deny contains msg if {...}` verwendet und einer die `allow if {...}` verwendet. Wann nutze ich welches Pattern in der Compliance?"

Vergleiche die Antwort mit dem, was du in dieser Lektion gelernt hast. Wo ergänzt die KI dein Wissen? Wo widerspricht sie?

---

→ [Lektion 3: Der Übersetzungsprozess](03-translation-process.md)
→ [Zurück zur Modulübersicht](../README.md)
