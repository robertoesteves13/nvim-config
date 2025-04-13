local function config()
	require("dap.ext.vscode").getconfigs(nil)

	local dap = require("dap")
	dap.adapters.go = {
		type = "executable",
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:38697" },
	}

  dap.set_log_level('DEBUG')

	local ui = require("dapui")
	dap.listeners.before.attach.dapui_config = ui.open
	dap.listeners.before.launch.dapui_config = ui.open
	dap.listeners.before.event_terminated.dapui_config = ui.close
	dap.listeners.before.event_exited.dapui_config = ui.close
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
			{ "<leader>dsi", "<cmd>DapStepInto<CR>" },
			{ "<leader>dso", "<cmd>DapStepOver<CR>" },
			{ "<leader>da", "<cmd>DapToggleBreakpoint<CR>" },
			{ "<leader>dsu", "<cmd>DapStepOut<CR>" },
			{ "<leader>dc", "<cmd>DapContinue<CR>" },
			{ "<leader>de", '<cmd>lua require("dapui").eval()<CR>' },
			{ mode = "v", "<leader>de", '<cmd>lua require("dapui").eval()<CR>' },
		},
		config = config,
	},
}
