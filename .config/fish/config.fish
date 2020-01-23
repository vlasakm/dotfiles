set -x GPG_TTY (tty)

if status is-interactive

	alias cal 'cal -3 -m'
	alias config 'git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME"'
	alias df 'df -h'
	alias diff 'diff --color=auto'
	alias ffmpeg 'ffmpeg -hide_banner'
	alias free 'free -h'
	alias g++ 'g++ -fdiagnostics-color=always'
	alias gcc 'gcc -fdiagnostics-color=always'
	alias gdb 'gdb -q'
	alias grep 'grep --color=auto'
	alias info 'info --vi-keys'
	alias la 'ls -lA'
	alias less 'less -R'
	alias ll 'ls -l'
	alias llblk 'lsblk -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINT'
	alias ls 'ls -hN --color=auto --group-directories-first'
	alias nnn 'nnn -do'
	alias perldoc 'perldoc -n groff'
	alias rm 'rm -i'
	alias vim 'nvim'

	abbr -a -g ga 'git add'
	abbr -a -g gap 'git add --patch'
	abbr -a -g gc 'git commit'
	abbr -a -g gca 'git commit -a'
	abbr -a -g gd 'git diff'
	abbr -a -g gds 'git diff --staged'
	abbr -a -g gl 'git lg'
	abbr -a -g gst 'git status'
	abbr -a -g gsh 'git show'
	abbr -a -g ytdl 'youtube-dl'

	set fish_prompt_pwd_dir_length 0

	function fish_prompt
		if test $status -eq 0; set status_color green; else; set status_color red; end
		printf '%s%s%s\n%s%s%s ' (set_color -o blue) (prompt_pwd) (set_color normal) (set_color $status_color) \$ (set_color normal)
	end

end

if status is-login && test -z "$TMUX"
	# Default applications
	set -x EDITOR "nvim"
	set -x BROWSER "firefox"
	set -x TERMINAL "alacritty -e"

	# Application options
	set -x NNN_USE_EDITOR "1"
	set -x PASSWORD_STORE_CLIP_TIME "3"

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
