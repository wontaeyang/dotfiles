require("aerial").setup({
  backends = { "treesitter", "lsp", "man" },
  layout = {
    max_width = { 80, .33 },
    min_width = 32,
    default_direction = "prefer_left",
    placement = "edge",
  },
  show_guides = true,
  guides = {
    mid_item = "├─", -- When the child item has a sibling below it
    last_item = "└─", -- When the child item is the last in the list
    nested_top = "│ ", -- When there are nested child guides to the right
    whitespace = "  ", -- Raw indentation
  },
})

map("n", "<leader>o", "<cmd>AerialToggle!<CR>", opts)
