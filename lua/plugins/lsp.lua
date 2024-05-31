return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},

	{
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				init = function()
					require("hover.providers.lsp")
				end,
				preview_opts = {
					border = nil,
				},
				preview_window = false,
				title = true,
			})
		end,
		keys = {
			{ "K", '<cmd>lua require("hover").hover()<CR>', desc = "hover.nvim" },
			{ "gK", '<cmd>lua require("hover").hover_select()<CR>', desc = "hover.nvim (select)" },
		},
	},

	{ "folke/trouble.nvim", lazy = true, event = { "LspAttach" } },
	{
		"dgagn/diagflow.nvim",
		event = "LspAttach",
		opts = {},
	},
}
