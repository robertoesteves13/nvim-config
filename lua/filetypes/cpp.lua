return function(pCapabilities)
  vim.bo.tabstop = 4
  vim.bo.shiftwidth = 4
  vim.bo.softtabstop = 4

  require'lspconfig'.clangd.setup {
    capabilities = pCapabilities
  }
end
