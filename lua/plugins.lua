return require('packer').startup(function(use)
  -- Plugin Manager
  use { 'wbthomason/packer.nvim' }

  -- Colorschemes
  use { 'folke/tokyonight.nvim' }
  use { 'ellisonleao/gruvbox.nvim' }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "jacoborus/tender.vim" }
  use { "savq/melange-nvim" }
  use { 'almo7aya/neogruvbox.nvim' }

  -- Make Neovim look dope
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'romgrk/barbar.nvim' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'onsails/lspkind.nvim' }
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- Make coding enjoyable
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'ThePrimeagen/refactoring.nvim' }
  use { 'folke/trouble.nvim' }

  -- LSP Support
  use { 'neovim/nvim-lspconfig' }

  -- Debugging support
  use { 'mfussenegger/nvim-dap' }
  use { 'theHamsta/nvim-dap-virtual-text' }

  -- Code Snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- Intellisense
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }

  -- Language-specific Plugins
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'simrat39/rust-tools.nvim' }
  use { 'lervag/vimtex' }
end)
