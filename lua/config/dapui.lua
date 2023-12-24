return function ()
  vim.api.nvim_set_keymap('v', '<leader>e', '<cmd>lua require("dapui").eval()<CR>', {
    noremap = true,
    silent = true,
  })

  vim.api.nvim_set_keymap('n', '<C-K>', '<cmd>lua require("dapui").eval()<CR>', {
    noremap = true,
    silent = true,
  })

  require('dapui').setup()
end
