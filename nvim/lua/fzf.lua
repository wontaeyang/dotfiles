vim.env.FZF_DEFAULT_COMMAND =
'rg --files --no-ignore --hidden --follow --ignore-case -g "!{.git,node_modules}/*" 2> /dev/null'
vim.g.fzf_layout = { ['window'] = '-tabnew' }

-- map('n', '<C-r>', '<Cmd>Rg<CR>', opts)
map('n', '<C-t>', '<Cmd>FZF<CR>', opts)
