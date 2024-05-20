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
		ft = "dart",
		opts = {},
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
		"Badhi/nvim-treesitter-cpp-tools",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		ft = { "c", "cpp" },
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
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		opts = {
			org_agenda_files = "~/orgfiles/**/*",
			org_default_notes_file = "~/orgfiles/refile.org",
		},
	},
	{
		"akinsho/org-bullets.nvim",
		ft = { "org" },
	},
}
