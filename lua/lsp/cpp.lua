return function (dap_install)
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()
local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end

require('cmake').setup({
  parameters_file = 'neovim.json', -- JSON file to store information about selected target, run arguments and build type.
  build_dir = '{cwd}' .. 'build' .. '{os}-{build_type}', -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values.
  default_projects_path = vim.loop.os_homedir() .. 'Projects', -- Default folder for creating project.
  configure_arguments = '-D CMAKE_EXPORT_COMPILE_COMMANDS=1', -- Default arguments that will be always passed at cmake configure step. By default tells cmake to generate `compile_commands.json`.
  build_arguments = '', -- Default arguments that will be always passed at cmake build step.
  asyncrun_options = { save = 2 }, -- AsyncRun options that will be passed on cmake execution. See https://github.com/skywind3000/asyncrun.vim#manual
  target_asyncrun_options = { mode = "term", pos = "gnome"}, -- AsyncRun options that will be passed on target execution. See https://github.com/skywind3000/asyncrun.vim#manual
  dap_open_command = dap.repl.open,
})
end
