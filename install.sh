#!/bin/bash

source ./utils.sh

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
mkdir -p $XDG_CONFIG_HOME

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
