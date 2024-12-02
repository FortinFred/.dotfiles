#!/bin/bash

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
mkdir -p $XDG_CONFIG_HOME

function setupSymlink() {
  source=$1
  dest=$2
  rm -f $2
  ln -sf $1 $2
}

export -f setupSymlink

function dotfilesRC() {
  # append all params to .dotfilesrc
  echo "$@" >>$HOME/.dotfilesrc
}

export -f dotfilesRC

function main() {
  echo "Clear ~/.dotfilesrc"
  echo "" >$HOME/.dotfilesrc

  #loop on all dirs and execute install.sh if present
  for dir in ./*; do
    if [ -f "$dir/install.sh" ]; then
      echo "Setting up $dir"
      pushd $dir >/dev/null
      bash install.sh
      popd >/dev/null
    fi
  done
}

main
