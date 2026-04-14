# Lektion 1: Payment Rails for Compliance Engineers

## Warum diese Lektion wichtig ist

Wer `Transaction Monitoring`, `Transaction Screening` oder `Fraud Detection`
bauen oder bewerten will, muss die technische Realitaet des Zahlungsverkehrs
verstehen. Die Qualitaet einer Fincrime-Loesung haengt nicht nur von Regeln
oder Modellen ab, sondern davon, welche Daten auf welcher Schiene verfuegbar
sind, wie schnell entschieden werden muss und wie sauber Zahlungsereignisse
ueber ihren gesamten Lebenszyklus verknuepft werden.

Viele RegTech-Projekte scheitern nicht an fehlender Regulatorik-Expertise,
sondern an einem falschen Daten- und Architekturverstaendnis:

- `SWIFT` wird mit Settlement verwechselt
- `SEPA` wird als technische Plattform statt als Scheme verstanden
- `T2` und `TIPS` werden auf ein "ganz normales Core-Banking-Konto" reduziert
- `ISO 20022` wird auf Alt-Schemata heruntergemappt
- Screening, Monitoring und Fraud werden mit derselben Engine-Logik gedacht

Diese Lektion schafft das Fundament, damit wir in Modul 4 nicht nur ueber
Typologien reden, sondern ueber implementierbare Kontrollsysteme.

## Lernziele

Nach dieser Lektion kannst du:

1. `SWIFT`, `SEPA`, `T2` und `TIPS` fachlich und technisch unterscheiden
2. `Messaging`, `Scheme`, `Settlement` und `bankinterne Daten` sauber trennen
3. eine `pacs.008`-Nachricht in ein kanonisches internes Zahlungsmodell
   ueberfuehren
4. erklaeren, warum `Screening`, `Monitoring` und `Fraud Detection`
   unterschiedliche Architektur brauchen
5. die Guete einer Vendor-Loesung mit einer technischen Scorecard bewerten

## Die vier Ebenen des Zahlungsverkehrs

Bevor wir auf konkrete Rails schauen, muessen wir vier Ebenen auseinanderhalten:

### 1. Scheme

Das fachliche Regelwerk einer Zahlungsart.

Beispiele:
- `SEPA SCT`
- `SEPA SCT Inst`
- `SEPA SDD`

Ein Scheme sagt, welche Regeln, Fristen, Teilnehmerpflichten und Dateninhalte
gelten. Es ist nicht automatisch die technische Infrastruktur.

### 2. Messaging

Die Nachricht, die zwischen Parteien oder Systemen ausgetauscht wird.

Beispiele:
- `MT103`
- `pacs.008`
- `pain.001`
- `camt.054`

Messaging transportiert Zahlungsinformationen, aber ist nicht dasselbe wie
Settlement.

### 3. Settlement

Die tatsaechliche Verrechnung des Geldes.

Beispiele:
- Settlement in Korrespondenzbankketten
- Settlement in `T2`
- Settlement in `TIPS`

Eine Nachricht kann verarbeitet worden sein, ohne dass bereits finale
Settlement-Endgueltigkeit eingetreten ist.

### 4. Bankinterne Daten

Alles, was ausserhalb der Zahlungsnachricht fuer Fincrime relevant ist:

- Kundenstammdaten
- Kontobeziehungen
- UBO-Informationen
- Geraete- und Session-Daten
- Case-Management-Status
- historische Muster und Peer Groups

Eine starke Fincrime-Loesung verbindet alle vier Ebenen in einem einzigen
Analysemodell.

## Die wichtigsten Rails

## SWIFT / CBPR+

`SWIFT` ist ein sicheres globales Messaging-Netz. Es transportiert
Finanznachrichten, bewegt aber nicht selbst das Geld.

Fuer Fincrime ist `SWIFT` besonders relevant, weil:

- grenzueberschreitende Zahlungen oft mehrere Banken und Intermediaere
  einbeziehen
