#!/usr/bin/env bash

echo "\033[0;34m Now I will customize the terminal 👀 \033[0m"

echo "\033[0;34m Enabling remote login (turn on SSH in the GUI) 💻 \033[0m"
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
# disable: sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist

brew install --cask fig; sudo open -a fig

echo "\033[0;34m Hiding the "Last login" message when opening a new terminal window 🤫 \033[0m"
touch ~/.hushlogin

brew install starship

filename='../.zshrc' # Define the filename
newtext="\nalias gp=git pull\nalias ga=git add\nalias gc=git commit\nalias gpush=git push"
echo $newtext >> $filename

# newtext="\n\nPROMPT='⚡️%B%F{green}%1~ %%%f%b '"
# echo $newtext >> $filename
newtext="\n\n# Starship prompt\n# eval \"\$(starship init zsh)\""
echo $newtext >> $filename

mkdir -p ~/.config && touch ~/.config/starship.toml
starship preset plain-text-symbols -o ~/.config/starship.toml
clear # or "exec zsh"