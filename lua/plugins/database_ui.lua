return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup()
    end,
    keys = {
      {"<leader>c", "<cmd>Dbee<CR>", desc = "Open Dbee UI"}
    }
  },
}
