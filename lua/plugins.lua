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
        }
    } end },
    -- Discord Rich Presence
    { 'andweeb/presence.nvim', config = function () require('presence').setup({
      main_image = "file",
    }) end},
    {
      "lewis6991/hover.nvim",
      config = function()
          require("hover").setup {
              init = function()
                  -- Require providers
                  require("hover.providers.lsp")
                  -- require('hover.providers.gh')
                  -- require('hover.providers.gh_user')
                  -- require('hover.providers.jira')
                  -- require('hover.providers.man')
                  -- require('hover.providers.dictionary')
              end,
              preview_opts = {
                  border = nil
              },
              -- Whether the contents of a currently open hover window should be moved
              -- to a :h preview-window when pressing the hover keymap.
              preview_window = false,
              title = true
          }

          -- Setup keymaps
          vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
          vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
      end
    },

    -- Make coding enjoyable
    { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = require('config/treesitter') },
    { 'ThePrimeagen/refactoring.nvim', config = require('config/refactor') },
    { 'folke/trouble.nvim' },
    { 'tpope/vim-fugitive' },
    { 'ThePrimeagen/harpoon' },
    { 'stevearc/overseer.nvim', config = function() require('overseer').setup() end, },
    { 'stevearc/oil.nvim', opts = {} ,dependencies = {'nvim-tree/nvim-web-devicons'} },
    { 'echasnovski/mini.nvim', version = '*' },
    { 'akinsho/toggleterm.nvim', version = "*", config = true },

    -- LSP Support
    { 'neovim/nvim-lspconfig' },

    -- Debugging support
    { 'mfussenegger/nvim-dap' },
    { 'theHamsta/nvim-dap-virtual-text' },

    -- Code Snippets
    { 'L3MON4D3/LuaSnip' },

    -- Language-specific Plugins
    { 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim', event = { "BufRead *.dart"} },
    { 'ionide/Ionide-vim', event = { "BufRead *.fs"} },
    { 'lervag/vimtex' },
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
