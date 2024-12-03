#!/bin/bash

function dotfilesRC() {
  # append all params to .dotfilesrc
  echo "$@" >>$HOME/.dotfilesrc
}

function setupSymlink() {
  source=$1
  dest=$2
  rm -f $2
  ln -sf $1 $2
}

export -f dotfilesRC setupSymlink
