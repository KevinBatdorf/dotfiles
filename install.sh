#!/bin/sh

echo "Setting up your Mac..."

if test ! $(which rustc); then
  echo "Installing rust..."
  curl https://sh.rustup.rs -sSf | sh
fi

# update rust version
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

# Make ZSH the default shell environment
sudo dscl . -create /Users/$USER UserShell "$(brew --prefix)/bin/zsh"

# Set default MySQL root password and auth type.
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
pecl install memcached imagick

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer

# Install NPM packages
npm install --global npm-check-updates trash-cli dau

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/code/dotfiles/.zshrc $HOME/.zshrc

# git
rm -rf $HOME/.gitignore_global
ln -s $HOME/code/dotfiles/.gitignore_global $HOME/.gitignore_global
rm -rf $HOME/.gitconfig
ln -s $HOME/code/dotfiles/.gitconfig $HOME/.gitconfig

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
