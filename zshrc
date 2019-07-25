source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen theme steeef

###########################
#####     PLUGINS     #####
###########################

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle vi-mode
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found

antigen apply

#############################
######     ALIASES     ######
#############################

alias cb="git rev-parse --abbrev-ref HEAD"
alias vim="nvim"

# Improved git log graph alias
alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

##################################
#####     GENERAL CONFIG     #####
##################################

# Set colors correctly for vim (MAC)
# TERM="screen-256color"
export TERM="xterm-256color"

# improve responsiveness
KEYTIMEOUT=1

# Make nvim the default EDITOR
export EDITOR='nvim'

# Add bin for tldr
export PATH="$PATH:$HOME/bin"

# Man pages in nvim
export MANPAGER="nvim -c 'set ft=neoman' -"

# Fix weird non unicode characters
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Fix make target completion
autoload -U compinit && compinit
zstyle ':completion:*:*:make:*' tag-order 'targets'

export COLORTERM=truecolor

# Google workstation config
if [ "$(uname)" = "Linux" ]; then
  source $HOME/.zshrc-google
fi

