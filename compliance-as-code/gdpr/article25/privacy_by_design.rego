# DSGVO Artikel 25 - Datenschutz durch Technikgestaltung und durch datenschutzfreundliche Voreinstellungen
# Quelle: https://eur-lex.europa.eu/legal-content/DE/TXT/?uri=CELEX%3A32016R0679
#
# Lehrbeispiel: Diese Policy modelliert Privacy-by-Design und Privacy-by-Default
# ueber einige zentrale technische Stellhebel.

package gdpr.article25.privacy_by_design

import rego.v1

default compliant := false

acceptable_default_visibility := {
    "restricted",
    "need-to-know",
}

deny contains msg if {
    some system in input.systems
    system.processes_personal_data == true
    system.purpose_defined != true
    msg := sprintf(
        "VERSTOSS [Art. 25 DSGVO]: System '%s' verarbeitet personenbezogene Daten ohne dokumentierten Zweck.",
        [system.name]
    )
}

deny contains msg if {
    some system in input.systems
    system.processes_personal_data == true
    some field in system.default_collected_fields
    not field in system.required_fields
    msg := sprintf(
        "VERSTOSS [Art. 25 DSGVO - Datenminimierung]: System '%s' erhebt das Feld '%s' standardmaessig ohne fachliche Notwendigkeit.",
        [system.name, field]
    )
}

deny contains msg if {
    some system in input.systems
    system.processes_personal_data == true
    not system.default_visibility in acceptable_default_visibility
    msg := sprintf(
        "VERSTOSS [Art. 25 DSGVO - Privacy by Default]: System '%s' hat mit '%s' keine datenschutzfreundliche Standardsichtbarkeit.",
        [system.name, system.default_visibility]
    )
}

deny contains msg if {
    some system in input.systems
    system.processes_personal_data == true
    system.default_analytics_enabled == true
    msg := sprintf(
        "VERSTOSS [Art. 25 DSGVO - Privacy by Default]: System '%s' aktiviert Analyse- oder Tracking-Funktionen standardmaessig.",
        [system.name]
    )
}

deny contains msg if {
    some system in input.systems
    system.processes_personal_data == true
    system.retention_days_default > system.retention_days_required
    msg := sprintf(
        "VERSTOSS [Art. 25 DSGVO - Speicherbegrenzung]: System '%s' behaelt Daten standardmaessig %d statt maximal %d Tage.",
        [system.name, system.retention_days_default, system.retention_days_required]
    )
}

deny contains msg if {
    some system in input.systems
    system.processes_personal_data == true
    system.privacy_controls.access_logging != true
    msg := sprintf(
        "VERSTOSS [Art. 25 DSGVO - technische Schutzmassnahmen]: System '%s' protokolliert Zugriffe auf personenbezogene Daten nicht standardmaessig.",
        [system.name]
    )
}

compliant if {
    count(deny) == 0
}

summary := {
    "regulation": "DSGVO",
    "article": "Art. 25",
    "check": "Privacy by Design and by Default",
    "compliant": compliant,
    "violations": deny,
    "violation_count": count(deny),
    "systems_checked": count(input.systems),
}
