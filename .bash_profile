[[ -f ~/.bashrc ]] && . ~/.bashrc

source "${XDG_CONFIG_HOME:-"$HOME/.config"}/bash/environment"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x bspwm || exec ssh-agent startx
fi
