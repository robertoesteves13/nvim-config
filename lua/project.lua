Project = {
    var_name = 'ProjectExec'
}

local params = {
  noremap = true,
  silent = true
}

Project.set_exec = function()
  local input = vim.fn.input("Executable: ", Project.get_exec(), "file")
  vim.api.nvim_set_var(Project.var_name, input)
end

Project.get_exec = function()
    return vim.api.nvim_get_var(Project.var_name);
end

return {
  setup = function()
    vim.api.nvim_set_var(Project.var_name, vim.fn.getcwd())
    vim.api.nvim_set_keymap('', '<leader>ps', '<cmd>lua Project.set_exec()<CR>', params)
    return Project
  end
}
