return {
  pattern = {"*.php"},
  lsp_name = "phpactor",
  lsp_setup_params = {
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    },
  },
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
