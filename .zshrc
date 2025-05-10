# profiling
# zmodload zsh/zprof

# Starship
# eval "$(starship init zsh --print-full-init)"

# Path to your dotfiles.
export DOTFILES=$HOME/code/dotfiles

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add custom completion directory to fpath
fpath=(~/.zsh $fpath)

# Load bash completions
autoload -U bashcompinit
bashcompinit

# Load zsh completions
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

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

# Only check for updates on the 1st of the month
[ "$(date +%d)" = "01" ] && unset DISABLE_AUTO_UPDATE || DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

source $HOME/.cargo/env

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# zsh enhancements
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load pure prompt theme
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure


# Created by `pipx` on 2021-03-20 22:33:43
export PATH="$PATH:/Users/kevin/.local/bin"


eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/Users/kevin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "$HOME/.cargo/env"

# Add docker to path
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# Add rye to path (python stuffz)
source "$HOME/.rye/env"

# bun completions
[ -s "/Users/kevin/.bun/_bun" ] && source "/Users/kevin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# eval "$(gh copilot alias -- zsh)"

source "$HOME/.cargo/env"

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"

# c/c++
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export CC=/opt/homebrew/opt/llvm/bin/clang
export CXX=/opt/homebrew/opt/llvm/bin/clang++
export PATH="$HOME/vcpkg:$PATH"
export VCPKG_ROOT="$HOME/vcpkg"
export CPATH="/opt/homebrew/include:$CPATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"

# Herd injected PHP binary.
export PATH="/Users/kevin/Library/Application Support/Herd/bin":$PATH


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/kevin/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/kevin/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/kevin/Library/Application Support/Herd/config/php/81/"

# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/kevin/Library/Application Support/Herd/config/php/80/"

# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/kevin/Library/Application Support/Herd/config/php/74/"

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/kevin/Library/Application Support/Herd/config/php/84/"

# Herd injected NVM configuration
export NVM_DIR="/Users/kevin/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

export PHP_CS_FIXER_IGNORE_ENV=1
