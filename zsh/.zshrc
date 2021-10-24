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
