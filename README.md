dotfiles
========

    for file in `ls dotfiles/* | grep -v README | sed 's/dotfiles\///'`; do ln -fs dotfiles/$file .$file; done;
