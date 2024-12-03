#!/bin/bash
NODEJS_DIR=/usr/local/lib/node/

sudo rm -rf $NODEJS_DIR
sudo mkdir -p $NODEJS_DIR
wget https://nodejs.org/dist/v20.18.1/node-v20.18.1-linux-x64.tar.xz -O /tmp/nodejs.tar.xz
sudo tar -C $NODEJS_DIR --strip-components=1 -xvf /tmp/nodejs.tar.xz
rm -f /tmp/nodejs.tar.xz

sudo ln -s $NODEJS_DIR/bin/node /usr/local/bin/node
sudo ln -s $NODEJS_DIR/bin/npm /usr/local/bin/npm
sudo ln -s $NODEJS_DIR/bin/npx /usr/local/bin/npx

npm config set prefix "~/.npm-global"

dotfilesRC '
#npm 
export PATH="$PATH:~/.npm-global/bin"
'
