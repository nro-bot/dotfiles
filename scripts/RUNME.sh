#!/bin/bash

./symlink_dotfiles.sh
./aptinstall.sh
./setup_programs.sh

# Get all upgrades
sudo apt upgrade -y

echo "!-------- Final Instructions -----!"
# See our bash changes
echo "Remember to add ssh key to github. And go to gedit>preferences>plugins to enable font rescaling"
echo "Edit gnome-termianl preferences > profile > unamed > built-in schemes > grey on black"
echo "Now gnome extensions: enable Gtile (no changes), vitals (check load and cpu usage)"
echo "dash to panel (panel top, taskbar left with fixed center plugin, clock right of plugin icons)"
echo "!-------- END -----!"

gnome-shell-extension-prefs

source ~/.bashrc # requires `bash RUNME.sh` instead of `sh RUNME.sh`

# Fun hello
figlet "... and we're back!" | lolcat

# note: issues with sudo? try chmod  0440  /etc/sudoers
