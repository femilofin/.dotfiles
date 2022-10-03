function _reload(){
  source ~/.zshrc
  for config ($ZSH_CUSTOM/*.zsh) source $config
}

alias reload!=_reload
alias vim="nvim"
alias vi="nvim"
alias ssh='TERM=screen-256color ssh'
alias copy="tr -d '\n' | pbcopy"

eval "$(hub alias -s)"
alias kube='kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}" ${KUBECTL_NAMESPACE/[[:alnum:]-]*/--namespace=${KUBECTL_NAMESPACE}}'
# alias kube="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias mk="minikube"
alias hdi="howdoi"
alias v="vault"
alias vlaut="vault"
alias timeout="gtimeout"
alias tower="tower-cli"
alias cat="bat"
alias eks="eksctl"
# using ksd for https://github.com/mfuentesg/ksd
unalias ksd >/dev/null 2>&1
alias helm3="helm"
