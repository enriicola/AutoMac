#!/usr/bin/env zsh
##############################
# brew install cirruslabs/cli/tart
# tart clone ghcr.io/cirruslabs/macos-sonoma-base:latest sonoma-base
# tart run sonoma-base
##############################

# TODO setta tutte le preferenze di sistema finder, safari, etc con la registrazione di automator
# +
# TODO manda notifica che dica di eseguire quel workflow dall’interno a 10x
# i.e.:
# echo -e "\033[1;31m First thing first: sending alert to execute automator workflow (at 10x) while the script keep running \033[0m"
# alert "launch the app $name from Automator at 10x velocity to set some preferences across sys, safari and finder"

# osascript -e 'display dialog "hello world"' 

# echo prima
# osascript -e 'display alert "hello world"' & 
# echo dopo

# osascript -e 'display notification "hello world!" with title "Title" subtitle "Subtitle"'

# osascript -e 'tell application "Script Editor" to quit'

# defaults write com.apple.notificationcenterui bannerTime 12 # default 5
# # killall cfprefsd # bisogna fare logout e login per applicare modifiche :/
# # killall NotificationCenter
# osascript -e 'display notification "scarica subito tutti i file di onedrive"'


# echo "tell application \"System Events\" to keystroke \"ù\" using {command down} " | osascript

# https://github.com/jacobsalmela/tccutil

# sudo tccutil.py --list
# sudo tccutil --list
# sudo tccutil.py -i /usr/bin/osascript
# sudo tccutil -i /usr/bin/osascript
# sudo tccutil.py --enable com.apple.Terminal
# sudo tccutil --enable com.apple.Terminal


# sudo osascript -e 'tell application "System Events" 
# keystroke "ù" using {command down} 
# end tell'

# ------------------------------------------------------------------------------------------------------------


# osascript set_pointer_speed.scpt 2.5

# osascript - "$1" "$2" "$3" <<END                                                                                                        
# on run argv                                                                                                                       
#     set stringedAll to date (item 2 of argv & " " & item 3 of argv)                                                               
#     tell application "Reminders"                                                                                                  
#         make new reminder with properties {name:item 1 of argv, due date:stringedAll}                                             
#     end tell                                                                                                                      
# end run                                                                                                                           
# END

# ------------------------------------------------------------------------------------------------------------

sh hello.s 2> error.log
# cat error.log


last_command=$(tail -n 1 ~/.zsh_history)
echo "The last command executed was: $last_command"


# :)


# CHEATSHEET:
# killall -KILL NotificationCenter
# killall -KILL SystemUIServer #menubar
# killall -KILL Dock
# killall -KILL Finder
# killall Spotlight

# defaults read com.apple.Siri

# /Library/Preferences/ByHost/com.apple.controlcenter.$hostId