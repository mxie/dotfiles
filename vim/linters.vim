let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'elixir': ['mix_format'],
\   'typescript': ['prettier', 'tslint', 'eslint']
\}

let g:ale_linters = {
\   'typescript': ['tslint', 'tsserver'],
\   'go': ['gopls']
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:elm_format_autosave = 1
