vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

require("lsp_utils").SetupLsp({
  name = "html",
  cmd = { "vscode-html-language-server", "--stdio" },
  root_files = {".git"},
})
