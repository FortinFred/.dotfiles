#!/bin/bash
symlink $(pwd) $XDG_CONFIG_HOME/nvim

installNvim() {
  if command -v dnf &>/dev/null; then
    sudo dnf install -y gcc fd-find ripgrep
  elif command -v apt &>/dev/null; then
    sudo apt install -y gcc fd-find ripgrep
  fi

  npm install -g neovim

  wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O /tmp/neovim.tar.xz
  sudo rm -rf /opt/nvim-linux64
  sudo mkdir -p /opt/
  sudo tar -C /opt/ -xzf /tmp/neovim.tar.xz
  rm /tmp/neovim.tar.xz
}

installNvim
dotfilesRC '
# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
'
