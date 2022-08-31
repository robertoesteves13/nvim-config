return {
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
  run_once = function ()
    local rt = require("rust-tools")

    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<Leader>la", rt.hover_actions.hover_actions, { buffer = bufnr })
        end,
      },
    })
  end,
}
