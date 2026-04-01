# Lektion 1: Einführung in Compliance-as-Code

## Was ist Compliance-as-Code?

Compliance-as-Code (CaC) bedeutet, regulatorische Anforderungen als ausführbaren, testbaren und versionierbaren Code zu formulieren – statt als PDF-Checklisten, Excel-Tabellen oder Word-Dokumente.

**Traditioneller Ansatz:**
```
Gesetzestext (PDF) → Compliance-Abteilung liest → Checkliste (Excel)
→ Manuelle Prüfung → Report (Word) → Audit (jährlich)
```

**Compliance-as-Code:**
```
Gesetzestext → Formalisierung → Executable Policy (Code)
→ Automatisierte Prüfung → Kontinuierlicher Compliance-Status → Audit Trail
```

## Warum ist das wichtig?

### Das Skalierungsproblem

Allein im EU-Finanzsektor gelten gleichzeitig:
- **DORA** (ICT-Risikomanagement, seit Jan 2025)
- **MiCAR** (Krypto-Asset-Regulierung, ab Juli 2026)
- **EU AI Act** (KI-Regulierung, ab Aug 2026)
- **DSGVO** (Datenschutz, seit 2018)
- **Basel III/IV**, **MiFID II**, **PSD2**, **AMLD6**, ...

Kein Team kann diese Komplexität manuell bewältigen. Automatisierung ist keine Option – sie ist eine Notwendigkeit.

### Die Vorteile

| Aspekt | Manuell | Compliance-as-Code |
|--------|---------|-------------------|
| Prüffrequenz | Jährlich/Quartalsweise | Kontinuierlich (Echtzeit) |
| Konsistenz | Abhängig von Person | Deterministisch |
| Nachvollziehbarkeit | Schwer dokumentierbar | Git-Versionshistorie |
| Skalierung | Linear (mehr Leute) | Automatisiert |
| Fehlerquote | Hoch bei Komplexität | Testbar, reproduzierbar |
| Reaktionszeit | Wochen bis Monate | Minuten bis Stunden |

## Technologie-Überblick

### Open Policy Agent (OPA)

OPA ist eine Open-Source-Policy-Engine, die von der Cloud Native Computing Foundation (CNCF) gepflegt wird. Sie ermöglicht:

- **Deklarative Policies**: Regeln beschreiben *was* erlaubt/verboten ist, nicht *wie* geprüft wird
- **Universelle Einsetzbarkeit**: APIs, Kubernetes, Datenbanken, CI/CD, Microservices
- **Rego-Sprache**: Eine speziell für Policy-Entscheidungen entwickelte Sprache
- **Decoupling**: Policies sind von der Anwendungslogik getrennt

### Warum OPA für RegTech?

```
+-------------------+     +-----------+     +------------------+
| Compliance-Daten  | --> |    OPA    | --> | Entscheidung     |
| (Transaktionen,   |     | (Rego-    |     | (allow/deny +    |
|  Konfigurationen, |     |  Policies)|     |  Begründung)     |
|  Systeme)         |     |           |     |                  |
+-------------------+     +-----------+     +------------------+
```

OPA passt perfekt zu RegTech, weil:
1. Policies als Code versionierbar und auditierbar sind
2. Die Trennung von Daten und Logik regulatorisch sinnvoll ist
3. Es bereits breite Adoption in der Cloud-Native-Welt hat
4. Tests und CI/CD nativ unterstützt werden

## Erstes Beispiel

**Regulatorische Anforderung (vereinfacht):**
> „Personenbezogene Daten müssen bei der Speicherung verschlüsselt werden." (DSGVO Art. 32)

**Als Rego-Policy:**

```rego
package gdpr.article32

import rego.v1

# Prüfe: Sind alle Ressourcen mit personenbezogenen Daten verschlüsselt?
deny contains msg if {
    some resource in input.resources
    resource.contains_personal_data == true
    resource.encryption.enabled != true
    msg := sprintf(
        "DSGVO Art. 32 Verstoss: '%s' enthält personenbezogene Daten ohne Verschlüsselung",
        [resource.name]
    )
}

# Compliance-Status: Nur wenn keine Verstösse vorliegen
compliant if {
    count(deny) == 0
}
```

**Test-Input:**

```json
{
  "resources": [
    {
      "name": "customer-database",
      "contains_personal_data": true,
      "encryption": { "enabled": true, "algorithm": "AES-256" }
    },
    {
      "name": "analytics-log",
      "contains_personal_data": true,
      "encryption": { "enabled": false }
    }
  ]
}
```

**Ergebnis:**
```json
{
  "deny": [
    "DSGVO Art. 32 Verstoss: 'analytics-log' enthält personenbezogene Daten ohne Verschlüsselung"
  ],
  "compliant": false
}
```

## Der Übersetzungsprozess (Vorschau auf Lektion 3)

```
1. Gesetzestext lesen & verstehen
   ↓
2. Kernanforderung extrahieren (Was muss geprüft werden?)
   ↓
3. Entscheidungsbaum zeichnen (Wenn X, dann Y)
   ↓
4. Datenmodell definieren (Welche Inputs braucht die Policy?)
   ↓
5. Rego-Policy schreiben
   ↓
6. Tests schreiben (positive + negative Fälle)
   ↓
7. Peer-Review (Regulatory + Technical)
```

## KI-Tipp

Du kannst einen LLM als Unterstützung nutzen, um den Übersetzungsprozess zu starten:

```
Prompt: "Analysiere DSGVO Artikel 32 und extrahiere die konkreten
technischen Anforderungen, die automatisiert geprüft werden können.
Formuliere jede Anforderung als If-Then-Regel."
```

**Wichtig:** KI-Output ist ein Startpunkt, kein Endprodukt! Du musst:
- Die juristische Korrektheit verifizieren
- Edge Cases identifizieren
- Tests schreiben, die auch Grenzfälle abdecken

## Weiter

→ [Lektion 2: OPA & Rego Grundlagen](02-opa-rego-basics.md)
→ [Übung 1: DSGVO Art. 32 Verschlüsselungsprüfung](../exercises/01-gdpr-encryption-check.md)
