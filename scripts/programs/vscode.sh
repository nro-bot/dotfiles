echo "⌨️  Installing VSCode extensions"

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
