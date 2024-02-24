#!/usr/bin/env bash

# TODO create a github personal website and add a sh to it, in order to execute it via curl ... | sh
# TODO https://github.com/sbmpost/AutoRaise/edit/master/AutoRaise.dmg :)

echo "\033[0;34m Installing Homebrew! 🍺 \033[0m"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#TODO: check if brew is already installed

#TODO: install everything with brew bundle :)

echo "\033[0;34m Installing all the other apps i need (also I'll open them to setup some preferences) 💻🖥 \033[0m"
brew install --cask onedrive; sudo open -a onedrive
# TODO "scarica subito tutti i file di onedrive"=on
osascript -e 'display notification "Manual settings: setta onedrive per scaricare subito tutti i file"'

brew install --cask aldente; sudo open -a aldente
# TODO controllare che mas funzioni e accedere all'app store
brew install mas # Mac App Store command-line interface
mas upgrade # just to be sure :)

# mas install 823766827 || mas upgrade 823766827; open -a onedrive                   # onedrive https://apps.apple.com/it/app/onedrive/id823766827?mt=12

mas install 1459809092 || mas upgrade 1459809092; open -a accelerate                # accelerate https://apps.apple.com/us/app/accelerate-for-safari/id1459809092 
mas install 1421915518 || mas upgrade 1421915518; open -a piper                     # piper https://apps.apple.com/it/app/piper/id1421915518?mt=12
mas install 993753145 || mas upgrade 993753145; open -a enki                        # enki https://apps.apple.com/it/app/enki-learn-coding-programming/id993753145
mas install 674984916 || mas upgrade 674984916; open -a etoro                       # etoro https://apps.apple.com/il/app/etoro-trade-stocks-crypto/id674984916
# mas install 1561604170 || mas upgrade 1561604170; open -a nigthshift                # nightshift https://apps.apple.com/it/app/nightshift-dark-mode/id1561604170?mt=12
# TODO script to install dark reader
mas install 409201541 || mas upgrade 409201541; open -a pages                       # pages https://apps.apple.com/it/app/pages/id409201541?mt=12
mas install 409183694 || mas upgrade 409183694; open -a keynote                     # keynote https://apps.apple.com/it/app/keynote/id409183694?mt=12
mas install 409203825 || mas upgrade 409203825; open -a numbers                     # numbers https://apps.apple.com/it/app/numbers/id409203825?mt=12
mas install 595191960 || mas upgrade 595191960; open -a copyclip                    # copyclip https://apps.apple.com/us/app/copyclip-clipboard-history/id595191960?mt=12
mas install 1614659226 || mas upgrade 1614659226; open -a virtualos                 # virtualos https://apps.apple.com/it/app/virtualos/id1614659226?mt=12
mas install 1436953057 || mas upgrade 1436953057; open -a Ghostery\ –\ Privacy\ Ad\ Blocker.app
mas install 1432731683 || mas upgrade 1432731683; open -a adblockplus               # https://apps.apple.com/it/app/adblock-plus-for-safari-abp/id1432731683?l=en-GB&mt=12
echo "\033[0;34m If all apps are installed by now...open them to setup some preferences 🔩 \033[0m"
# TODO: https://github.com/hadig/Focus-for-Youtube/releases/tag/v1.1



# open -a pages; open -a keynote; open -a numbers



# TODO: check termional docker download and install -> curl -sSL https://get.docker.com/ | sh
git config --global user.email "enrico.pezzano@outlook.it"
git config --global user.name "EnricoPezzano"
brew install gh

brew install node
brew install neovim
echo "\033[0;34m Installing neovim plugins 📝 \033[0m"
git clone https://github.com/github/copilot.vim.git \~/.config/nvim/pack/github/start/copilot.vim
echo "\033[0;34m Start Neovim and invoke ":Copilot setup" ✅ \033[0m"
nvim

brew install --cask microsoft-teams; 
# rename to Microsoft Teams.app using regular expression
sudo mv /Applications/Microsoft\ Teams* /Applications/Microsoft\ Teams.app; sudo open -a "Microsoft Teams"

brew install bat
brew install jupyterlab
brew install --cask multipass # https://multipass.run/download/macos
brew install --cask hush; sudo open -a hush
brew install --cask cookie; sudo open -a cookie
brew install --cask amethyst; sudo open -a amethyst
brew install --cask whatsapp; sudo open -a whatsapp
brew install --cask telegram; sudo open -a telegram
brew install --cask adguard-vpn; sudo open -a "adguard vpn"
brew install --cask iterm2; sudo open -a iterm2
brew install --cask rectangle; sudo open -a rectangle
brew install tag
brew install fzf
brew install pandoc
brew install tccutil # https://github.com/jacobsalmela/tccutil

# brew install python #-tk@3.9
# brew install python-tk@3.9
# sudo ln -s /usr/bin/python3 /usr/local/bin/python

brew install --cask dotnet
brew install htop
brew install tree
brew install --cask google-chrome; sudo open -a "Google Chrome" 
brew install --cask chromedriver
brew install --cask brave-browser
brew install --cask opera
brew install --cask mamp; rm -rf /Applications/MAMP\ PRO.app; sudo open -a mamp
brew install --cask visual-paradigm-ce; sudo open -a "visual paradigm ce"
brew install --cask utm; sudo open -a utm
brew install --cask mactex
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
brew install --cask lunar; sudo open -a lunar
brew install maven
brew install --cask handbrake; sudo open -a handbrake
brew install --cask spotify; sudo open -a spotify
brew install --cask the-unarchiver; sudo open -a "the unarchiver"
# brew install --cask visual-studio; sudo open -a "visual studio"
# TODO: check if it is the correct way to do it -> brew install --cask oracle-jdk-javadoc
brew install blacktop/tap/lporg # https://github.com/blacktop/lporg organize launchpad
brew install docker
brew install --cask docker; sudo open -a Docker

sh customize-terminal.sh

xcode-select --install
sudo xcodebuild -license

brew upgrade # just to be sure :)
brew cleanup

echo "\033[0;34m Installing rust 🦀 \033[0m"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh