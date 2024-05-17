return {
  {
    'rcarriga/nvim-dap-ui',
    event = { "LspAttach" },
    dependencies = {
      { 'mfussenegger/nvim-dap' },
      { 'theHamsta/nvim-dap-virtual-text', opts = {} },
      { 'nvim-neotest/nvim-nio' },
    },
    opts = {},
    keys = {
      { '<C-K>',      '<cmd>lua require("dapui").eval()<CR>' },
      { '<leader>dc', '<cmd>DapContinue<CR>' },
      { mode = 'v',   '<leader>e',                           '<cmd>lua require("dapui").eval()<CR>' },
    },
  },
  {
    'dgagn/diagflow.nvim',
    event = 'LspAttach',
    opts = {}
  },
}
