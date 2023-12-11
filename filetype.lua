require('project').setup()

vim.cmd([[au BufNewFile,BufRead *.xaml setlocal filetype=xml]])
vim.cmd([[au BufNewFile,BufRead *.axaml setlocal filetype=xml]])
vim.cmd [[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]]
vim.cmd [[ autocmd BufRead,BufNewFile *.templ set filetype=templ ]]

-- Make denols work
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

local lsp_attach = require('keymaps').lsp_attach
local lspconfig = require('lspconfig')
local capabilities = require('config/cmp').capabilities

for name, filetype in pairs(require("filetypes")) do
  if filetype.pattern == nil then
    print('WARNING: Filetype pattern for ' .. name .. ' not set, skipping configuration...')
    goto continue
  end

  local setup_params = {
    on_attach = lsp_attach,
    capabilities = capabilities
  }

  -- Hack to fix omnisharp
  if name == "csharp" then
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end

  if filetype.run_once then
    filetype.run_once()
  end

  if filetype.lsp_name then
    for key, value in pairs(filetype.lsp_setup_params) do
      setup_params[key] = value
    end

    lspconfig[filetype.lsp_name].setup(setup_params)

    if filetype.dap_name then
      local dap = require('dap')
      dap.adapters[filetype.dap_name] = filetype.dap_adapter_params
      dap.configurations[name] = filetype.dap_configuration_params
    end
  end

  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = filetype.pattern,
    callback = filetype.configs
  })
  ::continue::
end
