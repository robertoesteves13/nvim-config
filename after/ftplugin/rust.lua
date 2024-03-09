vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

require("lsp_utils").SetupLsp({
  name = "rust-analyzer",
  root_files = { ".git", "Cargo.toml" },
})
