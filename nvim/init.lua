vim.cmd [[
  source ~/.config/nvim/plugins.vim
  syntax enable
  colorscheme lackluster
]]

map = vim.keymap.set
opts = { noremap = true, silent = true }

vim.g.mapleader = ' '                         -- Set space for leader
vim.opt.encoding = 'utf-8'                    -- set default encoding
vim.opt.wildmenu = true                       -- enhanced command line completion=
vim.opt.wildmode = 'list:longest,list:full'   -- tab completion preview settings
vim.opt.wrap = false                          -- prevent wrap
vim.opt.list = true                           -- enable list mode, show white spaces
vim.opt.listchars = 'tab:»·,trail:·,nbsp:·'   -- custom characters for white spaces
vim.opt.clipboard = 'unnamedplus'             -- use clipboard for yank and paste
vim.opt.ignorecase = true                     -- case insensitive search
vim.opt.smartcase = true                      -- ignore insensitive search if first letter is uppercase
vim.opt.paste = false                         -- disable paste aid
vim.opt.cursorline = true                     -- highlight current row
vim.opt.number = true                         -- display current line number
vim.opt.tabstop = 2                           -- tab is two spaces
vim.opt.shiftwidth = 2                        -- number of spaces to user for indentation
vim.opt.shiftround = true                     -- round indent to multiples of shiftwidth
vim.opt.expandtab = true                      -- Use the appropriate number of spaces to insert a tab
vim.opt.autoindent = true                     -- enable auto indentation
vim.opt.copyindent = true                     -- copy previous indentation on autocomplete
vim.opt.termguicolors = true                  -- enable better colors on terminal
vim.opt.iskeyword:append("-")                 -- consider dashed string as one word
vim.opt.spell = true                          -- turn on spell check
vim.opt.spelllang = 'en_us'                   -- set spell check language
vim.opt.splitbelow = true                     -- open horizontal split to bottom
vim.opt.splitright = true                     -- open vertical split to right
vim.opt.swapfile = false                      -- prevent swap files
vim.opt.completeopt = 'menu,menuone,noselect' -- auto completion option

-- Base mappings
map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', {}) -- edit command with current folders populated
map('x', 'p', '"_dP', {})                                        -- Adjust paste to not yank

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

-- disable spell check in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.opt.spell = false
  end,
})

-- Remove all trailing white spaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

require('golang')
require('rust')
require('completion')
require('lsp')
require('treesitter')
require('tabs')
require('term')
require('format')
require('fzf')
