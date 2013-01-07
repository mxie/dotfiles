" use vim defaults not vi
set nocompatible

" Character encoding
set encoding=utf-8

" Line/character number things
set number
set ruler
"set textwidth=79
"if exists ("+colorcolumn")
"    set colorcolumn=+1
"endif

" Purdy things
set background=light
" Vundle setup
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
" syntax
syntax enable
set showmatch
autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile
" tabs
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" indentation
set autoindent
set cindent

" Search stuff
set incsearch
set hlsearch

" Matching brackets and things
highlight MatchParen ctermbg=74
inoremap (<cr> (<cr>)<Esc>O
inoremap [<cr> [<cr>]<Esc>O
inoremap {<cr> {<cr>}<Esc>O

" Remapping some key behaviors
set paste
set backspace=indent,eol,start
command! W w        "because I ALWAYS do :W by accident
command! Q q        "because I ALWAYS do :Q by accident

nmap k gk
nmap j gj

"set scrolloff=999

" let Vundle manage Vundle
"  " required! 
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
