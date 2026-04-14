# Lektion 2: Missing Perspectives & Deep Dives

## Warum diese Lektion existiert

Ein `Fincrime 360`-Ansatz ist nur dann wirklich ganzheitlich, wenn er nicht bei
den klassischen Bloecken `KYC`, `AML`, `Fraud` und `Sanktionen` stehenbleibt.

Die groessten Architektur- und Betriebsprobleme in echten Programmen entstehen
oft an den Raendern:

- wenn Datenschutz und Ermittlungslogik kollidieren
- wenn On-Chain-Signale nicht mit Fiat-Zahlungen verbunden werden
- wenn externe Informationen fehlen
- wenn interne Mitarbeiterhandlungen gar nicht im Scope sind
- wenn Alerts zwar entstehen, aber nicht in gute Meldungen und belastbare
  Narrative uebersetzt werden

Diese Lektion fuehrt die Perspektiven ein, die in vielen Fincrime-Stacks
unterbelichtet sind, aber fuer RegTech Engineers strategisch immer wichtiger
werden.

## Lernziele

Nach dieser Lektion kannst du:

1. erklaeren, warum `Privacy`, `Web3`, `OSINT`, `Internal Fraud` und
   `Regulatory Reporting` Teil eines echten `Fincrime 360`-Ansatzes sind
2. die technische Kernfrage jedes Bereichs benennen
3. fuer jeden Bereich einen sinnvollen Deep-Dive-Use-Case formulieren
4. erkennen, welche Teile eher in `M4`, `M5` oder `M6` vertieft werden sollten

## 1. Data Privacy vs. Fincrime

### Das Problem

Fincrime-Teams wollen moeglichst viele Signale in einem gemeinsamen Analysebild
sehen. Datenschutzregime wie die `DSGVO` und bankinterne Vertraulichkeitsregeln
setzen dem klare Grenzen.

Die technische Spannung lautet:

> Wie erkennen wir Muster ueber Datensilos hinweg, ohne Rohdaten unkontrolliert
> zusammenzufuehren?

### Warum das fuer Engineers wichtig ist

Hier reicht juristisches Wissen allein nicht. Man braucht Architektur- und
Implementierungsentscheidungen, die sowohl Detection als auch Datenschutz
beruecksichtigen.

### Relevante Themen

- Datenminimierung und Zweckbindung
- Pseudonymisierung und kontrollierte Re-Identifikation
- Privacy Enhancing Technologies
- Federated Learning
- verschluesseltes Rechnen
- Auditierbarkeit von Datenzugriffen

### Beispiel-Deep-Dive

Ein Konsortium moechte Mule-Account-Muster bankuebergreifend erkennen, darf
aber keine vollstaendigen Kundendaten in einen gemeinsamen Data Lake kopieren.

Frage:
Wie entwirfst du eine Architektur, die nur die minimal noetigen Signale teilt?

## 2. Web3 und On-Chain Fincrime

### Das Problem

Ein erheblicher Teil moderner Finanzkriminalitaet laeuft nicht mehr nur ueber
klassische Bankrails. Wallets, Bridges, Mixer, DEXs und Off-Ramps schaffen
zusaetzliche Komplexitaet.

### Warum das fuer Engineers wichtig ist

RegTech-Systeme muessen On-Chain- und Off-Chain-Daten zusammenbringen. Das
heisst:

- Wallets clustern
- Exposition gegenueber Hochrisiko-Diensten erkennen
- Ein- und Auszahlungen mit traditionellen Kundenprofilen verbinden

### Relevante Themen

- Wallet-Entity-Resolution
- Krypto-Off-Ramps
- Mixer und Layering
- Travel-Rule-Kontext
- Bruecken zwischen Wallets und Bankkonten

### Beispiel-Deep-Dive

Ein Kunde erhaelt regelmaessig SEPA-Gutschriften von einer regulierten
Kryptoboerse. On-Chain zeigt das vorgeschaltete Wallet jedoch Kontakt zu einem
Mixer.

Frage:
Wie wird dieses externe On-Chain-Signal in Monitoring und Fallbearbeitung
ueberfuehrt?

## 3. OSINT und Adverse Media

### Das Problem

Transaktionsdaten allein liefern selten das volle Lagebild. Oft fehlen
Kontextsignale aus oeffentlichen Quellen.

### Warum das fuer Engineers wichtig ist

Externe Daten sind meist unstrukturiert, verrauscht und qualitaetskritisch.
Trotzdem koennen sie fuer `KYC`, `perpetual KYC`, `Adverse Media` und
Investigation entscheidend sein.

### Relevante Themen

- Transparenzregister
- UBO-Abgleich
- adverse media
- Quellenranking
- NLP fuer Ereignis- und Entitaetenextraktion
- Record Linkage und Entity Resolution

### Beispiel-Deep-Dive

