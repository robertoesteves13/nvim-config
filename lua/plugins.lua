return require('packer').startup(function(use)
  -- Plugin Manager
  use { 'wbthomason/packer.nvim' }

  -- Best colorscheme ever!
  use { "morhetz/gruvbox" }

  -- Make Neovim look dope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use { "nvim-lualine/lualine.nvim" }
  use { "romgrk/barbar.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {'kyazdani42/nvim-web-devicons'}
  use { "luukvbaal/stabilize.nvim", config = function() require("stabilize").setup() end }

  -- Make coding enjoyable
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { "ThePrimeagen/refactoring.nvim" }

  -- LSP Plugins
  use { "neovim/nvim-lspconfig" }

  -- Code Snippets
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }

  -- Intellisense
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/nvim-cmp" }
end)
