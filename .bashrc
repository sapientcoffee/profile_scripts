export PATH="$PATH:~/bin"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Colour ls prompt (OS X):
export CLICOLOR="yes"
export LSCOLORS="gxhxfxcxcxdxcxcxcxgxgx"
export EDITOR="vim"
export VISUAL="vim"
export LS_OPTIONS='--color=auto'

# 256 colour support pls
if [[ $TERM != *256color* ]]; then
        export TERM=xterm-256color;
fi

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Update lines and columns
shopt -s checkwinsize

# Colour prompt :)
PS1='\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@h: ${PWD/$HOME/~}\007"' ;; *)  ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
