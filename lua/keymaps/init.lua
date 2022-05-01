local binds = {}

binds.params = {
  noremap = true,
  silent = true
}

binds.lsp_attach = function(_, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', binds.params)
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
  binds.nmap('<leader>e', '<cmd>Telescope file_browser<CR>')
  binds.nmap('<leader>ff', '<cmd>Telescope find_files<CR>')
  binds.nmap('<leader>fw', '<cmd>Telescope live_grep<CR>')

  -- Refactoring
  binds.vmap('<leader>re', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR> ]])
  binds.vmap('<leader>rf', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR> ]])
  binds.vmap('<leader>rv', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR> ]])

end

return binds
