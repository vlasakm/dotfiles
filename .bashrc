#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

## OWN ADDITIONS

# KEY BINDINGS
alias info="info --vi-keys"
maninfo () {
	info "$@" --subnodes -o - | less ;
}

# SAFETY
alias rm="rm -i"

# COLOR
alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"

# ls shorts
alias ll="ls -l"
alias la="ls -al"

# working fast
alias v="vim"
alias r="ranger"

# dotfiles vcs
alias config="git --git-dir=$HOME/.myconf/ --work-tree=$HOME"

# PS1
# inspired from https://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code 
# https://github.com/sindresorhus/pure
# https://github.com/sapegin/dotfiles/blob/dd063f9c30de7d2234e8accdb5272a5cc0a3388b/includes/bash_prompt.bash

source /usr/share/git/completion/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=1

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    local GIT=$(__git_ps1 "%s")
    PS1=""

    local RESET='\[\e[0m\]'

    local RED='\[\e[0;31m\]'
    local GREEN='\[\e[0;32m\]'
    local BRIGHT_BLUE='\[\e[1;34m\]'
    local GRAY='\[\e[0;38;5;240m\]'

    PS1+="${BRIGHT_BLUE}\w${RESET} " # working directory
    PS1+="${GRAY}${GIT}${RESET}" # git branch
    PS1+="\n"

    if [ $EXIT != 0 ]; then
        PS1+="${RED}\$${RESET}" # red if exit code non 0
    else
        PS1+="${GREEN}\$${RESET}" # green if exit code 0
    fi

    PS1+=" " # space at the end
}
