function _reload(){
  source ~/.zshrc
  for config ($ZSH_CUSTOM/*.zsh) source $config
}

alias reload!=_reload
alias vim="nvim"
alias ssh='TERM=screen-256color ssh'
alias copy="tr -d '\n' | pbcopy"

eval "$(hub alias -s)"
alias kube="kubectl"

