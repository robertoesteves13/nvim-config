return {
	{
		"numToStr/Comment.nvim",
		opts = {},
		keys = {
			{ "gcc", "<Plug>(comment_toggle_linewise)" },
			{ "gbc", "<Plug>(comment_toggle_blockwise)" },

			{ mode = "v", "gc", "<Plug>(comment_toggle_linewise_visual)" },
			{ mode = "v", "gb", "<Plug>(comment_toggle_blockwise_visual)" },
		},
	},
	{ "echasnovski/mini.nvim", version = "*" },

	{
		"akinsho/flutter-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
	},
	{ "ionide/Ionide-vim", event = { "BufRead *.fs" }, lazy = true },
	{ "lervag/vimtex", event = "BufRead *.tex", lazy = true },
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local crates = require("crates")
			local opts = { silent = true }

			vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
			vim.keymap.set("n", "<leader>cr", crates.reload, opts)

			vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
			vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
			vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

			vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
			vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
			vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
			vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
			vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
			vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

			vim.keymap.set("n", "<leader>cH", crates.open_homepage, opts)
			vim.keymap.set("n", "<leader>cR", crates.open_repository, opts)
			vim.keymap.set("n", "<leader>cD", crates.open_documentation, opts)
			vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opts)

			crates.setup()
		end,
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
		opts = { arg = "leetcode.nvim" },
	},
	{ "p00f/clangd_extensions.nvim", lazy = true },
	{ "mfussenegger/nvim-jdtls" },
	{
		"folke/twilight.nvim",
		opts = {},
	},
	{ "laytan/cloak.nvim", opts = {} },
	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "mistral",
			host = "localhost",
			port = "11444",
		},
	},
	{
		"renerocksai/telekasten.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		cmd = "Telekasten",
		keys = {
			{ "<leader>z", "<cmd>Telekasten<CR>", desc = "Telekasten options" },
		},
		opts = {
			home = vim.fn.expand("~/notes"),
		},
	},
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				filetype = { "markdown", "telekasten" },
			})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{ "danielo515/nvim-treesitter-reason", lazy = true },
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},
}
