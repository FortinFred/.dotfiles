#!/bin/bash
setupSymlink $(pwd) $XDG_CONFIG_HOME/nvim

dotfilesRC '
# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
'
