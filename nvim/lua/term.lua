require("toggleterm").setup({
  open_mapping = [[<leader>k]],
  hide_humbers = true,
  start_in_insert = false,
  insert_mappings = false,
  direction = "float",
  auto_scroll = true,
  close_on_exit = true,
  float_opts = {
    border = "curved",
  },
})

-- Lazygit
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
