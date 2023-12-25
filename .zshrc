# https://zsh.sourceforge.io/Guide/zshguide02.html
#setopt NO_BEEP
setopt AUTO_CD
# setopt EXTENDED_GLOB

# continue programs after disown
setopt AUTO_CONTINUE

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

# https://wiki.archlinux.org/index.php/Zsh#Help_command
autoload -Uz run-help
unalias run-help
alias help=run-help

# https://unix.stackexchange.com/a/258661
autoload -U select-word-style
select-word-style bash

# https://zsh.sourceforge.io/Guide/zshguide02.html
HISTZIE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history
setopt APPEND_HISTORY INC_APPEND_HISTORY HIST_IGNORE_SPACE HIST_NO_STORE NO_HIST_BEEP
# maybe not INC_APPEND_HISTORY, but  SHARE_HISTORY, ?? works with  autosuggestions??
bindkey -e

PS1=$'%B%F{blue}zsh:%~%b\n%(0?.%F{green}.%F{red})%(\!.#.$)%f '

alias bc'bc -q'
alias cal='cal -3 -m'
alias config='git --git-dir="$HOME/.dotfiles.git/" --work-tree="$HOME"'
alias df='df -h'
alias diff='diff --unified --color=always'
alias disas='objdump -d'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias free='free -h'
alias g++='g++ -fdiagnostics-color=always'
alias gcc='gcc -fdiagnostics-color=always'
alias gdb='gdb -q'
alias grep='grep --color=auto'
alias info='info --vi-keys'
alias l='ll'
alias la='ls -lA'
alias less='less -R'
alias ll='ls -l'
alias llblk='lsblk -o NAME,SIZE,FSTYPE,LABEL,MOUNTPOINT,PARTUUID'
alias ls='ls -hN --color=auto --group-directories-first'
alias n='nnn'
alias nnn='nnn -do'
alias o='xdg-open'
alias objdump=' objdump -M intel'
alias perldoc='perldoc -n groff'
alias rm='rm -i'
alias vim='nvim'
alias yd='youtube-dl'

alias ga='git add'
alias gap='git add --patch'
alias gc='git commit'
alias gca='git commit -a'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git lg'
alias gst='git status'
alias gsh='git show'

#ZSH_AUTOSUGGEST_STRATEGY=(history) # match_prev_cmd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#BD93F9"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Dracula color scheme

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6272A4'
ZSH_HIGHLIGHT_STYLES[path]='fg=#FF79C6,underline'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#FFB86C'

ZSH_HIGHLIGHT_STYLES[precommand]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#F8F8F2'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#F1FA8C'


ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#00a6b2'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#00a6b2'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#00a6b2'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#00a6b2'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#00a6b2'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#00a6b2'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#00a6b2'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#FF79C6'

ZSH_HIGHLIGHT_STYLES[redirection]='fg=#8BE9FD'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#8BE9FD'

ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[command-substitution]=none
ZSH_HIGHLIGHT_STYLES[process-substitution]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[rc-quote]=none # maybe?
ZSH_HIGHLIGHT_STYLES[named-fd]=none

setopt INTERACTIVE_COMMENTS

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# setup key bindings, man 5 terminfo
bindkey -- "${terminfo[khome]}" beginning-of-line              # Home
bindkey -- "${terminfo[kend]}"  end-of-line                    # End
bindkey -- "${terminfo[kich1]}" overwrite-mode                 # Insert
bindkey -- "${terminfo[kbs]}"   backward-delete-char           # Backspace
bindkey -- "${terminfo[kdch1]}" delete-char                    # Delete
bindkey -- "${terminfo[kcuu1]}" up-line-or-history             # Up
bindkey -- "${terminfo[kcuu1]}" up-line-or-beginning-search    # Up
bindkey -- "${terminfo[kcud1]}" down-line-or-history           # Down
bindkey -- "${terminfo[kcud1]}" down-line-or-beginning-search  # Down
bindkey -- "${terminfo[kcub1]}" backward-char                  # Left
bindkey -- "${terminfo[kcuf1]}" forward-char                   # Right
bindkey -- "${terminfo[kpp]}"   beginning-of-buffer-or-history # PageUp
bindkey -- "${terminfo[knp]}"   end-of-buffer-or-history       # PageDown
bindkey -- "${terminfo[kcbt]}"  reverse-menu-complete          # ShiftTab
# https://stackoverflow.com/questions/18042685/list-of-zsh-bindkey-commands
bindkey -- "${terminfo[kLFT3]}" backward-word                  # Ctrl + Left
bindkey -- "${terminfo[kLFT5]}" backward-word                  # Alt + Left
bindkey -- "${terminfo[kRIT3]}" forward-word                   # Ctrl + Right
bindkey -- "${terminfo[kRIT5]}" forward-word                   # Alt + Left

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
		echoti smkx
	}
	function zle_application_mode_stop {
		echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# End of arch wiki

# must be at end (https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
