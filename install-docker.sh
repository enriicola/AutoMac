#!/usr/bin/env bash

open https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module
echo -e "\033[1;31m Wait for the Docker download to be done! 🛑 \033[0m"
read -p "Press enter to continue 😬"

cd ..
ls
echo -e "\033[0;33m This next command will be a little slow 🐢\n In case of failure, you'll have to install Docker manually 🥶 \033[0m"
chmod -R 777 Downloads/Docker.dmg
hdiutil attach Downloads/Docker.dmg
cp -R "/Volumes/Docker/Docker.app" /Applications
# codesign --force --deep --sign - /Applications/Docker.app
# xattr -d -r com.apple.quarantine /Applications/Docker.app 
# chmod -R 755 /Applications/Docker.app/Contents/MacOS/Install_Visual_Studio 
# open -a /Applications/Install\ Visual\ Studio\ for\ Mac.app
hdiutil unmount /Volumes/Docker
rm /Users/enrico/Downloads/Docker.dmg