# Uebung 4: DSGVO Art. 25 - Privacy by Design & by Default

> **Schwierigkeit:** Intermediate · **Dauer:** 2-3 Stunden · **Punkte:** 10
> **Regulatorischer Bezug:** DSGVO Art. 25

## Kontext

Ein Produktteam einer Bank baut ein neues Kundenportal. Fachlich ist fast alles
bereit, aber die Frage bleibt: Welche datenschutzfreundlichen Voreinstellungen
muessen direkt in der Produktkonfiguration stecken?

Deine Aufgabe: Nutze das Lehrbeispiel unter
`compliance-as-code/gdpr/article25/`, um Privacy-by-Design- und
Privacy-by-Default-Kontrollen nachvollziehbar zu pruefen.

## Aufgabe

### Teil 1: Policy lesen

Analysiere die bestehende Policy:

- Welche technischen Defaults werden geprueft?
- Welche Interpretationsannahmen stecken im Lehrbeispiel?
- Welche Grenzen hat die Abbildung von Art. 25?

### Teil 2: Tests erweitern

Fuege mindestens zwei weitere Testfaelle hinzu:

1. positiver Fall mit `need-to-know`
2. negativer Fall mit mehreren ueberschuessigen Default-Feldern

### Teil 3: Reflexion

Beschreibe in 5-8 Saetzen:

- warum Art. 25 mehr ist als "Privacy aktivieren"
- welche Default-Einstellungen in echten Produktteams am haeufigsten uebersehen
  werden
- wie sich Art. 25 und Art. 32 ergaenzen

## KI-Hinweis

Nutze den Tutor fuer die Vorarbeit, aber ueberpruefe die Ergebnisse selbst.

Prompt-Vorschlag:

```text
Ich analysiere ein Lehrbeispiel zu DSGVO Art. 25 als Rego-Policy.
Hilf mir, die Unterschiede zwischen Zweckbindung, Datenminimierung,
Privacy by Default und technischen Schutzmassnahmen als Prueffragen zu formulieren.
```

## Abgabe

Branch: `exercise/04-gdpr-privacy-{dein-github-name}`
Dateien in: `compliance-as-code/gdpr/article25/`
Label: `academy-submission`, `module/m3`, `regulatory/gdpr`
