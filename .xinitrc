#!/bin/sh

# update environment in both systemd and dbus
# DISPLAY is required for e.g. starting dunst as a service
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

exec bspwm
