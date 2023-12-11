#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding settings that are about to be changed
osascript -e 'tell application "System Preferences" to quit'

# TODO setta tutte le preferenze di sistema finder, safari, etc con la registrazione di automator
# TODO setta scroll velocity at max (accessibility->pointer control->trackpad options->tracking speed->fast)
# TODO drag things with 3 fingers (accessibility->pointer control->trackpad options->enable dragging->3 fingers)
# TODO finder->preferenze->avanzate->quando eseeguo una ricerca=cerca nella cartella attuale
# TODO manda notifica che dica di eseguire quel workflow dall’interno a 10x
# i.e.:
# echo -e "\033[1;31m First thing first: sending alert to execute automator workflow (at 10x) while the script keep running \033[0m"
# alert "launch the app $name from Automator at 10x velocity to set some preferences across sys, safari and finder"

# TODO set night shift on and set it to sunset to sunrise

sudo sh set-profile-pic.sh


echo "\033[0;34m Changing the wallpaper 🖼 \033[0m"
brew install wallpaper
read -p "First you have to download the wallpaper from system preferences, then press any key to continue..."
# TODO osascript per scaricare wallpaper e (a sto punto) per impostarlo
osascript -e 'display notification "Manual settings: imposta sfondo desktop"'
wallpaper set /Users/enrico/Library/Application\ Support/com.apple.mobileAssetDesktop/Catalina.heic
# osascript -e 'tell application "Finder" to set desktop picture to POSIX file "Catalina bello.jpg"'
# osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/enrico/Library/Application Support/com.apple.mobileAssetDesktop/Catalina.heic"'


# TODO calibra colori schermo secondario
sh testing.sh "calibra colori schermo secondario" 1/1/2023 10:00:00PM
osascript -e 'display notification "Manual settings: calibra colori schermo secondario"'

# TODO preferenzesys->set notifications to banners
osascript -e 'display notification "Manual settings: set notifications to banners"'
# defaults write com.apple.notificationcenterui bannerTime 2 # default 5


# TODO set meteo to "posizione attuale"
osascript -e 'display notification "Manual settings: set meteo to posizione attuale"'

# TODO preferenzesys->siri->seleziona voce 1
osascript -e 'display notification "Manual settings: set siri voice to 1"'

# TODO enable type to siri in accessibility preferences
osascript -e 'display notification "Manual settings: enable type to siri in accessibility preferences"'

# TODO preferenzesys->dock->centro controllo->schermo->mostra barra dei menu off #volendo posso lasciarlo on, tanto non si vede
osascript -e 'display notification "Manual settings: set control center to hide menu bar"'

# TODO preferenzesys->dock->centro controllo->suono->mostra barra dei menu off
osascript -e 'display notification "Manual settings: set control center to hide menu bar"'

# TODO preferenzesys->dock->centro controllo->riproduzione->mostra barra dei menu off
osascript -e 'display notification "Manual settings: set control center to hide menu bar"'

# TODO preferenzesys->dock->altrimoduli->batteria->barra menù=on
osascript -e 'display notification "Manual settings: set battery to show on menu bar"'
# TODO preferenzesys->batteria->disattiva schermo dopo=mai, oscura schermo=off, caricamento ottimizzato=off (prova a lasciare on), disattiva dishi=on
osascript -e 'display notification "Manual settings: set battery to never turn off screen, never dim screen, optimized charging off, disattiva dishi on"'

# TODO preferenzesys->batteria->alimentatore->disattiva schermo=mai #(dovrebbero già essere così) impedisci etc=on, attiva per accesso rete=on
osascript -e 'display notification "Manual settings: set battery to never turn off screen, never dim screen, optimized charging off, attiva per accesso rete on"'
echo "\033[0;34m Showing battering percentage 🔋 \033[0m"
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true
echo "\033[0;34m Hiding Siri 🗣 \033[0m"
defaults write com.apple.Siri StatusMenuVisible -bool false
killall -KILL SystemUIServer

echo "\033[0;34m Hiding spotlight 🔍 \033[0m"
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1 #0 to show

