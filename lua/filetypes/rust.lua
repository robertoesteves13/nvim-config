return {
  pattern = {"*.rs", "Cargo.toml"},
  lsp_name = "rls",
  lsp_setup_params = {
    settings = {
      rust = {
        unstable_features = true,
        build_on_save = false,
        all_features = true,
      },
    },
  },
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
