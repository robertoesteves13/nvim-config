vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("lsp_utils").SetupLsp({
	name = "qmlls6",
	root_files = { ".git" },
})
