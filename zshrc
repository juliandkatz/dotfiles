source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen theme romkatv/powerlevel10k

###########################
#####     PLUGINS     #####
###########################

antigen bundle git
antigen bundle vi-mode
# antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle fzf

antigen apply

###### PLUGIN CONFIG ######

# fix slow pasting with fast-syntax-highlight 
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

#############################
######     ALIASES     ######
#############################

alias cb="git rev-parse --abbrev-ref HEAD"
alias vim="nvim"

# Improved git log graph alias
alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# pull and rebase
alias gpmr="git pull origin master --rebase"

# variables for faster kubectl
alias k="kubectl"
alias kls="kubectl config get-contexts"

# tmux
alias tma="tmux attach -t"
alias tmd="tmux detach"
alias tmls="tmux ls"
alias tmn="tmux new -s"
alias tmks="tmux kill-session -t"

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
# zstyle ':completion:*:make:*:targets' call-command true

export COLORTERM=truecolor

# Google workstation config
if [ "$(uname)" = "Linux" ]; then
  source $HOME/.zshrc-google
else
  source $HOME/.zshrc-personal
fi

source /usr/share/google-cloud-sdk/completion.zsh.inc


##################################
#####     AUTOCOMPLETION     #####
##################################

### KUBECTL ###

kubectl () {
    command kubectl $*
    if [[ -z $KUBECTL_COMPLETE ]]
    then
        source <(command kubectl completion zsh)
        KUBECTL_COMPLETE=1 
    fi
}

### GCLOUD ###

gcloud () {
    command gcloud $*
    if [[ -z $GCLOUD_COMPLETE ]]
    then
        source /usr/share/google-cloud-sdk/completion.zsh.inc
        GCLOUD_COMPLETE=1 
    fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
