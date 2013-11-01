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
