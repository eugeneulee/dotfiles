#!/bin/bash

# Create symlinks to dotfiles provided by this repo
#
# Run at your own risk; this will delete existing dotfiles
# in your home folder of the same name. There are no backups made.

# break on errors
set -e

function write-dot-files() {

  # Start a subshell so we don't leave the current directory
  (

    echo Creating symbolic links to dotfiles in version control
    OUTPUT=''
    cd ~

    # create symlinks
    function replace-dotfile() {
      [ -d $1 -o -e $1 -o -h $1 ] && rm -rf $1
      ln -s $2 $1
      OUTPUT="${OUTPUT}~/$1 -> ~/$2|"
    }

    # setup vim, zsh, tmux, and screen
    replace-dotfile .vim dotfiles/vim
    replace-dotfile .vimrc dotfiles/vim/vimrc
    replace-dotfile .gvimrc dotfiles/vim/gvimrc
    replace-dotfile .zshrc dotfiles/zsh/zshrc
    replace-dotfile .tmux.conf dotfiles/tmux/tmux.conf
    replace-dotfile .screenrc dotfiles/screenrc

    echo Updated the following files:
    echo $OUTPUT | tr "|" "\n" | column -t -s ' '
    echo

    echo ...finished
  )

  exit 0

}

function install-homebrew-packages() {

  # Check if brew is installed.  If not, install it
  if command -v brew >/dev/null 2>&1; then
    echo Homebrew installed. Will attempt to install packages
  else
    echo Homebrew is not installed. Attempting to install from: https://brew.sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install packages from dotfiles/brew/packages
  if [ -f "brew/packages" ]; then
    packages=$(tr '\n' ' ' < "brew/packages")
    echo Package list: $packages
    read -r -p "Are you sure you want to install all the packages listed above?" package_response
		case $package_response in
        [yY][eE][sS]|[yY])
        brew install -v $packages
        ;;
      *)
    echo -e "\n...aborted"
        exit 1
        ;;
	  esac
  else
    echo No package list found in brew/packages
  fi
}

# Make sure we want to continue...
echo This script will permanently delete dotfiles in your home dir
echo It will delete: .vim/
echo "                .vimrc"
echo "                .gvimrc"
echo "                .zshrc"
echo "                .tmux.conf"
echo "                .screenrc"
read -r -p "Are you sure you want to continue? [y/n] " dotfile_response
case $dotfile_response in
    [yY][eE][sS]|[yY])
        install-homebrew-packages
        write-dot-files
        ;;

    *)
	echo -e "\n...aborted"
        exit 1
        ;;

esac

