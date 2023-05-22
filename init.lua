require('plugins')()

vim.o.background = "dark"
vim.o.termguicolors = true
vim.api.nvim_set_var('gruvbox_contrast_dark', 'hard')
vim.api.nvim_set_var('gruvbox_invert_selection', '0')

vim.api.nvim_set_var('&t_8f', '<Esc>[38;2;%lu;%lu;%lum')
vim.api.nvim_set_var('&t_8f', '<Esc>[48;2;%lu;%lu;%lum')

-- Neovide stuff
vim.cmd([[colorscheme gruvbox]])
vim.opt.guifont = "FiraCode Nerd Font:h11"
vim.g.neovide_cursor_vfx_mode = "wireframe"
vim.g.neovide_refresh_rate = "120"
vim.g.neovide_cursor_trail_length = "0.1"

vim.g.mapleader = " "

vim.g.asyncrun_open = 6

vim.api.nvim_set_var('completeopt', 'menu,menuone,noselect')

vim.o.errorbells = false
vim.o.hidden = true
vim.o.smartindent = true
vim.o.confirm = true
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.mouse = "a"
vim.o.scrolloff = 8
vim.o.hlsearch = false
vim.o.smartcase = true

vim.o.filetype = true
vim.o.do_filetype_lua = 1

vim.cmd([[set colorcolumn=80]])

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.swapfile = false
vim.o.backup = false
vim.cmd([[set undodir=]] .. vim.fn.stdpath('config') .. '/undodir')
vim.o.undofile = true

vim.opt.list = true

-- Configurations
require('config/dap')()

require('mini.starter').setup()
require('mini.tabline').setup()
require('mini.pairs').setup()

-- Keymaps
require('keymaps/init').setup()
