vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

require("lsp_utils").SetupLsp({
	name = "emmet",
	cmd = { "emmet-language-server", "--stdio" },
	root_files = { ".git", "gradlew", "mvnw" },
})
