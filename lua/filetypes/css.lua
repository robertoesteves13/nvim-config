local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  pattern = {"*.css", "*.scss", "*.less"},

  lsp_name = "cssls",
  lsp_setup_params = {
      capabilities = capabilities,
  },
  configs = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
}
