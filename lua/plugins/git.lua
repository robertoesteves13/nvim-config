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
			{ "<leader>gs", "<cmd>Neogit<CR>" },
		},
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
}
