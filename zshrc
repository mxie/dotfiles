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

df=('aliases' 'functions')
for f in $df; do
  if [ -e "$HOME/.$f" ]; then
    source "$HOME/.$f"
  fi
done

if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
  export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
fi

if which brew > /dev/null; then
  source $(brew --prefix asdf)/libexec/asdf.sh
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi

HISTSIZE=4096
SAVEHIST=4096
HISTFILE=~/.history

# automatically find the directory
setopt auto_cd
cdpath=($HOME/projects $HOME/external)

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='%{$fg_bold[red]%}$(parse_git_branch)%{$reset_color%}[${SSH_CONNECTION+"%{$fg_no_bold[green]%}%n@%m:"}%{$fg_no_bold[cyan]%}%2d%{$reset_color%} %{$fg_no_bold[magenta]%}$(parse_git_uncommitted)$(parse_git_unpushed)%{$reset_color%}] %{$fg_no_bold[green]%}%% %{$reset_color%}'

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

export HISTTIMEFORMAT="%F %T "

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi
