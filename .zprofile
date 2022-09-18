[[ -v TMUX ]] && return

# Default applications
export EDITOR="nvim"

# Address sanitizer options
export ASAN_OPTIONS="color=always:symbolize=1:debug=1:detect_leaks=1:strict_string_checks=1:detect_stack_use_after_return=1:check_initialization_order=1:strict_init_order=1"
export TSAN_OPTIONS="color=always"

# Path
export PATH="$HOME/.local/bin:$HOME/src/texlive/bin/x86_64-linux/:$HOME/src/context/tex/texmf-linux-64/bin/:$HOME/.cargo/bin:$PATH"

# Finish initialization of gnome keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# https://mastransky.wordpress.com/2020/03/16/wayland-x11-how-to-run-firefox-in-mixed-environment/
export MOZ_DBUS_REMOTE=1

# Start aria2 daemon
aria2c --daemon --enable-rpc

# Start window manager at login on tty1
if [[ ! -v DISPLAY && "$XDG_VTNR" -eq 1 ]]; then
	#exec startx -- -keeptty
	exec env LIBSEAT_BACKEND=logind sway
fi
