return function ()
  require("nvim-dap-virtual-text").setup()
  vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>DapContinue<CR>', {
    noremap = true,
    silent = true,
  })
end
