#!/bin/bash

installTmp() {
  mkdir -p $HOME/.tmux/plugins

  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
}

setupSymlink $(pwd) $XDG_CONFIG_HOME/tmux
installTmp
