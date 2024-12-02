#!/bin/bash

setupSymlink $(pwd)/.bashrc $HOME/.bashrc
setupSymlink $(pwd)/.zshrc $HOME/.zshrc

dotfilesRC '
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
'
