return function(pCapabilities)
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
