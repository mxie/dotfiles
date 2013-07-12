" vimux
let g:VimuxHeight = "25"
let g:VimuxOrientation = "h"
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

" turbux
let g:turbux_command_prefix = 'clear; bundle exec'
let g:turbux_command_rspec  = 'rspec --color'
" override default mappins
let g:no_turbux_mappings = 1
" run all tests in the spec
map <leader>a <Plug>SendTestToTmux
" run this line in the spec
map <leader>l <Plug>SendFocusedTestToTmux

" align Cucumber tables as you type
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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
