# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/Oluwafemi/.oh-my-zsh

# Autostart tmux when terminal is opened
# export ZSH_TMUX_AUTOSTART=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/Users/Oluwafemi/.dotfiles/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  iterm2
  zsh-autosuggestions
  zsh-syntax-highlighting
  dirhistory
  osx
  kubectl
  history
  kubectl
)
source $ZSH/oh-my-zsh.sh

# source all .zsh files inside of the zsh/ directory
for config ($ZSH_CUSTOM/*.zsh) source $config

source /Users/Oluwafemi/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval $(thefuck --alias)
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "`pip completion --zsh`"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
export PATH="/usr/local/opt/openjdk/bin:$PATH"
