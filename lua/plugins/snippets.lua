return {
	{
		"L3MON4D3/LuaSnip",
		event = { "LspAttach" },
		version = "v2.*",
		build = "make install_jsregexp",
	},
	{
		"rafamadriz/friendly-snippets",
		event = { "LspAttach" },
		dependencies = { "L3MON4D3/LuaSnip" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
