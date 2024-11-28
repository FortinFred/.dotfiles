#!/bin/bash

curl -sS https://starship.rs/install.sh | sh

setupSymlink $(pwd)/starship.toml $XDG_CONFIG_HOME/starship.toml
