return {
  pattern = {"*.cs"},
  lsp_name = "omnisharp",
  lsp_setup_params = {
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    root_dir = require("lspconfig").util.root_pattern("*.sln")
  },
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
