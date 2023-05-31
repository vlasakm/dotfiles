" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'Mofiqul/vscode.nvim'
Plug 'ziglang/zig.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
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
highlight ModeMsg guibg=NONE

" Status line
set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ],
      \ },
      \ 'colorscheme': 'one',
      \ }

" netrw settings
let g:netrw_banner=0

" Highlight trailing whitespace
" https://stackoverflow.com/a/7255709/6184792
highlight link ExtraWhitespace Error
autocmd BufEnter    * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

lua <<EOF
-- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash", "bibtex", "c", "cmake", "cpp", "css", "dockerfile", "fish", "html", "json", "latex", "llvm", "lua", "make", "python", "rst", "rust", "scala", "toml", "vim", "zig",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- https://github.com/neovim/nvim-lspconfig

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {}
lspconfig.clangd.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF

lua require'plenary.filetype'.add_file('filetypes')
