return function()
  require('notifier').setup {
    components = {
      'nvim',
      'lsp',
    }
  }
end
