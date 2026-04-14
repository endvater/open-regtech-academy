# Lektion 6: Network Analysis and Graph Thinking

## Fokus

Viele Fincrime-Muster liegen nicht in Einzelzahlungen, sondern in Beziehungen.
Diese Lektion fuehrt in graphisches Denken fuer Gegenparteien, UBOs, Konten und
verwandte Signale ein.

## Kernfragen

- Welche Knoten und Kanten liefern in Fincrime-Faellen den meisten Erkenntniswert?
- Wann reicht eine relationale Sicht, wann braucht es Netzwerklogik?
- Wie verhindert man, dass Graphen zu reiner Visualisierung ohne operativen Wert werden?

## Warum das wichtig ist

Smurfing, Ringstrukturen, gemeinsame wirtschaftlich Berechtigte oder geteilte
Kontaktpunkte werden oft erst sichtbar, wenn Beziehungen ueber mehrere Hops
mitgedacht werden.

## Typische Knoten

- Personen
- Organisationen
- Konten
- Wallets
- Devices
- Alerts und Cases

## Typische Kanten

- `owns`
- `controls`
- `transacts_with`
- `shares_address`
- `uses_device`
- `mentioned_in`

## Gute Netzwerkfragen

- Welche Gegenparteien teilen denselben UBO?
- Welche Konten haengen ueber gemeinsame Merkmale an bereits bekannten Faellen?
- Wie weit reicht die Nachbarschaft, bevor nur noch Rauschen entsteht?

## Erwartetes Artefakt

Teilnehmende definieren:

- drei Knotentypen
- vier Kanten
- zwei operative Fragen, die mit Netzwerklogik besser beantwortbar sind
