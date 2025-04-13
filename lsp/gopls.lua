return {
	cmd = { "gopls" },
	settings = {
		["gopls"] = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = false,
				parameterNames = false,
				rangeVariableTypes = true,
			},

			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
	root_markers = { "go.mod", "go.work" },
	filetypes = { "go" },
}
