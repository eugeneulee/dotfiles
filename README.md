# eugeneulee/dotfiles

## Overview

Just something to make it easier for me to move into a <b>new</b> laptop.

Use it to setup my dev environment for:
* <b>languages</b>
  * Java w/ maven - using [sdkman](https://sdkman.io) to manage Java versions
  * node.js - using nvm to manage node versions
  * python@3.11
* <b>tools</b>
  * vim / gvim
  * screen
  * tmux (someday?)
  * zsh
    * display branch name if current working directory is a git repo
    * load aliases
    * set env vars

### Usage

To setup, clone dotfiles into your home folder and then run `./setup.sh`

### Steps in setup.sh
* install [brew](https://brew.sh)
* installs packages from package list in `brew/packages`
* deletes existing screen, (g)vim, tmux configs
* symlinks the configs from dotfiles into your home dir

### IMPORTANT
* setup.sh <b>_will_</b> delete these dotfiles if they exist
  * .screenrc
  * .tmuxrc
  * .zshrc
  * .gvimrc
  * .vim/
  * .vimrc

### LESS IMPORTANT
If you're cloning this because you've stumbled on it on accident, please note that:
* the zshrc has my home dirs hardcoded in it... I wrote it for myself to use ¯\\\_(ツ)_/¯
* setup is specific for python@3.11

If you're trying to use this, be sure to update `zsh/modules/zshrc`

### Usage

To setup, just clone dotfiles into your home folder and then run `./setup.sh`

