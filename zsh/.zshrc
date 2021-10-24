##### General Options #####

bindkey -e

unsetopt nomatch
setopt extended_glob
setopt rm_star_silent
setopt auto_cd

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Directory stack
setopt autopushd pushdminus pushdsilent pushdtohome
export dirstacksize=10
alias dh='dirs -v'

##### History #####

setopt extended_history
setopt no_share_history
unsetopt share_history
setopt inc_append_history

HISTFILE=~/.history
HISTSIZE=1000000000
SAVEHIST=$HISTSIZE

##### Auto Completion #####

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

# Completion menu style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

##### Help #####

autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

autoload -Uz run-help-git run-help-ip run-help-openssl run-help-p4 run-help-sudo run-help-svk run-help-svn
