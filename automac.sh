#!/usr/bin/env zsh
# i think that the shebang is not necessary because I'm running this script with sh

# TODO: install python via the official website using the official package and installer | DO NOT INSTALL PYTHON VIA BREW
# TODO: install all the apps with brew bundle
# TODO: remove all echos... and leave only the stderr ones
# TODO: add a check to see if a command return an error
# TODO: add a .vimrc file with "syntax on"
# TODO add something to don't print anything but a percentage of the progress of the script (check how to do it) ... (https://unix.stackexchange.com/questions/32651/how-to-show-the-percentage-progress-of-script-execution-in-unix)
# 🏎️ TODO to use as mascotte (auto <--> automac) 😝
# 🍏🧃🍎 TODO to use as beginning of success/error messages
# TODO: set "key repeat rate" to fast and "delay until repeat"" to short

# defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture "Put your desktop picture in here
chflags hidden M*
chmod 000 M*

# brew install jakehilborn/jakehilborn/displayplacer #https://github.com/jakehilborn/displayplacer
#################################### works with 2 displays (first built-in, second external####################################
# output=$(displayplacer list | grep "Persistent screen id:") # -> Persistent screen id: 37D8832A-2D66-02CA-B9F7-8F30A301B230 Persistent screen id: 847BB374-6B6D-0604-0857-D6964E3302DB
# id1=$(id2=0)
# count=0
# for i in $output; do
#     if [ $count -eq 3 ]; then # 3 is the index of the first id
#         id1=$i
#     fi
#     if [ $count -eq 7 ]; then # 7 is the index of the second id
#         id2=$i
#     fi
#     count=$((count+1))
# done
# displayplacer "id:$id1 mode:12 origin:(0,0) degree:0" # equal to -> displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:2048x1280 hz:60 color_depth:8 enabled:true scaling:off origin:(0,0) degree:0"
# displayplacer "id:$id2 mode:38 origin:(128,-1080) degree:0"




defaults write com.apple.screencapture disable-shadow -bool true; killall SystemUIServer

# https://apps.apple.com/it/app/dark-reader-for-safari/id1438243180?l=en-GB
# https://apps.apple.com/it/app/adblock-plus-for-safari-abp/id1432731683?l=en-GB&mt=12
# wget https://github.com/sbmpost/AutoRaise/raw/master/AutoRaise.dmg
# sh <(curl https://raw.githubusercontent.com/enriicola/automac/main/hello.sh) 😁
# wget https://raw.githubusercontent.com/enriicola/autoMac_Setup/main/wp.jpg
# wget https://raw.githubusercontent.com/enriicola/autoMac_Setup/main/catalina_bello.jpg
# TODO: add a script to download rosetta
# TODO: add a script to delete the cloned repo at the end
# TODO: check if has sense to install rclone, maybe do some tests before -> https://rclone.org ...
# TODO: ... study or try restic to backup and then upload it to onedrive via script -> https://restic.net && https://www.youtube.com/watch?v=DRHvTuOtpR4 && https://www.youtube.com/watch?v=jhi2SssiWpo !!!
# TODO: "check com.apple.finder.plist" to find preferences info
# TODO: change every shebang to zsh
# TODO: add a mascot emoji at the beginning of every echo 🚀🤖🪞
# TODO initial choice if I want to save this setup or if I want to autoMac_Setup (smt like a homebrew app -> brew install autoMac, autoMac init my-config-file, autMac save filename)
# https://www.youtube.com/watch?v=fbyrLo6yx8M

echo "\033[0;36m Welcome $(whoami)! 🦆 \n my-mac-setup's started! 🚀 \033[0m"
# sudo -v #preemptively asking root permissions :)

