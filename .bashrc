alias ls="ls -hN --color=auto --group-directories-first"
alias ll="ls -l"
alias la="ls -Al"

__prompt_command() {
	if (( $? == 0 )); then local color='\[\e[0;32m\]'; else local color='\[\e[0;31m\]'; fi
	printf -v PS1 '%s%s%s\n%s%s%s ' '\[\e[1;34m\]' 'bash:\w' '\[\e[0m\]' "$color" '\$' '\[\e[0m\]'
}
PROMPT_COMMAND=__prompt_command
