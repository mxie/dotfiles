# completion
autoload -U compinit && compinit

# TODO: need description
autoload -U select-word-style && select-word-style bash

# use vim as an editor
export VISUAL='vim'
export EDITOR=$VISUAL

# incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

HISTSIZE=4096
SAVEHIST=4096
HISTFILE=~/.history

# expand functions in the prompt
setopt prompt_subst

function kill_shit {
  ps aux | grep $1 | grep -v grep | awk '{ FS=" +" }; { print $2 }' | xargs -I pid kill -9 pid
}
