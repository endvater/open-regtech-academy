# DSGVO Artikel 32 Abs. 1 lit. a – Verschlüsselung personenbezogener Daten
# Quelle: https://eur-lex.europa.eu/legal-content/DE/TXT/?uri=CELEX%3A32016R0679
#
# Diese Policy prüft:
# 1. Ob alle Ressourcen mit personenbezogenen Daten verschlüsselt sind
# 2. Ob ein akzeptierter Algorithmus verwendet wird (Stand der Technik)
# 3. Ob die Key Rotation innerhalb des zulässigen Zeitraums erfolgt ist
#
# Nutzung: opa eval -d . -i input.json "data.gdpr.article32.encryption"
# Tests:  opa test . -v

package gdpr.article32.encryption

import rego.v1

# ============================================================
# Konfiguration: Akzeptierte Algorithmen & Key-Rotation-Limit
# ============================================================

# Akzeptierte Verschlüsselungsalgorithmen gemäss BSI TR-02102-1
# und ENISA Empfehlungen (Stand der Technik, Art. 32 DSGVO)
accepted_algorithms := {
    "AES-256",
    "AES-256-GCM",
    "AES-128-GCM",       # Akzeptabel für Daten mit mittlerem Risiko
    "ChaCha20-Poly1305",
    "Camellia-256",
}

# Maximale Tage seit letzter Key Rotation
# Empfehlung: BSI & NIST empfehlen jährliche Rotation
max_key_age_days := 365

# ============================================================
# Deny-Regeln: Jeder Verstoss erzeugt eine Nachricht
# ============================================================

# Regel 1: Personenbezogene Daten MÜSSEN verschlüsselt sein
deny contains msg if {
    some resource in input.resources
    resource.contains_personal_data == true
    resource.encryption.enabled != true
    msg := sprintf(
        "VERSTOSS [Art. 32 Abs. 1 lit. a DSGVO]: Ressource '%s' (Typ: %s) enthält personenbezogene Daten ohne aktive Verschlüsselung.",
        [resource.name, resource.type]
    )
}

# Regel 2: Nur akzeptierte Algorithmen (Stand der Technik)
deny contains msg if {
    some resource in input.resources
    resource.contains_personal_data == true
    resource.encryption.enabled == true
    not resource.encryption.algorithm in accepted_algorithms
    msg := sprintf(
        "VERSTOSS [Art. 32 Abs. 1 DSGVO – Stand der Technik]: Ressource '%s' verwendet unsicheren Algorithmus '%s'. Akzeptiert: %v",
        [resource.name, resource.encryption.algorithm, accepted_algorithms]
    )
}

# Regel 3: Key Rotation muss innerhalb des zulässigen Zeitraums liegen
deny contains msg if {
    some resource in input.resources
    resource.contains_personal_data == true
    resource.encryption.enabled == true
    resource.encryption.algorithm in accepted_algorithms

    # Berechne Alter des Schlüssels in Tagen (vereinfacht)
    key_date := time.parse_rfc3339_ns(sprintf("%sT00:00:00Z", [resource.encryption.key_rotation_date]))
    current := time.parse_rfc3339_ns(sprintf("%sT00:00:00Z", [input.current_date]))
    age_days := (current - key_date) / (24 * 60 * 60 * 1000000000)
    age_days > max_key_age_days

    msg := sprintf(
        "VERSTOSS [Art. 32 DSGVO – Key Management]: Schlüssel für '%s' ist %d Tage alt (max: %d). Key Rotation erforderlich.",
        [resource.name, age_days, max_key_age_days]
    )
}

# ============================================================
# Compliance-Status & Zusammenfassung
# ============================================================

# Gesamtstatus: compliant wenn keine Verstösse
compliant if {
    count(deny) == 0
}

# Zusammenfassung für Audit Trail
summary := {
    "regulation": "DSGVO",
    "article": "Art. 32 Abs. 1 lit. a",
    "check": "Verschlüsselung personenbezogener Daten",
    "compliant": compliant,
    "violations": deny,
    "violation_count": count(deny),
    "resources_checked": count(input.resources),
    "timestamp": input.current_date,
}
