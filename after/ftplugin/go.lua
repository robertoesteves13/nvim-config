vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local dap = require("dap")
dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

dap.configurations.go = {
	{
		type = "delve",
		name = "Debug test",
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug Module",
		request = "launch",
		program = "./${relativeFileDirname}",
	},
}
