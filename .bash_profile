#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$HOME/.scripts:/usr/local/texlive/2018/bin/x86_64-linux"

#export MANPATH=${MANPATH:+$MANPATH:}/usr/local/texlive/2018/texmf-dist/doc/man
#export INFOPATH=${INFOPATH:+$INFOPATH:}/usr/local/texlive/2018/texmf-dist/doc/info

export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x i3 || exec ssh-agent startx
fi
