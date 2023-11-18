#!/bin/zsh

brew tap teamookla/speedtest
brew update
# Example how to remove conflicting or old versions using brew
# brew uninstall speedtest --force
# brew uninstall speedtest-cli --force
brew install speedtest --force