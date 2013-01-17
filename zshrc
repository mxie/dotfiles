autoload -U compinit && compinit
autoload -Uz colors && colors

# use vim as an editor
export EDITOR=vim

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
  [[ -d .git && $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "✗"
}
function parse_git_unstaged {
  line=$(git status 2> /dev/null | sed -n '2 p')
  [[ -d .git && "$line" != "# Changes not staged for commit:"  && "$line" != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "(%{$fg_bold[red]%}${ref#refs/heads/}%{$reset_color%}) "
  fi
}

# prompt
export PS1='$(parse_git_branch)[${SSH_CONNECTION+"%{$fg_no_bold[green]%}%n@%m:"}%{$fg_no_bold[blue]%}%~%{$reset_color%} %{$fg_no_bold[cyan]%}$(parse_git_uncommitted)$(parse_git_unstaged)%{$reset_color%}] %{$fg_no_bold[magenta]%}$%{$reset_color%} '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

HISTSIZE=4096
SAVEHIST=4096
HISTFILE=~/.history

