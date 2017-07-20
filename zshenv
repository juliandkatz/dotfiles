##############################
######   GENERAL PATH   ######
##############################

export PATH="$HOME/bin:$HOME/.rbenv/shims:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:$HOME/.rvm/bin:$HOME/.vim/bundle/vim-superman/bin"
export PATH="/usr/local/bin:$PATH" # for homebrew
export PATH=/usr/local/share/python:$PATH


###########################################
######   LANGUAGE SPECIFIC OPTIONS   ######
###########################################

###### RUBY ######

# set default ruby version.
export RBENV_VERSION=2.2.2

# enable rbenv, shims and autocompletion.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

###### PYTHON ######
eval "$(pyenv init -)"
