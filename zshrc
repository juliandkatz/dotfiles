export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git aws yarn vi-mode)

####################################
######   USER CONFIGURATION   ######
####################################

source $ZSH/oh-my-zsh.sh

# improve git autocomplete
__git_files () { 
    _wanted files expl 'local files' _files  }

# Set command line to vi mode
set -o vi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#########################
######   ALIASES   ######
#########################

alias findn="find . -iname"
alias weather="curl http://wttr.in/"
alias mytime="node $HOME/personalDev/my-scripts/get-time.js"
alias help="run-help"
alias cb="git rev-parse --abbrev-ref HEAD"
alias vim="nvim"

alias set_boost_admin="export AWS_PROFILE=aetnaboost_admin"
alias set_prd_admin="export AWS_PROFILE=aetna-digital-aws-prd_admin"
alias set_npr_admin="export AWS_PROFILE=aetna-digital-aws-npr_admin"
alias set_inf_admin="export AWS_PROFILE=aetna-digital-aws-inf_admin"
alias set_lab_admin="export AWS_PROFILE=aetna-digital-aws-lab_admin"
alias set_aem_admin="export AWS_PROFILE=aetna-digital-aws-aem_admin"
alias set_lab="export AWS_PROFILE=lab"
alias set_dev="export AWS_PROFILE=dev"

alias set_train="export AWS_PROFILE=training"

# Improved git log graph alias
alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

###########################################
######   LANGUAGE AND PATH OPTIONS   ######
###########################################

export PATH="$HOME/bin:$HOME/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:$HOME/.rvm/bin:$HOME/.config/nvim/plugged/vim-superman/bin"
export PATH="/usr/local/bin:$PATH" # for homebrew

##### RUBY #####
eval "$(rbenv init -)"

##### PYTHON/PYENV #####
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

###### NODE ######
# Setup for nvm
# export NVM_DIR=$HOME/.nvm
# . "/usr/local/opt/nvm/nvm.sh"

# Add npm auto-completion
# source <(npm completion)

###### STACK CONFIGURATION #####
export AWS_PROFILE=dev
source "$(stack -H)/bin/stack.completions"
export SOKE_LOGIN_METHOD="onelogin_cookie"

###### NEOVIM MAN PAGES ######
export MANPAGER="nvim -c 'set ft=neoman' -"

[[ -s "/Users/A780976/.gvm/scripts/gvm" ]] && source "/Users/A780976/.gvm/scripts/gvm"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/A780976/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/A780976/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/A780976/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/A780976/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
