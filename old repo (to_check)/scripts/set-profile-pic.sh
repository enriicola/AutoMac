#!/usr/bin/env bash

echo "\033[0;34m Setting profile picture 🤽 \033[0m"

# create an array from all images in the User Pictures subfolders
IFS=$'\n' read -rd '' -a pictures <<< "$(find '/Library/User Pictures/Fun' -name *.tif -print )"

picIndex=0

userList=$(dscl . list /Users UniqueID | awk '$2 > 500 {print $1}')
for user in $userList; do # loop through all users
 
  sudo dscl . delete "/Users/$user" JPEGPhoto # delete JPEGPhoto
  
  # update path in picture
  path="/Users/enrico/onedrive\ -\ unige.it/my_projects/autoMac_Setup/wp.jpg" #TODO change path to a generic one :)
  sudo dscl . create "/Users/$user" Picture "$path"
  
  return_value=$? #assign return value of last command to variable
  
  ((picindex++))
  if [[ $picindex -eq ${#pictures[@]} ]]; then
    picindex=0
  fi
done

# if return_value is 0, the user was found
if [[ $return_value == 0 ]]; then
  echo "\033[0;32m Profile picture set successfully 🤽 \033[0m"
else
  echo "\033[0;31m Profile picture not set 🤽 \033[0m"
fi