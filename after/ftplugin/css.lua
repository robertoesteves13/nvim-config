vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

require("lsp_utils").SetupLsp({
  name = "cssls",
  cmd = { "vscode-css-language-server", "--stdio" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  root_files = {".git"},
})
