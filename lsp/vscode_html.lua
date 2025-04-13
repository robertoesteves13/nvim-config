return {
	cmd = { "vscode-html-language-server", "--stdio" },
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
	root_markers = { "package.json", ".git" },
	filetypes = { "html", "templ" },
}
