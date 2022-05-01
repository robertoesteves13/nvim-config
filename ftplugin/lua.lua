local lsp_attach = require('keymaps').lsp_attach
local capabilities = require('config/cmp').capabilities

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

require'lspconfig'.sumneko_lua.setup {
  on_attach = lsp_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
