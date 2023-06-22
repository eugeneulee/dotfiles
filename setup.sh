#!/bin/bash

# Create symlinks to dotfiles provided by this repo
#
# Run at your own risk; this will delete existing dotfiles
# in your home folder. There are no backups.

# Break on errors
set -e

# Actual method
function write-dot-files() {

  # Start a subshell so we don't leave the current directory
  # the script is started from
  (

    echo Creating symbolic links to dotfile assets...

    # Clear our output
    OUTPUT=''

    # Go home
    cd ~

    # Function to let us quickly replace files with a symbolic link
    function replace-dotfile() {
      [ -d $1 -o -e $1 -o -h $1 ] && rm -rf $1
      ln -s $2 $1
      OUTPUT="${OUTPUT}~/$1 -> ~/$2|"
    }

    # Set up vim
    replace-dotfile .vim dotfiles/vim
    replace-dotfile .vimrc dotfiles/vim/vimrc
    replace-dotfile .gvimrc dotfiles/vim/gvimrc

    # Set up zshrc
    replace-dotfile .zshrc dotfiles/zsh/zshrc

    # Tmux configuration
    replace-dotfile .tmux.conf dotfiles/tmux/tmux.conf

    # Screen configuration
    replace-dotfile .screenrc dotfiles/screenrc

    # dotjs - see http://defunkt.io/dotjs/
    replace-dotfile .js dotfiles/js

    # Show the results of our operation
    echo Updated the following files:
    echo $OUTPUT | tr "|" "\n" | column -t -s ' '
    echo

    echo ...finished
  )

  exit 0

}

function install-homebrew-packages() {

  {

    echo Installing packages in SRC_ROOT/brew/pacakges
    brew install -v `tr '\n' ' '  < brew/packages`

  }

}

# Make sure we want to continue...
echo "WARNING! This script will destroy any existing dotfiles in your"
read -r -p "home folder; are you sure you want to continue? [y/n] " response
case $response in
    [yY][eE][sS]|[yY])
        write-dot-files
        install-homebrew-packages
        ;;

    *)
	echo -e "\n...aborted"
        exit 1
        ;;

esac

