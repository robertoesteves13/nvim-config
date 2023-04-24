return function ()
  local telescope = require('telescope')
  telescope.load_extension('file_browser')
  telescope.load_extension('harpoon')

  telescope.setup{
    defaults = {
      -- ...
    },
    pickers = {
      find_files = {
        theme = "ivy",
      }
    },
    extensions = {
      -- ...
    }
  }
end
