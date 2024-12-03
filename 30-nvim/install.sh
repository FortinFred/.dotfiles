#!/bin/bash
setupSymlink $(pwd) $XDG_CONFIG_HOME/nvim

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O /tmp/neovim.tar.xz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/
sudo tar -C /opt/ -xzf /tmp/neovim.tar.xz
rm /tmp/neovim.tar.xz

dotfilesRC '
# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
'
