return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings = {},
				},
				pickers = {
					find_files = {
						theme = "ivy",
					},
					lsp_dynamic_workspace_symbols = {
						theme = "dropdown",
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			telescope.load_extension("file_browser")
			telescope.load_extension("harpoon")
			telescope.load_extension("fzf")
			telescope.load_extension("dap")
		end,
		keys = {
			{ "<leader>vh", "<cmd>Telescope help_tags<CR>", desc = "Vim Help" },
			{ "<leader>vo", "<cmd>Telescope vim_options<CR>", desc = "Vim Options" },
			{ "<leader>vc", "<cmd>Telescope coloscheme<CR>", desc = "List Colorschemes" },

			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>fs", "<cmd>Telescope treesitter<CR>", desc = "Find Statements" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List Buffers" },

			{ "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", desc = "LSP Definitions" },
			{ "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "LSP Type Definitions" },
			{ "<leader>ls", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "LSP Symbols" },

			{ "<leader>dv", "<cmd>Telescope dap variables<CR>", desc = "DAP Variables" },
			{ "<leader>df", "<cmd>Telescope dap frames<CR>", desc = "DAP Frames" },
			{ "<leader>db", "<cmd>Telescope dap list_breakpoints<CR>", desc = "DAP List Breakpoints" },

			{ "<leader>gl", "<cmd>Telescope git_status<CR>", desc = "Git Status" },
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
	},

	{
		"ThePrimeagen/harpoon",
		lazy = true,
		keys = {
			{ "<leader>ha", [[<cmd>lua require("harpoon.mark").add_file()<CR>]], desc = "Harpoon add file" },
			{ "<leader>hl", [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], desc = "Harpool list files" },
			{ "`", [[<cmd>lua require("harpoon.ui").nav_next()<CR>]], desc = "Harpoon switch" },
		},
	},

	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end,
	},
}
