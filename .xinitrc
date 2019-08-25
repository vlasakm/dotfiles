#!/bin/sh

# update environment in both systemd and dbus
# DISPLAY is required for e.g. starting dunst as a service
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY &

# make X settings
xsetroot -cursor_name left_ptr &
setxkbmap -layout us,cz -variant ,qwerty -option terminate:ctrl_alt_bksp grp:shifts_toggle caps:escape &

# start X applications
xbanish -i shift -i control -i mod1 -i mod4 &
SXHKD_SHELL=sh sxhkd -m 1 &
polybar top &
feh --bg-scale --no-fehbg "$HOME/.wallpaper" &
redshift &
"$BROWSER" &

# execute window manager
exec bspwm
