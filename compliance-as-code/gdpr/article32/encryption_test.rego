# Tests für DSGVO Art. 32 – Verschlüsselungsprüfung
# Ausführen: opa test . -v

package gdpr.article32.encryption_test

import rego.v1
import data.gdpr.article32.encryption

# ============================================================
# Test 1: Vollständig konforme Ressource → KEIN Verstoss
# ============================================================
test_compliant_resource if {
    result := encryption.deny with input as {
        "resources": [{
            "name": "customer-db",
            "type": "database",
            "contains_personal_data": true,
            "encryption": {
                "enabled": true,
                "algorithm": "AES-256",
                "key_rotation_date": "2026-02-01"
            }
        }],
        "current_date": "2026-04-01"
    }
    count(result) == 0
}

# ============================================================
# Test 2: Nicht verschlüsselte Ressource → VERSTOSS
# ============================================================
test_unencrypted_personal_data if {
    result := encryption.deny with input as {
        "resources": [{
            "name": "analytics-log",
            "type": "storage",
            "contains_personal_data": true,
            "encryption": {
                "enabled": false
            }
        }],
        "current_date": "2026-04-01"
    }
    count(result) > 0
    some msg in result
    contains(msg, "ohne aktive Verschlüsselung")
}

# ============================================================
# Test 3: Schwacher Algorithmus → VERSTOSS
# ============================================================
test_weak_algorithm if {
    result := encryption.deny with input as {
        "resources": [{
            "name": "legacy-storage",
            "type": "file-system",
            "contains_personal_data": true,
            "encryption": {
                "enabled": true,
                "algorithm": "DES",
                "key_rotation_date": "2026-03-01"
            }
        }],
        "current_date": "2026-04-01"
    }
    count(result) > 0
    some msg in result
    contains(msg, "unsicheren Algorithmus")
}

# ============================================================
# Test 4: Abgelaufene Key Rotation → VERSTOSS
# ============================================================
test_expired_key_rotation if {
    result := encryption.deny with input as {
        "resources": [{
            "name": "archive-db",
            "type": "database",
            "contains_personal_data": true,
            "encryption": {
                "enabled": true,
                "algorithm": "AES-256",
                "key_rotation_date": "2024-12-01"
            }
        }],
        "current_date": "2026-04-01"
    }
    count(result) > 0
    some msg in result
    contains(msg, "Key Rotation erforderlich")
}

# ============================================================
# Test 5: Ressource OHNE personenbezogene Daten → KEIN Verstoss
# ============================================================
test_non_personal_data_no_encryption_ok if {
    result := encryption.deny with input as {
        "resources": [{
            "name": "public-cache",
            "type": "cache",
            "contains_personal_data": false,
            "encryption": {
                "enabled": false
            }
        }],
        "current_date": "2026-04-01"
    }
    count(result) == 0
}

# ============================================================
# Test 6: Mehrere Ressourcen, gemischt → Korrekte Erkennung
# ============================================================
test_mixed_resources if {
    result := encryption.deny with input as {
        "resources": [
            {
                "name": "compliant-db",
                "type": "database",
                "contains_personal_data": true,
                "encryption": {
                    "enabled": true,
                    "algorithm": "AES-256-GCM",
                    "key_rotation_date": "2026-03-01"
                }
            },
            {
                "name": "non-compliant-storage",
                "type": "storage",
                "contains_personal_data": true,
                "encryption": {
                    "enabled": false
                }
            },
            {
                "name": "public-api-cache",
                "type": "cache",
                "contains_personal_data": false,
                "encryption": {
                    "enabled": false
                }
            }
        ],
        "current_date": "2026-04-01"
    }
    # Genau 1 Verstoss (non-compliant-storage)
    count(result) == 1
}

# ============================================================
# Test 7: ChaCha20-Poly1305 ist akzeptiert
# ============================================================
test_chacha20_accepted if {
    result := encryption.deny with input as {
        "resources": [{
            "name": "mobile-sync-db",
            "type": "database",
            "contains_personal_data": true,
            "encryption": {
                "enabled": true,
                "algorithm": "ChaCha20-Poly1305",
                "key_rotation_date": "2026-01-15"
            }
        }],
        "current_date": "2026-04-01"
    }
    count(result) == 0
}

# ============================================================
# Test 8: Compliance Summary korrekt
# ============================================================
test_summary_compliant if {
    s := encryption.summary with input as {
        "resources": [{
            "name": "ok-db",
            "type": "database",
            "contains_personal_data": true,
            "encryption": {
                "enabled": true,
                "algorithm": "AES-256",
                "key_rotation_date": "2026-03-01"
            }
        }],
        "current_date": "2026-04-01"
    }
    s.compliant == true
    s.violation_count == 0
    s.resources_checked == 1
}
