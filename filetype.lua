vim.filetype.add({
  extension = {
    qml = "qml",
    templ = "templ",
    slint = "slint",
    xaml = "xml",
    axaml = "xml",
    re = "reason",
  },
})

-- Set ident guides for the correct filetype
local function set_ident_guides()
  local lead = "▎"
  for _ = 1, vim.bo.shiftwidth - 1 do
    lead = lead .. " "
  end
  vim.opt_local.listchars:append({ leadmultispace = lead })
end

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = { "shiftwidth" },
  callback = set_ident_guides
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = set_ident_guides
})

local function lsp_attach(client, bufnr)
  local params = {
    noremap = true,
    silent = true,
  }

  -- LSP
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", params)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", params)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", params)
end

-- Make denols work
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    lsp_attach(client, bufnr)
    vim.lsp.inlay_hint.enable(true, nil)
  end,
})
