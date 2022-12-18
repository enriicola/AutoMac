#!/usr/bin/env bash

# TODO testa my-automated-mac-setup copiando ed incollando un pezzo alla volta

# https://youtube.com/watch?v=TlT7xjM01k8&feature=share

# file="/System/Library/Desktop Pictures/Catalina.madesktop"
# defaults write com.apple.desktop Background '{default = {ImageFilePath = "/System/Library/Desktop Pictures/Catalina.madesktop";};}'

# funziona, ma non è dynamic...
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/enrico/Downloads/Catalina.heic"'

# sudo cp /System/Library/Desktop\ Pictures/Catalina.madesktop /Users/enrico/Downloads
# sudo osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/enrico/Downloads/Catalina.madesktop"'

# L'azione “Osserva le mie azioni” ha rilevato un errore: “Per potere usare Osservami, questa applicazione deve ottenere l'autorizzazione a controllare questo computer mediante le funzioni di accessibilità. Per concederla, apri le preferenze Sicurezza e Privacy di Preferenze di Sistema.”
# sudo chmod -R 777 set-catalina-desktop.app
# sudo open set-catalina-desktop.app