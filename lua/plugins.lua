vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use { 'wbthomason/packer.nvim' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = 'kyazdani42/nvim-web-devicons',
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

	use { "shadmansaleh/lualine.nvim" }
	use { "romgrk/barbar.nvim" }
	use { "ChristianChiarulli/dashboard-nvim" }

	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

end)
