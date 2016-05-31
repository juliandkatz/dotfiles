# set default ruby version.
export RBENV_VERSION=2.2.2

# enable rbenv, shims and autocompletion.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# configure shell for docker
# docker-machine start default
eval "$(docker-machine env default)"
