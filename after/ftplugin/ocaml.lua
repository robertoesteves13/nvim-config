vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

require("lsp_utils").SetupLsp({
	name = "ocamllsp",
	root_files = { "*.opam", ".git", "esy.json", "dune-project", "dune-workspace" },
})
