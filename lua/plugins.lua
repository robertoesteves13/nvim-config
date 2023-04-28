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
		{ "ellisonleao/gruvbox.nvim" },
    { "catppuccin/nvim", as = "catppuccin" },
    { "jacoborus/tender.vim" },
    { "savq/melange-nvim" },
    { 'almo7aya/neogruvbox.nvim' },

    -- Make Neovim look dope
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, config = require('config/telescope')},
    { 'nvim-lualine/lualine.nvim', config = function() require("config/lualine")() end },
    { 'romgrk/barbar.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
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
    { 'vigoux/notifier.nvim', config = function() require('notifier').setup{
        components = {
          'nvim',
          'lsp',
          'rust-tools'
        }
    } end },
    -- Discord Rich Presence
    { 'andweeb/presence.nvim', config = function () require('presence').setup({
      main_image = "file",
    }) end},

    -- Make coding enjoyable
    { 'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup({
          check_ts = true,
          ts_config = {
            lua = {'string'},-- it will not add a pair on that treesitter node
            javascript = {'template_string'},
            java = false,-- don't check treesitter on java
          }
        })
      end,
    },
    { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('config/treesitter') },
    { 'ThePrimeagen/refactoring.nvim', config = require('config/refactor') },
    { 'folke/trouble.nvim' },
    { 'tpope/vim-fugitive' },
    { 'ThePrimeagen/harpoon' },
    { 'skywind3000/asynctasks.vim' },
    { 'skywind3000/asyncrun.vim' },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
    },

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
    { 'elkowar/yuck.vim' },
    {
      'Saecki/crates.nvim',
      event = { "BufRead Cargo.toml" },
      dependencies = 'nvim-lua/plenary.nvim',
      config = function ()
        local crates = require('crates')
        local opts = { silent = true }

        vim.keymap.set('n', '<leader>ct', crates.toggle, opts)
        vim.keymap.set('n', '<leader>cr', crates.reload, opts)

        vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
        vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
        vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)

        vim.keymap.set('n', '<leader>cu', crates.update_crate, opts)
        vim.keymap.set('v', '<leader>cu', crates.update_crates, opts)
        vim.keymap.set('n', '<leader>ca', crates.update_all_crates, opts)
        vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, opts)
        vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, opts)
        vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts)

        vim.keymap.set('n', '<leader>cH', crates.open_homepage, opts)
        vim.keymap.set('n', '<leader>cR', crates.open_repository, opts)
        vim.keymap.set('n', '<leader>cD', crates.open_documentation, opts)
        vim.keymap.set('n', '<leader>cC', crates.open_crates_io, opts)

        crates.setup()
      end,
    },
  }

  require("lazy").setup(plugins)
end
