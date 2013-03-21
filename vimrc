" Space leader!
let mapleader = " "

" use vim defaults not vi
set nocompatible
set noswapfile
set vb

" Character encoding
set encoding=utf-8

" Line/character number things
set number
set ruler
set showcmd 
set laststatus=2
" show a bar at column 79
set textwidth=79
if exists ("+colorcolumn")
   set colorcolumn=+1
   highlight ColorColumn ctermbg=234
endif

" Purdy things
" Vundle setup
filetype off
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
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
" syntax
syntax enable
set showmatch
autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile .tmux.conf*,tmux.conf* set filetype=tmux
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
" preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
" toggle comment
noremap <leader>c :TComment<CR>
" turnoff highlight
noremap <leader>h :noh<CR>
" allow jumping between do/end, etc. using %
runtime macros/matchit.vim
" command line abbreviations
cabbr <expr> %% expand('%:p:h')

" align cucumber tables as you type
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" vimux mappings
let g:VimuxHeight = "30"
let g:VimuxOrientation = "h"
" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>rl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>ri :VimuxInspectRunner<CR>
" Close all other tmux panes in current window
map <Leader>rx :VimuxClosePanes<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>rq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>rs :VimuxInterruptRunner<CR>

" turbux mappings
let g:turbux_command_rspec  = 'clear; rspec'
let g:turbux_command_cucumber = 'clear; cucumber'
let g:no_turbux_mappings = 1
map <leader>a <Plug>SendTestToTmux
map <leader>l <Plug>SendFocusedTestToTmux

:" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'ack.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'benmills/vimux'
Bundle 'christoomey/magictags'
Bundle 'danro/rename.vim'
Bundle 'endwise.vim'
Bundle 'godlygeek/tabular'
Bundle 'jgdavey/vim-turbux'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'rake.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tComment'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'

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
