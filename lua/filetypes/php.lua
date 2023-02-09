return {
  pattern = {"*.php"},
  lsp_name = "intelephense",
  lsp_setup_params = {},
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
