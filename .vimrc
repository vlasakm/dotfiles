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
syntax on
set number
set relativenumber
set showmatch
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

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Clang-format
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

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
