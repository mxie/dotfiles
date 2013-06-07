#!/bin/sh

echo "Symlinking dotfiles to your home directory"

for file in *; do
  if [ "$file" =~ 'README' ]; then
    ln -fs "$PWD/$file" "$HOME/.$file"
  fi
done

vundle_dir=~/.vim/bundle/vundle
if [ ! -d $vundle_dir ]; then
  echo 'Installing vundle'
  git clone https://github.com/gmarik/vundle.git
fi

echo 'Running BundleInstall'
vim -u ~/.vimrc +BundleInstall +qa
