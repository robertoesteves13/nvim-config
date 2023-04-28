local binds = {}

binds.params = {
  noremap = true,
  silent = true
}

binds.lsp_attach = function(_, bufnr)
  -- LSP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', binds.params)

  -- DAP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>da', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dc', '<cmd>lua require\'dap\'.continue()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dso', '<cmd>lua require\'dap\'.step_over()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dsi', '<cmd>lua require\'dap\'.step_into()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dw', '<cmd>lua require\'dap\'.repl.open()<CR>', binds.params)
end

binds.map = function(keys, cmd)
  vim.api.nvim_set_keymap('', keys, cmd, binds.params)
end

binds.nmap = function(keys, cmd)
  vim.api.nvim_set_keymap('n', keys, cmd, binds.params)
end

binds.vmap = function(keys, cmd)
  vim.api.nvim_set_keymap('v', keys, cmd, binds.params)
end

binds.setup = function()
  -- Normal Mode
  binds.nmap('<leader>q', '<cmd>q<CR>')
  binds.nmap('<leader>w', '<cmd>w<CR>')

  -- Editor Settings
  binds.nmap('<leader>vh', '<cmd>Telescope help_tags<CR>')
  binds.nmap('<leader>vo', '<cmd>Telescope vim_options<CR>')
  binds.nmap('<leader>vc', '<cmd>Telescope colorscheme<CR>')

  -- Browsing stuff
  binds.nmap('<leader>e', '<cmd>Neotree<CR>')
  binds.nmap('<leader>ff', '<cmd>Telescope find_files<CR>')
  binds.nmap('<leader>fw', '<cmd>Telescope live_grep<CR>')

  -- Refactoring
  binds.vmap('<leader>re', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR> ]])
  binds.vmap('<leader>rf', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR> ]])
  binds.vmap('<leader>rv', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR> ]])

  -- Harpoon
  binds.nmap('<leader>ha', [[<cmd>lua require("harpoon.mark").add_file()<CR>]])
  binds.nmap('<leader>hl', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]])
  binds.nmap('`', [[<cmd>lua require("harpoon.ui").nav_next()<CR>]])

  -- Overseer (task runner)
  binds.nmap('<leader>ti', [[<cmd>AsyncTaskList<CR>]])
  binds.nmap('<leader>tr', [[<cmd>AsyncTaskLast<CR>]])
  binds.nmap('<leader>te', [[<cmd>AsyncTaskEdit<CR>]])

  -- Git integration
  binds.nmap('<leader>gi', [[<cmd>Git<CR>]])
  binds.nmap('<leader>gc', [[<cmd>Git commit<CR>]])
  binds.nmap('<leader>gd', [[<cmd>Git diff HEAD<CR>]])
  binds.nmap('<leader>gp', [[<cmd>Git push<CR>]])
  binds.nmap('<leader>gs', [[<cmd>Git pull<CR>]])
end

return binds
