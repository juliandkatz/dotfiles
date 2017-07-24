##############################
######   GENERAL PATH   ######
##############################

export PATH="$HOME/bin:$HOME/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:$HOME/.rvm/bin:$HOME/.vim/bundle/vim-superman/bin"
export PATH="/usr/local/bin:$PATH" # for homebrew

# setup stack
export AWS_PROFILE=dev_deployer
export STACK_HOME=$HOME/dev/stack
source $STACK_HOME/bin/stack.env

