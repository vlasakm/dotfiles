#!/bin/bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd
HISTSIZE=-1
HISTFILESIZE=-1
HISTFILE="${XDG_DATA_HOME:-"$HOME/.local/share"}/bash/history"

for file in "${XDG_CONFIG_HOME:-"$HOME/.config"}/bash/"{prompt,aliases,functions}; do
	source $file;
done;

# Completion
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
