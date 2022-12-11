#!/usr/bin/env bash
##!/bin/sh

echo "\033[0;36m Welcome! 🦆 \n my-auto-setup started! 🚀 \033[0m"

defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
# undo: defaults write com.apple.dock autohide-delay -float 0.5; defaults write com.apple.dock autohide-time-modifier -int 0.5 ;killall Dock

# 𝗗𝗶𝘀𝗮𝗯𝗹𝗲 𝗔𝗻𝗻𝗼𝘆𝗶𝗻𝗴 𝗗𝗶𝘀𝗸 𝗪𝗮𝗿𝗻𝗶𝗻𝗴 (must restart Mac to take effect): 
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd
echo -e "\033[1;31m Must restart Mac to take effect 🔁 \033[0m"
# 𝗥𝗲-𝗘𝗻𝗮𝗯𝗹𝗲 𝗔𝗻𝗻𝗼𝘆𝗶𝗻𝗴 𝗗𝗶𝘀𝗸 𝗪𝗮𝗿𝗻𝗶𝗻𝗴:
# sudo defaults delete /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification && sudo pkill diskarbitrationd

# 𝗖𝗵𝗮𝗻𝗴𝗲 𝗦𝗰𝗿𝗲𝗲𝗻𝘀𝗵𝗼𝘁 𝗗𝗲𝗳𝗮𝘂𝗹𝘁 𝘁𝗼 𝗝𝗣𝗚 (replace with png to undo):
defaults write com.apple.screencapture type jpg

# 𝗠𝗮𝗸𝗲 𝗛𝗶𝗱𝗱𝗲𝗻 𝗔𝗽𝗽𝘀 𝗧𝗿𝗮𝗻𝘀𝗽𝗮𝗿𝗲𝗻𝘁:
defaults write com.apple.Dock showhidden -bool TRUE && killall Dock


#osascript # TODO impostare sfondo catalina dinamico (+ sfondo secondario big sur dinamico)
#tell application "Finder"
#set desktop picture to POSIX file "/Library/Desktop Pictures/Solid Colors/Catalina.madesktop"
#end tell
# TODO via script modify widget 
# TODO via script metti tutte le app in una schermata del launchpad (+ cartella produttivitò con pages etc, cartella utility con rectangle etc, cartella estensioni safari, cartella altro con altre app che non usi)
# TODO via script apri tutte le app installate per configurare tutto
# TODO via script modify barra strumenti Finder
# TODO via script modify barra strumenti Safari
# TODO via script change profile picture for the mac/icloud
# TODO via script try to uninstall some defualt apps
# TODO via script metti tutte le app nella dock 
# TODO via script rimuovi alcune app dalla dock
# TODO via script modifica preferenze dock 
# TODO via script modify system preferences
# TODO via script modify menu bar
# TODO via script modifica angoli attivi

# TODO apri impostazioni sfondo scrivania
# TODO imposta sfondo dinamico catalina
# TODO imposta sfondo secondario dinamico big sur
# TODO calibra colori schermo secondario
# TODO apri preferenze safari e modificale
# TODO apri preferenze finder e modificale
# TODO cambia foto profilo mac :)
# TODO disattiva salvaschermo

# TODO trascrivi come commenti la disposizione delle app nel launchpad


open https://apps.apple.com/us/app/accelerate-for-safari/id1459809092 
open https://apps.apple.com/it/app/piper/id1421915518?mt=12
open https://apps.apple.com/it/app/enki-learn-coding-programming/id993753145
open https://apps.apple.com/il/app/etoro-trade-stocks-crypto/id674984916
open https://apps.apple.com/it/app/nightshift-dark-mode/id1561604170?mt=12
open https://apps.apple.com/it/app/adguard-per-safari/id1440147259?mt=12
open https://apps.apple.com/it/app/pages/id409201541?mt=12
open https://apps.apple.com/it/app/keynote/id409183694?mt=12
open https://apps.apple.com/it/app/numbers/id409203825?mt=12
open https://apps.apple.com/it/app/dropover-easier-drag-drop/id1355679052?mt=12
open https://aka.ms/vs/mac/download
echo -e "\033[1;31m Wait for the VS download to be done! 🛑 \033[0m"
read -p "Press enter to continue 😬"

