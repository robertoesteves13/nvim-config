return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			h = { "clang-format" },
			hpp = { "clang-format" },
			go = { "goimports", "gofmt" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
	},
}
