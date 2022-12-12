#!/usr/bin/env bash
##!/bin/sh
# TODO testa my-automated-mac-setup copiando ed incollando un pezzo alla volta

echo "\033[0;36m Now I will edit some dock's preferences 🌟 \033[0m"
defaults write com.apple.dock persistent-apps -array
# TODO ordine app dock: safari mail foto calendario promemoria note appstore imovie monitoraggioattività enki etoro terminale teams discord mamp eclipse intellij vs vsc utm iterm2 +...
#                      ...adguardvpn handbrake vlc firefox spotify telegram whatsapp appcleaner onedrivetrash downloads
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Safari.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

# defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Foto.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

    # queste funzionano
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Enki.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
killall cfprefsd
killall Dock