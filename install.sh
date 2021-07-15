#!/bin/sh

echo "Setting up your Mac..."

if test ! $(which rustc); then
  echo "Installing rust..."
  curl https://sh.rustup.rs -sSf | sh
fi

# update version
rustup update

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type.
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
pecl install memcached imagick

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet tightenco/takeout beyondcode/expose

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/code

# Create sites subdirectories
# mkdir $HOME/Sites/blade-ui-kit
# mkdir $HOME/Sites/laravel

# Clone Github repositories
./clone.sh

# Install NPM packages
yarn global add @vue/cli pure-prompt npm-check-updates trash-cli

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/code/dotfiles/.zshrc $HOME/.zshrc

# Add deno completions
mkdir $HOME/.zsh
deno completions zsh > $HOME/.zsh/_deno

# Removes .vimrc from $HOME (if it exists) and symlinks the .vimrc file from the dotfiles
rm -rf $HOME/.vimrc
ln -s $HOME/code/dotfiles/.vimrc $HOME/.vimrc

# git
rm -rf $HOME/.gitignore_global
ln -s $HOME/code/dotfiles/.gitignore_global $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory
ln -s $HOME/code/dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
