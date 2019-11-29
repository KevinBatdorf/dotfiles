# Kevin's Dotfiles

This set of files will restore my Mac to my preferred development state. Heavily inspired by [Dries](https://github.com/driesvints/dotfiles).

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Do you have any unstaged/uncommitted changes to your git repositories?
- Did you remember to check the documents and downloads directories?
- Did you save your ssh keys?
- Did you save all of your work from apps which aren't synced?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`? Verify the backups worked as the app is somewhat buggy at times.

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### Setting up your fresh Mac

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
1. Install Xcode from the App Store, open it and accept the license agreement
1. Install macOS Command Line Tools by running `xcode-select --install`
1. Copy your public and private SSH keys to `~/.ssh` and make sure they're set to `600`
1. Clone this repo to `~/code/dotfiles`
1. Run `chsh -s /bin/zsh` to switch the shell to zsh
1. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#getting-started)
1. Run `sh install.sh` to start the installation
1. After mackup is synced to Dropbox, restore preferences by running `mackup restore`
1. Restart your computer to finalize the process
1. If you need mysql, run `brew install mysql` manually

Your Mac is now ready to use!

## Your Own Dotfiles

Better to check [Dries](https://github.com/driesvints/dotfiles) for the latest updates. He has a [video](https://laracasts.com/series/guest-spotlight/episodes/1) on Laracasts as well that *very quickly* goes over everything here.
