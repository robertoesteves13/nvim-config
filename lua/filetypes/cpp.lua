return {
  pattern = {"*.cpp", "*.hpp", "*.h"},
  lsp_name = "clangd",
  lsp_setup_params = {},
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
