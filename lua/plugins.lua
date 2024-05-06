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
    { "ellisonleao/gruvbox.nvim", priority = 1000,     opts = {} },
    { "catppuccin/nvim",          name = 'catppuccin', lazy = true },
    { "jacoborus/tender.vim",     lazy = true },
    { "savq/melange-nvim",        lazy = true },

    -- Make Neovim look dope
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = require('config.telescope'),
      keys = require('keymaps.telescope'),
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

    {
      "j-hui/fidget.nvim",
      event = { "LspAttach" },
      opts = {},
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
    {
      "michaelrommel/nvim-silicon",
      lazy = true,
      cmd = "Silicon",
      opts = {
        font = "FiraCode Nerd Font=34",
        theme = "gruvbox-dark",
        pad_horiz = 0,
        pad_vert = 0,
        to_clipboard = true,
        no_round_corner = true,
        no_window_controls = true,
      },
    },
    -- Make coding enjoyable
    { 'numToStr/Comment.nvim',                   opts = {},                           keys = require('keymaps.comment') },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = require('config/treesitter')
    },
    { 'nvim-treesitter/nvim-treesitter-context', opts = {} },
    { 'ThePrimeagen/refactoring.nvim',           config = require('config/refactor'), lazy = true,                       keys = require('keymaps.refactoring') },
    { 'folke/trouble.nvim',                      lazy = true,                         event = { "LspAttach" } },
    { 'tpope/vim-fugitive',                      lazy = true,                         keys = require('keymaps.fugitive') },
    { 'ThePrimeagen/harpoon',                    lazy = true,                         keys = require('keymaps.harpoon') },
    { 'stevearc/overseer.nvim',                  opts = {},                           lazy = true,                       keys = require('keymaps.overseer') },
    {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      keys = require('keymaps.oil'),
    },
    { 'echasnovski/mini.nvim',        version = '*' },
    -- LSP Support
    {
      'williamboman/mason.nvim',
      build = ":MasonUpdate",
      opts = {},
    },
    {
      'hrsh7th/nvim-cmp',
      event = { "LspAttach" },
      config = require("config.cmp"),
      dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        "L3MON4D3/LuaSnip",
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind.nvim',
      }
    },
    {
      "L3MON4D3/LuaSnip",
      event = { "LspAttach" },
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {
        'rafamadriz/friendly-snippets',
        dependencies = { 'L3MON4D3/LuaSnip' },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    { 'lvimuser/lsp-inlayhints.nvim', opts = {},    event = "LspAttach" },

    -- Debugging support
    {
      'rcarriga/nvim-dap-ui',
      event = { "LspAttach" },
      dependencies = {
        { 'mfussenegger/nvim-dap' },
        { 'theHamsta/nvim-dap-virtual-text', opts = {} },
        { 'nvim-neotest/nvim-nio' },
      },
      opts = {},
      keys = require('keymaps.dapui'),
    },
    {
      'dgagn/diagflow.nvim',
      event = 'LspAttach',
      opts = {}
    },

    -- Language-specific Plugins
    {
      'akinsho/flutter-tools.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      ft = "dart",
      opts = {},
    },
    { 'ionide/Ionide-vim', event = { "BufRead *.fs" }, lazy = true },
    { 'lervag/vimtex',     event = "BufRead *.tex",    lazy = true },
    {
      'Saecki/crates.nvim',
      event = { "BufRead Cargo.toml" },
      dependencies = 'nvim-lua/plenary.nvim',
      config = require('config/crates_nvim'),
    },
    {
      'stevearc/conform.nvim',
      opts = {},
      keys = require('keymaps.conform'),
    },
    {
      "Badhi/nvim-treesitter-cpp-tools",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      opts = {},
      ft = { 'c', 'cpp' },
    },
    { "folke/neodev.nvim", opts = { lspconfig = false }, ft = { "lua" } },
    {
      "kawre/leetcode.nvim",
      build = ":TSUpdate html",
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
      },
      lazy = 'leetcode.nvim' ~= vim.fn.argv()[1],
      opts = { arg = 'leetcode.nvim' },
    },
  }

  require("lazy").setup(plugins)
end
