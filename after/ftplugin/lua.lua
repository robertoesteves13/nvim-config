vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

local lsp_settings = {
	Lua = {
		diagnostics = {
			globals = { "vim" },
		},
	},
}

require("lsp_utils").SetupLsp({
	name = "lua-language-server",
	root_files = { ".git" },
	before_init = require("neodev.lsp").before_init,
	settings = lsp_settings,
})
