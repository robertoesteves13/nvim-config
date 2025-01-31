vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

local lsp_settings = {}

require("lsp_utils").SetupLsp({
	name = "lua_ls",
	cmd = { "lua-language-server" },
	root_files = { ".git" },
	settings = lsp_settings,
})

require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
	integrations = {
		lspconfig = false,
		cmp = false,
	},
})

local blink = require("blink.cmp")
blink.add_provider("lazydev", {
	name = "LazyDev",
	module = "lazydev.integrations.blink",
	score_offset = 100,
})
