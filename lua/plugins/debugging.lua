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
			{ "<leader>dt", "<cmd>DapToggleBreakpoint<CR>" },
			{ "<leader>dsu", "<cmd>DapStepOut<CR>" },
			{ "<leader>dc", "<cmd>DapContinue<CR>" },
			{ "<leader>de", '<cmd>lua require("dapui").eval()<CR>' },
			{ mode = "v", "<leader>de", '<cmd>lua require("dapui").eval()<CR>' },
		},
	},
}
