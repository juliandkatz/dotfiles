# set default ruby version.
export RBENV_VERSION=2.2.2

# set default aws profile
export AWS_DEFAULT_PROFILE=myaetna-aws-labs-jkatz

# enable rbenv, shims and autocompletion.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
