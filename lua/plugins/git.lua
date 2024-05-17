return {
  'tpope/vim-fugitive',
  lazy = true,
  keys = {
    { '<leader>gi', [[<cmd>Git<CR>]] },
    { '<leader>gc', [[<cmd>Git commit<CR>]] },
    { '<leader>gd', [[<cmd>Git diff HEAD<CR>]] },
    { '<leader>gp', [[<cmd>Git push<CR>]] },
    { '<leader>gs', [[<cmd>Git pull<CR>]] }
  }
}
