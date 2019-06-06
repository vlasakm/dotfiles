" Basic
set nocompatible
set lazyredraw
filetype plugin on
set splitbelow splitright
set clipboard=unnamedplus

" UTF-8
set encoding=utf-8
"set fileencoding=utf-8
"scriptencoding utf-8

" UI
syntax enable
set number
set relativenumber
set showmatch
set showcmd
highlight Visual cterm=reverse ctermbg=NONE

" Search
set ignorecase
set smartcase
set incsearch

" Indent / cursor behavior
set smartindent
set nostartofline
set scrolloff=3

" Undo
set undofile
set undodir=~/.vim/undodir

" Autoformat
autocmd BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0

" Termdebug
packadd termdebug

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'Chiel92/vim-autoformat'
call plug#end()

" Filetype specific
autocmd FileType html,css,tex,latex,context setlocal tabstop=2

" No arrow keys
noremap <Up> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Down> <Nop>
noremap <Left> <Nop>
inoremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Right> <Nop>
