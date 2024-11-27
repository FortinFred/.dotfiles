#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

mkdir -p $XDG_CONFIG_HOME
rm -f $XDG_CONFIG_HOME/tmux
ln -sf $(pwd) $XDG_CONFIG_HOME/tmux

mkdir -p $HOME/.tmux/plugins

if [ ! -d $HOME/.tmux/plugins/tpm ]; then
  git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
