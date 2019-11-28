# Path to your dotfiles.
# Path to your dotfiles.
export DOTFILES=$HOME/code/dotfiles

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  history
  colorize
  wd
  HTTPie
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Do not record an event starting with a space
setopt HIST_IGNORE_SPACE

# Share history between sessions
setopt SHARE_HISTORY

# Write to the history file immediately, not when the shell exits
setopt INC_APPEND_HISTORY

# Auto changes to a directory without typing "cd"
setopt AUTO_CD

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# load pure prompt theme
autoload -U promptinit; promptinit
prompt pure
