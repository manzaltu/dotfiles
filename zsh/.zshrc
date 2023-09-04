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

##### FZF #####

# Based on instructions found here https://github.com/junegunn/fzf/blob/master/README.md

# FZF mappings and options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh ||
{ [ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh }

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

##### Utilities #####

alias cdp='source ~/.local/share/utils/cdp'
