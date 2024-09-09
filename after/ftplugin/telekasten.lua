local params = {
  noremap = true,
  silent = true,
}

vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>Telekasten follow_link<CR>", params)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>fn", "<cmd>Telekasten find_notes<CR>", params)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>fd", "<cmd>Telekasten find_daily_notes<CR>", params)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>fw", "<cmd>Telekasten find_weekly_notes<CR>", params)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>ff", "<cmd>Telekasten find_friends<CR>", params)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>l", "<cmd>Telekasten insert_link<CR>", params)
