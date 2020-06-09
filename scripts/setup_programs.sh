#!/bin/bash

cd program_settings/

./vundle.sh
echo "Warning: generating ssh, requires human interaction"
./ssh.sh # WARNING: This requires interaction
./venv.sh # WARNING: must run after aptinstall.sh installs e.g. pip 

# Todo list (minimalist)
touch ~/.todo

# Terminal Timer sound
cp ../media/Computer_Magic_Microsoft.wav ~/Computer_Magic_Microsoft.wav
