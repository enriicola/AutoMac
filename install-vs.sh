#!/usr/bin/env bash
##!/bin/sh

open https://aka.ms/vs/mac/download
echo -e "\033[1;31m Wait for the Visual Studio download to be done! 🛑 \033[0m"
read -p "Press enter to continue 😬"

cd ..
ls
echo -e "\033[0;33m This next command will be a little slow 🐢\n In case of failure, you'll have to install VS manually 🥶 \033[0m"
chmod -R 777 Downloads/visualstudioformacinstaller-*.dmg
hdiutil attach Downloads/visualstudioformacinstaller-*.dmg
cp -R "/Volumes/Visual Studio for Mac Installer/Install Visual Studio for Mac.app" /Applications
codesign --force --deep --sign - /Applications/Install\ Visual\ Studio\ for\ Mac.app
xattr -d -r com.apple.quarantine /Applications/Install\ Visual\ Studio\ for\ Mac.app 
chmod -R 755 /Applications/Install\ Visual\ Studio\ for\ Mac.app/Contents/MacOS/Install_Visual_Studio 
open -a /Applications/Install\ Visual\ Studio\ for\ Mac.app
hdiutil unmount /Volumes/Visual\ Studio\ for\ Mac\ Installer
rm /Users/enrico/Downloads/visualstudioformacinstaller-*.dmg