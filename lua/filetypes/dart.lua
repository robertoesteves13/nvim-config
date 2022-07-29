
return {
  pattern = {".dart"},
  lsp_name = "dartls",
  lsp_setup_params = {},
  configs = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
}
