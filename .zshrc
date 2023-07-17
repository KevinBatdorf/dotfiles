# Path to your dotfiles.
export DOTFILES=$HOME/code/dotfiles

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

autoload -U bashcompinit
bashcompinit

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  history
  colorize
  wd
  HTTPie
)

# Do not record an event starting with a space
setopt HIST_IGNORE_SPACE

# Share history between sessions
setopt SHARE_HISTORY

# Write to the history file immediately, not when the shell exits
setopt INC_APPEND_HISTORY

# Auto changes to a directory without typing "cd"
setopt AUTO_CD

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

source $ZSH/oh-my-zsh.sh

source $HOME/.cargo/env

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# load pure prompt theme
autoload -U promptinit; promptinit
prompt pure

# zh enhancements
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# source "$HOME/.secrets"

# Starship
eval "$(starship init zsh --print-full-init)"

# FNM
# eval "$(fnm env)"
# export PATH="/usr/local/opt/php@7.4/bin:$PATH"
# export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

# if command -v pyenv 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"
# fi
# eval "$(register-python-argcomplete pipx)"

# Created by `pipx` on 2021-03-20 22:33:43
export PATH="$PATH:/Users/kevin/.local/bin"

# For auto switching Node versions
eval "$(fnm env)"
FNM_USING_LOCAL_VERSION=0
autoload -U add-zsh-hook
_fnm_autoload_hook () {
  if [[ -f .node-version && -r .node-version ]]; then
    FNM_USING_LOCAL_VERSION=1
    fnm use --install-if-missing
  elif [ $FNM_USING_LOCAL_VERSION -eq 1 ]; then
    FNM_USING_LOCAL_VERSION=0
    fnm use default --install-if-missing
  fi
}
add-zsh-hook chpwd _fnm_autoload_hook \
    && _fnm_autoload_hook

eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/Users/kevin/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
