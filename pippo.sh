cd ~
ls
echo -e "\033[0;33m This next command will be a little slow 🐢\n In case of failure, you'll have to install VS manually 🥶 \033[0m"
RETURN=$(hdiutil attach Downloads/visualstudioformacinstaller-*.dmg)
echo "debug"
echo $RETURN
echo "gubed"
# open -W  Downloads/visualstudioformacinstaller-*.dmg # less fun alternative
sudo cp -R "/Volumes/Visual Studio for Mac Installer/Install Visual Studio for Mac.app" /Applications
sudo codesign --force --deep --sign - /Applications/Install\ Visual\ Studio\ for\ Mac.app
sudo xattr -d -r com.apple.quarantine /Applications/Install\ Visual\ Studio\ for\ Mac.app 
sudo chmod -R 755 /Applications/Install\ Visual\ Studio\ for\ Mac.app/Contents/MacOS/Install_Visual_Studio 
sudo open -a /Applications/Install\ Visual\ Studio\ for\ Mac.app
# To instead install a .pkg, use this command:
# sudo installer -package /path/to/package -target "/Volumes/Macintosh HD"
hdiutil unmount /Volumes/Visual\ Studio\ for\ Mac\ Installer



# rm Downloads/visualstudioformacinstaller-*.dmg