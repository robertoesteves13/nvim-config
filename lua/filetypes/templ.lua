return {
  pattern = { "*.templ" },
  lsp_name = "templ",
  lsp_setup_params = {},

  configs = function()
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
}
