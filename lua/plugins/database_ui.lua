return {
	{ "kristijanhusak/vim-dadbod-completion", lazy = true },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
		keys = {
			{ "<leader>c", "<cmd>DBUIToggle<CR>", "Database Client" },
		},
		lazy = true,
	},
}
