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
