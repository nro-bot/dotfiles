#!/bin/bash

# Set up the desktop
#gsettings set org.gnome.desktop.wm.keybindings maximize-vertically "['<Alt>v']"
#gsettings set org.gnome.desktop.wm.keybindings maximize-horizontally "['<Alt>h']"
#gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '<Shift><Alt>t'
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 23.0
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 6.0
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.screensaver lock-delay 60
gsettings set org.gnome.desktop.screensaver show-notifications false
#gsettings set org.gnome.shell.overrides dynamic-workspaces true
#gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
#gsettings set org.gnome.mutter dynamic-workspaces true
#gsettings set org.gnome.mutter workspaces-only-on-primary false


# GNOME Extensions
# https://extensions.gnome.org/#
mkdir -p ~/.local/share/gnome-shell/extensions

# move bar to bottom
sudo apt install -y gnome-tweaks chrome-gnome-shell
git clone https://github.com/home-sweet-gnome/dash-to-panel.git panel
cd panel && make install
cd ..
rm -rf panel
gnome-extensions install dash-to-panel
gnome-extensions enable dash-to-panel

git clone https://github.com/gTile/gTile.git ~/.local/share/gnome-shell/extensions/gTile@vibou
gnome-extensions enable gTile

# git clone https://github.com/roberth-k/gnome-shell-extension-battery_status.git 
# cd gnome-shell-extension-battery_status
# mv battery_status@milliburn.github.com
# ~/.local/share/gnome-shell/extensions/battery_status@milliburn.github.com
# cd ..
# rm -rf gnome-shell-extension-battery_status
# gnome-extensions -e battery_status


sudo apt install lm-sensors
git clone https://github.com/corecoding/Vitals.git ~/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com
gnome-extensions enable Vitals@CoreCoding.com


# Now do the pretty stuff (`gsettings list-recursively` for all)
#gsettings set org.gnome.shell favorite-apps "['ubiquity.desktop']"
#gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
#gsettings set org.gnome.desktop.interface icon-theme 'ubuntu-mono-dark'
#gsettings set org.gnome.desktop.wm.preferences theme 'Adwaita-dark'
#gsettings set org.gnome.desktop.background show-desktop-icons false
#gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
#gsettings set org.gnome.shell.extensions.desktop-icons show-home false
#gsettings set org.gnome.desktop.background picture-options 'spanned'
#cp ../img/desktop.jpg ~/desktop.jpg
#cp ../img/lock.jpg ~/lock.jpg
#gsettings set org.gnome.desktop.background picture-uri 'file:///home/v/desktop.jpg'
#gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/v/lock.jpg'

gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'  #hover focuses window
gsettings set org.gnome.desktop.default-applications.terminal exec terminator # gnome-terminal
