require('bufferline').setup {
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
