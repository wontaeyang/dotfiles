require("conform").setup({
  formatters_by_ft = {
    go = { "gopls" },
    zig = { "zigfmt" },
    rust = { "rustfmt" },
    yaml = { "yamlls" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    require("conform").format({ lsp_fallback = true })
  end,
})
