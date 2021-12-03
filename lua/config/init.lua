return function()
  require('config/telescope')()
  require('config/treesitter')()
  require('config/refactor')()
end
