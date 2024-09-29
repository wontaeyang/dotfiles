require("aerial").setup({
  backends = { "lsp", "treesitter", "man" },
  filter_kind = {
    "Function",
    "Method",
    "Struct",
    "Field",
    "Variable",
    "Constant",
  },
  layout = {
    max_width = { 100, .4 },
    min_width = 32,
    default_direction = "prefer_left",
    placement = "edge",
    resize_to_content = true,
  },
  show_guides = true,
  guides = {
    mid_item = "├─", -- When the child item has a sibling below it
    last_item = "└─", -- When the child item is the last in the list
    nested_top = "│ ", -- When there are nested child guides to the right
    whitespace = "  ", -- Raw indentation
  },
  open_automatic = false,
  close_on_select = true,
  autojump = true,
})

map("n", "<leader>o", "<cmd>AerialToggle<CR><C-h>", opts)
