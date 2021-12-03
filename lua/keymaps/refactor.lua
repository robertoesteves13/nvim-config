return {
  r = {
    name = 'Refactor',
    e = {[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract function"},
    f = {[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], "Extract funtion into file"},
  }
}
