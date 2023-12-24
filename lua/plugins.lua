return function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
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

  local plugins = {
    -- Colorschemes
    { 'folke/tokyonight.nvim',    lazy = true },
    { "ellisonleao/gruvbox.nvim", lazy = true },
    { "catppuccin/nvim",          lazy = true },
    { "jacoborus/tender.vim",     lazy = true },
    { "savq/melange-nvim",        lazy = true },

    -- Make writing configs easier
    { "folke/neodev.nvim", config = require('config.neodev'), },

    -- Make Neovim look dope
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = require('config.telescope'),
      keys = require('keymaps.telescope'),
    },
    {
      'nvim-lualine/lualine.nvim',
      config = require("config/lualine")
    },
    { 'nvim-telescope/telescope-file-browser.nvim', dependencies = { 'nvim-telescope/telescope.nvim' }, lazy = true },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build =
      'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      dependencies = { 'nvim-telescope/telescope.nvim' },
      lazy = true,
    },
    { 'nvim-telescope/telescope-dap.nvim',          dependencies = { 'nvim-telescope/telescope.nvim' }, lazy = true },

    { 'onsails/lspkind.nvim',                       dependencies = 'neovim/nvim-lspconfig' },
    {
      'vigoux/notifier.nvim',
      config = require('config/notifier'),
      dependencies = { 'neovim/nvim-lspconfig', 'hrsh7th/nvim-cmp' }
    },
    {
      "lewis6991/hover.nvim",
      config = require('config/hover_nvim'),
      keys = require('keymaps.hover_nvim')
    },
    {
      'kristijanhusak/vim-dadbod-ui',
      dependencies = {
        { 'tpope/vim-dadbod',                     lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
      },
      cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
      },
      init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
      end,
      keys = require('keymaps.dadbod'),
      lazy = true,
    },

    -- Make coding enjoyable
    { 'numToStr/Comment.nvim',         opts = {} },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = require(
        'config/treesitter')
    },
    { 'ThePrimeagen/refactoring.nvim', config = require('config/refactor'), lazy = true,                       keys = require('keymaps.refactoring') },
    { 'folke/trouble.nvim',            lazy = true },
    { 'tpope/vim-fugitive',            lazy = true,                         keys = require('keymaps.fugitive') },
    { 'ThePrimeagen/harpoon',          lazy = true,                         keys = require('keymaps.harpoon') },
    { 'stevearc/overseer.nvim',        opts = {},                           lazy = true,                       keys = require('keymaps.overseer') },
    {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      keys = require('keymaps.oil'),
    },
    { 'echasnovski/mini.nvim',   version = '*' },
    { 'akinsho/toggleterm.nvim', version = "*", config = true, keys = require('keymaps.toggleterm') },

    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    {
      'lvimuser/lsp-inlayhints.nvim',
      config = require('config.lsp_inlayhints'),
    },
    {
      'williamboman/mason.nvim',
      build = ":MasonUpdate",
      opts = {},
    },

    -- Intellisense
    { 'hrsh7th/nvim-cmp',               config = require('config.cmp') },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'dcampos/nvim-snippy',            config = require('config.snippy') },
    { 'dcampos/cmp-snippy' },

    -- Debugging support
    { 'mfussenegger/nvim-dap' },
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'rcarriga/nvim-dap-ui', config = require('config.dapui') },

    -- Language-specific Plugins
    { 'akinsho/flutter-tools.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, event = { "BufRead *.dart" }, lazy = true },
    { 'ionide/Ionide-vim',          event = { "BufRead *.fs" },                 lazy = true },
    { 'lervag/vimtex',              event = "BufRead *.tex",                    lazy = true },
    {
      'Saecki/crates.nvim',
      event = { "BufRead Cargo.toml" },
      dependencies = 'nvim-lua/plenary.nvim',
      config = require('config/crates_nvim'),
    },
  }

  require("lazy").setup(plugins)
end
