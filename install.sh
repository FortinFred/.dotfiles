#!/bin/bash

#loop on all dirs and execute install.sh if present
for dir in ./*; do
  if [ -f "$dir/install.sh" ]; then
    echo "Setting up $dir"
    pushd $dir >/dev/null
    bash install.sh
    popd >/dev/null
  fi
done
