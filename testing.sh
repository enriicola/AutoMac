#!/bin/bash

# TODO testa my-automated-mac-setup copiando ed incollando un pezzo alla volta

# https://youtube.com/watch?v=TlT7xjM01k8&feature=share

# file="/System/Library/Desktop Pictures/Catalina.madesktop"
# defaults write com.apple.desktop Background '{default = {ImageFilePath = "/System/Library/Desktop Pictures/Catalina.madesktop";};}'

# funziona, ma non è dynamic...
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/enrico/Downloads/pippo.jpg"'