- jede beteiligte Bank eigene Kontrollen und Reparaturprozesse braucht
- alte `MT`-Nachrichten historisch viele unstrukturierte Freitextfelder hatten
- `CBPR+` mit `ISO 20022` heute deutlich strukturiertere Daten liefert

Wichtiger technischer Punkt:

- Fuer `CBPR+` endete die `MT`/`ISO 20022`-Koexistenz auf `SWIFT` am
  `22. November 2025`

Warum das fuer Fincrime wichtig ist:

- strukturierte Partei- und Adressfelder verbessern Screening
- eindeutige Identifikatoren wie `UETR` erleichtern Lifecycle-Verknuepfung
- Legacy-Systeme verlieren Qualitaet, wenn sie MX wieder auf MT-Denkmuster
  zurueckrechnen

## SEPA

`SEPA` ist ein europaeisches Regelwerk fuer Euro-Zahlungen. Es ist kein
Settlement-System, sondern ein Scheme-Framework.

Fuer diese Lektion sind drei Varianten relevant:

- `SCT` fuer klassische Credit Transfers
- `SCT Inst` fuer Instant Payments
- `SDD` fuer Direct Debits

Warum `SEPA` fuer Fincrime besonders spannend ist:

- `SEPA` arbeitet mit `ISO 20022`
- `SCT Inst` hat ein enges Zeitfenster fuer Entscheidungen
- die Qualitaet von Kontrollen haengt stark von strukturierten Feldern und
  sauberem Prozessdesign ab

Wichtige regulatorisch-technische Eckpunkte:

- fuer PSPs im Euro-Raum galt ab `9. Januar 2025` die Pflicht zum Empfangen von
  Euro-Instant-Payments
- ab `9. Oktober 2025` kamen Sende-Pflichten und `Verification of Payee` hinzu

Fuer RegTech bedeutet das:

- Screening- und Fraud-Loesungen muessen echtzeitfaehig sein
- Systemverhalten unter Last ist ein Kernteil der Produktguete
- Queueing, Timeouts und Fallbacks muessen explizit modelliert werden

## T2 und TIPS

`TARGET2` wurde im `Maerz 2023` durch `T2` ersetzt.

Die fuer diese Lektion wichtigsten Eurosystem-Dienste:

- `T2`: RTGS fuer Zahlungen in Zentralbankgeld
- `TIPS`: Instant-Payment-Settlement in Zentralbankgeld, 24/7/365

Warum das fuer Fincrime wichtig ist:

- hohe Werte und enge Liquiditaetslogik machen False Positives teuer
- nicht jedes bankinterne Monitoring-System sieht dieselben Settlement-Events
- manche Banken monitoren primär auf Payment-Hub- und Core-Banking-Daten,
  waehrend andere direkte Infrastrukturereignisse zusaetzlich nutzen

## ISO 20022 als Game Changer

`ISO 20022` ist kein einzelnes Nachrichtenformat, sondern ein
datenmodellgetriebener Standard fuer strukturierte Finanznachrichten.

Im Fincrime-Kontext ist der Mehrwert vor allem:

- strukturierte Parteifelder statt Freitextbloecke
- bessere Trennung von Namen, Konten, Agenten und Adressen
- klarere Nachrichtentypen und Referenzen
- hoehere Automatisierbarkeit fuer Regeln, Scores und Audit Trails

Typische Familien:

- `pain` fuer Customer-to-Bank
- `pacs` fuer Interbank Payments
- `camt` fuer Cash Management und Reports

### Beispiel: Warum Struktur wichtig ist

Flaches Legacy-Feld:

```text
MAX MUSTERMANN HAMBURGER STRASSE 12 BERLIN DE
```

Strukturierte Felder in `ISO 20022`:

```xml
<Nm>Max Mustermann</Nm>
<PstlAdr>
  <StrtNm>Hamburger Strasse</StrtNm>
  <BldgNb>12</BldgNb>
  <TwnNm>Berlin</TwnNm>
  <Ctry>DE</Ctry>
</PstlAdr>
```

