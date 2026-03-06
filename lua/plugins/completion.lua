return {
  {
    "saghen/blink.cmp",
    event = "VeryLazy",
    version = "*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      signature = { enabled = true },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      keymap = {
        preset = "default",
      },

      snippets = {
        expand = function(snippet) vim.snippet.expand(snippet) end,
        active = function(filter)
          return vim.snippet.active(filter)
        end,
        jump = function(direction) vim.snippet.jump(direction) end,
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {},
      },
      completion = {
        menu = { auto_show = false },
        documentation = { auto_show = true },
      }
    },
    opts_extend = { "sources.default" },
  },
}
