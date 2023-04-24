local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  pattern = {"*.html", "*.html"},
  lsp_name = "html",
  lsp_setup_params = {
    capabilities = capabilities,
  },

  configs = function ()
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
}
