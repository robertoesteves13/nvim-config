return {
	{ "folke/tokyonight.nvim", lazy = true },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			overrides = {
				LspInlayHint = {
					bg = "#504945",
				},
			},
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "jacoborus/tender.vim", lazy = true },
	{ "savq/melange-nvim", lazy = true },
}
