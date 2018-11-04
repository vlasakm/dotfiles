scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

set nocompatible

filetype plugin on

syntax on

set ignorecase
set smartcase

set autoindent
set nostartofline

set number

set undofile
set undodir=~/.vim/undodir

autocmd FileType html setlocal tabstop=2

map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
