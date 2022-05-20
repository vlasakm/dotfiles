" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'Mofiqul/vscode.nvim'
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
let g:vscode_style = "dark"
let g:vscode_transparent = 1
colorscheme vscode

" netrw settings
let g:netrw_banner=0

" Highlight trailing whitespace
" https://stackoverflow.com/a/7255709/6184792
highlight link ExtraWhitespace Error
autocmd BufEnter    * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" C style
" https://www.reddit.com/r/vim/comments/svntkt/question_about_reformattingindenting_c_code/hxh4w30/
set cinoptions+=t0  " don't indent function type
set cinoptions+=l1  " align with case label
set cinoptions+=:0  " align case with switch
set cinkeys-=0#     " directives aren't special

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
