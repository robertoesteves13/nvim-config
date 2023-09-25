return {
  pattern = {"meson.build"},
  lsp_name = "swift_mesonls",
  lsp_setup_params = {},

  configs = function ()
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
}
