# GitHub Issue Backlog

Priorisierter Start-Backlog fuer die Open RegTech Engineering Academy.
Stand: 2026-04-02

## P0

### 1. README und Quickstart mit tatsaechlichem Repo-Stand synchronisieren

Labels: `good-first-issue`, `help-wanted`, `difficulty/beginner`

Das README beschreibt den Anspruch des Projekts bereits gut, enthaelt im aktuellen Stand aber ein paar Inkonsistenzen, die neue Contributors verwirren koennen. Ziel dieses Issues ist, Clone-URL, Status-Angaben, Quickstart und Repository-Struktur so zu ueberarbeiten, dass sie exakt dem realen Inhalt des Repos entsprechen.

Done when:
- Clone-Befehl ist korrekt.
- Status-Tabelle spiegelt den tatsaechlichen Stand wider.
- Verweise auf `.github` und CI/CD sind nur enthalten, wenn sie wirklich vorhanden sind.
- Quickstart wurde einmal frisch getestet.

### 2. GitHub Actions fuer OPA-Tests und Markdown-Checks aufsetzen

Labels: `module/m3`, `type/test`, `difficulty/intermediate`, `help-wanted`

Damit das Repo als Lern- und Qualitaetsbasis funktioniert, sollen Pull Requests automatisch geprueft werden. Wir brauchen einen minimalen CI-Workflow, der Rego-Policies testet und Markdown-Dateien auf offensichtliche Probleme wie kaputte Links oder Formatfehler prueft.

Done when:
- Workflow laeuft bei `push` und `pull_request`.
- `opa test` wird fuer die vorhandenen Policies ausgefuehrt.
- Markdown wird automatisch geprueft.
- Fehler schlagen die Pipeline sichtbar fehl.

### 3. Issue-Templates und PR-Template fuer die Academy anlegen

Labels: `good-first-issue`, `help-wanted`, `difficulty/beginner`

Contributors sollen schnell verstehen, wie sie Bugs melden, neue Policies vorschlagen oder Curriculum-Beitraege einreichen. Dieses Issue legt standardisierte Templates fuer typische Academy-Beitraege an und ergaenzt eine PR-Checklist fuer Tests, regulatorische Quellen und Review-Hinweise.

Done when:
- Es gibt Templates fuer `Bug`, `Policy Contribution`, `Curriculum Contribution` und `Lab Improvement`.
- Ein PR-Template mit Test- und Quellen-Checklist ist vorhanden.
- Die Templates passen zur Sprache und Struktur des Repos.

### 4. Beispiel-Inputs und Runbook fuer Modul 3 ergaenzen

Labels: `module/m3`, `type/curriculum`, `difficulty/beginner`

Die vorhandenen Policies und Lektionen sind gut, aber der Einstieg wird deutlich einfacher, wenn fuer jede Kernuebung direkt ausfuehrbare Beispiel-Inputs und Befehle vorliegen. Ziel ist ein kleines Runbook, mit dem Lernende `opa eval` und `opa test` ohne Raetselraten ausfuehren koennen.

Done when:
- Fuer DSGVO Art. 32 und DORA Art. 18 gibt es Beispiel-`input.json`-Dateien.
- Die wichtigsten Befehle sind dokumentiert.
- Erwartete Outputs oder Verstoesse sind beschrieben.
- Das Runbook funktioniert mit dem aktuellen Repo-Stand.

## P1

### 5. Synthetic Incident Generator v1 fuer DORA-Uebungen bauen

Labels: `module/m3`, `type/lab`, `difficulty/intermediate`, `regulatory/dora`

Das Verzeichnis `synthetic-data/` ist aktuell noch ein Platzhalter. Dieses Issue erstellt einen ersten Python-Generator fuer synthetische ICT-Incidents, damit Uebungen, Tests und Labs mit realistischeren, aber DSGVO-konformen Daten arbeiten koennen.

Done when:
- Ein CLI-Skript erzeugt synthetische Incidents.
- Ausgabe ist mindestens als JSON oder SQL moeglich.
- Faelle decken minor und major incidents ab.
- Die Nutzung ist im README dokumentiert.

### 6. Grafana-Dashboard fuer compliance_overview automatisch provisionieren

Labels: `module/m3`, `type/lab`, `difficulty/intermediate`

Das Lab startet bereits PostgreSQL, OPA und Grafana, aber der Mehrwert bleibt begrenzt, solange Dashboards manuell gebaut werden muessen. Ziel ist, beim Start direkt ein vorkonfiguriertes Dashboard fuer Ressourcenstatus, Verschluesselungsverstoesse und Key-Rotation bereitzustellen.

Done when:
- Grafana-Provisioning-Dateien sind im Repo.
- `docker-compose up` stellt mindestens ein Dashboard automatisch bereit.
- Dashboard nutzt die vorhandene Datenbasis oder View.
- Die Einrichtung ist dokumentiert.

