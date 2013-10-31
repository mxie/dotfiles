autocmd BufRead,BufNewFile Gemfile set filetype=ruby
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux
autocmd BufRead,BufNewFile *.coffee* set filetype=coffee
autocmd BufWritePre * :%s/\s\+$//e
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
