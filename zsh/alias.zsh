function _reload(){
  source ~/.zshrc
  for config ($ZSH_CUSTOM/*.zsh) source $config
}

alias reload!=_reload
alias vim="nvim"
