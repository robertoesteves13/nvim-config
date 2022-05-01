return function(pCapabilities)
  require'lspconfig'.clangd.setup {
    capabilities = pCapabilities
  }
end
