#!/bin/sh

export PATH="$PATH:$HOME/.scripts"

export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x i3 || exec ssh-agent startx
fi
