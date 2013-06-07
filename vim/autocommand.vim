autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux
autocmd BufRead,BufNewFile *.coffee* set filetype=coffee
autocmd BufWritePre * :%s/\s\+$//e
