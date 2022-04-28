return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { "folke/which-key.nvim" }
	use { "morhetz/gruvbox" }
	use { "nvim-lualine/lualine.nvim" }
	use { "romgrk/barbar.nvim" }

  use { "nvim-telescope/telescope-file-browser.nvim" }
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }

  use {'mhinz/vim-signify'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-rhubarb'}
  use {'junegunn/gv.vim'}

  use {'skywind3000/asyncrun.extra'}
  use {'kyazdani42/nvim-web-devicons'}

  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }
end)
