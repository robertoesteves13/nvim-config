require('plugins')

vim.o.background = "dark"
vim.o.termguicolors = true
vim.api.nvim_set_var('gruvbox_contrast_dark', 'hard')
vim.api.nvim_set_var('gruvbox_invert_selection', '0')

vim.api.nvim_set_var('&t_8f', '<Esc>[38;2;%lu;%lu;%lum')
vim.api.nvim_set_var('&t_8f', '<Esc>[48;2;%lu;%lu;%lum')

vim.cmd([[colorscheme gruvbox]])
vim.cmd([[set guifont=Fira\ Code:h11]])

vim.g.mapleader = " "

vim.api.nvim_set_var('completeopt', 'menu,menuone,noselect')

vim.o.errorbells = false
vim.o.hidden = true
vim.o.smartindent = true
vim.o.confirm = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.mouse = "a"

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.swapfile = false
vim.o.backup = false
vim.cmd([[set undodir=]] .. vim.fn.stdpath('config') .. '/undodir')
vim.o.undofile = true

require('lsp')()

vim.api.nvim_set_keymap("n", "<S-k>", "<cmd>lua require'dap'.step_out()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-l>", "<cmd>lua require'dap'.step_into()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-j>", "<cmd>lua require'dap'.step_over()<CR>", {noremap = true})
