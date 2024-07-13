"  ██          ██   ██               ██
" ░░          ░░   ░██              ░░
"  ██ ███████  ██ ██████    ██    ██ ██ ██████████
" ░██░░██░░░██░██░░░██░    ░██   ░██░██░░██░░██░░██
" ░██ ░██  ░██░██  ░██     ░░██ ░██ ░██ ░██ ░██ ░██
" ░██ ░██  ░██░██  ░██   ██ ░░████  ░██ ░██ ░██ ░██
" ░██ ███  ░██░██  ░░██ ░██  ░░██   ░██ ███ ░██ ░██
" ░░ ░░░   ░░ ░░    ░░  ░░    ░░    ░░ ░░░  ░░  ░░

" ---
" general config
" ---

" Remove compatibility with VI
set nocompatible
" Set encoding to utf-8
set encoding=utf-8
scriptencoding utf-8
" Disable swap file
set noswapfile
" Disable bells
set noerrorbells
" Set clipboard register to system clipboard
set clipboard=unnamed,unnamedplus
" Wrap line to previous line's indentation
set breakindent
" Show line numbers and set width to 3
set number numberwidth=3
" Case insensitive search for lowercase query
set ignorecase
" Case sensitive search for queries with caps
set smartcase
" Display tabs as 2 spaces
set tabstop=2
" Indent with 2 spaces when >> << == are used
set shiftwidth=4
" Tab key will insert spaces instead of tabs
set expandtab
" Display trailing whitespaces as • and tab as →•
set list listchars=trail:•,tab:→•
" Use terminal cursor for all modes
set guicursor=
" Disable mouse
set mouse=
" Relative line numbers
set relativenumber
" Set viminfo path
set viminfo='100,n$HOME/.config/nvim/nviminfo
" Disable mode message
set noshowmode
" split right and below
set splitright
set splitbelow

" ---
" keybinds
" ---

" Set leader key to Space
let mapleader = "\<Space>"

" Move via display line, but only if v:count is 0
" i.e. `j` will execute `gj`, but `2j` will execute `2j`
" https://stackoverflow.com/a/21000307
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" Remaps to correct mistypes
command W w
command Wq wq
map <F1> <Esc>
map <S-k> <Nop>
map Q <NOP>

" Write with sudo
command Sudow w !sudo tee %

" Remap pane navigation to Ctrl+[h, j, k, l]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap splits to SPC+[-,<]
nnoremap <leader>- <C-w>s
nnoremap <leader>< <C-w>v

" Tab navigation via leader+number
" https://vim.fandom.com/wiki/Alternative_tab_navigation
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

" Tab navigation with t prefix
" https://vim.fandom.com/wiki/Alternative_tab_navigation
nnoremap th :tabprev<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tabnext<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

" Restart LSP
nnoremap <leader>r :LspRestart<CR>

" Normal mode in terminal with Esc
tnoremap <Esc> <C-\><C-n>

" Open terminal and split below
vnoremap <C-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <C-t> :split<CR>:ter<CR>:resize 15<CR>

" ---
" macros
" ---

let @p='gg0Orequire ''pry''orequire ''pry-byebug''0'
let @i='oimport ipdb; ipdb.set_trace();'

" ---
" vim-plug
" ---

let plugged_dir = "$HOME/.config/nvim/plugged"
call plug#begin(plugged_dir)
" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
" Git integration
Plug 'tpope/vim-fugitive'
" Find and replace in cwd
Plug 'dyng/ctrlsf.vim'
" Start screen
Plug 'mhinz/vim-startify'
" colorscheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" tags
Plug 'ludovicchabant/vim-gutentags'
" synstack
Plug 'dylnmc/synstack.vim'
" Hex codes to colors
Plug 'norcalli/nvim-colorizer.lua'
" Lua-powered statusline
Plug 'nvim-lualine/lualine.nvim'
" Per-directory local config
Plug 'klen/nvim-config-local'
" Run tests in a neovim terminal
Plug 'vim-test/vim-test'
" Async tests
Plug 'nvim-lua/plenary.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-vim-test'
Plug 'nvim-neotest/nvim-nio'
" Native lsp
Plug 'neovim/nvim-lspconfig'
" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Formatting
Plug 'mhartington/formatter.nvim'
" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.8'}
" File exploer
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
" Git decorations
Plug 'lewis6991/gitsigns.nvim'
" Commenting
Plug 'numToStr/Comment.nvim'
" Parentheses matching
Plug 'p00f/nvim-ts-rainbow'
" LSP installer
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()

" ---
" ctrlsf
" ---

" Set window size to 50%
let g:ctrlsf_winsize = '50%'

nmap <leader>a <Plug>CtrlSFPrompt
nmap <leader>* <Plug>CtrlSFCCwordPath<CR>

" ---
" startify
" ---

" Custom header
let g:startify_custom_header = ['   welcome to hell']
" Do not change to directory of opened file
let g:startify_change_to_dir = 0
" Change directory to opened file's git repository's root
let g:startify_change_to_vcs_root = 1
" Display 5 files per section
let g:startify_files_number = 5
" Customize startify list order and content
let g:startify_list_order = [
  \ ['   MRU CWD'],
  \ 'dir',
  \ ['   MRU'],
  \ 'files',
  \ ]

map <leader>S :Startify<CR>

" ---
" catppuccin
" ---

set background=dark
set termguicolors

lua << EOF
local catppuccin = require("catppuccin")

