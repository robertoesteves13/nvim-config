vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

vim.treesitter.language.add("reason", { filetype = "reason" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
})
