set -x GPG_TTY (tty)

if status is-interactive

	alias cal 'cal -3 -m'
	alias config 'git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME"'
	alias df 'df -h'
	alias diff 'diff --unified --color=always'
	alias disas 'objdump -d'
	alias ffmpeg 'ffmpeg -hide_banner'
	alias free 'free -h'
	alias g++ 'g++ -fdiagnostics-color=always'
	alias gcc 'gcc -fdiagnostics-color=always'
	alias gdb 'gdb -q'
	alias grep 'grep --color=auto'
	alias info 'info --vi-keys'
	alias l 'll'
	alias la 'ls -lA'
	alias less 'less -R'
	alias ll 'ls -l'
	alias llblk 'lsblk -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINT'
	alias ls 'ls -hN --color=auto --group-directories-first'
	alias n 'nnn'
	alias nnn 'nnn -do'
	alias objdump ' objdump -M intel'
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

	set fish_greeting ''
	set fish_key_bindings fish_default_key_bindings
	set fish_prompt_pwd_dir_length 0

	# Dracula colorscheme
	set fish_color_autosuggestion BD93F9
	set fish_color_cancel -r
	set fish_color_command F8F8F2
	set fish_color_comment 6272A4
	set fish_color_cwd green
	set fish_color_cwd_root red
	set fish_color_end 50FA7B
	set fish_color_error FFB86C
	set fish_color_escape 00a6b2
	set fish_color_history_current --bold
	set fish_color_host normal
	set fish_color_match --background=brblue
	set fish_color_normal normal
	set fish_color_operator 00a6b2
	set fish_color_param FF79C6
	set fish_color_quote F1FA8C
	set fish_color_redirection 8BE9FD
	set fish_color_search_match 'bryellow'  '--background=brblack'
	set fish_color_selection 'white'  '--bold'  '--background=brblack'
	set fish_color_user brgreen
	set fish_color_valid_path --underline
	set fish_pager_color_completion normal
	set fish_pager_color_description 'B3A06D'  'yellow'
	set fish_pager_color_prefix 'white'  '--bold'  '--underline'
	set fish_pager_color_progress 'brwhite'  '--background=cyan'

	function fish_prompt
		if test $status -eq 0; set status_color green; else; set status_color red; end
		printf '%s%s%s\n%s%s%s ' (set_color -o blue) (prompt_pwd) (set_color normal) (set_color $status_color) \$ (set_color normal)
	end

end

if status is-login && test -z "$TMUX"
	# Default applications
	set -x EDITOR "nvim"

	# Application options
	set -x NNN_USE_EDITOR "1"
	set -x PASSWORD_STORE_CLIP_TIME "3"

	# Address sanitizer options
	set -x ASAN_OPTIONS  "symbolize=1:debug=1:detect_leaks=1:strict_string_checks=1:detect_stack_use_after_return=1:check_initialization_order=1:strict_init_order=1"

	# Path
	set -x PATH $HOME/.local/bin $HOME/projects/scripts /usr/local/texlive/bin/x86_64-linux $PATH

	# Start ssh-agent
	set -x SSH_AUTH_SOCK /tmp/ssh-agent.(id -un)
	if ! test -S $SSH_AUTH_SOCK
		eval (ssh-agent -c -a $SSH_AUTH_SOCK)
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
