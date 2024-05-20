return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { { "prettierd", "prettier" } },
			go = { { "goimports", "gofmt" } },
		},
	},
	keys = {
		{ "<leader>p", '<cmd>lua require("conform").format()<CR>' },
	},
}
