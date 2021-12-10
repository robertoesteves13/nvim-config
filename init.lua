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

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.swapfile = false
vim.o.backup = false
vim.cmd([[set undodir=~/.config/nvim/undodir]])
vim.o.undofile = true

local params = {
  prefix = '<leader>',
  noremap = true,
  silent = true
}

require('config')()
require('lsp')()

local wk = require('which-key')
wk.register(require('keymaps/telescope'), params)
wk.register(require('keymaps/lsp'), params)
wk.register(require('keymaps/vim'), params)
wk.register(require('keymaps/buffer'), params)
wk.register(require('keymaps/treeview'), params)
wk.register(require('keymaps/project'), params)
wk.register(require('keymaps/git'), params)
wk.register(require('keymaps/dap'), params)
wk.register(require('keymaps/normal'), params)
wk.register(require('keymaps/refactor'), {mode = 'v', prefix = '<leader>'})

vim.api.nvim_set_keymap("n", "<S-k>", "<cmd>lua require'dap'.step_out()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-l>", "<cmd>lua require'dap'.step_into()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-j>", "<cmd>lua require'dap'.step_over()<CR>", {noremap = true})
