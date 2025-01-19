vim.bo.shiftwidth = 2
vim.opt.softtabstop = 2
vim.bo.tabstop = 2

require("lsp_utils").SetupLsp({
	name = "ccls",
	root_files = { ".git" },
})
