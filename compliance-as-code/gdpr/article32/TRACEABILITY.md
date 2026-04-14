# Traceability: GDPR Article 32 Encryption

## 1. Policy-Identitaet

- **Policy-Pack:** `gdpr/article32`
- **Regulierung / Artikel:** DSGVO Art. 32 Abs. 1 lit. a
- **Status:** Stable teaching example
- **Maintainer:** Open RegTech Academy

## 2. Quelle

- **Primaerquelle:** Verordnung (EU) 2016/679, Art. 32
- **Technische Referenzen:** BSI TR-02102-1, ENISA Guidance

## 3. Ziel der Policy

Die Policy soll sichtbar machen, wie aus einer relativ abstrakten
Sicherheitsanforderung konkrete technische Prueffragen entstehen:

- ist Verschluesselung aktiviert?
- ist der Algorithmus akzeptabel?
- ist Key Rotation ueberfaellig?

## 4. Interpretationsannahmen

- das Lehrbeispiel reduziert `Stand der Technik` auf eine endliche Liste
  akzeptierter Algorithmen
- Key Rotation wird didaktisch auf einen festen Grenzwert von `365 Tagen`
  vereinfacht
- weitere organisatorische Massnahmen aus Art. 32 werden nicht modelliert

## 5. Datenmodell

Die Policy erwartet pro Ressource unter anderem:

- `contains_personal_data`
- `encryption.enabled`
- `encryption.algorithm`
- `encryption.key_rotation_date`
- `current_date`

## 6. Entscheidungslogik

| Regel | Beschreibung | Input-Felder | Ergebnis |
|-------|--------------|--------------|----------|
| `deny` | Ressource mit personenbezogenen Daten ist nicht verschluesselt | `contains_personal_data`, `encryption.enabled` | Verstoss |
| `deny` | unsicherer Algorithmus | `encryption.algorithm` | Verstoss |
| `deny` | Key Rotation ueberfaellig | `encryption.key_rotation_date`, `current_date` | Verstoss |

## 7. Teststrategie

- konforme Ressource
- unverschluesselte Ressource
- schwacher Algorithmus
- abgelaufene Key Rotation
- nicht-personenbezogene Daten
- gemischtes Input-Set

## 8. Reviewer-Hinweise

- regulatorisch: ist die didaktische Vereinfachung klar genug markiert?
- technisch: sind Zeitlogik und Fehlermeldungen nachvollziehbar?

## 9. Offene Grenzen des Lehrbeispiels

- keine Bewertung von Schluesselmanagement-Prozessen ausserhalb des Datums
- keine differenzierte Risikoabstufung je Datentyp
- keine organisatorischen oder vertraglichen Kontrollen
