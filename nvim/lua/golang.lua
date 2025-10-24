function DebugPrintSelected()
  local selected_text = vim.fn.getreg("")
  vim.fn.feedkeys('o')
  vim.fn.feedkeys('fmt.Printf("DEBUG: %v\\n", ')
  vim.fn.feedkeys(')')
  vim.api.nvim_input('<Left>')
end

function InsertGoErrorCheck()
  local line = vim.api.nvim_get_current_line()
  local indent = line:match("^%s*") or ""
  local new_lines = {
    indent .. "if err != nil {",
    indent .. "    return err",
    indent .. "}"
  }

  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, new_lines)

  -- Move cursor to "return" line and enter insert mode at end
  vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
  vim.api.nvim_feedkeys("A", "n", true)
end

function go_test_with_env(test_command)
  return function()
    vim.cmd('Dotenv env/test.env')
    vim.cmd(test_command)
  end
end

-- Grab the name and type of the test function immediately above the cursor
local function testify_test_func_info()
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(0, 0, cursor_line, false)

  for i = #lines, 1, -1 do
    local line = lines[i]
    local testify_test = line:match('func%s+%b()%s+(Test%w+)') -- testify suite test
    if testify_test then
      return testify_test, '-testify.m'
    end

    local normal_test = line:match('func%s+(Test%w+)%s*%(') -- regular go test
    if normal_test then
      return normal_test, '-run'
    end
  end

  vim.notify("No test found immediately above cursor", vim.log.levels.WARN)
  return nil, nil
end

-- Get the module path relative to project root (project agnostic)
local function testify_test_module_name()
  local file_path = vim.fn.expand('%:p:h')
  local mod_root = vim.fn.findfile('go.mod', '.;')

  if mod_root == '' then
    vim.notify("Could not find go.mod", vim.log.levels.ERROR)
    return nil
  end

  local mod_root_dir = vim.fn.fnamemodify(mod_root, ':p:h')
  local module_path = file_path:gsub('^' .. vim.pesc(mod_root_dir .. '/'), '')

  return module_path
end

-- Build and execute the test command in a split terminal
function TestifyTestFunc()
  local test_func, test_arg = testify_test_func_info()
  local module_name = testify_test_module_name()

  if not test_func or not module_name or not test_arg then
    return
  end

  local cmd = string.format(
    "split | terminal env $(cat env/test.env | xargs) go test -bench=. -v ./%s %s %s",
    module_name,
    test_arg,
    test_func
  )

  vim.cmd(cmd)
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "go" },
  callback = function()
    vim.opt.list = false
    vim.opt.expandtab = false
    map('n', 'gd', ':GoDef<CR>', opts)
    map('n', 'gt', ':GoDefPop<CR>', opts)
    -- map('n', '<leader>t', go_test_with_env("TestNearest"), opts)
    -- map('n', '<leader>a', go_test_with_env("TestFile"), opts)
    map('n', '<leader>t', TestifyTestFunc, opts)
    map('n', '<leader>d', DebugPrintSelected, opts)
    map('n', '<leader>f', InsertGoErrorCheck, opts)
  end,
})

vim.g.go_def_mapping_enabled = true
vim.g.go_auto_type_info = true
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'
vim.g.go_term_enabled = 'split'
vim.g.go_doc_keywordprg_enabled = false
vim.g.go_def_mapping_enabled = false -- remap some vim-go key bindings to prevent colliding with FZF
