vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("lsp_utils").SetupLsp({
	name = "clangd",
	root_files = { ".git" },
})

local cmp = require("cmp")
cmp.setup.filetype("cpp", {
	sorting = {
		comparators = {
			require("clangd_extensions.cmp_scores"),
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})
