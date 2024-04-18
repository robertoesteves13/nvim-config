vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local lsp_settings = {
  ['gopls'] = {
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      constantValues = true,
      functionTypeParameters = false,
      parameterNames = false,
      rangeVariableTypes = true
    },

    experimentalPostfixCompletions = true,
    analyses = {
      unusedparams = true,
      shadow = true,
    },
    staticcheck = true,
  }
}

require("lsp_utils").SetupLsp({
  name = "gopls",
  settings = lsp_settings,
  root_files = { "go.mod", "go.work" }
})

local dap = require('dap')
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  },
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug Module",
    request = "launch",
    program = "./${relativeFileDirname}"
  }
}
