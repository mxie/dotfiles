augroup syntaxHighlighting
	autocmd!
	autocmd BufRead,BufNewFile *.md,*.markdown setlocal filetype=ghmarkdown
	autocmd BufRead,BufNewFile *.coffee* set filetype=coffee
	autocmd BufRead,BufNewFile *.proto set filetype=proto
	autocmd BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux
	autocmd BufRead,BufNewFile Gemfile,Appraisals set filetype=ruby
	autocmd BufRead,BufNewFile gitconfig set filetype=gitconfig
  autocmd BufRead,BufNewFile,BufReadPost *.json set syntax=json
augroup end
autocmd BufWritePre * :%s/\s\+$//e

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Highlight trailing whitespace while not in insert mode
autocmd InsertEnter * match Error /\s\+\%#\@<!$/
autocmd InsertLeave * match Error /\s\+$/

" from http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(5, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
