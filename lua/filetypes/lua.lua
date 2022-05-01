return function(pCapabilities)
  vim.o.shiftwidth = 2
  vim.o.tabstop = 2

  vim.o.expandtab = true
  vim.o.cursorline = true

  require'lspconfig'.sumneko_lua.setup {
    capabilities = pCapabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  }
end
