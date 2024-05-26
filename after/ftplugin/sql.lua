vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

local cmp = require("cmp")
cmp.setup.filetype("sql", {
	sources = cmp.config.sources({
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	}),
})
