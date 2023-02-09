return function ()
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
    { 'folke/tokyonight.nvim' },
    { 'ellisonleao/gruvbox.nvim' },
    { "catppuccin/nvim", as = "catppuccin" },
    { "jacoborus/tender.vim" },
    { "savq/melange-nvim" },
    { 'almo7aya/neogruvbox.nvim' },

    -- Make Neovim look dope
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, config = require('config/telescope')},
    { 'nvim-lualine/lualine.nvim', config = function() require("config/lualine")() end },
    { 'romgrk/barbar.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'onsails/lspkind.nvim' },
    { 'lukas-reineke/indent-blankline.nvim', config = function()
      require("indent_blankline").setup({
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      })

      -- Hack to load colorscheme properly in the plugin
      vim.cmd([[colorscheme gruvbox]])
    end },

    -- Make coding enjoyable
    { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end },
    { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('config/treesitter') },
    { 'ThePrimeagen/refactoring.nvim', config = require('config/refactor') },
    { 'folke/trouble.nvim' },

    -- LSP Support
    { 'neovim/nvim-lspconfig' },

    -- Debugging support
    { 'mfussenegger/nvim-dap' },
    { 'theHamsta/nvim-dap-virtual-text' },

    -- Code Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Intellisense
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },

    -- Language-specific Plugins
    { 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    { 'ionide/Ionide-vim' },
    { 'simrat39/rust-tools.nvim' },
    { 'lervag/vimtex' },
  }

  require("lazy").setup(plugins)
end
