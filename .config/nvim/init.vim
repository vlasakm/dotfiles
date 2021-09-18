" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'aonemd/kuroi.vim', { 'commit': '6ec47dc72c5031e1ceab6ee2100a7329052d97a7' }
Plug 'ziglang/zig.vim'
Plug 'junegunn/fzf.vim'
call plug#end()

" Basic
set hidden
set splitbelow splitright
set wildmode=list:longest,full
let mapleader = " "

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
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>r :Rg<CR>

" Cursor behavior
set nostartofline
set nojoinspaces
set scrolloff=8

" Undo
set undofile

" Current directory
" https://vimways.org/2019/vim-and-the-working-directory/
nnoremap <leader>cd :lcd %:h<CR>

" Colors
set termguicolors " enable 24-bit colors
colorscheme kuroi
highlight Normal guibg=NONE
highlight EndOfBuffer gui=NONE guibg=NONE

" netrw settings
let g:netrw_banner=0

" Highlight trailing whitespace
" https://stackoverflow.com/a/7255709/6184792
highlight link ExtraWhitespace Error
autocmd BufEnter    * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
