#!/bin/bash

./symlink_dotfiles.sh
./aptinstall.sh
./setup_programs.sh
./gnome_settings.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
echo "Remember to add ssh key to github. And go to gedit>preferences>plugins"
echo "Edit vimrc to molokai colorscheme"
source ~/.bashrc

# Fun hello
figlet "... and we're back!" | lolcat
