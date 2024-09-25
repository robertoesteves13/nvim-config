local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Map leader key before Lazy sets up keybindings
vim.g.mapleader = " "
require("lazy").setup("plugins")

vim.o.termguicolors = true
vim.o.background = "dark"
vim.api.nvim_set_var("gruvbox_contrast_dark", "hard")
vim.api.nvim_set_var("gruvbox_invert_selection", "0")
vim.cmd([[colorscheme gruvbox]])

vim.api.nvim_set_var("&t_8f", "<Esc>[38;2;%lu;%lu;%lum")
vim.api.nvim_set_var("&t_8f", "<Esc>[48;2;%lu;%lu;%lum")

-- Neovide stuff
if vim.g.neovide then
  vim.opt.guifont = "FiraCode Nerd Font:h12"
  vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_refresh_rate = "120"
  vim.g.neovide_cursor_trail_length = "0.1"
end

vim.g.asyncrun_open = 6

vim.api.nvim_set_var("completeopt", "menu,menuone,noselect")

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

vim.opt.conceallevel = 2

vim.opt.list = true
vim.opt.listchars = {
  tab = "··>",
  trail = "·",
  nbsp = "+",
  multispace = "·",
}

vim.wo.colorcolumn = "80"
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.swapfile = false
vim.o.backup = false
vim.cmd([[set undodir=]] .. vim.fn.stdpath("config") .. "/undodir")
vim.o.undofile = true

vim.opt.list = true

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

-- Configurations
require("mini.starter").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()
