#!/bin/bash
cd programs/

./vundle.sh
./tlp.sh

echo "⚠  🚧 🔐 Warning: generating ssh, requires human interaction"
./ssh.sh # WARNING: This requires interaction
./venv.sh # WARNING: must run after aptinstall.sh installs e.g. pip 
./vscode.sh
./docker.sh
# ./duckie.sh

# Todo list (minimalist)
touch ~/.todo

# Terminal Timer sound
cp ../../media/Computer_Magic_Microsoft.wav ~/Computer_Magic_Microsoft.wav

# Enable touch scrolling on FF 
echo "🦊 Enable touch scrolling on Firefox"
echo "MOZ_USE_XINPUT2 DEFAULT=1" | sudo tee -a /etc/security/pam_env.conf
