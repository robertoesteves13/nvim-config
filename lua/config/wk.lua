return function ()

  local params = {
    prefix = '<leader>',
    noremap = true,
    silent = true
  }

  local wk = require('which-key')

  wk.setup {}

  wk.register(require('keymaps/telescope'), params)
  wk.register(require('keymaps/vim'), params)
  wk.register(require('keymaps/buffer'), params)
  wk.register(require('keymaps/git'), params)
  wk.register(require('keymaps/normal'), params)
  wk.register(require('keymaps/refactor'), {mode = 'v', prefix = '<leader>'})
end
