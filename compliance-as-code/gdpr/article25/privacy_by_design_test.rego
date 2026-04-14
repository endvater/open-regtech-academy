package gdpr.article25.privacy_by_design_test

import rego.v1
import data.gdpr.article25.privacy_by_design

test_compliant_system if {
    result := privacy_by_design.deny with input as {
        "systems": [{
            "name": "customer-onboarding",
            "processes_personal_data": true,
            "purpose_defined": true,
            "required_fields": ["full_name", "iban", "date_of_birth"],
            "default_collected_fields": ["full_name", "iban", "date_of_birth"],
            "default_visibility": "restricted",
            "default_analytics_enabled": false,
            "retention_days_default": 90,
            "retention_days_required": 90,
            "privacy_controls": {
                "access_logging": true
            }
        }]
    }
    count(result) == 0
}

test_missing_purpose if {
    result := privacy_by_design.deny with input as {
        "systems": [{
            "name": "marketing-export",
            "processes_personal_data": true,
            "purpose_defined": false,
            "required_fields": ["email"],
            "default_collected_fields": ["email"],
            "default_visibility": "restricted",
            "default_analytics_enabled": false,
            "retention_days_default": 30,
            "retention_days_required": 30,
            "privacy_controls": {
                "access_logging": true
            }
        }]
    }
    some msg in result
    contains(msg, "ohne dokumentierten Zweck")
}

test_default_collection_not_minimized if {
    result := privacy_by_design.deny with input as {
        "systems": [{
            "name": "kyc-lite",
            "processes_personal_data": true,
            "purpose_defined": true,
            "required_fields": ["full_name", "iban"],
            "default_collected_fields": ["full_name", "iban", "occupation"],
            "default_visibility": "restricted",
            "default_analytics_enabled": false,
            "retention_days_default": 30,
            "retention_days_required": 30,
            "privacy_controls": {
                "access_logging": true
            }
        }]
    }
    some msg in result
    contains(msg, "Datenminimierung")
}

test_non_private_defaults if {
    result := privacy_by_design.deny with input as {
        "systems": [{
            "name": "case-portal",
            "processes_personal_data": true,
            "purpose_defined": true,
            "required_fields": ["case_id", "customer_id"],
            "default_collected_fields": ["case_id", "customer_id"],
            "default_visibility": "public",
            "default_analytics_enabled": false,
            "retention_days_default": 30,
            "retention_days_required": 30,
            "privacy_controls": {
                "access_logging": true
            }
        }]
    }
    some msg in result
    contains(msg, "Standardsichtbarkeit")
}

test_default_tracking_and_retention if {
    result := privacy_by_design.deny with input as {
        "systems": [{
            "name": "customer-analytics",
            "processes_personal_data": true,
            "purpose_defined": true,
            "required_fields": ["customer_id"],
            "default_collected_fields": ["customer_id"],
            "default_visibility": "need-to-know",
            "default_analytics_enabled": true,
            "retention_days_default": 365,
            "retention_days_required": 90,
            "privacy_controls": {
                "access_logging": true
            }
        }]
    }
    count(result) == 2
}

test_missing_access_logging if {
    result := privacy_by_design.deny with input as {
        "systems": [{
            "name": "hr-case-store",
            "processes_personal_data": true,
            "purpose_defined": true,
            "required_fields": ["employee_id"],
            "default_collected_fields": ["employee_id"],
            "default_visibility": "restricted",
            "default_analytics_enabled": false,
            "retention_days_default": 30,
            "retention_days_required": 30,
            "privacy_controls": {
                "access_logging": false
            }
        }]
    }
    some msg in result
    contains(msg, "protokolliert Zugriffe")
}
