return {
  d = {
    name = "Debug",
    b = {"<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Set breakpoint"},
    l = {"<cmd>Telescope dap list_breakpoints<CR>", "List breakpoints"},
    r = {"<cmd>Telescope dap commands<CR>", "Run debug"},
    i = {"<cmd>Telescope dap variables<CR>", "Inspect variables"},
  }
}
