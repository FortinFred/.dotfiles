#!/bin/bash

installTmp() {
  mkdir -p $HOME/.tmux/plugins

  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    git -c http.sslVerify=false clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  else
    cd $HOME/.tmux/plugins/tpm && git pull --ff-only
  fi
}

symlink $(pwd) $XDG_CONFIG_HOME/tmux
installTmp
