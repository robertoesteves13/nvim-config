return {
  pattern = { "*.vue" },

  lsp_name = "volar",
  lsp_setup_params = {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    init_options = {
      typescript = {
        tsdk = '/usr/lib/node_modules/typescript/lib'
      }
    }
  },

  configs = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
}
