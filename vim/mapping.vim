" break this line into a new one below
map <CR> i<CR><Esc>
" add newline above current line
map <Esc><CR> O<Esc>
" add newline below current line
map <Leader><CR> o<Esc>

" autocomplete my brackets
inoremap (<cr> (<cr>)<Esc>O
inoremap [<cr> [<cr>]<Esc>O
inoremap {<cr> {<cr>}<Esc>O

" use Tab for word completion
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" move up and down more naturally
nmap k gk
nmap j gj

" minimize keys needed for window-swiching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open current window in new tab, close original
nnoremap <Leader>nt <C-W>T

" preserve indentation when pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" toggle comment
noremap <leader>c :TComment<CR>

" turnoff highlight
noremap <leader>h :noh<CR>

" format file and return to where I was before
nnoremap <Leader>= mmgg=G`mzz

" change hash syntax for current line
noremap <leader>s :s/:\(\w\+\)\s\+=>\s\+/\1: /g<CR>

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
