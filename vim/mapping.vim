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
noremap <Leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" toggle comment
noremap <Leader>c :TComment<CR>

" turnoff highlight
noremap <Leader>h :noh<CR>

" format file and return to where I was before
nnoremap <Leader>= mmgg=G`mzz

" change hash syntax for current line
noremap <Leader>s :s/:\(\w\+\)\s\+=>\s\+/\1: /g<CR>

" delete current file
noremap <Leader>rm :call delete(expand('%'))<CR>

" force reload windows
noremap <Leader>e :windo e!<CR>

" redraw my windows because sometimes it gets fucked up
noremap <Leader>r :redraw!<CR>

" write to file without prehooks
noremap <Leader>w :noautocmd w<CR>

" start a file search
noremap <Leader>g :Ag!

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
