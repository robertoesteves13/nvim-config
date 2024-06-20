vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("cmp").setup.buffer({
	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	},
})
