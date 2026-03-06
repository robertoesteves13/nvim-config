local lspinfo = {}

function lspinfo:logs()
  local path = vim.lsp.get_log_path()
  vim.cmd.edit(path)
end

function lspinfo:restart()
  local clients = vim.lsp.get_clients()
  vim.ui.select(clients, {
    prompt = 'Select the LSP server',
    format_item = function(item)
      return item.name
    end
  }, function(item)
    if item then
      item.stop()
      vim.lsp.enable(item.name, true)
    end
  end)
end

function lspinfo:toggle_diagnostics()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

function lspinfo:setup(opts)
  vim.api.nvim_create_user_command("LspLogs", lspinfo.logs, {})
  vim.api.nvim_create_user_command("LspRestart", lspinfo.restart, {})
  vim.api.nvim_create_user_command("LspDiagnostic", lspinfo.toggle_diagnostics, {})
end

return lspinfo
