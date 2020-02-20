#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
#install chromium-browser
install curl
install exfat-utils
install file
install git
install htop
install nmap
install openvpn
install tmux
#install vim-gnome
install exuberant-ctags
install tree
install autojump

# Latest vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
install vim

# Image processing
install jpegoptim
install optipng

# Media
install gimp
install inkscape
install ffmpeg

# Fun stuff
install figlet
install toilet
install lolcat

# TerminalTimer
install festival
install sox

# Save thinkpad laptop battery
# install tlp
# sudo tlp setcharge 70 80 BAT0

# Python
install python3-venv
install python3-pip

# Snaps
install snapd
sudo snap install code --classic
#sudo snap install


# Data science 
install python-numpy
install python-scipy
install python-matplotlib
install ipython
install jupyter
install python-pandas 
#python-sympy python-nose spyder


# Blog
# sudo snap install node --classic --channel=12
# npm install hexo-cli -g

# Settings
install dconf-editor

# Chinese
install fcitx-googlepinyin


