vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rs" },
  callback = function()
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
  end,
})
