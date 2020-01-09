#!/bin/bash

cd programs/

./vundle.sh
./tlp.sh
echo "Warning: generating ssh, requires human interaction"
./ssh.sh # WARNING: This requires interaction
./venv.sh # WARNING: must run after aptinstall.sh installs e.g. pip 

