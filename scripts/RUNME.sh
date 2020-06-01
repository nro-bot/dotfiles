#!/bin/bash

./symlink_dotfiles.sh
./aptinstall.sh
./setup_programs.sh
./gnome_settings.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
echo "Remember to add ssh key to github. And go to gedit>preferences>plugins to enable font rescaling"
echo "Edit vimrc to use molokai colorscheme"
echo "Edit gnome-termianl preferences > profile > unamed > built-in schemes > grey on black"
echo "Now gnome extensions: enable Gtile (no changes), vitals (check load and cpu usage)"
echo "dash to panel (panel top, taskbar left with fixed center plugin, clock right of plugin icons)"
gnome-shell-extension-prefs
source ~/.bashrc

# Fun hello
figlet "... and we're back!" | lolcat
