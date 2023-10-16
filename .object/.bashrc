[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s cmdhist
shopt -s globstar
shopt -s histappend
shopt -s histverify

## Định cấu hình lịch sử bash.
if [ "$(id -u)" = "0" ]; then
	export HISTFILE="$HOME/.bash_root_history"
else
	export HISTFILE="$HOME/.bash_history"
fi
export HISTSIZE=4096
export HISTFILESIZE=16384
export HISTCONTROL="ignoreboth"

## con trỏ
printf '\e[4 q'

## loader
. ~/.draw;

## Lời nhắc.
. ~/.username
PROMPT_DIRTRIM=2
if [ "$(id -u)" = "0" ]; then
	PS1="\\[\\e[0;31m\\]\\w\\[\\e[0m\\] \\[\\e[0;97m\\]\\$\\[\\e[0m\\] "
else
	PS1="
\[\033[0;31m\]┌─[\[\033[1;34m\]$NAME\[\033[1;33m\]@\[\033[1;36m\]termux\[\033[0;31m\]]─[\[\033[0;32m\]\w\[\033[0;31m\]]
\[\033[0;31m\]└──╼ \[\e[1;31m\]❯\[\e[1;34m\]❯\[\e[1;90m\]❯\[\033[0m\] "
fi
PS2='> '
PS3='> '
PS4='+ '
## Tiêu đề thiết bị đầu cuối.
case "$TERM" in
	xterm*|rxvt*)
		if [ "$(id -u)" = "0" ]; then
			PS1="\\[\\e]0;termux (root): \\w\\a\\]$PS1"
		else
			PS1="\\[\\e]0;termux: \\w\\a\\]$PS1"
		fi
		;;
	*)
		;;
esac

## Đầu ra đầy màu sắc và các bí danh hữu ích cho 'ls' và 'grep'.
if [ -x "$PREFIX/bin/dircolors" ] && [ -n "$LOCAL_PREFIX" ]; then
	if [ -f "$LOCAL_PREFIX/etc/dircolors.conf" ]; then
		eval "$(dircolors -b "$LOCAL_PREFIX/etc/dircolors.conf")"
	fi
fi

## Đầu ra có màu.
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto -h'

## Thay 'mèo' bằng 'dơi' (nếu có).
if [ -n "$(command -v bat)" ]; then
	alias cat='bat --color=never --decorations=never --paging=never'
fi

## Thay thế 'ls' bằng 'exa' (nếu có) + một số bí danh.
if [ -n "$(command -v exa)" ]; then
	alias l='exa'
	alias ls='exa'
	alias l.='exa -d .*'
	alias la='exa -a'
	alias ll='exa -Fhl'
	alias ll.='exa -Fhl -d .*'
else
	alias l='ls --color=auto'
	alias ls='ls --color=auto'
	alias l.='ls --color=auto -d .*'
	alias la='ls --color=auto -a'
	alias ll='ls --color=auto -Fhl'
	alias ll.='ls --color=auto -Fhl -d .*'
fi

## Sự an toàn.
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'

## gốc env
alias nethunter='proot-distro login nethunter'
