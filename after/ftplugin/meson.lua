vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

require("lsp_utils").SetupLsp({
	name = "swift_mesonls",
	cmd = { "mesonlsp" },
	root_files = { ".git", "meson.build" },
})
