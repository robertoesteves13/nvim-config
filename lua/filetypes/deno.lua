local nvim_lsp = require('lspconfig')

return {
  pattern = {"*.ts"},
  lsp_name = "denols",
  lsp_setup_params = {
    init_options = {
      enable = true,
      lint = true,
    },
    root_dir = nvim_lsp.util.root_pattern("deno.json")
  },
  configs = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
}
