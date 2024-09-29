function DebugPrintSelected()
  return function()
    local selected_text = vim.fn.getreg("")
    vim.fn.feedkeys('o')
    vim.fn.feedkeys('fmt.Printf("DEBUG: %v\\n", ')
    vim.fn.feedkeys(')')
    vim.api.nvim_input('<Left>')
  end
end

function go_test_with_env(test_command)
  return function()
    vim.cmd('Dotenv test/test.env')
    vim.cmd(test_command)
  end
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "go" },
  callback = function()
    vim.opt.list = false
    vim.opt.expandtab = false
    map('n', 'gd', ':GoDef<CR>', opts)
    map('n', 'gt', ':GoDefPop<CR>', opts)
    map('n', '<leader>t', go_test_with_env("TestNearest"), opts)
    map('n', '<leader>a', go_test_with_env("TestFile"), opts)
    map('n', '<leader>d', DebugPrintSelected(), opts)
  end,
})

vim.g.go_def_mapping_enabled = true
vim.g.go_auto_type_info = true
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'
vim.g.go_term_enabled = 'split'
vim.g.go_doc_keywordprg_enabled = false
vim.g.go_def_mapping_enabled = false -- remap some vim-go key bindings to prevent colliding with FZF
