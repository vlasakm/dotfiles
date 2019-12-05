set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for' : 'cpp' }
Plug 'rhysd/vim-clang-format'
Plug 'aonemd/kuroi.vim'
let g:plug_shallow = 0
" Repositories not supporting shallow clone
Plug 'https://sanctum.geek.nz/code/vim-redact-pass.git'
call plug#end()

" Basic
set hidden
set splitbelow splitright

" Input, drawing
set lazyredraw

" Clipboard
set clipboard^=unnamedplus

" UI
set number
set relativenumber

" Search
set ignorecase
set smartcase

" Cursor behavior
set nostartofline
set scrolloff=2

" Undo
set undofile
set undodir=~/.vim/undo//
set directory=~/.vim/swap//

" Colors
set termguicolors " enable 24-bit colors
colorscheme kuroi
highlight Normal guibg=NONE
highlight EndOfBuffer gui=NONE guibg=NONE

" Delete trailing whitespace on save
autocmd BufWrite * %s/\s\+$//e

" Filetype specific
autocmd FileType html,css,tex,latex,context setlocal tabstop=2
