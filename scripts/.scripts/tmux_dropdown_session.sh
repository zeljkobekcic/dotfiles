#!/bin/sh

tmux has-session -t 'dropdown'

val=$?

if [ $val -eq 1 ]; then
    tmux new -s 'dropdown'
else 
    tmux attach-session -t 'dropdown'
fi
