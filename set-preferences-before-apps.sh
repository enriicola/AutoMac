#!/usr/bin/env bash
##!/bin/sh

# Close any open System Preferences panes, to prevent them from overriding settings that are about to be changed
osascript -e 'tell application "System Preferences" to quit'

sudo sh set-profile-pic.sh

echo "\033[0;34m Enabling “Remove items from the Trash after 30 days” 🗑 \033[0m"
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# TODO preferenzesys->angoli attivi (basso-sx=nota rapida, basso-dx=mostra desktop)
# TODO preferenzesys->dock e barra dei menù->ingrandimento on, dimensioni max, ingrandimento 50%, nascondi dock on(cmd+option+d), nascondi recenti
# TODO preferenzesys->dock->centro controllo->schermo->mostra barra dei menu off
# TODO preferenzesys->dock->centro controllo->suono->mostra barra dei menu off
# TODO preferenzesys->dock->centro controllo->riproduzione->mostra barra dei menu off
# TODO preferenzesys->dock->altrimoduli->accessibilità->* off
# TODO preferenzesys->dock->altrimoduli->batteria->barra menù=on, centrocontrollo=off, percentuale=on
# TODO preferenzesys->dock->altrimoduli->spotlight->off
# TODO preferenzesys->dock->altrimoduli->siri->off
# TODO preferenzesys->accountinternet->imposta icloud (on: foto, portachiavi, calendari, promemoria, note, safari, trova il mio mac, siri)
# TODO preferenzesys->accountinternet->imposta unige.it (on: mail)
# TODO preferenzesys->accountinternet->imposta outlook (on: mail, contatti)
# TODO preferenzesys->estensioni->(on: dropover, onedrive, telegram)
# TODO preferenzesys->estensioni->(on: dropover, onedrive, telegram)
# TODO preferenzesys->tastiera->(on: regola luminosità, disattiva retroilluminazione dopo 5 minuti)
# TODO preferenzesys->tastiera->abbreviazioni->azioni rapide->aggiungi workflow onedrive trash (cmd+ì)
# TODO preferenzesys->trackpad->velocità=max, clic silenzioso=on
# TODO preferenzesys->batteria->disattiva schermo=mai, disattiva dishi=on, oscura schermo=off, caricamento ottimizzato=off
# TODO preferenzesys->batteria->alimentatore->disattiva schermo=mai, impedisci etc=on, attiva per accesso rete=on
# TODO ordina preferenze da A a Z

# TODO mail preferences->togli caselle smart + aggiungi ai preferiti cestino(tutte), spam(tutte), archivio + ordinale 

# TODO remove all widget; aggiungi meteo(grande) e sotto eventiCalendario(grande)
# TODO apri preferenze finder e modificale + modifica barra strumenti Finder + modifica barra laterale
# TODO apri preferenze safari e modificale + modifica barra strumenti safari


# TODO apri impostazioni sfondo scrivania
# TODO imposta sfondo dinamico catalina
# TODO imposta sfondo secondario dinamico big sur
# TODO calibra colori schermo secondario
# TODO cambia foto profilo mac :)
# TODO disattiva salvaschermo

#osascript # TODO impostare sfondo catalina dinamico (+ sfondo secondario big sur dinamico)
#tell application "Finder"
#set desktop picture to POSIX file "/Library/Desktop Pictures/Solid Colors/Catalina.madesktop"
#end tell

# TODO in alternativa prova a registrare le tue azioni tramite automator e salvarle in un app da eseguire... 


echo "\033[0;34m Automatically quit printer app once the print jobs complete 🖨 \033[0m"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "\033[0;34m Showing icons for hard drives, servers, and removable media on the desktop ℹ️ \033[0m"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true; killall Finder

echo "\033[0;34m Setting to 0 the wait time for showing the dock ⏲ \033[0m"
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
# undo: defaults write com.apple.dock autohide-delay -float 0.5; defaults write com.apple.dock autohide-time-modifier -int 0.5; killall Dock

echo "\033[0;34m Disabling annoying disk warning when unmounting external devices 💾 \033[0m"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd
echo -e "\033[1;31m Must restart Mac to take effect 🔁 \033[0m"
# re-enable annoyng disk warning:
# sudo defaults delete /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification && sudo pkill diskarbitrationd

echo "\033[0;34m Changing screenshot default to jpg (replace with png to undo) 📸 \033[0m"
defaults write com.apple.screencapture type jpg

echo "\033[0;34m Making hidden apps transparent 🫥 \033[0m"
defaults write com.apple.Dock showhidden -bool TRUE && killall Dock