scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

set nocompatible
set lazyredraw

colorscheme badwolf

syntax on
set number
set cursorline
set showmatch
set wildmenu

set ignorecase
set smartcase
set incsearch
set hlsearch

set autoindent
set nostartofline
set scrolloff=3

set undofile
set undodir=~/.vim/undodir

filetype plugin on
autocmd FileType html setlocal tabstop=2

map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
