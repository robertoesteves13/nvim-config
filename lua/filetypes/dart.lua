return {
  pattern = {"*.dart"},
  configs = function ()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
  run_once_check = true,
  run_once = function ()
    local lsp_attach = require('keymaps').lsp_attach

    require('flutter-tools').setup {
      lsp = {
        on_attach = lsp_attach
      }
    }
  end,
}
