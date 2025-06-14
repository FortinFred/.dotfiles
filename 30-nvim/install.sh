#!/bin/bash
symlink $(pwd) $XDG_CONFIG_HOME/nvim

installNvim() {
  if command -v dnf &>/dev/null; then
    sudo dnf install -y gcc fd-find ripgrep fzf make
  elif command -v apt &>/dev/null; then
    sudo apt install -y gcc fd-find ripgrep fzf make
  fi

  npm install -g neovim

  wget https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.tar.gz -O /tmp/neovim.tar.xz
  sudo mkdir -p /opt/
  sudo tar -C /opt/ -xzf /tmp/neovim.tar.xz
  rm /tmp/neovim.tar.xz
}

installNvim

dotfilesRC '
# nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
'
