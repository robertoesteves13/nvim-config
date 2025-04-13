return {
	cmd = { "vscode-css-language-server", "--stdio" },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	},
	root_markers = { ".git", "package.json" },
	filetypes = { "css", "html", "scss" },
}
