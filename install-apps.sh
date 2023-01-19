#!/usr/bin/env bash

echo "\033[0;34m Installing Homebrew! 🍺 \033[0m"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
read -p "Press enter to continue 😁"

echo "\033[0;34m Installing all the other apps i need (also I'll open them to setup some preferences) 💻🖥 \033[0m"
brew install --cask onedrive; sudo open -a onedrive
# TODO "scarica subito tutti i file di onedrive"=on
brew install --cask aldente; sudo open -a aldente
git config --global user.email "enrico.pezzano@outlook.it"
git config --global user.name "EnricoPezzano"
brew install --cask microsoft-teams; sudo open -a "microsoft teams"
brew install --cask whatsapp; sudo open -a whatsapp
brew install --cask telegram; sudo open -a telegram
brew install --cask adguard-vpn; sudo open -a "adguard vpn"
brew install --cask iterm2; sudo open -a iterm2
brew install --cask rectangle; sudo open -a rectangle
brew install tag

brew install python #-tk@3.9
brew install python-tk@3.9
sudo ln -s /usr/bin/python3 /usr/local/bin/python

brew install --cask google-chrome; sudo open -a "Google Chrome" 
brew install --cask chromedriver
brew install --cask mamp; rm -rf /Applications/MAMP\ PRO.app; sudo open -a mamp
brew install --cask utm; sudo open -a utm
brew install --cask vlc; sudo open -a vlc
brew install --cask firefox; sudo open -a firefox
brew install --cask visual-studio-code; sudo open -a "visual studio code"
brew install --cask 4k-video-downloader; sudo open -a "4k video downloader"
brew install --cask discord; sudo open -a discord
brew install --cask intellij-idea; sudo open -a "intellij idea"
brew install --cask alt-tab; sudo open -a alttab
brew install --cask cheatsheet; sudo open -a cheatsheet
brew install --cask appcleaner; sudo open -a appcleaner
brew install --cask lunar; sudo open -a lunar
brew install maven
brew install --cask handbrake; sudo open -a handbrake
brew install --cask spotify; sudo open -a spotify
brew install --cask the-unarchiver; sudo open -a "the unarchiver"
brew install --cask visual-studio; sudo open -a "visual studio"
brew install --cask oracle-jdk-javadoc
brew install blacktop/tap/lporg

sh customize-terminal.sh

brew upgrade # just to be sure :)
brew cleanup

echo "\033[0;34m Installing rust 🦀 \033[0m"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh