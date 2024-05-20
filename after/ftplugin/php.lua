vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("lsp_utils").SetupLsp({
	name = "phpactor",
	root_files = { ".git" },
})
