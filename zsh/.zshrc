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
