#!/usr/bin/env bash

# This file needs to be run from the git root directory!

# Exit script on the first error
set -o errexit -o nounset

current_hw=$(ls -dv hw* | tail -n1)




for taskdir in $current_hw/task*; do
    echo ""
    echo "=== Führe Lösung von Aufgabe in $taskdir aus"
    manifest="$taskdir/Cargo.toml"
    if [ -e "$manifest" ]; then
        echo "=== Cargo-Manifest gefunden in '$manifest' -> Cargo-Modus"
        cargo run --manifest-path "$manifest"
    elif [ $(ls $taskdir/*.rs | wc -l) -ne 0 ]; then
        echo "=== Sourcedatei(en) gefunden -> rustc-Modus"
        for srcfile in $taskdir/*.rs; do
            echo "=== Kompiliere '$srcfile'..."
            rustc "$srcfile"
        done
    else
        echo ""
        echo "!!! Falsch konfigurierter Aufgabenordner oder ungelöste Aufgabe"
        echo "!!! Bitte .rs-Dateien in '$taskdir' ablegen"
        echo "!!! Oder ein Cargo-Projekt mit 'cargo init' darin erzeugen"
        echo "!!! Alternativ den Ordner löschen"
        exit 1
    fi


    echo ""
    echo "=== Suche bats File in $taskdir"
    for batsfile in $taskdir/tests/*.bats; do
       if [ -e "$batsfile" ]; then
           echo "=== bats File gefunden, teste output"
           bats "$batsfile"
       else
            echo "=== keine output Tests via bats ausgeführt"
      fi
    done
done
