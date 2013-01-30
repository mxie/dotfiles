" Space leader!
let mapleader = " "

" use vim defaults not vi
set nocompatible

" Character encoding
set encoding=utf-8

" Line/character number things
set number
set ruler
set showcmd 
set laststatus=2
" show a bar at column 79
"set textwidth=79
"if exists ("+colorcolumn")
"    set colorcolumn=+1
"endif

" Purdy things
" Vundle setup
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
" syntax
syntax enable
set background=light
set showmatch
autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile
autocmd BufRead,BufNewFile *.md set filetype=markdown
" tabs
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" indentation
set autoindent
set cindent

" Search behavior
set incsearch
set hlsearch

" Keyboard behaviors
set backspace=indent,eol,start
set splitbelow
set splitright
" matching brackets
highlight MatchParen ctermbg=74
inoremap (<cr> (<cr>)<Esc>O
inoremap [<cr> [<cr>]<Esc>O
inoremap {<cr> {<cr>}<Esc>O
" insert new line current w/o going into insert mode
map <CR> o<Esc>
map <Leader><CR> O<Esc>
" tab completion
set complete=.,b,u,]
set wildmode=longest,list:longest
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
" other stuff
command! W w        "because I ALWAYS do :W by accident
command! Q q        "because I ALWAYS do :Q by accident
nmap k gk
nmap j gj
" allow jumping between do/end, etc. using %
runtime macros/matchit.vim
" command line abbreviations
cabbr <expr> %% expand('%:p:h')

" align cucumber tables as you type
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>


:" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'ack.vim'
Bundle 'tComment'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'godlygeek/tabular'
Bundle 'endwise.vim'
Bundle 'rake.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'

" Functions
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

function! RunCurrentSpecFile()
  if InSpecFile()
    let l:command = "s " . @% . " -f documentation"
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let l:command = "s " . @% . " -l " . line(".") . " -f documentation"
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunLastSpec()
  if exists("t:last_spec_command")
    call RunSpecs(t:last_spec_command)
  endif
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1
endfunction

function! SetLastSpecCommand(command)
  let t:last_spec_command = a:command
endfunction

function! RunSpecs(command)
  execute ":w\|!clear && echo " . a:command . " && echo && " . a:command
endfunction
