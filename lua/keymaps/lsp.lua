return {
  l = {
    name = 'LSP',
    d = {'<cmd>Telescope lsp_definitions<CR>', 'Jump to definition'},
    a = {'<cmd>Telescope lsp_code_actions<CR>', 'Code actions'},
    p = {'<cmd>Telescope lsp_references<CR>', 'Peek references'},
    r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
    f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format file'},
  }
}
