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

# automatically find the directory
setopt auto_cd
cdpath=($HOME/projects $HOME/external)

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
export PS1='%{$fg_bold[red]%}$(parse_git_branch)%{$reset_color%}[${SSH_CONNECTION+"%{$fg_no_bold[green]%}%n@%m:"}%{$fg_no_bold[cyan]%}%2d%{$reset_color%} %{$fg_no_bold[magenta]%}$(parse_git_uncommitted)$(parse_git_unpushed)%{$reset_color%}] %{$fg_no_bold[green]%}%% %{$reset_color%}'

# auto-rename tmux window
# thanks teo!
rename_tmux_window_to_current_dir() {
  if [ ! -z "$TMUX" ]; then
    if [ "$PWD" != "$LPWD" ]; then
      LPWD="$PWD"
      tmux rename-window $(print -Pn "%c")
    fi
  fi
}

function precmd {
  rename_tmux_window_to_current_dir
}


# for Homebrew executables
export PATH="/usr/local/sbin:$PATH"

# custom executables
export PATH="$HOME/.bin:$PATH"

# Go dev
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# VS Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export GPG_TTY=$(tty)

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export SSH_AGENT_PID
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
else
  eval $(gpg-agent --daemon)
fi

if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
  export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
fi

export HISTTIMEFORMAT="%F %T "

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

eval "$(rbenv init -)"
