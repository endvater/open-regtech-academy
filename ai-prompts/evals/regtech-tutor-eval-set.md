# Prompt Eval Set: RegTech Tutor

## Ziel

Dieses Dokument definiert ein kleines, reproduzierbares Eval-Set fuer den
allgemeinen RegTech Tutor. Es soll nicht mathematische Benchmark-Praezision
simulieren, sondern Tutor-Qualitaet im Academy-Kontext sichtbar machen.

## Bewertungsrubrik

Jede Antwort wird auf einer Skala von `1-5` bewertet:

1. **Regulatorische Genauigkeit**  
   Werden Normen korrekt eingeordnet?
2. **Artikel- und Quellennaehe**  
   Werden konkrete Artikel oder Fundstellen genannt?
3. **Law vs. Practice**  
   Trennt die Antwort sauber zwischen Normtext und Praxis?
4. **Didaktischer Wert**  
   Hilft die Antwort beim Lernen statt nur beim Behaupten?
5. **Technische Anschlussfaehigkeit**  
   Wird klar, wie daraus spaeter Code, Datenmodell oder Kontrolllogik werden kann?
6. **Vorsicht statt Halluzination**  
   Werden Unsicherheiten und Grenzen markiert?

## Beispiel-Fragen

1. `Erklaere DORA Art. 18 in einfachen Worten und nenne die wichtigsten technischen Datenpunkte fuer ein Incident-System.`
2. `Welche Unterschiede gibt es zwischen DSGVO Art. 25 und Art. 32 aus Engineering-Sicht?`
3. `Ist eine SEPA-Instant-Payment-Fraud-Engine eher ein AML- oder ein Fraud-Thema? Begruende.`
4. `Wie wuerdest du eine Rego-Policy fuer Privacy by Default vorbereiten, ohne sofort Code zu schreiben?`
5. `Welche Risiken entstehen, wenn ein LLM automatisch eine SAR-Narrative vorformuliert?`
6. `Wie unterscheidet sich MiCAR-Regulierung von klassischen DORA-Anforderungen fuer ein Tech-Team?`

## Dokumentierte Testlaeufe

### Lauf A

- **Datum:** 2026-04-14
- **Modell:** `GPT-5.4`
- **Promptbasis:** `ai-prompts/regtech-tutor-system-prompt.md`
- **Kurzfazit:** sehr gute Struktur, gute Vorsichtshinweise, gelegentlich zu breit

| Kriterium | Score | Beobachtung |
|-----------|------:|-------------|
| Regulatorische Genauigkeit | 5 | solide Einordnung, klare Verweise |
| Artikel- und Quellennaehe | 4 | meist konkret, vereinzelt noch allgemeiner als ideal |
| Law vs. Practice | 5 | trennt sauber |
| Didaktischer Wert | 5 | erklaert Begriffe und Hintergruende |
| Technische Anschlussfaehigkeit | 4 | gute Bruecken, gelegentlich noch high-level |
| Vorsicht statt Halluzination | 5 | markiert Unsicherheiten sichtbar |

### Lauf B

- **Datum:** 2026-04-14
- **Modell:** `GPT-5.4-mini`
- **Promptbasis:** `ai-prompts/regtech-tutor-system-prompt.md`
- **Kurzfazit:** schneller und kompakter, aber etwas weniger differenziert

| Kriterium | Score | Beobachtung |
|-----------|------:|-------------|
| Regulatorische Genauigkeit | 4 | solide, aber knapper |
| Artikel- und Quellennaehe | 3 | nennt nicht immer konkrete Artikel |
| Law vs. Practice | 4 | meist sauber getrennt |
| Didaktischer Wert | 4 | gut fuer schnelle Orientierung |
| Technische Anschlussfaehigkeit | 4 | brauchbar fuer erste Umsetzungsschritte |
| Vorsicht statt Halluzination | 4 | ordentlich, aber weniger explizit |

## Typische Failure Cases

- **Zu allgemeine Antworten**  
  Der Tutor beschreibt Regulierungen, ohne konkrete Artikel oder Datenpunkte zu nennen.
- **Overconfidence**  
  Praktische Auslegungen werden als zwingender Normtext dargestellt.
- **Code ohne juristische Grenze**  
  Es wird sofort Implementierungslogik geliefert, ohne auf Lehrbeispielcharakter
  und Auslegungsspielraum hinzuweisen.
- **Schwache Anschlussfaehigkeit**  
  Antworten bleiben auf Essay-Niveau und helfen nicht beim Uebergang zu Daten,
  Policies oder Labs.

## Empfohlener Eval-Rhythmus

- bei groesseren Prompt-Aenderungen
- vor jeder neuen Kohorte
- vor Aufnahme neuer Modul-Tutor-Prompts
