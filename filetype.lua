vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- Make denols work
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

local lsp_attach = require('keymaps').lsp_attach
local capabilities = require('config/cmp').capabilities
local lspconfig = require('lspconfig')

for _, filetype in pairs(require("filetypes")) do
  local setup_params = {
    on_attach = lsp_attach,
    capabilities = capabilities,
  }

  if filetype.lsp_name then
    for key, value in pairs(filetype.lsp_setup_params) do
      setup_params[key] = value
    end

    lspconfig[filetype.lsp_name].setup(setup_params)
  end

  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = filetype.pattern,
    callback = filetype.configs
  })
end
