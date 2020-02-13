" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
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
set wildmode=list:longest,full

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
set nohlsearch

" Substitute
set gdefault

" Cursor behavior
set nostartofline
set nojoinspaces
set scrolloff=2

" Undo
set undofile

" Colors
set termguicolors " enable 24-bit colors
colorscheme kuroi
highlight Normal guibg=NONE
highlight EndOfBuffer gui=NONE guibg=NONE

" netrw settings
let g:netrw_banner=0

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
