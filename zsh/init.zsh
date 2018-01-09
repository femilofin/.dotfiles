# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# fuck
eval $(thefuck --alias)

# Base16 shell setup
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH

# Statuscake API key
export STATUSCAKE_APIKEY=65yMdPxg2blZ98uQaXrk
export STATUSCAKE_USERNAME=devopsehealthafricaorg

# AWS default region
export AWS_DEFAULT_REGION=eu-west-1

# go home
export GOPATH=$HOME/go
