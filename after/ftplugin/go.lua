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
  root_files = {"go.mod", "go.work"}
})
