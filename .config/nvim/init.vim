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

" C style
" https://www.reddit.com/r/vim/comments/svntkt/question_about_reformattingindenting_c_code/hxh4w30/
set cinoptions+=t0  " don't indent function type
set cinoptions+=l1  " align with case label
set cinoptions+=:0  " align case with switch
set cinkeys-=0#     " directives aren't special

if has("cscope")
  " Look for a 'cscope.out' file starting from the current directory,
  " going up to the root directory.
  let s:dirs = split(getcwd(), "/")
  while s:dirs != []
          let s:path = "/" . join(s:dirs, "/")
          if (filereadable(s:path . "/cscope.out"))
                  execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
                  break
          endif
          let s:dirs = s:dirs[:-2]
  endwhile

  set csto=0        " Use cscope first, then ctags
  set cst                " Only search cscope
  set csverb        " Make cs verbose

  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

  nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

  " Open a quickfix window for the following queries.
  set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

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

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
}
EOF

lua require'plenary.filetype'.add_file('filetypes')
