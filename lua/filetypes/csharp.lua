return {
  pattern = {"*.cs"},
  lsp_name = "omnisharp",
  lsp_setup_params = {
    cmd = { "omnisharp" }
  },
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
