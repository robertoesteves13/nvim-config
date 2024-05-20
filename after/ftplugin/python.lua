vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("lsp_utils").SetupLsp({
	name = "jedi-language-server",
	root_files = { ".git", "pyproject.toml" },
})
