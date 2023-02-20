#!/usr/bin/env bash

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

echo "\033[0;34m Use current directory as default search scope in Finder \033[0m"
defaults write com.apple.finder FXDefaultSearchScope -string “SCcf”

echo "\033[0;34m Enabling “Remove items from the Trash after 30 days” 🗑 \033[0m"
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

echo "\033[0;34m Showing icons for hard drives, servers, and removable media on the desktop ℹ️ \033[0m"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

killall Finder