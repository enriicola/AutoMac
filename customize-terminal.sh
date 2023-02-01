#!/usr/bin/env bash

echo "\033[0;34m Now I will customize the terminal 👀 \033[0m"

echo "\033[0;34m Enabling remote login (turn on SSH in the GUI) 💻 \033[0m"
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
# disable: sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist

brew install --cask fig; sudo open -a fig

touch ~/.hushlogin

filename='../.zshrc' # Define the filename
newtext="\n\nPROMPT='⚡️%B%F{green}%1~ %%%f%b '"

echo $newtext >> $filename

exec zsh