return {
	{
		"saghen/blink.cmp",
		event = "VeryLazy",
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			signature = { enabled = true },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			keymap = {
				preset = "default",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {},
			},
		},
		opts_extend = { "sources.default" },
	},
}