catppuccin.setup({
  integrations = {
    ts_rainbow = true,
  },
  color_overrides = {
    mocha = {
      text = "#F4CDE9",
      subtext1 = "#DEBAD4",
      subtext0 = "#C8A6BE",
      overlay2 = "#B293A8",
      overlay1 = "#9C7F92",
      overlay0 = "#866C7D",
      surface2 = "#705867",
      surface1 = "#5A4551",
      surface0 = "#44313B",

      base = "#352939",
      mantle = "#211924",
      crust = "#1a1016",
    },
  },
})
EOF

colorscheme catppuccin

" ---
" copilot
" ---

" Use Ctrl-j to accept suggestions
" imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

" ---
" synstack
" ---

nmap <leader>ss <plug>(SynStack)

" ---
" treesitter
" ---

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "query",
    "python",
    "html",
    "javascript",
    "dockerfile",
    "markdown",
    "rust",
    "svelte",
    "typescript",
    "lua",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  }
}
EOF

nmap <leader>st :TSHighlightCapturesUnderCursor<CR>
nmap <leader>sp :TSPlaygroundToggle<CR>

" ---
" colorizer
" ---

lua <<EOF
require'colorizer'.setup()
EOF

" ---
" lualine
" ---

lua <<EOF
local lualine = require("lualine")

-- use emotes for mode names

local mode_map = {

  n = "(ᴗ_ ᴗ。)", -- normal mode

  nt = "(ᴗ_ ᴗ。)", -- normal mode in terminal

  i = "(•̀ - •́ )", -- insert

  R = "( •̯́ ₃ •̯̀)", -- replace

  v = "(⊙ _ ⊙ )", -- visual by character

  V = "(⊙ _ ⊙ )", -- visual by line

  no = "Σ(°△°ꪱꪱꪱ)", -- operator pending

  ["\22"] = "(⊙ _ ⊙ )",

  t = "(⌐■_■)", -- terminal mode

  ['!'] = "Σ(°△°ꪱꪱꪱ)",

  c = "Σ(°△°ꪱꪱꪱ)", -- c requires some kind of motion; e.g. you can type cw to remove the whole word and enter insert mode. On the other hand, cl is essentially the same as s.

  s = "SUB"

}

lualine.setup {

  sections = {

    lualine_a = {

      {

      "mode",

      icons_enabled = true,

      separator = {

        left = "",

        right = ""

      },

        fmt = function()

          return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode

        end

      },

    },

    lualine_x = {'encoding', 'filetype'}

  },

}

EOF

" ---
" nvim-config-local
" ---

lua <<EOF
require('config-local').setup {
  config_files = { "local.nvimrc" }
}
EOF

" ---
" vim-test
" ---

nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>

let test#strategy = "neovim"
let test#neovim#term_position = "vert"
" Override this value in local.nvimrc
let test#python#djangotest#executable="docker exec web python manage.py test"

" ---
" neotest
" ---

lua <<EOF
require("neotest").setup({
  adapters = {
    require("neotest-vim-test"),
  },
})
EOF

nmap <silent> tt <cmd>lua require("neotest").run.run()<CR>
nmap <silent> ts <cmd>lua require("neotest").summary.toggle()<CR>
nmap <silent> to <cmd>lua require("neotest").output.open()<CR>

" ---
" nvim-cmp
" ---

set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
EOF

" ---
" nvim-lspconfig
" ---

lua <<EOF

-- Asegurarse de que las funciones de keymaps estén definidas
local function on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Globally add borders to all nvim-lspconfig floating windows
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#borders
border="single"
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['svelte'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['html'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  filetypes = {"html", "htmldjango"},
}

require('lspconfig')['cssls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['vimls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
EOF

" ---
" formatter.nvim
" ---

lua <<EOF
require('formatter').setup({
  filetype = {
    python = {
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },
    htmldjango = {
      function()
        return {
          exe = "djhtml",
          args = { "-" },
          stdin = true,
        }
      end,
    },
    svelte = {
      require("formatter.filetypes.svelte").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },
    -- ["*"] = {
    --  require("formatter.filetypes.any").remove_trailing_whitespace,
    -- }
  },
})
EOF

nnoremap <silent> gf :Format<CR>

" ---
" telescope
" ---

nnoremap <leader>f <cmd>Telescope find_files<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>d <cmd>Telescope tags<CR>
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>k <cmd>Telescope keymaps<CR>
nnoremap <leader>s <cmd>Telescope lsp_dynamic_workspace_symbols<CR>

" ---
" nvim-tree
" ---

lua <<EOF
require("nvim-tree").setup({
  view = {
    side = "right",
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "H",
      info = "I",
      warning = "W",
      error = "E",
    },
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
      },
      git_placement = "after",
    },
  },
})
EOF

map <leader>t :NvimTreeToggle<CR>

" ---
" gitsigns
" ---

lua <<EOF
require('gitsigns').setup()
EOF

" ---
" comment.nvim
" ---

lua <<EOF
require('Comment').setup()
EOF

" ---
" vim-gutentags
" ---

" Use rg to feed files to vim-gutentags
" https://github.com/universal-ctags/ctags/issues/218#issuecomment-377731658
let g:gutentags_file_list_command = 'rg --files | rg -v ".json"'

" ---
" mason.nvim
" ---

lua <<EOF
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "cssls",
    "html",
    "pyright",
    "lua_ls",
    "svelte",
    "tsserver",
    "vimls",
  },
  automatic_installation = true,
})
EOF

" I like using H and L for beginning/end of line
nmap H ^
nmap L $

" Find
nnoremap // :noh<CR>
