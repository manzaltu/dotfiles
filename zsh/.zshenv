##### Language #####

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

##### Emacs Editor #####

export VISUAL='emacsclient'
export EDITOR=$VISUAL
alias ec='emacsclient -n'

export LSP_USE_PLISTS=true

##### Cargo Setup #####

if [ -r "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env";
fi

##### Env Vars #####

PATH="$HOME/.local/bin:$PATH"

##### Local Configuration #####

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
