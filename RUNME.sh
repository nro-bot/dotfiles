#!/bin/bash

./scripts/symlink_dotfiles.sh
./scripts/aptinstall.sh
./scripts/setup_programs.sh
./scripts/gnome_settings.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
source ~/.bashrc

# Fun hello
figlet "... and we're back!" | lolcat
