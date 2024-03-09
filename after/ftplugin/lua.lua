vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

local lsp_settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim' }
    }
  }
}

require("lsp_utils").SetupLsp({
  name = "lua-language-server",
  root_files = {".git"},
  settings = lsp_settings
})
