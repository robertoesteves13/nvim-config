local lsp = require('lspconfig')

return {
  pattern = {"*.slint"},
  lsp_name = "slint_lsp",
  lsp_setup_params = {
    root_dir = lsp.util.root_pattern(".git")
  },

  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
