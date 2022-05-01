local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

return {
  extensions = {
    lua = require("filetypes/lua")(capabilities),
    cpp = require("filetypes/cpp")(capabilities)
  }
}

