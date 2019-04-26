# zmodload zsh/zprof
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
KEYTIMEOUT=1

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode vagrant)

####################################
######   USER CONFIGURATION   ######
####################################

source $ZSH/oh-my-zsh.sh

# Set colors correctly for vim
TERM="screen-256color"

# improve git autocomplete
# __git_files () { 
#     _wanted files expl 'local files' _files  }
#
# # Set command line to vi mode
set -o vi
#
# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
#
# #########################
# ######   ALIASES   ######
# #########################
#
# alias findn="find . -iname"
# alias weather="curl http://wttr.in/"
# alias mytime="node $HOME/personalDev/my-scripts/get-time.js"
# alias help="run-help"
# alias cb="git rev-parse --abbrev-ref HEAD"
alias vim="nvim"
alias vag="vagrant"

#
# alias set_train="export AWS_PROFILE=training"
#
# # Improved git log graph alias
# alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
#
# ###########################################
# ######   LANGUAGE AND PATH OPTIONS   ######
# ###########################################
#
# #######OLD AND BROKEN# export PATH="$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:$HOME/.rvm/bin:$HOME/.config/nvim/plugged/vim-superman/bin"
# export PATH="/usr/local/bin:$PATH" # for homebrew
# #
# ##### PYTHON/PYENV #####
# export PYENV_ROOT="$HOME/.pyenv"
# export PYENV_VERSION="3.6.5"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
#
###### NODE ######
# Setup for nvm
if [[ ! -a ~/.zsh-async ]]; then  # zsh async allows background load
  git clone git@github.com:mafredri/zsh-async.git ~/.zsh-async
fi
source ~/.zsh-async/async.zsh

export NVM_DIR="$HOME/.nvm"
function load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

# Initialize zsh async worker
async_start_worker nvm_worker -n
async_register_callback nvm_worker load_nvm
async_job nvm_worker sleep 0.1
  
#
# # Add npm auto-completion
# # source <(npm completion)
#
# ###### NEOVIM MAN PAGES ######
export MANPAGER="nvim -c 'set ft=neoman' -"
#
# [[ -s "/Users/A780976/.gvm/scripts/gvm" ]] && source "/Users/A780976/.gvm/scripts/gvm"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/juliankatz/.nvm/versions/node/v10.15.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/juliankatz/.nvm/versions/node/v10.15.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/juliankatz/.nvm/versions/node/v10.15.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/juliankatz/.nvm/versions/node/v10.15.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
# [[ -f /Users/juliankatz/.nvm/versions/node/v10.15.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/juliankatz/.nvm/versions/node/v10.15.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
# zprof
