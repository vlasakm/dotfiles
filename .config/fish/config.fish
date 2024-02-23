if status is-interactive

	alias bc 'bc -q'
	alias cal 'cal -3 -m'
	alias config 'git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME"'
	alias df 'df -h'
	alias diff 'diff --unified --color=always'
	alias disas 'objdump -d'
	alias ffmpeg 'ffmpeg -hide_banner'
	alias ffprobe 'ffprobe -hide_banner'
	alias free 'free -h'
	alias g++ 'g++ -fdiagnostics-color=always'
	alias gcc 'gcc -fdiagnostics-color=always'
	alias grep 'grep --color=auto'
	alias info 'info --vi-keys'
	alias l 'll'
	alias la 'ls -lA'
	alias less 'less -R'
	alias ll 'ls -l'
	alias llblk 'lsblk -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINT,PARTUUID'
	alias ls 'ls -hN --color=auto --group-directories-first'
	alias n 'nnn'
	alias nnn 'nnn -Ado'
	alias o 'xdg-open'
	alias objdump ' objdump -M intel'
	alias perldoc 'perldoc -n groff'
	alias rsync 'rsync --no-motd'
	alias rm 'rm -i'
	alias vim 'nvim'
	alias yd 'yt-dlp'

	abbr -a -g ga 'git add'
	abbr -a -g gap 'git add --patch'
	abbr -a -g gc 'git commit'
	abbr -a -g gca 'git commit -a'
	abbr -a -g gd 'git diff'
	abbr -a -g gds 'git diff --staged'
	abbr -a -g gl 'git lg'
	abbr -a -g gst 'git status'
	abbr -a -g gsh 'git show'

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

	# don't search in repositories for missing commands
	function fish_command_not_found
	       __fish_default_command_not_found_handler $argv[1]
	end

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

	# Address sanitizer options
	set -x ASAN_OPTIONS "color=always:symbolize=1:debug=1:detect_leaks=1:strict_string_checks=1:detect_stack_use_after_return=1:check_initialization_order=1:strict_init_order=1"
	set -x TSAN_OPTIONS "color=always"

	# Path
	set -x PATH $HOME/.local/bin $HOME/src/texlive/bin/x86_64-linux/ $HOME/src/context/tex/texmf-linux-64/bin/ $HOME/.cargo/bin $PATH

	# Finish initialization of gnome keyring
	set -x GNOME_KEYRING_CONTROL "$XDG_RUNTIME_DIR/keyring"
	set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gcr/ssh"

	# https://mastransky.wordpress.com/2020/03/16/wayland-x11-how-to-run-firefox-in-mixed-environment/
	set -x MOZ_DBUS_REMOTE 1

	# Start aria2 daemon
	aria2c --daemon --enable-rpc

	# Start window manager at login on tty1
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		#exec startx -- -keeptty
		exec env LIBSEAT_BACKEND=logind sway
	end
end
