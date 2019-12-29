set -x GPG_TTY (tty)

if status is-interactive
	alias config 'git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME"'
	alias gdb 'gdb -q'
	alias grep 'grep --color=auto'
	alias diff 'diff --color=auto'
	alias info 'info --vi-keys'
	alias ffmpeg 'ffmpeg -hide_banner'
	alias la 'ls -lA'
	alias ll 'ls -l'
	alias ls 'ls -hN --color=auto --group-directories-first'
	alias nnn 'nnn -do'
	alias perldoc 'perldoc -n groff'
	alias rm 'rm -i'
	alias cal 'cal -3 -m'
	alias less 'less -R'
	alias gcc 'gcc -fdiagnostics-color=always'
	alias g++ 'g++ -fdiagnostics-color=always'
	alias vim 'nvim'

	abbr -a -g ga 'git add'
	abbr -a -g gap 'git add --patch'
	abbr -a -g gb 'git branch'
	abbr -a -g gc 'git commit'
	abbr -a -g gca 'git commit -a'
	abbr -a -g gcam 'git commit --amend'
	abbr -a -g gco 'git checkout'
	abbr -a -g gcob 'git checkout -b'
	abbr -a -g gd 'git diff'
	abbr -a -g gdc 'git diff --cached'
	abbr -a -g gl 'git lg'
	abbr -a -g gr 'git reset'
	abbr -a -g gs 'git status'
	abbr -a -g gsh 'git show'
	abbr -a -g s 'sudo'
	abbr -a -g ytdl 'youtube-dl'

	set fish_prompt_pwd_dir_length 0
end

if status is-login && test -z "$TMUX"
	# Default applications
	set -x EDITOR "nvim"
	set -x BROWSER "firefox"
	set -x TERMINAL "alacritty"
	set -x TERMEXEC "$TERMINAL -e"

	# Application options
	set -x NNN_USE_EDITOR "1"
	set -x PASSWORD_STORE_CLIP_TIME "3"
	set -x GOPATH "$HOME/.local/share/go"

	# Address sanitizer options
	set -x ASAN_OPTIONS  "symbolize=1:debug=1:detect_leaks=1:strict_string_checks=1:detect_stack_use_after_return=1:check_initialization_order=1:strict_init_order=1"

	# Path
	set -x PATH $HOME/.local/bin $HOME/projects/scripts /usr/local/texlive/bin/x86_64-linux $PATH

	# Start ssh-agent and add keys
	if ! test -S /tmp/ssh-agent.(id -un)
		eval (ssh-agent -c -a /tmp/ssh-agent.(id -un))
		ssh-add $HOME/.ssh/id_{ed25519,rsa}
	else
		set -x SSH_AUTH_SOCK /tmp/ssh-agent.(id -un)
	end

	# Start gpg-agent and add default key
	gpg --sign - <&- >/dev/null 2>/dev/null

	# Start tmux server
	tmux start-server &

	# Start X at login on tty1
	if test -z "$DISPLAY" -a $XDG_VTNR = 1
		exec startx -- -keeptty
	end
end