Ein Kunde wirkt intern unauffaellig. Extern taucht jedoch eine Reihe negativer
Berichte zu Sanktionsumgehung und Korruptionsvorwuerfen im Umfeld der
wirtschaftlich Berechtigten auf.

Frage:
Wie werden diese Signale aufgenommen, bewertet und dem Risikoprofil
zugeschlagen, ohne dass das System in News-Rauschen ertrinkt?

## 4. Internal Fraud und ABC

### Das Problem

Viele Kontrollarchitekturen betrachten nur externe Taeter. Ein erheblicher Teil
kritischer Risiken sitzt jedoch innerhalb der Organisation oder in ihrer
Kontrollumgebung.

### Warum das fuer Engineers wichtig ist

Ein Fincrime-Stack sollte nicht nur Kunden und Zahlungen, sondern auch
Mitarbeiterhandlungen, Rechte und Prozessumgehungen beobachten koennen.

### Relevante Themen

- Segregation of Duties
- Maker-Checker-Umgehungen
- privilegierte Zugriffe
- Zugriff auf sensible Kunden oder PEPs
- Anti-Bribery-and-Corruption-Indikatoren
- Log- und Berechtigungsanalyse

### Beispiel-Deep-Dive

Ein Mitarbeiter greift ungewoehnlich oft auf dieselbe Gruppe von
Hochrisikokunden zu und genehmigt kurz darauf auffaellig viele Ausnahmen.

Frage:
Welche Datenquellen, Regeln und Governance-Kontrollen brauchst du, um dieses
Muster sauber zu erkennen?

## 5. Regulatory Reporting

### Das Problem

Ein Alert hat keinen regulatorischen Wert, wenn daraus kein belastbarer,
vollstaendiger und fristgerechter Bericht entsteht.

### Warum das fuer Engineers wichtig ist

Die "letzte Meile" von Daten zu Meldung wird oft unterschaetzt. Genau dort
entsteht aber fuer FIU, Aufsicht und Ermittler der eigentliche Nutzen.

### Relevante Themen

- SAR/STR-Feldmapping
- Narrative aus strukturierten Falldaten
- Datenvollstaendigkeit
- Human-in-the-loop-Freigabe
- LLM-Assistenz fuer Entwuerfe
- Nachvollziehbarkeit und Versionierung

### Beispiel-Deep-Dive

Ein Graph-basiertes Monitoring identifiziert ein verdichtetes Netzwerk mit
Smurfing- und Mule-Account-Signalen.

Frage:
Wie wird aus Knoten, Kanten, Alerts und Kommentaren ein Behoerdenbericht, den
ein Analyst freigeben kann?

## Zuordnung zu den Academy-Modulen

| Deep Dive | Hauptmodul | Warum |
|-----------|------------|-------|
| Data Privacy vs. Fincrime | `M5` | Governance, Datenzugriff, PETs, Erklaerbarkeit |
| Web3 und On-Chain Fincrime | `M4` | Typologien, Detection, Off-Ramp-Integration |
| OSINT und Adverse Media | `M4` / `M5` | KYC, Risiko, Datenqualitaet, Governance |
| Internal Fraud und ABC | `M5` / `M6` | Kontrollen, Cyber- und Prozessschnittstellen |
| Regulatory Reporting | `M6` | Reporting, Narrative, Capstone, Abschlussfaehigkeit |

## Die sechs Perspektiven als Pruefrahmen

Bei jedem Deep Dive sollte mindestens diese Checkliste verwendet werden:

1. **Regulatorisch**  
   Welche Pflichten und Grenzen bestimmen den Use Case?
2. **Technisch**  
   Welche Datenquellen, Schnittstellen und Modelle sind noetig?
3. **Law Enforcement**  
   Was waere fuer FIU oder Ermittler wirklich nuetzlich?
4. **Wirtschaftlich**  
   Was kostet ein Fehlalarm oder ein verpasster Treffer?
5. **Forensisch**  
   Wie wird aus einem Signal eine belastbare Geschichte?
6. **Governance**  
   Wie bleiben Regeln, Modelle und Entscheidungen kontrollierbar?

## Praxisauftrag

Waehle einen der fuenf Deep-Dive-Bereiche und beantworte in maximal einer
Seite:

1. Was ist die zentrale technische Frage?
2. Welche Datenquellen brauchst du?
3. Welche Kontrolllogik waere sinnvoll?
4. Welcher Academy-Lab-Typ passt am besten: `Python`, `Graph`, `SQL`, `Rego`
   oder `LLM-Assisted Reporting`?
5. In welchem Modul sollte das Thema primaer verankert werden?

## Merksatz

Ein `Fincrime 360`-Programm scheitert selten daran, dass es zu wenig AML-Regeln
kennt. Es scheitert meist daran, dass es die angrenzenden Realitaeten zu spaet
integriert: Datenschutz, Krypto, externe Signale, interne Taeter und die
letzte Meile zum Reporting.
