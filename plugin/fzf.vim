let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }

let g:dbs = {
\  'dev': 'postgresql://root:500235@localhost:5432/psql'
\ }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Map fzf search to CTRL P
nnoremap <silent> <C-p> :GFiles<CR>

" Map fzf + ag search to CTRL P
nnoremap <C-g> :Ag<Cr>

