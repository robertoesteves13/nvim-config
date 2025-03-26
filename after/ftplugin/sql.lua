vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

if not vim.load_sql_once then
	require("blink.cmp").add_source_provider("dadbod", {
		name = "Dadbod",
		module = "vim_dadbod_completion.blink",
	})

	table.insert(require("blink.cmp.config").sources.default, "dadbod")

	vim.load_sql_once = true
end
