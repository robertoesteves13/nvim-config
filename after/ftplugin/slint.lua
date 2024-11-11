vim.bo.shiftwidth = 4
vim.opt.softtabstop = 4
vim.bo.tabstop = 4

require("lsp_utils").SetupLsp({
	name = "slint-lsp",
	root_files = { ".git" },
})
