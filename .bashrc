# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if [[ -f ~/.dir_colors ]] ; then
	eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
	eval $(dircolors -b /etc/DIR_COLORS)
fi

export PATH=$PATH:/usr/local/bin:/usr/local/kurz/

alias ls='ls --color=auto'
alias grep='grep --colour=auto'

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

alias em='emacs -nw '
alias ll='ls -lah'
alias l='ls -lh'
alias reb='rm -f *~'
alias pa='ps aux'
alias ..='cd ..'
alias ...='cd ../..'
alias svngrep='grep --exclude-dir=\.svn '

alias cm='ARCH=mips CROSS_COMPILE=mipsel-unknown-linux-gnu- make'

export SVN_EDITOR=vim
export LC_CTYPE=en_US.UTF-8

if [ ! -z ${KLOGIN_TYPE} ]; then
    test -z "${CLEARPATH}" && export CLEARPATH=${PATH}
    test -s ~/.kurz/kurzrc && . ~/.kurz/kurzrc
fi
