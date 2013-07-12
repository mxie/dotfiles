" Space leader!
let mapleader = " "

" use vim defaults not vi
set nocompatible
set noswapfile
set vb

" pull in other vim settings
source ~/.vim/autocommand.vim
source ~/.vim/mapping.vim
source ~/.vim/test_runners.vim
source ~/.vim/vundle.vim

" Character encoding
set encoding=utf-8

" Line/character number things
set relativenumber
set ruler
set showcmd
set laststatus=2

" syntax
syntax enable
set showmatch

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

" gui things
if has('gui_running')
  set background=dark
  set guioptions-=T
  set guioptions+=c
  colorscheme solarized
else
  set background=light
endif
let g:solarized_termcolors=256

" show a bar at column 79
set textwidth=79
if exists ("+colorcolumn")
   set colorcolumn=+1
   highlight ColorColumn ctermbg=234
endif

" tab completion
set complete=.,b,u,]
set wildmode=longest,list:longest

" other stuff
command! W w        "because I ALWAYS do :W by accident
command! Q q        "because I ALWAYS do :Q by accident

" allow jumping between do/end, etc. using %
runtime macros/matchit.vim

" matching brackets
highlight MatchParen ctermbg=74

" command line abbreviations
cabbr <expr> %% expand('%:p:h')

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
