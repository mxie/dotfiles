#!/bin/sh

echo "Symlinking dotfiles to your home directory"
for name in *; do
  target="$HOME/.$name"

  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done

vundle_dir=~/.vim/bundle/vundle
if [ ! -d $vundle_dir ]; then
  echo 'Installing vundle'
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo 'Running BundleInstall'
vim -u vim/vundle.vim +BundleInstall +qa
