vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use {
	    'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons',
	    config = function() require'nvim-tree'.setup {} end
	}

	use {
		"folke/which-key.nvim",
		config = function() require("which-key").setup {} end
	}

	use { "morhetz/gruvbox" }

	use { "neovim/nvim-lspconfig" }
	use { "williamboman/nvim-lsp-installer" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/nvim-cmp" }
	use { "saadparwaiz1/cmp_luasnip" }
	use { "L3MON4D3/LuaSnip" }

	use { "nvim-lualine/lualine.nvim" }
	use { "romgrk/barbar.nvim" }
	use { "ChristianChiarulli/dashboard-nvim" }

	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

  use { 'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use { 'onsails/lspkind-nvim' }

  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }

  use { 'Shatur/neovim-cmake',
        requires = { { 'skywind3000/asyncrun.vim' }, { 'mfussenegger/nvim-dap' } }
      }
  use {'mhinz/vim-signify'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-rhubarb'}
  use {'junegunn/gv.vim'}

  use {'Pocco81/DAPInstall.nvim'}
  use {'nvim-telescope/telescope-dap.nvim'}
  use {'skywind3000/asyncrun.extra'}

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

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
