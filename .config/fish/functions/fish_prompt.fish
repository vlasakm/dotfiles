function fish_prompt --description 'Write out the prompt'

	set stat $status

	set -l normal (set_color normal)
	set -l red (set_color red)
	set -l green (set_color green)
	set -l blue (set_color -o blue)
	set -l gray (set_color brblack)

	if set -q SSH_TTY
		set -l host " "(id -un)@(hostname)
	else
		set -l host
	end

	if test $stat -eq 0
		set fish_color_status (set_color green)
	else
		set fish_color_status (set_color red)
	end

	printf '%s%s%s%s\n%s%s%s ' $blue (prompt_pwd) $gray $host (__fish_git_prompt) $fish_color_status \$ $normal
end
