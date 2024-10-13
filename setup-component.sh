#!/bin/sh

if [ -z "$1" ]; then
	echo "Please provide one component which you want to stow."
	exit 1
fi

stow --dotfiles --target="$HOME" "$1"

