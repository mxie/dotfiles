" Space leader!
let mapleader = " "

set noswapfile
set encoding=utf-8
set ruler
set showcmd
set laststatus=2
set number

set rtp+=/usr/local/opt/fzf

" pull in other vim settings
source ~/.vim/autocommand.vim
source ~/.vim/linters.vim
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
colorscheme molokai
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" set character limit to 80 per line
set textwidth=80

" tab completion
set complete=.,b,u,]
set wildmode=longest,list:longest

" other stuff
command! W w        "because I ALWAYS do :W by accident
command! Q q        "because I ALWAYS do :Q by accident
command! Wa wa      "because I ALWAYS do :Wa by accident

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

" https://github.com/vim-airline/vim-airline#smarter-tab-line
let g:airline#extensions#tabline#enabled = 1

" enable mouse mode
if has('mouse')
  set mouse=a
endif

set redrawtime=10000
set maxmempattern=10000

" https://github.com/golang/tools/blob/master/gopls/doc/vim.md
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_assignments = 1