Screening, Entity Resolution und Explainability werden sofort besser, wenn das
System diese Struktur nativ verarbeitet.

## Eine `pacs.008` lesen

Die Datei
`labs/lab-fincrime360-sandbox/sample_pacs008.xml`
enthaelt eine vereinfachte Beispielnachricht.

Wichtige Felder:

- `MsgId`: technische Nachrichtenidentitaet
- `InstrId`: Instruktions-ID
- `EndToEndId`: fachliche Business-Referenz
- `UETR`: global eindeutige Tracking-ID
- `Dbtr` / `Cdtr`: Debtor und Creditor
- `DbtrAcct` / `CdtrAcct`: Kontoreferenz
- `DbtrAgt` / `CdtrAgt`: PSP-/Bank-Kontext
- `IntrBkSttlmAmt`: Interbank Settlement Amount
- `Purp`: Purpose Code
- `RmtInf`: Remittance Information

### Warum diese Felder fuer Fincrime zaehlen

| Feldgruppe | Screening | Monitoring | Fraud |
|-----------|-----------|------------|-------|
| Partei- und Agentdaten | sehr hoch | hoch | mittel |
| Konto- und Gegenparteidaten | hoch | sehr hoch | sehr hoch |
| Betrag, Waehrung, Datum | mittel | sehr hoch | hoch |
| Purpose und Remittance | mittel | hoch | niedrig |
| IDs und Referenzen | hoch | hoch | hoch |
| Session-, Device-, Kanal-Daten | niedrig | mittel | sehr hoch |

## Drei Problemklassen, drei Architekturtypen

## 1. Transaction Screening

Ziel:
Vor oder waehrend der Ausfuehrung pruefen, ob Parteien, Agenten oder andere
Elemente einen relevanten Treffer gegen Sanktions- oder interne Sperrlisten
ausloesen.

Technische Anforderungen:

- sehr niedrige Latenz
- starke Match-Logik fuer Namen und Aliase
- Rollenbewusstsein bei Parteien
- gute Erklaerbarkeit fuer Analysten und Audit
- definierte Reparatur- und Override-Prozesse

Typischer Fehler:
Eine Engine macht nur einfachen String-Vergleich auf einem zusammengebauten
Namensblock und ignoriert Rollen, Sprache, Transliterationen und Agentketten.

## 2. Transaction Monitoring

Ziel:
Nach Mustern, Typologien und Verhaltensaenderungen ueber Zeit suchen.

Technische Anforderungen:

- Historisierung ueber 30, 90 oder 360 Tage
- Szenario- und Schwellenlogik
- Kundensegmentierung und Peer-Groups
- Beziehungsdaten und Netzwerkperspektive
- gutes Alert-zu-Case-Design

Typischer Fehler:
Ein Monitoring-System bewertet nur Einzeltransaktionen, statt Kundenverhalten,
Beziehungsnetze und Ketten von Events zu betrachten.

## 3. Fraud Detection

Ziel:
Betrugsrisiko in Echtzeit oder near-real-time bewerten.

Technische Anforderungen:

- Daten jenseits der Zahlungsnachricht
- Device, Session, IP, Geo, Kanal
- Beneficiary Risk und Account-Age
- Schritt-fuer-Schritt-Entscheidungen wie blocken, freigeben, step-up

Typischer Fehler:
Ein Produkt nennt sich Fraud-Loesung, sieht aber nur Payment-Nachrichten ohne
Channel-Daten und kann deshalb nur einen kleinen Teil des wirklichen Risikos
bewerten.

## Kanonisches internes Zahlungsmodell

Fincrime-Plattformen sollten eingehende Nachrichten nicht direkt in
fachspezifische Silos schieben, sondern in ein kanonisches internes Modell
ueberfuehren.

