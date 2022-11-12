-- some things gotta run on vim script
vim.cmd [[
  source ~/.config/nvim/plugins.vim
  syntax enable
  colorscheme OceanicNext
]]

vim.g.mapleader = ' ' -- Set space for leader
vim.opt.encoding = 'utf-8' -- set default encoding
vim.opt.wildmenu = true -- enhanced command line completion=
vim.opt.wildmode = 'list:longest,list:full' -- tab completion preview settings
vim.opt.wrap = false -- prevent wrap
vim.opt.list = true -- enable list mode, show white spaces
vim.opt.listchars = 'tab:»·,trail:·,nbsp:·' -- cusotm characters for white spaces
vim.opt.clipboard = 'unnamedplus'  -- use clipboard for yank and paste
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- ignore insensitive search if first letter is uppercase
vim.opt.paste = false -- disable paste aid
vim.opt.cursorline = true -- highlight current row
vim.opt.number = true -- display current line number
vim.opt.tabstop = 2 -- tab is two spaces
vim.opt.shiftwidth = 2 -- number of spaces to user for indentation
vim.opt.shiftround = true -- round indent to multiples of shiftwidth
vim.opt.expandtab = true -- Use the appropriate number of spaces to insert a tab
vim.opt.autoindent = true -- enable auto indentation
vim.opt.copyindent = true -- copy previous indentation on autocomplete
vim.opt.termguicolors = true -- enable better colors on terminal

-- keymap variables
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- LSP custom keys
map('n', '<space>r', 'vim.diagnostic.open_float', opts)
map('n', '[d', 'vim.diagnostic.goto_prev', opts)
map('n', ']d', 'vim.diagnostic.goto_next', opts)
map('n', '<space>q', 'vim.diagnostic.setloclist', opts)

-- LSP languages
require('lspconfig')['gopls'].setup{} -- Setup LSP for Golang
require('lspconfig')['clangd'].setup{} -- Setup LSP for Clang
require('lspconfig')['zls'].setup{} -- Setup LSP for Zig

-- Treesitter setup
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = false,
  },
  indent = {
    enable = false,
  }
}

vim.opt.completeopt = 'menuone,noselect'
require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = false,
    tags = false,
    emoji = true,
  },
}

-- BarBar tabline keymaps
require'bufferline'.setup {
  animation = false, -- disable animation
  auto_hide = false, -- auto-hide single buffer
  tabpages = false, -- enable tab pages count
  closable = false, -- disable close button
  icons = 'numbers', -- display tab numbers
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = false,
  no_name_title = "New Buffer",
  icon_separator_active = '',
  icon_separator_inactive = '',
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

-- splitjoin
vim.g.splitjoin_trailing_comma = true

-- Vim test
vim.g['test#strategy'] = 'neovim'
map('n', '<leader>t', ':TestNearest<CR>', opts)
map('n', '<leader>a', ':TestFile<CR>', opts)
map('n', '<leader>l', ':TestLast<CR>', opts)

-- FZF Setup using ripgrep
map('n', '<C-t>', '<Cmd>FZF<CR>', opts)
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow --ignore-case -g "!{.git,node_modules}/*" 2> /dev/null'
vim.g.fzf_layout = { ['window'] = '-tabnew' }

-- Adjust paste to not yank
map('x', 'p', '"_dP', {})

-- edit command with current folders populated
map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', {})

-- Zig autoformat
vim.g.zig_fmt_autosave = true

-- Golang setup
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "go" },
  callback = function()
    vim.opt.list = false
    vim.opt.expandtab = false
    map('n', 'gd', ':GoDef<CR>', opts)
    map('n', 'gt', ':GoDefPop<CR>', opts)
    map('n', '<leader>t', ':call KesselTestFunc()<CR>', opts)
  end,
})
vim.g.go_fmt_autosave = true
vim.g.go_fmt_command = "gopls"
vim.g.go_def_mapping_enabled = true
vim.g.go_auto_type_info = true
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'
vim.g.go_term_enabled = 'split'
vim.g.go_highlight_build_constraints = true
vim.g.go_highlight_extra_types = true
vim.g.go_highlight_fields = true
vim.g.go_highlight_functions = true
vim.g.go_highlight_function_parameters = true
vim.g.go_highlight_methods = true
vim.g.go_highlight_operators = true
vim.g.go_highlight_structs = true
vim.g.go_highlight_types = true
vim.g.go_doc_keywordprg_enabled = false
vim.g.go_def_mapping_enabled = false -- remap some vim-go key bindings to prevent colliding with FZF

-- Parsec Kessel test runner for testify suite
vim.cmd [[
  function! KesselTestFuncName()
    let test_func = search('func ', "bcnW")
    if test_func == 0
      echo "No test found immediate to cursor"
      return
    end
    let line = getline(test_func)
    return matchstr(line, ' Test\w\+')[1:-1]
  endfunction
  function! KesselTestModuleName()
    let file_path = expand('%:p:h')
    let start_pos = match(file_path, 'kessel')
    let end_pos = len(file_path)
    return file_path[start_pos:end_pos]
  endfunction
  function! KesselTestFunc()
    execute ":split | terminal env $(cat test/test.env | xargs) go test -bench=. -v " . KesselTestModuleName() . " -testify.m " . KesselTestFuncName()
  endfunction
]]


-- Remove all trailing white spaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
