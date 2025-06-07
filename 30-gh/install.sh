#!/bin/bash

set -e

GH_VERSION="2.74.0"
GH_DIST="gh_${GH_VERSION}_linux_386"
GH_TAR="$GH_DIST.tar.gz"
TOOLS_DIR="$HOME/tools"
GH_DIR="$TOOLS_DIR/gh"

echo -e "30-gh: \033[1;93m====> Installing GitHub CLI\033[0m"

mkdir -p "$TOOLS_DIR"
rm -rf "$GH_DIR"

if wget -O "/tmp/$GH_TAR" "https://github.com/cli/cli/releases/download/v$GH_VERSION/$GH_TAR" &&
  tar -xzf "/tmp/$GH_TAR" -C "$TOOLS_DIR" &&
  mv "$TOOLS_DIR/$GH_DIST" "$GH_DIR" &&
  rm "/tmp/$GH_TAR"; then
  dotfilesRC " 
# GitHub CLI
export PATH=\"$GH_DIR/bin:$PATH\"
"
  echo -e "30-gh: \033[1;32m====> Successfully installed GitHub CLI\033[0m"
else
  echo -e "30-gh: \033[1;31m====> Failed to install GitHub CLI\033[0m"
  exit 1
fi
