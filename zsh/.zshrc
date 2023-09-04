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

##### Colors #####

autoload -U colors
colors

export CLICOLOR=1 # enable colored output from ls, etc
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

##### Prompt #####

setopt prompt_subst

# Adds the current branch name in green
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "(%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%})"
  fi
}

export PS1='[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%2~%{$reset_color%}]$(git_prompt_info) '
export RPS1='%D{%T}'
