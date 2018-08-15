[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

pgrep redshift &> /dev/null || redshift & &> /dev/null
pgrep compton &> /dev/null || compton & &> /dev/null
exec i3

