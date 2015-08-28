#!/bin/sh
SESSION_INIT_PATH=$HOME/dotfiles/tmux/sessions

# Start up tmux and create/reuse an existing session
if [ $# -eq 0 ]; then
  echo Attaching to most recent session
  tmux a
else
  echo Attaching to or creating: $1
  tmux a -t $1 || $SESSION_INIT_PATH/$1 || tmux new-session -s $1
fi
