#!/bin/sh
echo 'Set up dev environment using laptop'
bash <(curl -s https://raw.githubusercontent.com/thoughtbot/laptop/master/mac) 2>&1 | tee ~/laptop.log

echo 'Using RCM to symlink dotfiles'
rcup -v

vundle_plugin=~/.vim/bundle/Vundle.vim
if [ ! -d $vundle_plugin ]; then
  echo 'Installing vundle'
  git clone https://github.com/gmarik/Vundle.vim.git $vundle_plugin
fi

echo 'Running vundle'
vim -u vim/vundle.vim +PluginInstall +qa

# restart the shell
exec -l $SHELL
