vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

local lsp_settings = { }

require("lsp_utils").SetupLsp({
  name = "lua_ls",
	cmd = {"lua-language-server"},
	root_files = { ".git" },
	settings = lsp_settings,
})
