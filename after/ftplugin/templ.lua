vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

local lsputil = require("lsp_utils")

lsputil.SetupLsp({
  name = "templ",
  cmd = { "templ", "lsp" },
  root_files = { "go.mod" },
})

lsputil.SetupLsp({
  name = "html",
  cmd = { "vscode-html-language-server", "--stdio" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  },
  root_files = { "package.json", ".git" },
})


lsputil.SetupLsp({
  name = "emmet",
  cmd = { "emmet-language-server", "--stdio" },
  root_files = { "package.json", ".git" },
})

lsputil.SetupLsp({
  name = "unocss-language-server",
  cmd = { "unocss-language-server", "--stdio" },
  root_files = { "uno.config.ts", "uno.config.js" },
})
