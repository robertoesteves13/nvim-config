vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("lsp_utils").SetupLsp({
	name = "clangd",
	root_files = { ".clangd" },
})

require("clangd_extensions").setup()
