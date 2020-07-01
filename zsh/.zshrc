# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###########################
#####     PLUGINS     #####
###########################

source ~/.zplug/init.zsh

zplug 'romkatv/powerlevel10k', as:theme, depth:1

# zplug mafredri/zsh-async, from:github

# oh-my-zsh specific
zplug "plugins/git",       from:oh-my-zsh
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "plugins/fzf",       from:oh-my-zsh
zplug "lib/history",       from:oh-my-zsh
zplug "lib/directories",   from:oh-my-zsh
zplug "lib/completion",    from:oh-my-zsh
# zplug "lib/clipboard",     from:oh-my-zsh  -- maybe this will help at some point

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zdharma/zsh-diff-so-fancy"
zplug "djui/alias-tips"

zplug load

#####################################
#####    SHELL CONFIGURATION    #####
#####################################

# Make filesystem navigation more like oh-my-zsh
setopt autocd autopushd

# I've had pasting problems in the past.  This has fixed before
## fix slow pasting with fast-syntax-highlight
#zstyle ':bracketed-paste-magic' active-widgets '.self-*'
#printf "\e[?2004l" # can fix bracketed paste something?

# improve responsiveness
# KEYTIMEOUT=1

# Make nvim the default EDITOR
export EDITOR='nvim'

# Add bin for tldr
export PATH="$HOME/bin:$PATH"

# Fix weird non unicode characters
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Fix make target completion
# autoload -U compinit && compinit
# zstyle ':completion:*:*:make:*' tag-order 'targets'

# Somehow this improves autocomplete
#zstyle ':completion:*' users root $USER

export PATH="$PATH:${HOME}/.cargo/bin"

export BAT_THEME="Monokai Extended Origin"

#############################
######     ALIASES     ######
#############################

alias cb="git rev-parse --abbrev-ref HEAD"
alias vim="nvim"
alias v="vim"
alias c="clear"
alias dk="docker"
alias cat-basic="cat"
alias cat="bat"
alias ll="exa -l"
alias l="exa -la"
alias fd="fdfind"
alias vimrc="cd ~/dotfiles/nvim/.config/nvim; vim init.vim"
alias dotfiles="cd ~/dotfiles"

alias dev="cd ${HOME}/dev"

# Improved git log graph alias
alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"

alias gpmr="git pull origin master --rebase"
alias gdno="git --no-pager diff --name-only"
alias gcho="git branch | fzf | xargs -I {} git checkout {}"
alias gchod="git branch | fzf | xargs -I {} git branch -D {}"
alias gcfd="git clean -fd"
alias gft="git fetch --tags"
alias gl="git log"

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

### GCLOUD ###
aws () {
    command aws $*
    if [[ -z $AWS_CLI_COMPLETE ]]
    then
        source ${HOME}/.local/bin/aws_zsh_completer.sh
        AWS_CLI_COMPLETE=1
    fi
}

#######################
#####     FZF     #####
#######################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# only store unique commands in the history... improves fzf Ctrl-R
setopt HIST_IGNORE_ALL_DUPS

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

############################
#####     SOURCING     #####
############################

# Google workstation config
if [[ -e $HOME/.zshrc-google ]]; then
  source $HOME/.zshrc-google
else
  source $HOME/.zshrc-personal
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
