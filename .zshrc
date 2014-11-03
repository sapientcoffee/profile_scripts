# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Expand out path:
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:~/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:~/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Rest taken from Matt Day template

# Colour ls prompt (non-gnu 'ls' i.e. OS X)
export CLICOLOR="yes"
export LSCOLORS="gxhxfxcxcxdxcxcxcxgxgx"

# Load colour names
autoload -U colors && colors

# 256 colour support pls
if [[ $TERM != *256color* ]]; then
	export TERM=xterm-256color;
fi

# Essentials...
# If vim exists somewhere, make it the default editor:
if [[ -x $(which vim 2> /dev/null) ]]
	then
	export VISUAL="vim"
	export USE_EDITOR=$VISUAL
	export EDITOR=$VISUAL
fi

# Custom prompt (coloured in yellow and cyan): user@host:~%
PS1="%{$fg_bold[yellow]%}%n@%m%{$reset_color%}:%{$fg_bold[cyan]%}%~%{$reset_color%}%# "

# Date on right-side including return code [0][09:30:00]
RPROMPT=[%?]%{$fg_bold[grey]%}[%D{%H:%M:%S}]%{$reset_color%}

# Print xterm title (user@host:~)
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# A few nice settings
for option (
	noautomenu 	# don't select stuff automatically when tabbing if there are options
	auto_cd 	# Auto CD (i.e. can type '..' to change to parent directory, or 'bin' to change to ./bin)
	extendedglob 	# Expanded globbing (i.e. allow 'ls -d ^*.jpg' to show non-jpg files)
	noclobber 	# Require '>!' instead of '>' to overwrite a file
	correct		# Correct common errors
) setopt $option

# If a command takes longer than 15 seconds, print its duration
export REPORTTIME=15
# Meh, shit happens:
alias 'cd..=cd ..'
# Common shortcuts
alias ll='ls -la'
alias l='ls -CF'
# Some aliases are platform specific, such as ls --color=auto, so load them here:
if [[ -e .zsh_aliases ]]
	then
	source .zsh_aliases
fi

# History management
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
#setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Command completion
autoload -U compinit
compinit

# Ensure ctrl-a/ctrl-e for home/end respectively:
bindkey -e

# Map delete key (fn+backspace) on OS X correctly:
bindkey "^[[3~" delete-char

# Fish style syntax highlighting
if [[ -e .zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
	then
	source .zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Fish style command completion
if [[ -e ~/.zsh-autosuggestions/autosuggestions.zsh ]]
	then
	source ~/.zsh-autosuggestions/autosuggestions.zsh
	zle-line-init() {
		zle autosuggest-start
	}
	zle -N zle-line-init
fi
