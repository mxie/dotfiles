#!/bin/sh
echo 'Set up dev environment using laptop'
bash <(curl -s https://raw.githubusercontent.com/thoughtbot/laptop/master/mac) 2>&1 | tee ~/laptop.log

echo 'Using RCM to symlink dotfiles'
rcup -v

vundle_dir=~/.vim/bundle/vundle
if [ ! -d $vundle_dir ]; then
  echo 'Installing vundle'
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo 'Running BundleInstall'
vim -u vim/vundle.vim +BundleInstall +qa

# restart the shell
exec -l $SHELL
