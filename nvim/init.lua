-- some things gotta run on vim script
vim.cmd [[
  source ~/.config/nvim/plugins.vim
  syntax enable
  colorscheme nordfox
]]

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '                       -- Set space for leader
vim.opt.encoding = 'utf-8'                  -- set default encoding
vim.opt.wildmenu = true                     -- enhanced command line completion=
vim.opt.wildmode = 'list:longest,list:full' -- tab completion preview settings
vim.opt.wrap = false                        -- prevent wrap
vim.opt.list = true                         -- enable list mode, show white spaces
vim.opt.listchars = 'tab:»·,trail:·,nbsp:·' -- custom characters for white spaces
vim.opt.clipboard = 'unnamedplus'           -- use clipboard for yank and paste
vim.opt.ignorecase = true                   -- case insensitive search
vim.opt.smartcase = true                    -- ignore insensitive search if first letter is uppercase
vim.opt.paste = false                       -- disable paste aid
vim.opt.cursorline = true                   -- highlight current row
vim.opt.number = true                       -- display current line number
vim.opt.tabstop = 2                         -- tab is two spaces
vim.opt.shiftwidth = 2                      -- number of spaces to user for indentation
vim.opt.shiftround = true                   -- round indent to multiples of shiftwidth
vim.opt.expandtab = true                    -- Use the appropriate number of spaces to insert a tab
vim.opt.autoindent = true                   -- enable auto indentation
vim.opt.copyindent = true                   -- copy previous indentation on autocomplete
vim.opt.termguicolors = true                -- enable better colors on terminal
vim.opt.iskeyword:append("-")               -- consider dashed string as one word
vim.opt.spell = true                        -- turn on spell check
vim.opt.spelllang = 'en_us'                 -- set spell check language
vim.opt.splitbelow = true                   -- open horizontal split to bottom
vim.opt.splitright = true                   -- open vertical split to right
vim.opt.swapfile = false                    -- prevent swap files

-- disable spell check in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.opt.spell = false
  end,
})

-- setup code completion
vim.opt.completeopt = 'menu,menuone,noselect'
local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- manage LSP server installation
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "gopls", "lua_ls", "terraformls", "yamlls", "rust_analyzer" }
})

-- LSP custom keys
map('n', '<space>r', 'vim.diagnostic.open_float', opts)
map('n', '[d', 'vim.diagnostic.goto_prev', opts)
map('n', ']d', 'vim.diagnostic.goto_next', opts)
map('n', '<space>q', 'vim.diagnostic.setloclist', opts)

-- LSP languages
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {
  capabilities = capabilities,
}
lspconfig.gopls.setup {
  capabilities = capabilities,
}
lspconfig.lua_ls.setup {
  capabilities = capabilities,
}
lspconfig.terraformls.setup {
  capabilities = capabilities,
}
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
}
lspconfig.yamlls.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
}
-- require('lspconfig')['zls'].setup{
--   capabilities = capabilities,
-- }

-- Treesitter setup
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "go",
    "c",
    "lua",
    "zig",
    "json",
    "markdown",
    "bash",
    "vim",
    "html",
    "css",
    "javascript",
    "typescript",
    "dockerfile",
    "yaml",
    "rust",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "rust" },
  },
  indent = {
    enable = false,
  }
}

-- BarBar tabline keymaps
require 'bufferline'.setup {
  animation = false, -- disable animation
  auto_hide = false, -- auto-hide single buffer
  tabpages = false,  -- enable tab pages count
  icons = {
    button = '',
    buffer_index = true,
    filetype = { enabled = false },
  },
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = false,
  no_name_title = "New Buffer",
}
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- map('n', '<leader>p', '<Cmd>BufferPick<CR>', opts)

-- quicker window movement
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- terminal window movement
map('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
map('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
map('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
map('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)

-- buffer movement
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)

-- Vim test
vim.g['test#strategy'] = 'neovim'
map('n', '<leader>t', ':TestNearest<CR>', opts)
map('n', '<leader>a', ':TestFile<CR>', opts)
map('n', '<leader>l', ':TestLast<CR>', opts)

-- FZF Setup using ripgrep
map('n', '<C-t>', '<Cmd>FZF<CR>', opts)
vim.env.FZF_DEFAULT_COMMAND =
'rg --files --no-ignore --hidden --follow --ignore-case -g "!{.git,node_modules}/*" 2> /dev/null'
vim.g.fzf_layout = { ['window'] = '-tabnew' }

-- Adjust paste to not yank
map('x', 'p', '"_dP', {})

-- edit command with current folders populated
map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', {})

-- Rust settings
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rs" },
  callback = function()
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
  end,
})

-- Zig autoformat
vim.g.zig_fmt_autosave = true

-- Golang setup
function DebugPrintSelected()
  return function()
    local selected_text = vim.fn.getreg("")
    vim.fn.feedkeys('o')
    vim.fn.feedkeys('fmt.Printf("DEBUG: %v\\n", ')
    vim.fn.feedkeys(')')
    vim.api.nvim_input('<Left>')
  end
end

function go_test_with_env(test_command)
  return function()
    vim.cmd('Dotenv test/test.env')
    vim.cmd(test_command)
  end
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "go" },
  callback = function()
    vim.opt.list = false
    vim.opt.expandtab = false
    map('n', 'gd', ':GoDef<CR>', opts)
    map('n', 'gt', ':GoDefPop<CR>', opts)
    map('n', '<leader>t', go_test_with_env("TestNearest"), opts)
    map('n', '<leader>a', go_test_with_env("TestFile"), opts)
    map('n', '<leader>l', go_test_with_env("TestLast"), opts)
    map('n', '<leader>d', DebugPrintSelected(), opts)
  end,
})

vim.g.go_def_mapping_enabled = true
vim.g.go_auto_type_info = true
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'
vim.g.go_term_enabled = 'split'
vim.g.go_doc_keywordprg_enabled = false
vim.g.go_def_mapping_enabled = false -- remap some vim-go key bindings to prevent colliding with FZF


-- Lazygit
require("toggleterm").setup({
  open_mapping = [[<leader>k]],
  hide_humbers = true,
  start_in_insert = true,
  insert_mappings = true,
  direction = "float",
  auto_scroll = true,
  close_on_exit = true,
  float_opts = {
    border = "curved",
  },
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  close_on_exit = true,
  hidden = true,
  float_opts = {
    border = "curved",
  },
})

local function lazygit_toggle()
  return function()
    lazygit:toggle()
  end
end

map("n", "<leader>l", lazygit_toggle(), opts)


require("conform").setup({
  formatters_by_ft = {
    go = { "gopls" },
    zig = { "zigfmt" },
    rust = { "rustfmt" },
    yaml = { "yamlls" },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    require("conform").format({ lsp_fallback = true })
  end,
})

-- Remove all trailing white spaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
