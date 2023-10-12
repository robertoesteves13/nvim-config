local nvim_lsp = require('lspconfig')

return {
  pattern = { "*.sql" },

  lsp_name = "postgres_lsp",
  lsp_setup_params = {},

  configs = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
}
