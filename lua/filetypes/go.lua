return {
  pattern = { "*.go", "go.mod", "go.sum" },
  lsp_name = "gopls",
  lsp_setup_params = {
    settings = {
      ['gopls'] = {
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          constantValues = true,
          functionTypeParameters = false,
          parameterNames = false,
          rangeVariableTypes = true
        }
      }
    }
  },

  dap_name = "delve",
  dap_adapter_params = {
    type = 'server',
    port = '${port}',
    executable = {
      command = 'dlv',
      args = { 'dap', '-l', '127.0.0.1:${port}' },
    },
  },

  dap_configuration_params = {
    {
      type = "delve",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "delve",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
      type = "delve",
      name = "Debug (go.mod)",
      request = "launch",
      program = "./${relativeFileDirname}"
    }
  },

  configs = function()
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.tabstop = 4
  end,
}
