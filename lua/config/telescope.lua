return function (wk)
  require('telescope').load_extension('cmake')

  local params = { noremap = true, silent = true }

  local keymap = {
    t = {
      name = "Telescope",
      f = {'<cmd>Telescope find_files', 'Find file'},
      g = {'<cmd>Telescope live_grep', 'Find file'},
      b = {'<cmd>Telescope buffers', 'Find file'},
    }
  }

  vim.api.nvim_set_keymap('n', '<leader>vh', '<cmd>Telescope help_tags<CR>', params)

  -- CMake Configuration
  vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>Telescope cmake select_target<CR>', params)

  wk.register(keymap, { prefix = "<leader>" })
end
