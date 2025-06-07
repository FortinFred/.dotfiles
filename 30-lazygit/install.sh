#!/bin/bash


LAZYGIT_DIR=$HOME/tools/lazygit

if [ ! -f $LAZYGIT_DIR/lazygit ]; then
  # This script installs lazygit.
  mkdir -p $LAZYGIT_DIR

  wget https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/lazygit_0.44.1_Linux_x86_64.tar.gz -O /tmp/lazygit.tar.gz
  tar -xzf /tmp/lazygit.tar.gz -C $LAZYGIT_DIR
  rm -f /tmp/lazygit.tar.gz
fi

dotfilesRC '
# Lazygit
export PATH=$PATH:$HOME/tools/lazygit
'
