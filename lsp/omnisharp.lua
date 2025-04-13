return {
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	root_markers = { "*.csproj" },
	filetypes = { "cs", "vb" },
}
