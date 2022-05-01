return function(pCapabilities)
  vim.bo.shiftwidth = 4
  vim.bo.tabstop = 4

  vim.o.expandtab = true
  vim.o.cursorline = true

  require'lspconfig'.clangd.setup {
    capabilities = pCapabilities
  }
end
