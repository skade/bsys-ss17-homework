# Homework hw{n} task1

<!-- TOC -->

- [1. Homework hw{n} task1](#1-homework-hw5)

<!-- /TOC -->

## 1.1. Ziel

Ziel dieser Aufgabe ist es, einen Parser für ein simples Protokoll zu implementieren, das in den Folgeaufgaben verwendet wird.

Das Protokoll beschreibt das Veröffentlichen und Abrufen von Daten aus einem Netzwerkdienst.

## 1.2. Protokollbeschreibung

Das Protokoll kennt 2 Kommandos: Veröffentlichung und Abrufen. Weitere Kommandos sind nicht zugelassen. Das Protokoll arbeitet zeilenweise, d.h. ein newline ('\n') beendet das Kommando.

Die Kommandos folgen diesem Format:

```
<AKTION> [DATEN]\n
```

Werden keine Daten erwartet, folgt das newline-Zeichen direkt auf die Aktion.

Der Zeilenumbruch ist _nicht_ optional.

### 1.2.1 PUBLISH

Das PUBLISH-Kommando veröffentlicht eine Nachricht. Die Daten dürfen selbst kein newline enthalten. Es ist erlaubt, eine _leere_ Nachricht zu veröffentlichen.

Beispiele:

```
PUBLISH Hallo, hier ist eine kleine Nachricht!\n
PUBLISH \n
```

### 1.2.2 RETRIEVE

Das RETRIEVE-Kommando entnimmt eine Nachricht. Es erhält keine Daten.

Beispiel:

```
RETRIEVE\n
```

## 2.1 Aufgabe

Implementieren Sie einen Parser für dieses Protokoll. Der Parser sollte so simpel wie möglich gehalten sein.

Es ist insbesondere erlaubt, die Eingabe als einzelne Zeile zu erwarten. Die Trennung der Eingabe in einzelne Zeilen ist dem aufrufenden Code überlassen.

Enthält der Input mehrere newlines, darf der Rest ohne Fehler verworfen weden.

Folgendes öffentliche Interface ist vorgegeben:

```rust
pub fn parse(message: &str) -> ... {
   //...
}
```

### 2.2.1 Crate

Implementieren Sie den Parser als eigene Crate, die Sie dann in den weiteren Aufgaben einbinden können, statt den Code zu kopieren. Sie können diese Crate später entweder auf Github veröffentlichen oder über Pfade einbinden.

### 2.2.2 Testabdeckung

Achten Sie auf ausreichende Testabdeckung, um illegale Fälle abzudecken. Achten Sie vor allem darauf, dass auf keine Daten verloren gehen!

### 2.2.3 Fehlerbehandlung und Rückgabetyp

Finden Sie einen geeigneten Rückgabetyp, der das gefundene Kommando, als auch eventuelle Fehler kommuniziert. Kombinieren Sie dies mit einer geeigneten Darstellung des Kommandos.

Allokieren Sie die gefunden Daten als `String`.

## 3.1 Hilfen

Die Dokumentation von [`str`][str] enthält viele wichtige Hinweise.

## 4.1 Optional

Wenn Sie möchten, können Sie einmal versuchen, die Daten nicht als `String` zu allokieren. Stattdessen geben Sie `&str` zurück. Sie sollten dazu aber ein getrenntes Projekt oder einen Branch verwenden, da diese Strategie für die folgenden Aufgaben wenig Sinn macht.

[str]: https://doc.rust-lang.org/std/primitive.str.html