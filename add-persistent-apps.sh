#!/usr/bin/env bash

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
defaults write com.apple.dock persistent-apps -array-add "${Applications}Visual Paradigm.app${end}"
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