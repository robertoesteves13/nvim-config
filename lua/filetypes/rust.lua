return {
  pattern = {"*.rs"},

  lsp_name = "rust_analyzer",
  lsp_setup_params = {
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
  },

  configs = function ()
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.tabstop = 4
  end,
}
