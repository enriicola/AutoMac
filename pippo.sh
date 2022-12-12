cd
ls

open https://aka.ms/vs/mac/download
echo -e "\033[1;31m Wait for the VS download to be done! 🛑 \033[0m"
read -p "Press enter to continue 😬"

echo -e "\033[0;33m This next command will be a little slow 🐢\n In case of failure, you'll have to install VS manually 🥶 \033[0m"
hdiutil mount /Users/enrico/Downloads/visualstudioformacinstaller-*.dmg

# open -W  Downloads/visualstudioformacinstaller-*.dmg # less fun alternative
sudo cp -R "/Volumes/Visual Studio for Mac Installer/Install Visual Studio for Mac.app" /Applications
sudo codesign --force --deep --sign - /Applications/Install\ Visual\ Studio\ for\ Mac.app
sudo xattr -d -r com.apple.quarantine /Applications/Install\ Visual\ Studio\ for\ Mac.app 
sudo chmod -R 755 /Applications/Install\ Visual\ Studio\ for\ Mac.app/Contents/MacOS/Install_Visual_Studio 
sudo open -a /Applications/Install\ Visual\ Studio\ for\ Mac.app

hdiutil unmount /Volumes/Visual\ Studio\ for\ Mac\ Installer
# rm /Users/enrico/Downloads/visualstudioformacinstaller-*.dmg

echo "--- less fun alternative ---"
open -W  Downloads/visualstudioformacinstaller-*.dmg # less fun alternative