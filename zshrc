autoload -U compinit && compinit
autoload -Uz colors && colors
autoload -U select-word-style && select-word-style bash

# `cd` without `cd`
setopt AUTO_CD

# use vim as an editor
export EDITOR='vim'
# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# enable colored output from ls, etc
export CLICOLOR=1
# expand functions in the prompt
setopt prompt_subst

# set up to display branch name and status
function parse_git_uncommitted {
  [[ -d .git && $(command git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "✗"
}
function parse_git_unstaged {
  line=$(command git status 2> /dev/null | sed -n '2 p')
  [[ -d .git && "$line" != "# Changes not staged for commit:"  && "$line" != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "(%{$fg_bold[red]%}${ref#refs/heads/}%{$reset_color%}) "
  fi
}

# prompt
export PS1='$(parse_git_branch)[${SSH_CONNECTION+"%{$fg_no_bold[green]%}%n@%m:"}%{$fg_no_bold[blue]%}%~%{$reset_color%} %{$fg_no_bold[cyan]%}$(parse_git_uncommitted)$(parse_git_unstaged)%{$reset_color%}] %{$fg_no_bold[magenta]%}$%{$reset_color%} '

HISTSIZE=4096
SAVEHIST=4096
HISTFILE=~/.history

export PATH=$PATH:$HOME/bin

function kill_shit {
  ps aux | grep $1 | grep -v grep | awk '{ FS=" +" }; { print $2 }' | xargs -I pid kill -9 pid
}

function diff_routes {
  echo 'Generating new routes...'
  bundle exec rake routes > new_routes
  git stash --quiet
  echo 'Generating old routes...'
  bundle exec rake routes > old_routes
  if [[ -f old_routes && -f new_routes ]]; then
    echo 'Compare!'
    diff_results=`diff -uw old_routes new_routes`
    if [[ -n $diff_results ]]; then
      echo $diff_results
    else
      echo 'No route changes. Check for errors in generated files or try restarting your shell.'
    fi
  fi
  git stash pop --quiet
}
