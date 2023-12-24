return function()
  local telescope = require('telescope')
  telescope.setup {
    defaults = {
      mappings = {}
    },
    pickers = {
      find_files = {
        theme = "ivy",
      },
      lsp_dynamic_workspace_symbols = {
        theme = "dropdown",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  }

  telescope.load_extension('file_browser')
  telescope.load_extension('harpoon')
  telescope.load_extension('fzf')
  telescope.load_extension('dap')
end
