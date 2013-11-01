# makes color constants available
autoload -U colors && colors

# enable colored output from ls, etc
export CLICOLOR=1

# load scripts
export PATH="$HOME/.bin:$PATH"

# enable shims and autocompletion
eval "$(rbenv init -)"

# source boxen config
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# set up to display branch name and status
function parse_git_uncommitted {
  [[ -d .git && $(command git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "✗"
}
function parse_git_unstaged {
  line=$(command git status 2> /dev/null | sed -n '2 p')
  [[ -d .git && "$line" != "# Changes not staged for commit:"  && "$line" != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "(%{$fg_bold[red]%}${ref#refs/heads/}%{$reset_color%}) "
  fi
}

# prompt
export PS1='$(parse_git_branch)[${SSH_CONNECTION+"%{$fg_no_bold[green]%}%n@%m:"}%{$fg_no_bold[blue]%}%~%{$reset_color%} %{$fg_no_bold[cyan]%}$(parse_git_uncommitted)$(parse_git_unstaged)%{$reset_color%}] %{$fg_no_bold[magenta]%}$%{$reset_color%} '
