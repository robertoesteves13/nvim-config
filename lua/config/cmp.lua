local exp = {}

exp.cmp = require("cmp")
exp.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
exp.setup = function()
  exp.cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },

    formatting = {
      format = require('lspkind').cmp_format({
        mode = "symbol"
      })
    },
    window = {
      -- completion = exp.cmp.config.window.bordered(),
      -- documentation = exp.cmp.config.window.bordered(),
    },
    mapping = exp.cmp.mapping.preset.insert({
      ['<C-b>'] = exp.cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = exp.cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = exp.cmp.mapping.complete(),
      ['<C-e>'] = exp.cmp.mapping.abort(),
      ['<CR>'] = exp.cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = exp.cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'orgmode' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  exp.cmp.setup.filetype('gitcommit', {
    sources = exp.cmp.config.sources({
      { name = 'exp.cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  exp.cmp.setup.cmdline('/', {
    mapping = exp.cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  exp.cmp.setup.cmdline(':', {
    mapping = exp.cmp.mapping.preset.cmdline(),
    sources = exp.cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

return exp
