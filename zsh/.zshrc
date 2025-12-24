# Config
export ZSH="$HOME/.oh-my-zsh"
autoload -Uz compinit && compinit

# Theme
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Visibility
zstyle ':completion:*' menu select
setopt menu_complete

# Vi mode 
bindkey -v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Variables
export EDITOR='nvim'
export VISUAL='nvim'

# Functions
for file in ~/.config/zsh_functions/*(DN); do
    source "$file"
done

# Path

# Aliases
