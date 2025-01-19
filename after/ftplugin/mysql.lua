vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

local blink = require("blink.cmp")
blink.add_provider("dadbod", {
	name = "Dadbod",
	module = "vim_dadbod_completion.blink",
})

table.insert(require("blink.cmp.config").sources.default, "dadbod")
