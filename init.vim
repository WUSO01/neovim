" Basic Setting

set nobackup                    " 不创建备份文件
set nowritebackup
set noswapfile                  " 不创建交换文件

set encoding=utf-8              " 编码
set termguicolors               " 启用真彩
set number                      " 行号
set relativenumber							" 设置相对行号
set cursorline                  " 突出显示当前行
set mouse=a                     " 启用鼠标

set tabstop=2                   " Tab 长度为2空格
set shiftwidth=2                " 自动缩进长度
set expandtab
set softtabstop=2
set smarttab
set autoindent                  " 继承前一行的缩进方式

set laststatus=2                " 显示状态栏
set showtabline=2               " 显示标签栏
set textwidth=80                " 行宽
set wrap                        " 自动折行

set showmatch                   " 显示括号匹配
set hlsearch                    " 高亮显示匹配结果
set ignorecase                  " 搜索时忽略大小写

set history=1000                " 记录历史操作
set autoread                    " 启用文件监视
set shortmess=atI               " 不显示首页提示

set hidden
set updatetime=300
set shortmess+=c

" Allow copy and paste from system clipboard
set clipboard=unnamed

syntax on                       " 语法高亮
filetype plugin indent on       " 打开文件类型检测

let mapleader = "\<Space>"

let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = '/usr/local/bin/python3'

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Auto install plugin
if empty(glob('~/.config/nvim/plugged'))
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" front-end
Plug 'pangloss/vim-javascript'      " JavaScript support
Plug 'HerringtonDarkholme/yats.vim' " TypeScript Syntax Highlighting

" GIT ---------
Plug 'airblade/vim-gitgutter'       " Show git diff of lines edited
Plug 'tpope/vim-fugitive'

" 侧边栏
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" 实用集合
Plug 'tpope/vim-surround'
Plug 'hecal3/vim-leader-guide'
Plug 'scrooloose/nerdcommenter'     " 快速注释
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'christoomey/vim-tmux-navigator'

" 文件搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" themes
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Power
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme gruvbox

" Plugin Setting

" ----------- Nerdtree --------------

nmap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeIgnore = ['^node_modules$']

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" -----------------------------------

" ----------- Wintabs----------------

nmap <silent> bp <Plug>(wintabs_previous)
nmap <silent> bn <Plug>(wintabs_next)

" -----------------------------------

" ----------- FZF -------------------
" let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }

let g:dbs = {
\  'dev': 'postgresql://root:500235@localhost:5432/psql'
\ }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" Map fzf search to CTRL P
nnoremap <silent> <C-p> :GFiles<CR>

" Map fzf + ag search to CTRL P
nnoremap <C-g> :Ag<Cr>

" -----------------------------------

" ----------- Coc -------------------

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ ]

" Give more space for displaying messages.
set cmdheight=2

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
" TODO 自动打开quickfix list
nmap <F2> <Plug>(coc-rename)

" 重构
nmap <F3> <Plug>(coc-refactor)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" -----------------------------------
