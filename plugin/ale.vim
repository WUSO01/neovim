" Navigate between errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" 快速跳转
nmap <silent> <F12> <Plug>(ale_go_to_definition)
nmap <silent> <F11> <Plug>(ale_find_references)

" Use quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" 出现warn 或者 error时候打开loclist或者quickfix list
let g:ale_open_list = 1
