#!/bin/bash

# This script will serve as a simple check if a variety of tools are installed
# and available on the PATH.  Hopefully one day this can be replaced with some kind
# of package manager

tools=( \
  nvim \
  tmux \
  zsh \
  docker \
  git \
  rg \
  fzf \
  bat \
  batgrep \
  kubectl \
)

header_printed=0

for t in ${tools[@]}; do
  which ${t} > /dev/null
  if [ $? -eq 1  ]; then
    if [ $header_printed -eq 0 ]; then
      printf "NOT FOUND:\n"
      header_printed=1
    fi
    printf "%s\n" ${t}
  fi
done
