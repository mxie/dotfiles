#!/bin/sh


echo "Symlinking dotfiles to your home directory"
for file in `ls | grep -v README`; do
  if [ -d $file ]; then
    echo "Symlinking vim files into your .vim directory"
    for vim_file in `ls $file`; do
      ln -fs "$PWD/$file/$vim_file" "$HOME/.$file/$vim_file"
    done
  else
    ln -fs "$PWD/$file" "$HOME/.$file"
  fi
done

vundle_dir=~/.vim/bundle/vundle
if [ ! -d $vundle_dir ]; then
  echo 'Installing vundle'
  git clone https://github.com/gmarik/vundle.git
fi

echo 'Running BundleInstall'
vim +BundleInstall +qa
