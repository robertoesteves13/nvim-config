return {
  pattern = {"*.lua"},
  lsp_name = "lua_ls",
  lsp_setup_params = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  },
  configs = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
}
