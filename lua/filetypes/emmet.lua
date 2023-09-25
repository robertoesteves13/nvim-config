local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  pattern = { "*.css", "*.html", "*.js", "*.jsx", "&.less", "*.sass", "*.scss", "*.svelte", "*.pug", "*.tsx", "*.vue" },
  lsp_name = "emmet_language_server",
  lsp_setup_params = {
    capabilities = capabilities,
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    },
  },

  configs = function () end,
}
