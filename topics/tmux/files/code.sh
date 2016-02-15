#!/bin/bash

name=$1
dir=`find . -maxdepth 2 -type d -name $name`
cd $dir

if !(tmux has-session -t "$name" 2> /dev/null); then
  tmux start                      \;\
    set -g set-remain-on-exit on  \;\
    new-session -d -s $name
fi

tmux source-file "$HOME/.tmux.conf"
tmux source-file "$HOME/.tmux/profiles/$name.tmuxrc"
tmux source-file "$dir/$name.xen.tmuxrc"
tmux attach -t $name
