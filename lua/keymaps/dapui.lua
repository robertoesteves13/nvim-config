return {
  { '<C-K>',      '<cmd>lua require("dapui").eval()<CR>' },
  { '<leader>dc', '<cmd>DapContinue<CR>' },
  { mode = 'v',   '<leader>e',                           '<cmd>lua require("dapui").eval()<CR>' },
}