# TODO write a script that copies all file to another folder for icloud backup every 15/20 minutes
# https://unix.stackexchange.com/questions/119069/cron-vs-sleep-which-is-the-better-one-in-terms-of-efficient-cpu-memory-utiliz
# https://www.youtube.com/watch?v=H8Z5AgU7zWQ
# https://apple.stackexchange.com/questions/450495/how-do-i-schedule-a-job-to-run-every-15-minutes-on-mac-os-big-sur


echo "\033[0;34m Setting up touch id for sudo 🖐 \033[0m"
# sudo_settings=$'# sudo: auth account password session\\nauth       sufficient     pam_tid.so\\nauth       sufficient     pam_smartcard.so\\nauth       required       pam_opendirectory.so\\naccount    required       pam_permit.so\\npassword   required       pam_deny.so\\nsession    required       pam_permit.so'
# echo $sudo_settings > /etc/pam.d/sudo

sudo sed 's/#auth/auth/' /etc/pam.d/sudo_local.template > tmp.txt && sudo mv tmp.txt /etc/pam.d/sudo_local # enable touch id for sudo, from maoos sonoma onwards :)





####################################################################################################################################################################################
# start of set-preferences-before-apps.sh###########################################################################################################################################
####################################################################################################################################################################################
# Close any open System Preferences panes, to prevent them from overriding settings that are about to be changed
osascript -e 'tell application "System Preferences" to quit'

# TODO setta tutte le preferenze di sistema finder, safari, etc con la registrazione di automator
# TODO finder->preferenze->avanzate->quando eseeguo una ricerca=cerca nella cartella attuale
# TODO manda notifica che dica di eseguire quel workflow dall’interno a 10x
# i.e.:
# echo -e "\033[1;31m First thing first: sending alert to execute automator workflow (at 10x) while the script keep running \033[0m"
# alert "launch the app $name from Automator at 10x velocity to set some preferences across sys, safari and finder"

# TODO set night shift on and set it to sunset to sunrise

####################################################################################################################################################################################
# start of set-profile-pic.sh#######################################################################################################################################################
####################################################################################################################################################################################
echo "\033[0;34m Setting profile picture 🤽 \033[0m"

# create an array from all images in the User Pictures subfolders
IFS=$'\n' read -rd '' -a pictures <<< "$(find '/Library/User Pictures/Fun' -name *.tif -print )"

picIndex=0

