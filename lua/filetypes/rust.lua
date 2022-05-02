return {
  pattern = {"*.rs", "Cargo.toml"},
  lsp_setup_params = {},
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4

    require("rust-tools").setup({})
  end
}
