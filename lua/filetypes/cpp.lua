return {
  pattern = {"*.cpp", "*.hpp", "*.h"},

  lsp_name = "clangd",
  lsp_setup_params = {},

  dap_adapter_params = {
    type = 'executable',
    command = 'lldb-vscode'
  },
  dap_configuration_params = {
    {
      name = "Debug program",
      type = "cpp",
      request = "launch",
      program = function ()
        return vim.fn.input("Executable: ", Project.get_exec(), "file")
      end
    },
  },

  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end,
}
