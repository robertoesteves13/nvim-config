local function config()
	require("dap.ext.vscode").getconfigs(nil)
	local dap = require("dap")

	dap.adapters.go = {
		type = "server",
		port = "${port}",
		executable = {
			command = "dlv",
			args = { "dap", "-l", "127.0.0.1:${port}" },
		},
	}

	dap.adapters.lldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = "lldb-dap",
			args = { "--port", "${port}" },
		},
	}

	dap.adapters.lldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = "lldb-dap",
			args = { "--port", "${port}" },
		},
	}

	local ui = require("dapui")
	dap.listeners.before.attach.dapui_config = ui.open
	dap.listeners.before.launch.dapui_config = ui.open
	dap.listeners.before.event_terminated.dapui_config = ui.close
	dap.listeners.before.event_exited.dapui_config = ui.close

	ui.setup()
end

return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "mfussenegger/nvim-dap" },
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
			{ "nvim-neotest/nvim-nio" },
		},
		opts = {},
		keys = {
			{ "<F11>", "<cmd>DapStepInto<CR>" },
			{ "<F12>", "<cmd>DapStepOut<CR>" },
			{ "<F10>", "<cmd>DapStepOver<CR>" },
			{ "<F9>", "<cmd>DapToggleBreakpoint<CR>" },
			{ "<F5>", "<cmd>DapContinue<CR>" },
			{ "<leader>dt", '<cmd>lua require("dapui").toggle()<CR>' },
			{ "<leader>de", '<cmd>lua require("dapui").eval()<CR>' },
			{ mode = "v", "<leader>de", '<cmd>lua require("dapui").eval()<CR>' },
		},
		config = config,
	},
}
