local lspinfo = {}

function lspinfo.logs()
  local path = vim.lsp.get_log_path()
  vim.cmd.edit(path)
end

function lspinfo.setup(opts)
  vim.api.nvim_create_user_command("LspLogs", lspinfo.logs, {})
end

return lspinfo
