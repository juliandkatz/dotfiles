#!/bin/bash

if ! command -v stow > /dev/null; then
  printf "Stow not found on path.  Install then try again.\n"
  exit 1
fi

for i in $(ls -d */); do
  stow ${i%%/}
done

