#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install PHP extensions with PECL
pecl install memcached imagick

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/spark-installer laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Install NPM packages
yarn global add @vue/cli pure-prompt npm-check-updates

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/code/dotfiles/.zshrc $HOME/.zshrc

# git
git config --global user.name "Kevin Batdorf"
git config --global user.email "kbat82@gmail.com"
git config --global core.autocrlf false
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX" # https://github.com/so-fancy/diff-so-fancy
rm -rf $HOME/.gitignore_global
ln -s $HOME/code/dotfiles/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory
ln -s $HOME/code/dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
