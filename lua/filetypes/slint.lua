return {
  pattern = {"*.slint"},
  lsp_name = "slint_lsp",
  lsp_setup_params = {},

  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
