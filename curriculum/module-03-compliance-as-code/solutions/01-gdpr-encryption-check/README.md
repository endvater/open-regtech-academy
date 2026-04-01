# Musterlösung: Übung 1 – DSGVO Art. 32 Verschlüsselungsprüfung

> **Bitte erst nach eigener Abgabe einsehen!**

Die Musterlösung befindet sich in:

```
compliance-as-code/gdpr/article32/encryption.rego      # Policy
compliance-as-code/gdpr/article32/encryption_test.rego  # Tests
```

## Erklärung der Lösung

### Architekturentscheidungen

1. **Drei separate deny-Regeln** statt einer grossen: Jede Regel prüft genau eine Anforderung (Verschlüsselung aktiv, Algorithmus, Key Rotation). Das macht die Policy testbar und wartbar.

2. **Akzeptierte Algorithmen als Set**: Die Liste basiert auf BSI TR-02102-1 und ENISA-Empfehlungen. Sie ist als Konstante definiert, damit sie zentral aktualisiert werden kann, wenn sich der „Stand der Technik" ändert.

3. **Summary-Objekt**: Das `summary`-Feld erzeugt einen strukturierten Audit-Record. In der Praxis wird dieser Record in eine Audit-Datenbank geschrieben.

### Häufige Fehler in Einreichungen

- Key-Rotation-Berechnung: Die Zeitdifferenz in Rego erfordert `time.parse_rfc3339_ns()` und rechnet in Nanosekunden. Viele vergessen die Konvertierung in Tage.
- Fehlende Default-Werte: Was passiert, wenn `encryption` im Input fehlt? Die Musterlösung geht davon aus, dass das Feld immer vorhanden ist – eine robustere Variante würde `object.get()` verwenden.

### Verbesserungsmöglichkeiten

- Differenzierung nach Risikostufe (Daten mit hohem vs. mittlerem Risiko)
- Unterstützung für Encryption-at-Rest UND Encryption-in-Transit
- Integration mit einem Schlüsselverwaltungssystem (KMS) für Live-Prüfung
