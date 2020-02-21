#!/bin/bash

./symlink_dotfiles.sh
./aptinstall.sh
./setup_programs.sh
./gnome_settings.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
source ~/.bashrc

# Fun hello
figlet "... and we're back!" | lolcat
