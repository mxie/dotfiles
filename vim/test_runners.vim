" vimux

let g:VimuxHeight = "25"
let g:VimuxOrientation = "h"

" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand(";")<CR>
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

" vim-test

" use vimux to send commands to a pane
let test#strategy = "vimux"
" run all tests in the spec
map <Leader>a :TestFile<CR>
" run this line in the spec
map <Leader>l :TestNearest<CR>
