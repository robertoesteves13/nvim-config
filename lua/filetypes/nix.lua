return {
  pattern = {"*.nix"},

  lsp_name = "nil_ls",
  lsp_setup_params = {},

  configs = function ()
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
}
