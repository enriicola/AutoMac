#!/usr/bin/env bash
##!/bin/sh

echo "\033[0;34m Setting profile picture 🤽 \033[0m"

# create an array from all images in the User Pictures subfolders

IFS=$'\n' read -rd '' -a pictures <<< "$(find '/Library/User Pictures/Fun' -name *.tif -print )"

# loop through all users

picIndex=0

userList=$(dscl . list /Users UniqueID | awk '$2 > 500 {print $1}')
for user in $userList; do
  # delete JPEGPhoto
  dscl . delete "/Users/$user" JPEGPhoto
  
  # update path in picture
  dscl . create "/Users/$user" Picture "/Users/enrico/automated-macos-setup/wp.jpeg"
  
  ((picindex++))
  if [[ $picindex -eq ${#pictures[@]} ]]; then
    picindex=0
  fi
done
echo "\033[0;34m Done \033[0m"