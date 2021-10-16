  require('plugins')

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.cmd([[set guifont=Fira\ Code:h11]])

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>bw', ':bw<CR>', { noremap = true, silent = true})

vim.api.nvim_set_var('completeopt', 'menu,menuone,noselect')

vim.o.hidden = true
vim.o.confirm = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.wo.number = true
vim.wo.relativenumber = true

require('lualine').setup {
    options = {theme = 'gruvbox'}
}

-- LSP Config
local lsp_installer = require("nvim-lsp-installer")

local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

        -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      -- { name = 'vsnip' },

      -- For luasnip user.
      { name = 'luasnip' },

      { name = 'cmp_tabnine' },
      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    },
    formatting = {
      format = require('lspkind').cmp_format({with_text = false, maxwidth = 50})
    }
  })

local clangd = require('lsp/clangd')

lsp_installer.on_server_ready(function(server)
    local opts = {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == "clangd" then
	    clangd.setkeymap()
    end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

local params = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', params)
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', params)
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', params)

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', params)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', params)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', params)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', params)

