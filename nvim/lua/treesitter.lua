require('nvim-treesitter.configs').setup({
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
})
