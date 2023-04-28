return {
  pattern = {"*.zig"},
  lsp_name = "none",
  lsp_setup_params = {},
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}

