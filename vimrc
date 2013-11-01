" Space leader!
let mapleader = " "

set noswapfile
set encoding=utf-8
set ruler
set showcmd
set laststatus=2
set number

" pull in other vim settings
source ~/.vim/autocommand.vim
source ~/.vim/mapping.vim
source ~/.vim/test_runners.vim
source ~/.vim/vundle.vim

" syntax
syntax enable
filetype plugin indent on
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

" colors
set background=dark
colorscheme solarized
call togglebg#map("<F6>")

" show a bar at column 80
set textwidth=80
if exists ("+colorcolumn")
  let &colorcolumn=join(range(81,999),",")
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

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