# TODO preferenzesys->accountinternet->imposta icloud (on: foto, portachiavi, calendari, promemoria, note, safari, trova il mio mac, siri)
osascript -e 'display notification "Manual settings: set icloud to on for foto, portachiavi, calendari, promemoria, note, safari, trova il mio mac, siri"'

# TODO preferenzesys->accountinternet->imposta unige.it (on: mail)
osascript -e 'display notification "Manual settings: set unige.it to on for mail"'

# TODO preferenzesys->accountinternet->imposta outlook (on: mail, contatti)
osascript -e 'display notification "Manual settings: set outlook to on for mail, contatti"'

# TODO preferenzesys->estensioni->(on: dropover, onedrive, telegram)
osascript -e 'display notification "Manual settings: set extensions to on for dropover, onedrive, telegram"'

# TODO preferenzesys->tastiera->(on: regola luminosità, disattiva retroilluminazione dopo 5 minuti)
osascript -e 'display notification "Manual settings: set keyboard to on for regola luminosità, disattiva retroilluminazione dopo 5 minuti"'

# TODO preferenzesys->tastiera->abbreviazioni->azioni rapide->aggiungi workflow onedrive trash (cmd+ì)
osascript -e 'display notification "Manual settings: set keyboard to on for regola luminosità, disattiva retroilluminazione dopo 5 minuti"'

# TODO preferenzesys->trackpad->velocità=max, clic silenzioso=on
osascript -e 'display notification "Manual settings: set trackpad to max speed, clic silenzioso on"'

# TODO preferenzesys->privacy e sicurezza->imposta le localizzazioni su off (on solo "trova il mio mac" e "personalizzazione fuso orario e sistema")
osascript -e 'display notification "Manual settings: set privacy to off for localizzazioni"'

# TODO preferenzesys->privacy e sicurezza->accessibilità->terminale=on
osascript -e 'display notification "Manual settings: set privacy to on for accessibilità"'

# TODO preferenzesys->privacy e sicurezza->turn off "mostra l'icona della localizzazione quando i servizi di sistema richiedono la tua posizione" 
osascript -e 'display notification "Manual settings: turn off "mostra icona della localizzazione quando i servizi di sistema richiedono la tua posizione"'

# TODO preferenzesys->schermi->setta night shitf to on e programmato da tramonto all'alba
osascript -e 'display notification "Manual settings: set night shift to on and programmato da tramonto a alba"'

# TODO preferenzesys->privacy e sicurezza->setta blocca il mac a 1 minuto
osascript -e 'display notification "Manual settings: set privacy to 1 minute for blocca il mac"'

# TODO ordina preferenze da A a Z
osascript -e 'display notification "Manual settings: sort preferences from A to Z"'

# TODO mail preferences->togli caselle smart + aggiungi ai preferiti cestino(tutte), spam(tutte), archivio + ordinale 
osascript -e 'display notification "Manual settings: set mail preferences to remove smart mailboxes and add cestino, spam, archivio to favorites"'

# TODO remove all widget; aggiungi meteo(grande) e sotto eventiCalendario(grande)
osascript -e 'display notification "Manual settings: remove all widgets and add meteo and eventiCalendario"'

# TODO apri finder + modifica barra strumenti Finder + modifica barra laterale
osascript -e 'display notification "Manual settings: open finder and modify toolbar and sidebar"'

# TODO apri preferenze safari e modificale + modifica barra strumenti safari
osascript -e 'display notification "Manual settings: open safari preferences and modify toolbar"'

# TODO safari->preferenze->notifiche->mostra notifiche=off
osascript -e 'display notification "Manual settings: set safari preferences to not show notifications"'

# TODO apri preferenze itunes e modificale + mostra Sviluppo nella barra dei menu
osascript -e 'display notification "Manual settings: open itunes preferences and modify toolbar"'

# TODO set to true installa aggiornamenti delle app di appstore #forse posso evitare questo comando
osascript -e 'display notification "Manual settings: set appstore preferences to install updates"'

# TODO in alternativa prova a registrare le tue azioni tramite automator e salvarle in un app da eseguire...
osascript -e 'display notification "Manual settings: try to record your actions with automator and save them in an app to execute..."'

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

defaults write com.apple.screencapture disable-shadow -bool true 

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
killall SystemUIServer
