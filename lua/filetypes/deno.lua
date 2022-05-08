return {
  pattern = {".ts"},
  lsp_name = "denols",
  lsp_setup_params = {
    init_options = {
      enable = true,
      lint = true
    }
  },
  configs = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
}
