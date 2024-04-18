vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
  end,
})

require("lsp_utils").SetupLsp({
  name = "html",
  cmd = { "vscode-html-language-server", "--stdio" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  root_files = { "package.json", ".git" },
})
