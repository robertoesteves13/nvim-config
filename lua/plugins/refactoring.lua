return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = "Refactor",
	opts = {},
	keys = {
		{ mode = "v", "<leader>re", "<Cmd>Refactor extract<CR>" },
		{ mode = "v", "<leader>rb", "<Cmd>Refactor extract_block<CR>" },
		{ mode = "v", "<leader>rf", "<Cmd>Refactor extract_to_file<CR>" },
		{ mode = "v", "<leader>rv", "<Cmd>Refactor extract_var<CR>" },
	},
}
