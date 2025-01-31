vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

require("lsp_utils").SetupLsp({
	name = "qmlls6",
	root_files = { ".git" },
})

local function preview()
  vim.system({'qhot', vim.api.nvim_buf_get_name(0)})
end

vim.api.nvim_create_user_command("Preview", preview, {})
