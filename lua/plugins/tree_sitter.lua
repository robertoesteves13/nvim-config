---@diagnostic disable: inject-field
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				modules = {},
				ensure_installed = {},
				auto_install = true,
				ignore_install = { "org" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.fsharp = {
				install_info = {
					url = "https://github.com/baronfel/tree-sitter-fsharp.git", -- local path or git repo
					files = { "src/parser.c" },
					-- optional entries:
					branch = "main", -- default branch in case of git repo if different from master
				},
				filetype = "fs",
			}

			parser_config.jsp = {
				install_info = {
					url = "https://github.com/merico-dev/tree-sitter-jsp.git", -- local path or git repo
					files = { "src/parser.c", "src/scanner.cc" },
				},
			}
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context", opts = {} },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{ "danielo515/nvim-treesitter-reason", lazy = true },
}
