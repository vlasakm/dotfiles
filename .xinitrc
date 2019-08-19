#!/bin/sh

# update environment in both systemd and dbus
# DISPLAY is required for e.g. starting dunst as a service
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

xsetroot -cursor_name left_ptr &
xbanish &
SXHKD_SHELL=sh sxhkd -m 1 &
polybar top &
feh --bg-scale --no-fehbg "$HOME/.wallpaper" &
redshift &
"$BROWSER" &

exec bspwm
