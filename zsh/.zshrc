# Config
export ZSH="$HOME/.oh-my-zsh"
autoload -Uz compinit && compinit

# Theme
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Visibility
zstyle ':completion:*' menu select
setopt menu_complete

# Plugins
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Oh no
uwufetch
