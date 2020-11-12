set nobackup                    " 不创建备份文件
set nowritebackup
set noswapfile                  " 不创建交换文件

set encoding=utf-8              " 编码
set termguicolors               " 启用真彩
set number                      " 行号
set relativenumber							" 设置相对行号
set cursorline                  " 突出显示当前行
" set cursorcolumn								" 突出当前列
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

if empty(glob('~/.config/nvim/plugged'))
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" front-end
Plug 'pangloss/vim-javascript'      " JavaScript support
Plug 'leafgarland/typescript-vim'   " TypeScript syntax
Plug 'HerringtonDarkholme/yats.vim' "TypeScript Syntax Highlighting
Plug 'maxmellon/vim-jsx-pretty'     " JS and JSX syntax
Plug 'jparise/vim-graphql'          " GraphQL syntax

" git ---------
Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'tpope/vim-fugitive'         " :Gblame

" 侧边栏
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'

" GIT
Plug 'tpope/vim-fugitive'

" 实用集合
Plug 'tpope/vim-surround'
Plug 'hecal3/vim-leader-guide'
Plug 'ap/vim-buftabline'  " 顶部显示buffer
Plug 'dense-analysis/ale'

" 文件搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 悬浮窗
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" 美化
Plug 'itchyny/lightline.vim'

" themes
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'crusoexia/vim-monokai'

" Power
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme gruvbox
