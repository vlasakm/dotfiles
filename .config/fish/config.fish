# Start X at login
if status is-login
	if test -z "$DISPLAY" -a $XDG_VTNR = 1
		eval (ssh-agent -c)
		exec startx -- -keeptty
	end
end
