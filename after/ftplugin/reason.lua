vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

vim.treesitter.language.add("reason", { filetype = "reason" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});

require("lsp_utils").SetupLsp({
  name = "ocamllsp",
  root_files = { "*.opam", ".git", "esy.json", "dune-project", "dune-workspace" },
})
