#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding settings that are about to be changed
osascript -e 'tell application "System Preferences" to quit'

# TODO setta tutte le preferenze di sistema finder, safari, etc con la registrazione di automator
# +
# TODO manda notifica che dica di eseguire quel workflow dall’interno a 10x
# i.e.:
# echo -e "\033[1;31m First thing first: sending alert to execute automator workflow (at 10x) while the script keep running \033[0m"
# alert "launch the app $name from Automator at 10x velocity to set some preferences across sys, safari and finder"

sudo sh set-profile-pic.sh

echo "\033[0;34m Changing the wallpaper 🖼 \033[0m"
brew install wallpaper
read -p "First you have to download the wallpaper from system preferences, then press any key to continue..."
# TODO osascript per scaricare wallpaper e (a sto punto) per impostarlo
wallpaper set /Users/enrico/Library/Application\ Support/com.apple.mobileAssetDesktop/Catalina.heic

# TODO calibra colori schermo secondario

# TODO preferenzesys->set notifications to banners
# defaults write com.apple.notificationcenterui bannerTime 2 # default 5


# TODO set meteo to "posizione attuale"

# TODO preferenzesys->siri->seleziona voce 1
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
# TODO preferenzesys->privacy e sicurezza->imposta le localizzazioni su off (on solo "trova il mio mac" e "personalizzazione fuso orario e sistema")
# TODO preferenzesys->privacy e sicurezza->accessibilità->terminale=on
# TODO preferenzesys->privacy e sicurezza->turn off "mostra l'icona della localizzazione quando i servizi di sistema richiedono la tua posizione"
# TODO preferenzesys->schermi->setta night shitf to on e programmato da tramonto all'alba
# TODO preferenzesys->privacy e sicurezza->setta blocca il mac a 1 minuto
# TODO ordina preferenze da A a Z

# TODO mail preferences->togli caselle smart + aggiungi ai preferiti cestino(tutte), spam(tutte), archivio + ordinale 

# TODO remove all widget; aggiungi meteo(grande) e sotto eventiCalendario(grande)
# TODO apri preferenze finder e modificale + modifica barra strumenti Finder + modifica barra laterale
# TODO apri preferenze safari e modificale + modifica barra strumenti safari
# TODO apri preferenze itunes e modificale + mostra Sviluppo nella barra dei menu


# TODO set to true installa aggiornamenti delle app di appstore

# TODO in alternativa prova a registrare le tue azioni tramite automator e salvarle in un app da eseguire... 

sh set-finder-preferences.sh

echo "\033[0;34m Disabling screensaver... 📺 \033[0m"
defaults -currentHost write com.apple.screensaver idleTime 0

echo "\033[0;34m Automatically quit printer app once the print jobs complete 🖨 \033[0m"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "\033[0;34m Setting to 0 the wait time for showing the dock ⏲ \033[0m"
defaults write com.apple.dock autohide -bool true # enable autohide
value=0 # undo: set value to 0.5
defaults write com.apple.dock autohide-delay -float $value; # without animation
defaults write com.apple.dock autohide-time-modifier -int $value; # with animation

echo "\033[0;34m Disabling annoying disk warning when unmounting external devices 💾 \033[0m"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd
echo -e "\033[1;31m Must restart Mac to take effect 🔁 \033[0m"
# re-enable annoyng disk warning:
# sudo defaults delete /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification && sudo pkill diskarbitrationd

echo "\033[0;34m Changing screenshot default to jpg (replace with png to undo) 📸 \033[0m"
defaults write com.apple.screencapture type jpg

echo "\033[0;34m Making hidden apps transparent 🫥 \033[0m"
defaults write com.apple.Dock showhidden -bool TRUE

echo "\033[0;34m Disabling recent apps in dock 📱 \033[0m"
defaults write "/Users/$(whoami)/Library/Preferences/com.apple.dock.plist" show-recents -bool false

echo "\033[0;34m Sizing dock's tiles and magnification... 🔎 \033[0m"
defaults write com.apple.dock "tilesize" -int 40
defaults write com.apple.dock largesize -int 60

killall Dock


echo "\033[0;34m Setting hot corners... 🔥📐 \033[0m"
for corner in tl tr br bl; # Turn off hot-corners
  do
    defaults write com.apple.dock "wvous-$corner-corner" -int 0
  done
defaults write com.apple.dock "wvous-br-corner" -int 4  # mostra scrivania
defaults write com.apple.dock "wvous-bl-corner" -int 14 # nota rapida
killall Dock