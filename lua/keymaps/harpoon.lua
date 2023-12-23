return {
  {'<leader>ha', [[<cmd>lua require("harpoon.mark").add_file()<CR>]], desc = 'Harpoon add file'},
  {'<leader>hl', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], desc = 'Harpool list files'},
  {'`', [[<cmd>lua require("harpoon.ui").nav_next()<CR>]], desc = 'Harpoon switch'},
}
