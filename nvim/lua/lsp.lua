require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "gopls",
    "lua_ls",
    "terraformls",
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
local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  capabilities = capabilities,
})

lspconfig.gopls.setup({
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lspconfig.terraformls.setup({
  capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
})

lspconfig.yamlls.setup({
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = true
  end,
})

-- require('lspconfig')['zls'].setup({
--   capabilities = capabilities,
-- })
