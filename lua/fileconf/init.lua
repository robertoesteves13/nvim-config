---@class LanguageConfig
---@field pattern string[]
--
---@field lsp_name string
---@field lsp_setup_params table
--
---@field dap_name string
---@field dap_adapter_params table
---@field dap_configuration_params table
--
---@field configs function
---@field run_once function?
---@field run_once_check boolean,
local LanguageConfig = {}

local lspconfig = require('lspconfig')
local dap = require('dap')

---@param name string
---@param conf LanguageConfig
local function SetupLang(name, conf)
  local setup_params = {
    capabilites = require('coq').lsp_ensure_capabilities()
  }

  if conf.lsp_name then
    for key, value in pairs(conf.lsp_setup_params) do
      setup_params[key] = value
    end
    lspconfig[conf.lsp_name].setup(setup_params)
  end

  if conf.dap_name then
    dap.adapters[conf.dap_name] = conf.dap_adapter_params
    dap.configurations[name] = conf.dap_configuration_params
  end

  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = conf.pattern,
    callback = function()
      conf.configs()
      if conf.run_once_check then
        conf.run_once_check = false
        conf.run_once()
      end
    end
  })
end

local function Setup()
  for name, filetype in pairs(require("filetypes")) do
    SetupLang(name, filetype)
  end
end


return {
  setup = Setup
}
