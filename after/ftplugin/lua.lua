local lsp_attach = require('keymaps').lsp_attach
local capabilities = require('config/cmp').capabilities

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
