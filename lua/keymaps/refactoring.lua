return {
  { mode = 'v', '<leader>re', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR> ]] },
  { mode = 'v', '<leader>rf', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR> ]] },
  { mode = 'v', '<leader>rv', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR> ]] }
}
