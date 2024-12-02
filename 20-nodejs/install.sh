#!/bin/bash
NODEJS_DIR=/usr/local/lib/node/

if [ ! -d "$NODEJS_DIR" ]; then
  sudo mkdir -p $NODEJS_DIR
  wget https://nodejs.org/dist/v20.18.1/node-v20.18.1-linux-x64.tar.xz -O /tmp/nodejs.tar.xz
  sudo tar -C $NODEJS_DIR --strip-components=1 -xvf /tmp/nodejs.tar.gz
  rm -f /tmp/nodejs.tar.gz

  sudo ln -s /usr/local/lib/node/bin/node /usr/local/bin/node
  sudo ln -s /usr/local/lib/node/bin/npm /usr/local/bin/npm
fi
