return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
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
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context", opts = {} },
}
