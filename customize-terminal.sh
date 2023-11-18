#!/usr/bin/env bash

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

mkdir -p ~/.config && touch ~/.config/starship.toml
# starship preset plain-text-symbols -o ~/.config/starship.toml

brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

cp ~/Library/Fonts/* /Library/Fonts/

newtext="osascript -e "tell application \"Terminal\" to set the font name of window 1 to \"MesloLGL Nerd Font\"""
echo $newtext >> $filename
newtext="osascript -e "tell application \"Terminal\" to set the font size of window 1 to 11""
echo $newtext >> $filename

#TODO: in VS Code, open Code > Preferences > Settings and search for terminal.integrated.fontFamily. and set the font as "MesloLGL Nerd Font"

cp vscode-settings.json $HOME/Library/Application\ Support/Code/User/settings.json

clear # or "exec zsh"