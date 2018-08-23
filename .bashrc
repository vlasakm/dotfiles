#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# OWN ADDITIONS

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"

alias ll="ls -l"
alias la="ls -al"

alias v="vim"
alias r="ranger"

alias config="git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
