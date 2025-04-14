vim.filetype.add({
	extension = {
		qml = "qml",
		templ = "templ",
		slint = "slint",
		xaml = "xml",
		axaml = "xml",
		re = "reason",
	},
})

vim.lsp.enable({
	"lua_ls",
	-- "ccls",
	"clangd",
	"cssls",
	"denols",
	"emmet",
	"gopls",
	"jdtls",
	"jedi",
	"mesonlsp",
	"ocamllsp",
	"omnisharp",
	"phpactor",
	"qmlls6",
	"rust_analyzer",
	"slint_lsp",
	"svelte_ls",
	"templ_ls",
	"typescript_ls",
	"unocss_ls",
	"vscode_html",
	"zls",
})

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = true,
})

-- Set ident guides for the correct filetype
local function set_ident_guides()
	local lead = "▎"
	for _ = 1, vim.bo.shiftwidth - 1 do
		lead = lead .. " "
	end
	vim.opt_local.listchars:append({ leadmultispace = lead })
end

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = { "shiftwidth" },
	callback = set_ident_guides,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = set_ident_guides,
})

-- Make denols work
vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		vim.lsp.inlay_hint.enable(true, nil)
	end,
})
