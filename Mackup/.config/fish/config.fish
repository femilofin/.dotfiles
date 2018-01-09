thefuck --alias | source
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
export GOPATH=$HOME/go
export AWS_DEFAULT_REGION=eu-west-1

# Statuscake API key
export STATUSCAKE_APIKEY=65yMdPxg2blZ98uQaXrk
export STATUSCAKE_USERNAME=devopsehealthafricaorg
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# display clock on shell
#bash -c 'while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &'

alias vim="nvim"
