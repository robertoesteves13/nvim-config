vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

require("lsp_utils").SetupLsp({
	name = "svelte-language-server",
	cmd = { "svelte-language-server", "--stdio" },
	root_files = { "package.json" },
})

