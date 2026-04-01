-- Open RegTech Academy – Lab-Datenbank
-- Synthetische Beispieldaten für Compliance-Übungen
-- KEINE echten Personendaten (DSGVO-konform)

-- ============================================================
-- Schema: Ressourcen-Inventar (für DSGVO Art. 32 Übungen)
-- ============================================================

CREATE TABLE IF NOT EXISTS resources (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (type IN ('database', 'storage', 'cache', 'file-system')),
    department VARCHAR(100),
    contains_personal_data BOOLEAN DEFAULT FALSE,
    encryption_enabled BOOLEAN DEFAULT FALSE,
    encryption_algorithm VARCHAR(50),
    key_rotation_date DATE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Beispieldaten: Mix aus konformen und nicht-konformen Ressourcen
INSERT INTO resources (name, type, department, contains_personal_data, encryption_enabled, encryption_algorithm, key_rotation_date) VALUES
('customer-master-db', 'database', 'CRM', true, true, 'AES-256-GCM', '2026-02-15'),
('transaction-log', 'database', 'Payment', true, true, 'AES-256', '2026-01-20'),
('analytics-datalake', 'storage', 'BI', true, false, NULL, NULL),
('public-website-cache', 'cache', 'Marketing', false, false, NULL, NULL),
('employee-hr-records', 'database', 'HR', true, true, 'DES', '2025-06-01'),
('audit-archive', 'storage', 'Compliance', true, true, 'AES-256', '2024-03-10'),
('api-rate-limiter', 'cache', 'IT', false, false, NULL, NULL),
('kyc-document-store', 'file-system', 'Compliance', true, true, 'AES-256-GCM', '2026-03-01'),
('legacy-crm-backup', 'storage', 'CRM', true, true, 'RC4', '2023-11-15'),
('trading-position-db', 'database', 'Trading', true, true, 'ChaCha20-Poly1305', '2026-02-28');

-- ============================================================
-- Schema: ICT-Incidents (für DORA Art. 18 Übungen)
-- ============================================================

CREATE TABLE IF NOT EXISTS ict_incidents (
    id SERIAL PRIMARY KEY,
    incident_id VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    severity VARCHAR(20) CHECK (severity IN ('low', 'medium', 'high', 'critical')),
    affected_clients INTEGER DEFAULT 0,
    financial_impact_eur DECIMAL(15,2) DEFAULT 0,
    downtime_hours DECIMAL(5,2) DEFAULT 0,
    data_records_compromised INTEGER DEFAULT 0,
    affected_services TEXT[], -- Array of service names
    detected_at TIMESTAMP NOT NULL,
    resolved_at TIMESTAMP,
    reported_to_authority BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Beispiel-Incidents: Verschiedene Schweregrade
INSERT INTO ict_incidents (incident_id, description, severity, affected_clients, financial_impact_eur, downtime_hours, data_records_compromised, affected_services, detected_at, resolved_at, reported_to_authority) VALUES
('INC-2026-001', 'DDoS-Angriff auf Online-Banking-Portal', 'critical', 45000, 250000.00, 6.5, 0, ARRAY['core-banking', 'client-authentication'], '2026-03-15 08:30:00', '2026-03-15 15:00:00', true),
('INC-2026-002', 'Fehlkonfiguration im API-Gateway', 'medium', 200, 5000.00, 0.5, 0, ARRAY['api-gateway'], '2026-03-18 14:00:00', '2026-03-18 14:30:00', false),
('INC-2026-003', 'Ransomware-Versuch auf Backup-Server', 'high', 0, 15000.00, 2.0, 8500, ARRAY['backup-system'], '2026-03-20 03:15:00', '2026-03-20 09:00:00', true),
('INC-2026-004', 'Verzögerung im Clearing-System', 'high', 1200, 180000.00, 3.0, 0, ARRAY['payment-processing'], '2026-03-25 09:00:00', '2026-03-25 12:00:00', true),
('INC-2026-005', 'Monitoring-Agent Ausfall (kein Kundenbezug)', 'low', 0, 500.00, 0.25, 0, ARRAY['monitoring'], '2026-03-28 11:00:00', '2026-03-28 11:15:00', false);

-- ============================================================
-- View: Compliance-Übersicht (für Dashboard)
-- ============================================================

CREATE OR REPLACE VIEW compliance_overview AS
SELECT
    r.name,
    r.type,
    r.department,
    r.contains_personal_data,
    r.encryption_enabled,
    r.encryption_algorithm,
    r.key_rotation_date,
    CASE
        WHEN NOT r.contains_personal_data THEN 'N/A'
        WHEN NOT r.encryption_enabled THEN 'NON-COMPLIANT: Nicht verschlüsselt'
        WHEN r.encryption_algorithm IN ('DES', 'RC4', '3DES') THEN 'NON-COMPLIANT: Schwacher Algorithmus'
        WHEN r.key_rotation_date < CURRENT_DATE - INTERVAL '365 days' THEN 'NON-COMPLIANT: Key Rotation überfällig'
        ELSE 'COMPLIANT'
    END AS gdpr_art32_status
FROM resources r
ORDER BY
    CASE
        WHEN NOT r.contains_personal_data THEN 3
        WHEN NOT r.encryption_enabled THEN 0
        WHEN r.encryption_algorithm IN ('DES', 'RC4', '3DES') THEN 1
        WHEN r.key_rotation_date < CURRENT_DATE - INTERVAL '365 days' THEN 2
        ELSE 4
    END;