echo -e "\033[0;33m This next command will be a little slow 🐢 \033[0m"
hdiutil mount Downloads/visualstudioformacinstaller-*.dmg
# open -W  Downloads/visualstudioformacinstaller-*.dmg # less fun alternative
sudo cp -R "/Volumes/Visual Studio for Mac Installer/Install Visual Studio for Mac.app" /Applications
sudo codesign --force --deep --sign - /Applications/Install\ Visual\ Studio\ for\ Mac.app
sudo xattr -d -r com.apple.quarantine /Applications/Install\ Visual\ Studio\ for\ Mac.app 
sudo chmod -R 755 /Applications/Install\ Visual\ Studio\ for\ Mac.app/Contents/MacOS/Install_Visual_Studio 
sudo open -a /Applications/Install\ Visual\ Studio\ for\ Mac.app
# To instead install a .pkg, use this command:
# sudo installer -package /path/to/package -target "/Volumes/Macintosh HD"
hdiutil unmount /Volumes/Visual\ Studio\ for\ Mac\ Installer
rm Downloads/visualstudioformacinstaller-*.dmg

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask onedrive
sudo open -a onedrive

brew install --cask aldente
sudo open -a aldente

brew install git

brew install --cask microsoft-teams
sudo open -a "microsoft teams"

brew install --cask whatsapp
sudo open -a whatsapp

brew install --cask telegram
sudo open -a telegram

brew install --cask adguard-vpn
sudo open -a "adguard vpn"

brew install --cask iterm2
sudo open -a iterm2

brew install --cask rectangle
sudo open -a rectangle

brew install python #-tk@3.9
brew install python-tk@3.9

brew install --cask google-chrome
sudo open -a "Google Chrome" 
brew install --cask chromedriver

brew install --cask mamp
rm -rf ../../Applications/MAMP\ PRO.app
sudo open -a mamp

brew install --cask utm
sudo open -a utm

brew install --cask vlc

brew install --cask firefox
sudo open -a firefox

brew install --cask visual-studio-code
sudo open -a "visual studio code"

brew install --cask 4k-video-downloader

brew install --cask discord
sudo open -a discord

brew install --cask intellij-idea
sudo open -a "intellij idea"

brew install --cask alt-tab
sudo open -a alttab

brew install --cask cheatsheet
sudo open -a cheatsheet

brew install --cask appcleaner
sudo open -a appcleaner

brew install --cask lunar
sudo open -a lunar

brew install maven

brew install --cask handbrake
sudo open -a handbrake

brew install --cask eclipse-java 
sudo open -a "eclipse java"

brew install --cask spotify
sudo open -a spotify

brew install --cask the-unarchiver
sudo open -a "the unarchiver"

brew install --cask visual-studio
sudo open -a "visual studio"

brew install --cask oracle-jdk-javadoc

# brew install mono

brew upgrade

open -a enki
open -a accelerate
open -a piper
open -a etoro
open -a nigthshift
open -a "adguard for safari"
open -a pages
open -a keynote
open -a numbers
open -a dropover

# CODE TO RENAME ALL FILES TO LOWERCASE
for f in *; do mv "$f" "$f.tmp"; mv "$f.tmp" "`echo $f | tr "[:upper:]" "[:lower:]"`"; done

# sync desktop on onedrive command
sudo rm -r /Users/enrico/Desktop && ln -s -n /Users/enrico/onedrive\ -\ unige.it /Users/enrico/Desktop

cd
rm -r movies && rm bin

sudo mkdir ../../usr/local/bin 
sudo cp onedrive\ -\ unige.it/my_projects/copy-of-bin/* ../../usr/local/bin
sudo chmod +x ../../usr/local/bin/my-git-push

sudo rm -rf ../../Applications/Install\ Visual\ Studio\ for\ Mac.app

cd /Applications
cd
ls >> /Users/enrico/actual-app-list.txt
actual=$(cat /Users/enrico/actual-app-list.txt)
expected=$(cat "/Users/enrico/onedrive - unige.it/my_projects/automated_setup/expected-app-list.txt")
status=$"cmp --silent -- "$actual" "$expected""
if status; then
    echo -e "\033[1;31m Something went wrong...check which apps is not in actual-app-list.txt 🙁 \033[0m"
    open /Desktop/my_projects/automated_setup/expected-app-list.txt
    open /Applications/actual-app-list.txt
    exit
fi

echo -e "\033[0;32m Tutto installato correttamente 😄 \033[0m"
rm /Users/enrico/actual-app-list.txt

echo 

# TODO preferenze dock, quali app pinnare nella dock e mettere ordine nel launchpad
echo "\033[0;36m Now I will edit some dock's preferences 🌟 \033[0m"


read -p "Press enter to restart MacOs 🔁"
sudo shutdown -r now

# Old script: 
# brew install --cask xampp
# brew install --cask rider
# brew install --cask atom
# brew install --cask pgadmin4
# brew install --cask github
# brew install --cask visual-paradigm-ce
# brew install --cask xquartz
# brew install exiftool
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