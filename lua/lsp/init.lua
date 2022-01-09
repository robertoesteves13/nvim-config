return function ()
  local dap = require('dap-install')

  require('lualine').setup {
      options = {theme = 'gruvbox'}
  }

  local nvim_lsp = require('lspconfig')

  -- LSP Config
  local lsp_installer = require("nvim-lsp-installer")
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
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
      { name = 'luasnip' },
      { name = 'cmp_tabnine' },
      { name = 'buffer' },
    },
    formatting = {
      format = require('lspkind').cmp_format({with_text = false, maxwidth = 50})
    }
  })

  lsp_installer.on_server_ready(function(server)
      local opts = {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      }

      if server.name == 'sumneko_lua' then
        opts.settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      end

      if server.name == 'tsserver' then
        opts.root_dir = nvim_lsp.util.root_pattern("package.json")
      end

      if server.name == 'denols' then
        opts.settings = {
          deno = {
            enable = true,
            lint = true,
            importMap = 'import_map.json'
          }
        }

        opts.root_dir = nvim_lsp.util.root_pattern("import_map.json")
      end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
  end)

  require('lsp/cpp')(dap)
end
