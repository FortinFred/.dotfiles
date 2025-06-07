#!/bin/bash

source ./utils.sh

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
mkdir -p $XDG_CONFIG_HOME

function main() {
  PACKAGE=${1:-*}

  echo "Clear ~/.dotfilesrc"
  echo "" >$HOME/.dotfilesrc

  for dir in ./$PACKAGE; do
    if [ -f "$dir/uninstall.sh" ]; then
      echo "Uninstalling $dir"
      pushd $dir >/dev/null
      bash uninstall.sh
      popd >/dev/null
    fi
  done

  #loop on all dirs and execute install.sh if present
  for dir in ./$PACKAGE; do
    if [ -f "$dir/install.sh" ]; then
      echo "Setting up $dir"
      pushd $dir >/dev/null
      bash install.sh
      popd >/dev/null
    fi
  done
}

main $1
