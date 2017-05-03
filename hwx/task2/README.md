# Homework hw{n} task2

<!-- TOC -->

- [1. Homework hw{n} task2](#1-homework-hw5)

<!-- /TOC -->

## 1.1. Ziel

Ziel dieser Aufgabe ist es, einen kleinen TCP-Server zu implementieren, der das in task1 implementierte Protokoll annimmt. Der Server muss auch die angenommenen Daten speichern.

## 2.1 Aufgabe

Implementieren Sie den Webserver, in Sie [TCPListener][tcplistener] verwenden.

Sorgen Sie dafür, dass der Server Nachrichten zwischen Anfragen speichert und in der Reihenfolge zurück gibt, in der Sie gesendet wurden. ([FIFO][fifo])

Nutzen Sie die in task1 geschriebene Crate zum parsen der Kommandos.

Der Server darf beim Herunterfahren alle Daten verlieren.

## 3.1 Tipps

* Zum Speichern eignet sich die [VecDeque][vecdeque], mit der sich das oben genannte FIFO-Verhalten gut abbilden lässt.
* Früher an später denken: gut Aufteilung von Aufgaben in Funktionen macht die folgenden Aufgaben einfacher.
* Zum Testen eignet sich netcat:

```
echo "PUBLISH Meine Nachricht!" | nc 127.0.0.1 7878
echo "RETRIEVE" | nc 127.0.0.1 7878
```

[tcplistener]: 
[fifo]: 
[vecdeque]: 