return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
			integrations = {
				lspconfig = false,
				cmp = false,
			},
		},
	},
}
