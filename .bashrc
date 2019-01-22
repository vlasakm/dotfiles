# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## OWN ADDITIONS

# BASH SETTINGS
shopt -s autocd
HISTSIZE=10000

# KEY BINDINGS
alias info="info --vi-keys"

# SAFETY
alias rm="rm -i"

# COLOR
alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"

# ls shorts
alias ll="ls -l"
alias la="ls -al"

# working fast
alias s="sudo "
alias v="vim"
alias ytdl="youtube-dl"

# git aliases
alias ga='git add'
alias gap='git add --patch'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gpom='git push origin master'
alias gr='git reset'
alias gs='git status'
alias gsh='git show'
alias gl='git lg'

# dotfiles vcs
alias config="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"


# FUNCTIONS
maninfo () {
	info "$@" --subnodes -o - | less ;
}


# VARIABLES
export ASAN_OPTIONS=symbolize=1:debug=1:detect_leaks=1:strict_string_checks=1:detect_stack_use_after_return=1:check_initialization_order=1:strict_init_order=1


# NNN
export NNN_USE_EDITOR=1

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
        PS1+="${RED}" # red if exit code non 0
    else
        PS1+="${GREEN}" # green if exit code 0
    fi

    PS1+='\$' # prompt char
    PS1+="${RESET}"

    PS1+=" " # space at the end
}

# bash_completion
source /usr/share/bash-completion/bash_completion
