vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

if not vim.load_lua_once then
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
	blink.add_source_provider("lazydev", {
		name = "LazyDev",
		module = "lazydev.integrations.blink",
		score_offset = 100,
	})

	vim.load_lua_once = true
end
