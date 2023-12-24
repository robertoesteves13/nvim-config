return {
  { '<leader>vh', '<cmd>Telescope help_tags<CR>', desc = 'Vim Help'},
  { '<leader>vo', '<cmd>Telescope vim_options<CR>', desc = 'Vim Options'},
  { '<leader>vc', '<cmd>Telescope coloscheme<CR>', desc = 'List Colorschemes'},

  { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find Files'},
  { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Live Grep'},
  { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'List Buffers'},

  { '<leader>ld', '<cmd>Telescope lsp_definitions<CR>', desc = 'LSP Definitions'},
  { '<leader>lt', '<cmd>Telescope lsp_type_definitions<CR>', desc = 'LSP Type Definitions'},
  { '<leader>ls', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'LSP Symbols'},

  { '<leader>dv', '<cmd>Telescope dap variables<CR>', desc = 'DAP Variables'},
  { '<leader>df', '<cmd>Telescope dap frames<CR>', desc = 'DAP Frames'},
  { '<leader>db', '<cmd>Telescope dap list_breakpoints<CR>', desc = 'DAP List Breakpoints'},

  { '<leader>gl', '<cmd>Telescope git_status<CR>', desc = 'Git Status'},
}
