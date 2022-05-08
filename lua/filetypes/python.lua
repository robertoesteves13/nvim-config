return {
  pattern = {"*.py"},
  lsp_name = "pyright",
  lsp_setup_params = {},
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
