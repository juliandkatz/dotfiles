#!/bin/bash

# This script will serve as a simple check if a variety of tools are installed
# and available on the PATH.  Hopefully one day this can be replaced with some kind
# of package manager

tools=( \
  stow \
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
  gopls \
  bash-language-server \
  tldr \
  reattach-to-user-namespace \
  exa \
  yarn \
  node \
  npm \
  shellcheck \
  shfmt \
  nix \
)

header_printed=0

for t in "${tools[@]}"
do
  which "${t}" > /dev/null
  if [ "${?}" -eq 1  ]; then
    if [ "${header_printed}" -eq 0 ]; then
      printf "\nNOT FOUND:\n"
      header_printed=1
    fi
    printf "%s\n" "${t}"
  fi
done
