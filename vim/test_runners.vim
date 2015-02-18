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
map <Leader>a <Plug>SendTestToTmux
" run this line in the spec
map <Leader>l <Plug>SendFocusedTestToTmux
