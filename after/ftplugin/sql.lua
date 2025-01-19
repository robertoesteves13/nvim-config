vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("blink.cmp").add_provider("dadbod", {
	name = "Dadbod",
	module = "vim_dadbod_completion.blink",
})

table.insert(require("blink.cmp.config").sources.default, "dadbod")
