" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'aonemd/kuroi.vim', { 'commit': '6ec47dc72c5031e1ceab6ee2100a7329052d97a7' }
Plug 'ziglang/zig.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

" https://github.com/nvim-treesitter/nvim-treesitter
lua <<EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {
	"html", "latex",
    },
  },
  indent = {
    enable = true,
  },
}
EOF

lua require'plenary.filetype'.add_file('filetypes')
