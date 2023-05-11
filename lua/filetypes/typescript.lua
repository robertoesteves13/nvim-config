local nvim_lsp = require('lspconfig')

return {
  pattern = {"*.ts", "*.tsx"},

  lsp_name = "tsserver",
  lsp_setup_params = {
    root_dir = nvim_lsp.util.root_pattern("package.json")
  },

  configs = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
}
