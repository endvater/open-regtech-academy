# Dual-Track Onboarding

> **Woche 0** · 1 Woche · ca. 6-8h
> Einstieg fuer zwei Zielgruppen mit unterschiedlichen Vorkenntnissen

## Ziel

Die Academy richtet sich an zwei typische Gruppen:

1. **Compliance -> Tech**  
   Menschen mit regulatorischem und fachlichem Wissen, die technische
   Grundmuster fuer APIs, Datenmodelle, OPA und Labs aufbauen wollen
2. **Tech -> Compliance**  
   Engineers, Data- oder Product-Leute, die regulatorische Anforderungen
   sauber lesen, abgrenzen und in Controls uebersetzen wollen

Dieses Onboarding bringt beide Tracks auf einen gemeinsamen Startpunkt fuer
`Modul 1`, `Modul 3` und spaeter `Modul 4`.

## Lernziele

Nach dem Onboarding koennen Teilnehmende:

1. die eigene Startposition im Curriculum realistisch einschaetzen
2. den Unterschied zwischen `Gesetz`, `Interpretation`, `Control` und `Code`
   benennen
3. die wichtigsten Repo-Bereiche und Lernartefakte finden
4. einen ersten lokalen Lab- oder Lesepfad ohne Huerden starten

## Track A: Compliance -> Tech

### Voraussetzungen

- Grundverstaendnis fuer Compliance, Risiko oder Aufsicht
- keine vertieften Python-/Git-/OPA-Kenntnisse erforderlich

### Fokus

- GitHub-basierter Lernworkflow
- Datenmodelle lesen
- einfache JSON-Inputs verstehen
- OPA/Policy-Logik als Denkmodell
- Labs ausfuehren statt nur Beschreibungen lesen

### Empfohlene Reihenfolge

1. [Modul 1: EU Regulatory Landscape](../module-01-eu-regulatory-landscape/README.md)
2. [Modul 3: Einfuehrung in Compliance-as-Code](../module-03-compliance-as-code/lessons/01-introduction.md)
3. [Modul 3 Runbook](../../labs/lab-opa-sandbox/MODULE_03_RUNBOOK.md)
4. [Modul 4: Payment Rails for Compliance Engineers](../module-04-fincrime-360/lessons/01-payment-rails-for-compliance-engineers.md)

## Track B: Tech -> Compliance

### Voraussetzungen

- Grundkenntnisse in Python, SQL oder APIs
- Interesse an Regulatorik, aber keine Vorbildung noetig

### Fokus

- regulatorische Quellen lesen
- Artikel und Pflichten sauber zitieren
- Lehrbeispiele von produktiver Praxis abgrenzen
- Compliance-Logik in Daten- und Kontrollsprache uebersetzen

### Empfohlene Reihenfolge

1. [Modul 1: EU Regulatory Landscape](../module-01-eu-regulatory-landscape/README.md)
2. [RegTech Tutor Prompt](../../ai-prompts/regtech-tutor-system-prompt.md)
3. [Modul 3: Der Uebersetzungsprozess](../module-03-compliance-as-code/lessons/03-translation-process.md)
4. [Modul 4: Missing Perspectives & Deep Dives](../module-04-fincrime-360/lessons/02-missing-perspectives-and-deep-dives.md)

## Wochenstruktur

| Tag | Compliance -> Tech | Tech -> Compliance |
|-----|--------------------|-------------------|
| Mo | Repo-Orientierung und Modulueberblick | Repo-Orientierung und Regulatorik-Landkarte |
| Di | JSON-, Input- und Policy-Grundlagen | Quellenlesen und Artikellogik |
| Mi | Erster `opa eval`-Durchlauf | Erster Policy-Review |
| Do | Lab-Runbook und Beispielinputs | Prompt- und Interpretationsuebung |
| Fr | Reflexion und Track-Wechselblick | Reflexion und Track-Wechselblick |

## Reading List

- [README](../../README.md)
- [Modul 1 Skeleton](../module-01-eu-regulatory-landscape/README.md)
- [Modul 3 README](../module-03-compliance-as-code/README.md)
- [Modul 4 README](../module-04-fincrime-360/README.md)
- [Contributing Guide](../../CONTRIBUTING.md)

## Erfolgskriterium

Das Onboarding ist erfolgreich, wenn Teilnehmende:

- den fuer sie passenden Track benennen koennen
- ein erstes Repo-Artefakt lokal geoeffnet oder ausgefuehrt haben
- verstehen, warum die Academy in Modulen und Issues statt in PDFs denkt
