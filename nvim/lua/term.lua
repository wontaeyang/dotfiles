require("toggleterm").setup({
  open_mapping = [[<leader>j]],
  hide_numbers = true,
  start_in_insert = false,
  insert_mappings = false,
  direction = "tab",
  auto_scroll = true,
  close_on_exit = true,
  float_opts = {
    border = "curved",
  },
})

local Terminal = require('toggleterm.terminal').Terminal

-- Claude Code
local claude_code = Terminal:new({
  cmd = "brew upgrade claude-code && claude",
  direction = "float",
  close_on_exit = true,
  hidden = true,
  float_opts = {
    border = "curved",
  },
})
map("n", "<leader>k", function() claude_code:toggle() end, opts)

-- Lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  close_on_exit = true,
  hidden = true,
  float_opts = {
    border = "curved",
  },
})
map("n", "<leader>l", function() lazygit:toggle() end, opts)
