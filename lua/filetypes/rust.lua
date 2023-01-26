return {
  pattern = {"*.rs"},

  configs = function ()
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.tabstop = 4
  end,

  run_once = function ()
    local rt = require('rust-tools')

    rt.setup({
      server = {
        on_attach = function(client, bufnr)
          client.server_capabilities.semanticTokensProvider = nil
          vim.keymap.set("n", "<Leader>ld", rt.hover_actions.hover_actions, { buffer = bufnr })
        end,
      }
    })
  end
}
