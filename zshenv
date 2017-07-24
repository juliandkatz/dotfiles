##############################
######   GENERAL PATH   ######
##############################

export PATH="$HOME/bin:$HOME/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:$HOME/.rvm/bin:$HOME/.vim/bundle/vim-superman/bin"
export PATH="/usr/local/bin:$PATH" # for homebrew
export PATH=/usr/local/share/python:$PATH

# setup stack
export AWS_PROFILE=dev_deployer
export STACK_HOME=$HOME/dev/stack
source $STACK_HOME/bin/stack.env

###########################################
######   LANGUAGE SPECIFIC OPTIONS   ######
###########################################

###### RUBY ######
# set default ruby version.
export RBENV_VERSION=2.2.2

# enable rbenv, shims and autocompletion.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

###### NODE ######
# Setup for nvm
export NVM_DIR=$HOME/.nvm
. "/usr/local/opt/nvm/nvm.sh"

# Add npm auto-completion
source <(npm completion) &

###### PYTHON ######
eval "$(pyenv init -)"
