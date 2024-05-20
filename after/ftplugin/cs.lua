vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("lsp_utils").SetupLsp({
	name = "omnisharp",
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	root_files = { "*.csproj" },
})
