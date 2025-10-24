require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "gopls",
    "lua_ls",
    "terraformls",
    "tflint",
    "yamlls",
    "rust_analyzer",
  },
})

-- LSP custom keys
map('n', '<leader>i', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- LSP languages
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('clangd', {
  capabilities = capabilities,
})

vim.lsp.config('gopls', {
  capabilities = capabilities,
  settings = {
    gopls = {
      directoryFilters = { '+testdata' },
    }
  }
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

vim.lsp.config('terraformls', {
  capabilities = capabilities,
})

vim.lsp.config('tflint', {
  capabilities = capabilities,
})

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
})

vim.lsp.config('yamlls', {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = true
  end,
})
