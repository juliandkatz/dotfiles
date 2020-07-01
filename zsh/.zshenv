# LC_ALL=en_US.UTF-8
# LANG=en_US.UTF-8

alias cb="git rev-parse --abbrev-ref HEAD"
alias vim="nvim"
alias v="vim"
alias c="clear"
alias dk="docker"
alias cat="bat"
alias ll="exa -l"
alias l="exa -la"
alias fd="fdfind"
alias vimrc="cd ~/dotfiles/nvim/.config/nvim; vim init.vim"
alias dotfiles="cd ~/dotfiles"
alias gld="gcloud"
alias szsh="source ~/.zshrc"

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