### 7. Neues Policy-Pack: DSGVO Art. 25 Privacy by Design und by Default

Labels: `module/m3`, `type/policy`, `difficulty/intermediate`, `regulatory/gdpr`

Nach Art. 32 ist Art. 25 ein idealer naechster Baustein, weil er das Denken in technischen Defaults, Minimierung und Schutzmassnahmen staerkt. Dieses Issue ergaenzt ein neues Lehrbeispiel als Rego-Policy plus Tests und Uebung.

Done when:
- Neue Policy liegt unter `compliance-as-code/gdpr/article25/`.
- Mindestens 5 Tests decken positive und negative Faelle ab.
- Eine Uebung im Curriculum erklaert Kontext und Ziel.
- Regulatorische Quelle ist im Code dokumentiert.

### 8. DORA-Incident-Klassifizierung um Entscheidungsmatrix und Boundary-Tests erweitern

Labels: `module/m3`, `type/policy`, `difficulty/advanced`, `regulatory/dora`

Die bestehende DORA-Policy ist ein gutes Lehrbeispiel, sollte aber die Schwellenlogik und Grenzfaelle noch expliziter machen. Ziel ist eine nachvollziehbare Entscheidungsmatrix, die Lernenden zeigt, warum ein Incident als meldepflichtig klassifiziert wird oder nicht.

Done when:
- Schwellenwerte und Trigger sind zusaetzlich dokumentiert.
- Boundary-Tests fuer exakt-an-der-Schwelle und knapp-darunter sind vollstaendig.
- Die Policy-Ausgabe macht Klassifizierungsgruende klar nachvollziehbar.

## P2

### 9. Prompt-Eval-Set fuer den RegTech Tutor erstellen

Labels: `module/m3`, `type/test`, `difficulty/intermediate`

Die AI-Prompts sind ein wichtiger Teil des Academy-Ansatzes, aber ihre Qualitaet sollte reproduzierbar ueberpruefbar sein. Dieses Issue definiert ein kleines Eval-Set mit Beispielprompts, erwarteten Qualitaetskriterien und dokumentierten Testlaeufen auf mindestens zwei Modellen.

Done when:
- Es gibt ein Eval-Dokument mit Beispiel-Fragen.
- Eine Bewertungsrubrik ist definiert.
- Mindestens zwei Modelllaeufe sind dokumentiert.
- Typische Failure Cases sind beschrieben.

### 10. Dual-Track Onboarding als Einstiegsmodul ausarbeiten

Labels: `type/curriculum`, `difficulty/intermediate`, `help-wanted`

Das Repo erwaehnt bereits zwei Zielgruppen: Compliance-Personen mit Tech-Aufholbedarf und Tech-Personen mit Regulatorik-Aufholbedarf. Dieses Issue erstellt ein Onboarding-Modul, das beide Tracks strukturiert abholt und in Modul 3 hineinfuehrt.

Done when:
- Zwei Lernpfade sind beschrieben.
- Voraussetzungen und Lernziele je Track sind klar.
- Es gibt eine erste Wochenstruktur oder Reading List.
- Die Inhalte verlinken sauber auf bestehende Repo-Artefakte.

### 11. Policy-Traceability-Template fuer neue Regulatory Logic Beitraege anlegen

Labels: `type/policy`, `difficulty/beginner`, `help-wanted`

Ein zentrales Academy-Merkmal sollte sein, dass jede Policy nicht nur Code, sondern auch nachvollziehbare Herleitung enthaelt. Dieses Issue erstellt ein Template, das Gesetzesartikel, Interpretationsannahmen, Entscheidungslogik und Teststrategie standardisiert dokumentiert.

Done when:
- Es gibt ein Template fuer neue Policy-Beitraege.
- `CONTRIBUTING.md` verweist darauf.
- Mindestens ein bestehendes Beispiel nutzt das neue Format.
- Traceability ist fuer Reviewer leicht nachvollziehbar.

### 12. Modul 1 zur EU-Regulatorik als Curriculum-Skeleton veroeffentlichen

Labels: `module/m1`, `type/curriculum`, `difficulty/intermediate`, `help-wanted`

Um aus dem MVP eine sichtbare Academy-Roadmap zu machen, sollte neben Modul 3 mindestens ein weiteres Modul als strukturierter Skeleton vorliegen. Dieses Issue erstellt den inhaltlichen Rahmen fuer Modul 1 mit Themen, Lernzielen, Lektionen und ersten Platzhaltern fuer Uebungen.

Done when:
- `curriculum/module-01-...` existiert.
- Lernziele und Lektionstitel sind dokumentiert.
- Relevante Regulierungen wie DORA, MiCAR, AI Act und DSGVO sind sauber eingeordnet.
- Das Modul ist im Haupt-README verlinkt.
