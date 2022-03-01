#!/bin/bash

echo "📝 Installing VSCode extensions"

function vsinstall {
  name="${1}"
  code --install-extension ${name} --force
}

vsinstall ms-python.python
vsinstall ms-python.vscode-pylance
vsinstall ms-toolsai.jupyter
vsinstall ms-toolsai.jupyter-keymap
vsinstall ms-toolsai.jupyter-renderers
vsinstall ms-vscode-remote.remote-ssh
vsinstall ms-vscode-remote.remote-ssh-edit
vsinstall VisualStudioExptTeam.vscodeintellicode
vsinstall vscodevim.vim

function linkSettingsfile {
  dest="${HOME}/.config/Code/User/settings.json"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h "${dest}" ]; then
    # Existing symlink
    echo "Removing existing file: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  fi

  echo "Creating new symlink: ${dest}"
  #ln -s ${pwd}/vscode_settings.json ${dest} 
  cp ./vscode_settings.json ${dest} 
}

echo "🔗 Linking VS Code settings file"

linkSettingsfile
