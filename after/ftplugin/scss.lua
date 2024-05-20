vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

require("lsp_utils").SetupLsp({
	name = "cssls",
	root_files = { ".git" },
})
