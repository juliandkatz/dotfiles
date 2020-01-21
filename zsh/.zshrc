if [[ ! -e $HOME/antigen.zsh ]]; then
	curl -L git.io/antigen > antigen.zsh
fi

source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k

###########################
#####     PLUGINS     #####
###########################

antigen bundle git
antigen bundle vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle fzf
antigen bundle zdharma/zsh-diff-so-fancy
antigen bundle djui/alias-tips # Provides reminders of available aliases
# antigen bundle extract # provides a function "extract" that can extract many filetypes

antigen apply

###### PLUGIN CONFIG ######

# fix slow pasting with fast-syntax-highlight 
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

#############################
######     ALIASES     ######
#############################

alias cb="git rev-parse --abbrev-ref HEAD"
alias vim="nvim"
alias v="vim"
alias c="clear"
alias dk="docker"
alias cat="bat"

alias dev="cd ${HOME}/dev"

# Improved git log graph alias
alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"

# pull and rebase
alias gpmr="git pull origin master --rebase"
alias gdno="git diff --name-only"
alias gcho="git branch | fzf | xargs -I {} git checkout {}"
alias gchod="git branch | fzf | xargs -I {} git branch -D {}"

# variables for faster kubectl
alias k="kubectl"
alias kls="kubectl config get-contexts"
alias kaf="kubectl apply -f"

# tmux
alias tm="tmux"
alias tma="tmux attach -t"
alias tmd="tmux detach"
alias tmls="tmux ls"
alias tmn="tmux new -s"
alias tmks="tmux kill-session -t"
alias tms="tmux switch -t"
alias tmkw="tmux kill-window"

##################################
#####     GENERAL CONFIG     #####
##################################

# Set colors correctly for vim (MAC)
# TERM="screen-256color"
# export TERM="xterm-256color"

# improve responsiveness
KEYTIMEOUT=1

# Make nvim the default EDITOR
export EDITOR='nvim'

# Add bin for tldr
export PATH="$HOME/bin:$PATH"

# Fix weird non unicode characters
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Fix make target completion
autoload -U compinit && compinit
zstyle ':completion:*:*:make:*' tag-order 'targets'

# export COLORTERM=truecolor

# Somehow this improves autocomplete
zstyle ':completion:*' users root $USER

export PATH="$PATH:${HOME}/.cargo/bin"

export BAT_THEME="Monokai Extended Origin"

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

#######################
#####     FZF     #####
#######################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# only store unique commands in the history... improves fzf Ctrl-R
setopt HIST_IGNORE_ALL_DUPS

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Google workstation config
if [[ -e $HOME/.zshrc-google ]]; then
  source $HOME/.zshrc-google
else
  source $HOME/.zshrc-personal
fi
