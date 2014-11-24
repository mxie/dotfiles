# completion
autoload -U compinit && compinit

# TODO: need description
autoload -U select-word-style && select-word-style bash

# for some nice batch actions to files
autoload -U zmv

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

# set up to display branch name and status
function parse_git_uncommitted {
  [[ -d .git && $(command git status 2> /dev/null) =~ "Changes|Untracked" ]] && echo "✗"
}
function parse_git_branch() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "${ref#refs/heads/} "
  fi
}
function parse_git_unpushed {
  unpushed_commits=$(command git cherry -v origin/$(parse_git_branch) 2> /dev/null)
  [[ -d .git && -n $unpushed_commits ]] && echo "*"
}

# prompt
export PS1='%{$fg_bold[red]%}$(parse_git_branch)%{$reset_color%}[${SSH_CONNECTION+"%{$fg_no_bold[green]%}%n@%m:"}%{$fg_no_bold[cyan]%}%~%{$reset_color%} %{$fg_no_bold[magenta]%}$(parse_git_uncommitted)$(parse_git_unpushed)%{$reset_color%}] %{$fg_no_bold[green]%}%% %{$reset_color%}'

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/lib/node_modules"
source $(brew --prefix nvm)/nvm.sh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"
export PATH="$HOME/.bin:$PATH"

# aliases `hub` to `git` for the shell
eval "$(hub alias -s)"
