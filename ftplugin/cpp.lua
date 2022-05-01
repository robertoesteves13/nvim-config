local lsp_attach = require('keymaps').lsp_attach
local capabilities = require('config/cmp').capabilities

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require'lspconfig'.clangd.setup {
  on_attach = lsp_attach,
  capabilities = capabilities
}
