# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything:
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# These set up/down to do the history searching
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# enable color support of ls
eval "`dircolors -b`"
alias ls='ls --color=always'

if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

hg_branch() {
	hg branch 2> /dev/null | awk '{print ":"$1}'
}

# Comment in the above and uncomment this below for a color prompt
# Put \u@ before \h to have user@hostname again
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 ":%s")$(hg_branch)\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# Enable bash history
export HISTFILESIZE=20000
export HISTSIZE=20000
export HISTCONTROL=erasedups
shopt -s histappend

# These set up/down to do the history searching
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# Pythonpath
export PYTHONPATH=~/python:$PYTHONPATH
export PATH=$PATH:~/bin

# Android
export ANDROID_HOME=~/development/android/android-sdk-linux
export PATH=$PATH:~/development/android/android-sdk-linux/platform-tools
export PATH=$PATH:~/development/android/android-sdk-linux/tools

# GIT alias list
alias st='git status'
alias ci='git ci -am'

# alias
alias fastmplayer='mplayer -vfm ffmpeg -lavdopts fast:skiploopfilter=all'
