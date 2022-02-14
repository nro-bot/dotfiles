echo "⌨️  Installing VSCode extensions"

function install {
  name="${1}"
  code --install-extension ${name} --force
}

install ms-python.python
install ms-python.vscode-pylance
install ms-toolsai.jupyter
install ms-toolsai.jupyter-keymap
install ms-toolsai.jupyter-renderers
install ms-vscode-remote.remote-ssh
install ms-vscode-remote.remote-ssh-edit
install VisualStudioExptTeam.vscodeintellicode
install vscodevim.vim
