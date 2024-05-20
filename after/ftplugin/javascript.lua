vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

require("lsp_utils").SetupLsp({
	name = "typescript-language-server",
	cmd = { "typescript-language-server", "--stdio" },
	root_files = { "package.json" },
})