Die zugehoerige Beispieldatei findest du unter:

`labs/lab-fincrime360-sandbox/payment_event.schema.json`

Das Zielmodell enthaelt mindestens:

- `rail`
- `message_family`
- `message_type`
- `payment_ids`
- `parties`
- `agents`
- `amounts`
- `timing`
- `status`
- `context`
- `risk_hints`

Dieses Modell ist die Bruecke zwischen Zahlungsverkehr, Fincrime-Regeln,
Case-Management und spaeterer Auditierbarkeit.

## Vendor-Evaluierung: Was du immer fragen musst

### Daten und Standards

- Welche Rails und Nachrichtentypen werden nativ unterstuetzt?
- Werden `ISO 20022`-Felder vollstaendig erhalten?
- Gibt es Datenverlust beim Mapping in ein internes Modell?

### Echtzeit und Betrieb

- Welche `P95`- und `P99`-Latenzen schafft das System unter Last?
- Wie verhaelt sich das Produkt bei Peak-Volumen?
- Gibt es Replay, Idempotenz, Queueing und Fallback-Mechanismen?

### Detection-Qualitaet

- Wie wird Match-Qualitaet gemessen?
- Welche segmentierten Kennzahlen gibt es fuer False Positives?
- Wie gut lassen sich Alert-zu-Case und Case-zu-SAR bzw. Fraud-Loss-Prevention
  auswerten?

### Governance

- Sind Regeln, Listenstaende und Modelle versioniert?
- Kann man nachvollziehen, welche Logik zu welchem Zeitpunkt angewandt wurde?
- Sind manuelle Overrides und Analystenentscheidungen revisionssicher?

## Praxis-Lab

Zu dieser Lektion gehoeren drei Begleitdateien:

- `labs/lab-fincrime360-sandbox/sample_pacs008.xml`
- `labs/lab-fincrime360-sandbox/payment_event.schema.json`
- `labs/lab-fincrime360-sandbox/parse_pacs008.py`

Beispiel:

```bash
cd labs/lab-fincrime360-sandbox
python3 parse_pacs008.py sample_pacs008.xml
```

Das Skript erzeugt ein kanonisches JSON-Objekt, das sich fuer Screening,
Monitoring und Fraud-Pipelines weiterverarbeiten laesst.

## Uebung

1. Fuehre das Parsing-Skript fuer die Beispielnachricht aus.
2. Identifiziere drei Felder, die fuer Screening kritisch sind.
3. Identifiziere drei Felder, die fuer Monitoring kritisch sind.
4. Beschreibe zwei zusaetzliche Fraud-Datenpunkte, die in der Nachricht fehlen.
5. Bewerte, ob ein Vendor mit reinem MT-Fokus fuer `SCT Inst` noch zukunftsfest
   waere.

## Merksatz

Eine gute Fincrime-Loesung versteht nie nur die Nachricht. Sie versteht
`Scheme`, `Settlement`, `Lifecycle`, `Bankkontext` und `Operations` als
zusammenhaengendes System.

## Weiterfuehrende Quellen

- [SWIFT: What is Swift?](https://www.swift.com/about-us/who-we-are/what-swift)
- [SWIFT: ISO 20022 and CBPR+ roadmap](https://www.swift.com/standards/iso-20022/iso-20022-programme/cbpr-roadmap)
- [EPC: About SEPA](https://www.europeanpaymentscouncil.eu/about-sepa)
- [EPC: SCT rulebook 2025](https://www.europeanpaymentscouncil.eu/document-library/rulebooks/2025-sepa-credit-transfer-rulebook-version-10)
- [ECB: T2](https://www.ecb.europa.eu/paym/target/t2/html/index.en.html)
- [ECB: TIPS](https://www.ecb.europa.eu/paym/target/tips/html/index.en.html)
- [ECB: Instant payments regulation overview](https://www.ecb.europa.eu/paym/retail/instant_payments/html/instant_payments_regulation.en.html)
