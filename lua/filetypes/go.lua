return {
  pattern = {"*.go", "go.mod", "go.sum"},
  lsp_name = "gopls",
  lsp_setup_params = {},

  configs = function ()
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.tabstop = 4
  end,
}
