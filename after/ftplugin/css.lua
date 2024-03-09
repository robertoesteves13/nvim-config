vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

require("lsp_utils").SetupLsp({
  name = "cssls",
  cmd = { "vscode-css-language-server", "--stdio" },
  root_files = {".git"},
})

require("lsp_utils").SetupLsp({
  name = "tailwindcss",
  cmd = { "tailwindcss-language-server", "--stdio" },
  root_files = {"tailwind.config.js"},
})