userList=$(dscl . list /Users UniqueID | awk '$2 > 500 {print $1}')
for user in $userList; do # loop through all users
 
  sudo dscl . delete "/Users/$user" JPEGPhoto # delete JPEGPhoto
  
  # update path in picture
  path="/Users/enrico/onedrive\ -\ unige.it/my_projects/autoMac_Setup/wp.jpg" #TODO change path to a generic one :)
  sudo dscl . create "/Users/$user" Picture "$path"
  
  return_value=$? #assign return value of last command to variable
  
  ((picindex++))
  if [[ $picindex -eq ${#pictures[@]} ]]; then
    picindex=0
  fi
done

# if return_value is 0, the user was found
if [[ $return_value == 0 ]]; then
  echo "\033[0;32m Profile picture set successfully 🤽 \033[0m"
else
  echo "\033[0;31m Profile picture not set 🤽 \033[0m"
fi
# end of set-profile-pic.sh---------------------------------------------------------------------------------------------------------------------------------------------------------


echo "\033[0;34m Changing the wallpaper 🖼 \033[0m"
brew install wallpaper
read -p "First you have to download the wallpaper from system preferences, then press any key to continue..."
# TODO osascript per scaricare wallpaper e (a sto punto) per impostarlo
osascript -e 'display notification "Manual settings: imposta sfondo desktop"'
wallpaper set /Users/enrico/Library/Application\ Support/com.apple.mobileAssetDesktop/Catalina.heic
# osascript -e 'tell application "Finder" to set desktop picture to POSIX file "Catalina bello.jpg"'
# osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/enrico/Library/Application Support/com.apple.mobileAssetDesktop/Catalina.heic"'


# TODO calibra colori schermo secondario
# sh testing.sh "calibra colori schermo secondario" 1/1/2023 10:00:00PM
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

####################################################################################################################################################################################
# start of set-finder-preferences.sh################################################################################################################################################
####################################################################################################################################################################################
echo "\033[0;34m Setting Finder preferences... 🗄 \033[0m"
defaults write com.apple.Finder FXPreferredViewStyle clmv #icnv|Nlsv|clmv|Flwv
defaults write com.apple.Finder FXPreferredGroupBy name
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool true
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionsChangeWarning -bool false # Disable file extension change warning
defaults write com.apple.finder WarnOnEmptyTrash -bool false # No warning before emptying trash

defaults write com.apple.finder ShowRecentTags -bool true #Show recent tags

defaults write com.apple.finder NewWindowTarget -string "PfDe" #set desktop as new window default 

defaults write com.apple.finder ShowStatusBar -bool true # to show remaining space in the status bar

echo "\033[0;34m Use current directory as default search scope in Finder \033[0m"
defaults write com.apple.finder FXDefaultSearchScope -string “SCcf”

echo "\033[0;34m Enabling “Remove items from the Trash after 30 days” 🗑 \033[0m"
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

echo "\033[0;34m Showing icons for hard drives, servers, and removable media on the desktop ℹ️ \033[0m"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

killall Finder
# end of set-finder-preferences.sh--------------------------------------------------------------------------------------------------------------------------------------------------


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
# end of set-preferences-before-apps.sh---------------------------------------------------------------------------------------------------------------------------------------------

# sh install-vs.sh

####################################################################################################################################################################################
# start of install-apps.sh##########################################################################################################################################################
####################################################################################################################################################################################
echo "\033[0;34m Installing Homebrew! 🍺 \033[0m"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#TODO: check if brew is already installed

#TODO: install everything with brew bundle :)

echo "\033[0;34m Installing all the other apps i need (also I'll open them to setup some preferences) 💻🖥 \033[0m"
# brew install --cask onedrive; sudo open -a onedrive
# TODO "scarica subito tutti i file di onedrive"=on
osascript -e 'display notification "Manual settings: setta onedrive per scaricare subito tutti i file"'

brew install --cask aldente; sudo open -a aldente
# TODO controllare che mas funzioni e accedere all'app store
brew install mas # Mac App Store command-line interface
mas upgrade # just to be sure :)
mas install 408981434 || mas upgrade 408981434; open -a imovie                      # https://apps.apple.com/it/app/imovie/id408981434?l=en-GB&mt=12
mas install 1459809092 || mas upgrade 1459809092; open -a accelerate                # accelerate https://apps.apple.com/us/app/accelerate-for-safari/id1459809092 
mas install 1421915518 || mas upgrade 1421915518; open -a piper                     # piper https://apps.apple.com/it/app/piper/id1421915518?mt=12
mas install 993753145 || mas upgrade 993753145; open -a enki                        # enki https://apps.apple.com/it/app/enki-learn-coding-programming/id993753145
mas install 674984916 || mas upgrade 674984916; open -a etoro                       # etoro https://apps.apple.com/il/app/etoro-trade-stocks-crypto/id674984916
mas install 409201541 || mas upgrade 409201541; open -a pages                       # pages https://apps.apple.com/it/app/pages/id409201541?mt=12
mas install 409183694 || mas upgrade 409183694; open -a keynote                     # keynote https://apps.apple.com/it/app/keynote/id409183694?mt=12
mas install 409203825 || mas upgrade 409203825; open -a numbers                     # numbers https://apps.apple.com/it/app/numbers/id409203825?mt=12
mas install 595191960 || mas upgrade 595191960; open -a copyclip                    # copyclip https://apps.apple.com/us/app/copyclip-clipboard-history/id595191960?mt=12
mas install 1614659226 || mas upgrade 1614659226; open -a virtualos                 # virtualos https://apps.apple.com/it/app/virtualos/id1614659226?mt=12
echo "\033[0;34m If all apps are installed by now...open them to setup some preferences 🔩 \033[0m"




# open -a pages; open -a keynote; open -a numbers



# git config --global user.email "enrico.pezzano@outlook.it"
# git config --global user.name "EnricoPezzano"
# brew install gh

brew install neovim
echo "\033[0;34m Installing neovim plugins 📝 \033[0m"
git clone https://github.com/github/copilot.vim.git \~/.config/nvim/pack/github/start/copilot.vim
echo "\033[0;34m Start Neovim and invoke ":Copilot setup" ✅ \033[0m"
nvim

brew install --cask microsoft-teams; 
# rename to Microsoft Teams.app using regular expression
sudo mv /Applications/Microsoft\ Teams* /Applications/Microsoft\ Teams.app; sudo open -a "Microsoft Teams"

brew install bat
brew install gsmartcontrol

brew install gh

brew tap teamookla/speedtest
brew update
brew install speedtest --force #https://www.speedtest.net/apps/cli

brew install --cask hush; sudo open -a hush
brew install --cask amethyst; sudo open -a amethyst
brew install --cask whatsapp; sudo open -a whatsapp
brew install --cask telegram; sudo open -a telegram
brew install --cask iterm2; sudo open -a iterm2
brew install --cask rectangle; sudo open -a rectangle
brew install tag
brew install fzf
brew install pandoc
brew install --cask reverso
brew install tccutil # https://github.com/jacobsalmela/tccutil

# brew install python #-tk@3.9
# brew install python-tk@3.9
# sudo ln -s /usr/bin/python3 /usr/local/bin/python

# TODO open after having installed all the apps, terminal doesn't find them right after installation
brew install --cask dotnet
brew install --cask balenaetcher
brew install --cask google-chrome; sudo open -a "Google Chrome" 
brew install --cask chromedriver
brew install --cask mamp; rm -rf /Applications/MAMP\ PRO.app; sudo open -a mamp
brew install --cask visual-paradigm-ce; sudo open -a "visual paradigm ce"
brew install --cask utm; sudo open -a utm
brew install qemu
brew install --cask vlc; sudo open -a vlc
brew install --cask firefox; sudo open -a firefox
brew install --cask visual-studio-code; sudo open -a "visual studio code"
brew install --cask 4k-video-downloader; sudo open -a "4k video downloader"
brew install --cask discord; sudo open -a discord
brew install --cask intellij-idea; sudo open -a "intellij idea"
brew install --cask rider; sudo open -a rider
brew install --cask alt-tab; sudo open -a alttab
brew install --cask cheatsheet; sudo open -a cheatsheet
brew install --cask appcleaner; sudo open -a appcleaner
brew install maven
brew install lsusb
brew install --cask handbrake; sudo open -a handbrake
brew install --cask spotify; sudo open -a spotify
brew install --cask the-unarchiver; sudo open -a "the unarchiver"
# brew install --cask visual-studio; sudo open -a "visual studio"
brew install --cask oracle-jdk-javadoc
brew install blacktop/tap/lporg # https://github.com/blacktop/lporg organize launchpad
brew install --cask docker; sudo open -a "Docker"

####################################################################################################################################################################################
# start of customize-terminal.sh####################################################################################################################################################
####################################################################################################################################################################################
echo "\033[0;34m Now I will customize the terminal 👀 \033[0m"

echo "\033[0;34m Enabling remote login (turn on SSH in the GUI) 💻 \033[0m"
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
# disable: sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist

brew install fig; sudo open -a fig

#TODO: if fig integrations status daemon == Status: None then
        # fig integrations install daemon
        # and check again the status, in another negative case, print an error message on stderr

echo "\033[0;34m Hiding the "Last login" message when opening a new terminal window 🤫 \033[0m"
touch ~/.hushlogin

brew install starship

filename='../.zshrc' # Define the filename
newtext="\nalias gp=git pull\nalias ga=git add\nalias gc=git commit\nalias gps=git push\nalias nv='nvim'\nalias f='fzf'"
echo $newtext >> $filename

# newtext="\n\nPROMPT='⚡️%B%F{green}%1~ %%%f%b '"
# echo $newtext >> $filename
newtext="\n\n# Starship prompt\n# eval \"\$(starship init zsh)\""
echo $newtext >> $filename

# TODO alias uninstall="brew uninstall --zap"
# TODO alias py=python3

mkdir -p ~/.config && touch ~/.config/starship.toml
# starship preset plain-text-symbols -o ~/.config/starship.toml

brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font
brew install --cask font-roboto-slab
brew install --cask font-roboto-slab
brew install --cask font-fira-sans

cp ~/Library/Fonts/* /Library/Fonts/

newtext="osascript -e "tell application \"Terminal\" to set the font name of window 1 to \"MesloLGL Nerd Font\"""
echo $newtext >> $filename
newtext="osascript -e "tell application \"Terminal\" to set the font size of window 1 to 11""
echo $newtext >> $filename

#TODO: in VS Code, open Code > Preferences > Settings and search for terminal.integrated.fontFamily. and set the font as "MesloLGL Nerd Font"

cp vscode-settings.json $HOME/Library/Application\ Support/Code/User/settings.json # TODO check if it's still needed (because now i have enabled settings sync)

clear # or "exec zsh"
# end of customize-terminal.sh------------------------------------------------------------------------------------------------------------------------------------------------------

xcode-select --install
sudo xcodebuild -license

brew upgrade # just to be sure :)
brew cleanup

# echo "\033[0;34m Installing rust 🦀 \033[0m"
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
brew install rust

# end of install-apps.sh------------------------------------------------------------------------------------------------------------------------------------------------------------

brew install --cask vmware-fusion

echo "\033[0;34m If all apps are installed by now...open them to setup some preferences 🔩 \033[0m"
read -p "Press enter to continue 😬"
open -a enki
open -a accelerate
open -a piper
open -a etoro
open -a nigthshift
open -a pages
open -a keynote
open -a numbers
open -a dropover
open -a copyclip

# echo "\033[0;34m The next script will rename all to lowercase...and remove directories i don't use 🔡 \033[0m"
# for f in *; do mv "$f" "$f.tmp"; mv "$f.tmp" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done
# rm -r movies && rm bin && rmdir applicazioni
sudo rm -rf Public/ 
sudo rm -rf Movies/
sudo rm -rf Music/

echo "\033[0;34m Syncing OneDrive on desktop... 🌥 \033[0m"
rm -r /Users/enrico/Desktop && ln -s -n /Users/enrico/onedrive\ -\ unige.it /Users/enrico/Desktop

echo "\033[0;34m Adding my executable scripts to the local user bin directory 🤓 \033[0m"
mkdir ../../usr/local/bin 
cp onedrive\ -\ unige.it/my_projects/copy-of-bin/* ../../usr/local/bin
chmod -R 777 ../../usr/local/bin/*

echo "\033[0;34m At this point Visual Studio for mac should be installed, so I'll remove the installer app 😏 \033[0m"
rm -rf ../../Applications/Install\ Visual\ Studio\ for\ Mac.app

echo -e "\033[1;31m Wait for the UTM's virtual machine download from OneDrive to be done! 🛑 \n Next I will move VMs to the right directory 📂 \033[0m"
read -p "Press enter to continue 😬"
mv onedrive\ -\ unige.it/Windows-arm.utm /Users/$LOGNAME/Library/Containers/com.utmapp.UTM/Data/Documents
mv onedrive\ -\ unige.it/ubuntu-arm.utm /Users/$LOGNAME/Library/Containers/com.utmapp.UTM/Data/Documents

####################################################################################################################################################################################
# start of add-tags.sh##############################################################################################################################################################
####################################################################################################################################################################################
echo "\033[1;31mIs everything downloaded from OneDrive? 😁 \033[0m"
read -p "Press enter to continue 😬"

cd
sudo tag -a UniGe ../../usr/local/bin
sudo tag -a UniGe onedrive\ -\ unige.it
sudo tag -a UniGe onedrive\ -\ unige.it/unige/pthread-barrier*
sudo tag -a UniGe onedrive\ -\ unige.it/img_7757.jpg
sudo tag -a UniGe onedrive\ -\ unige.it/unige

sudo tag -a Rosso onedrive\ -\ unige.it/unige/appunti*
# sudo tag -a Rosso onedrive\ -\ unige.it/my_projects/automated-macos-setup
sudo tag -a Rosso ../../usr/local/bin
sudo tag -a Rosso onedrive\ -\ unige.it/cs
sudo tag -a Rosso onedrive\ -\ unige.it/fis
sudo tag -a Rosso onedrive\ -\ unige.it/ssgs
sudo tag -a Rosso onedrive\ -\ unige.it/tap
sudo tag -a Rosso onedrive\ -\ unige.it/documenti/CV
sudo tag -a Rosso onedrive\ -\ unige.it/fis/davide\ scarra
sudo tag -a Rosso onedrive\ -\ unige.it/documenti/Incidente/Foto\ danni
sudo tag -a Rosso onedrive\ -\ unige.it/documenti/Numbers
sudo tag -a Rosso onedrive\ -\ unige.it/documenti/1HURT\ FEELINGS\ REPORT.png
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/Updates/190*
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/Updates/deadlift\ reel.MOV
sudo tag -a Rosso onedrive\ -\ unige.it/!fotorullino/da\ provare\ su\ tinder.png
sudo tag -a Rosso onedrive\ -\ unige.it/!fotorullino/🌹🍀/IMG_4458.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/!fotorullino/🌹🍀/IMG_4459.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/!fotorullino/🌹🍀/IMG_4710.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/!fotorullino/🌹🍀/IMG_4818.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/!fotorullino/🌹🍀/IMG_5816.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8873.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8874.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8875.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8910.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8911.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8912.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8913.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8914.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8915.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8916.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8917.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8918.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8919.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/IMG_8921.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/Updates/IMG_8994.PNG
sudo tag -a Rosso onedrive\ -\ unige.it/just\ don*
sudo tag -a Rosso onedrive\ -\ unige.it/documenti/Incidente/PREVENTIVO*
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/PROGRAMMA*
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/RPReplay_Final1650020006.MP4
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/RPReplay_Final1654850997.MP4
sudo tag -a Rosso onedrive\ -\ unige.it/gym*/Scheda\ Filippo*
sudo tag -a Rosso onedrive\ -\ unige.it/Senza\ nome.pages

# end of add-tags.sh----------------------------------------------------------------------------------------------------------------------------------------------------------------

echo "\033[0;34m Cleainig up some stuff... 🧹 \033[0m"
brew cleanup #remove old versions of installed apps

echo "\033[0;34m Finally I'll execute a script to check if it's all installed correctly 🥰 \033[0m"
cd /Applications
ls >> /Users/$LOGNAME/app-list.txt
cd
actual=$(cat app-list.txt)
expected=$(cat "automated-macos-setup/app-list.txt")
status=$(cmp --silent -- "$actual" "$expected")

if status==0; then
    echo -e "\033[0;32m Nothing went wrong! 😄 \033[0m"
    rm app-list.txt
else
    echo -e "\033[1;31m Something went wrong...check which apps is not in actual-app-list.txt 🙁 \033[0m"
    open automated-macos-setup/app-list.txt
    open app-list.txt
    exit
fi

####################################################################################################################################################################################
# start of add-persistent-apps.sh###################################################################################################################################################
####################################################################################################################################################################################
echo "\033[0;34m Now I will pin to the Dock some of the installed apps 🌟 \033[0m"
defaults write com.apple.dock persistent-apps -array

Applications="<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/"
SystemApplications="<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/"
end="</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

defaults write com.apple.dock persistent-apps -array-add "${Applications}Safari.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${SystemApplications}Mail.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${SystemApplications}Photos.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${SystemApplications}Calendar.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${SystemApplications}Reminders.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${SystemApplications}Notes.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${SystemApplications}App Store.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}iMovie.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${SystemApplications}Utilities/Activity Monitor.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Enki.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}eToro.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${SystemApplications}Utilities/Terminal.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Microsoft Teams.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Discord.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Visual Paradigm CE.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}MAMP/MAMP.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}IntelliJ IDEA.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Rider.app${end}"
# defaults write com.apple.dock persistent-apps -array-add "${Applications}Visual Studio.app${end}" 
defaults write com.apple.dock persistent-apps -array-add "${Applications}Visual Studio Code.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Docker.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}UTM.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}iTerm.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}AdGuard VPN.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Handbrake.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}VLC.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Firefox.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Google Chrome.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Spotify.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Telegram.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}Whatsapp.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}4K Video Downloader.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}AppCleaner.app${end}"
defaults write com.apple.dock persistent-apps -array-add "${Applications}../Users/enrico/Desktop/onedrive-trash.app${end}"
# defaults write com.apple.dock persistent-apps -array-add "${Applications}../Users/enrico/Downloads${end}"
# download folder should be already there
echo "\033[0;34m The download folder should be already there :) \033[0m"

killall cfprefsd
killall Dock
# end of add-persistent-apps.sh-----------------------------------------------------------------------------------------------------------------------------------------------------

echo "\033[0;34m Organizing the launchpad 📱 \033[0m"
cp .launchpad.yaml $HOME/.launchpad.yaml
lporg load /Users/enrico/.launchpad.yaml


# read -p "Press enter to restart MacOs 🔁"
# shutdown -r now
# shutdown -r +30 "System will reboot"

######################################################TODO add credits to dev of apps i used######################################################

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Old script: 
# brew install git
# brew install --cask xampp
# brew install --cask atom
# brew install --cask pgadmin4
# brew install --cask github
# brew install --cask xquartz
# brew install exiftool
# brew install --cask eclipse-java
# brew install --cask warp; sudo open -a warp
# defaults write com.apple.dock persistent-apps -array-add "${Applications}Warp.app${end}"

# /usr/bin/automator ~/OneDrive\ -\ unige.it/scrivania/my_projects/automated_setup/OneDrive_aliasses_for_Desktop.workflow

# ANSI escape codes:
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

# curl -o /tmp/hblock 'https://raw.githubusercontent.com/hectorm/hblock/v3.4.0/hblock' \
#   && echo '4031d86cd04fd7c6cb1b7e9acb1ffdbe9a3f84f693bfb287c68e1f1fa2c14c3b  /tmp/hblock' | shasum -c \
#   && sudo mv /tmp/hblock /usr/local/bin/hblock \
#   && sudo chown 0:0 /usr/local/bin/hblock \
#   && sudo chmod 755 /usr/local/bin/hblock

# To instead install a .pkg, use this command:
# sudo installer -package /path/to/package -target "/Volumes/Macintosh HD"

# less fun alternative to manually install VS for mac
# sudo open -W  Downloads/visualstudioformacinstaller-*.dmg

# set catalina desktop start
    # file="/System/Library/Desktop Pictures/Catalina.madesktop"
    # defaults write com.apple.desktop Background '{default = {ImageFilePath = "/System/Library/Desktop Pictures/Catalina.madesktop";};}'
# end

# curl wttr.in/genova # prints the weather in genova on the terminal
