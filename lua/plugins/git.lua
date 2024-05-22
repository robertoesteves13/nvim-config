return {

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
		},
		keys = {
			{ "<leader>g", "<cmd>Neogit<CR>" },
		},
		opts = {},
	},
}
