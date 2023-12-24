vim.cmd([[au BufNewFile,BufRead *.xaml setlocal filetype=xml]])
vim.cmd([[au BufNewFile,BufRead *.axaml setlocal filetype=xml]])
vim.cmd [[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]]
vim.cmd [[ autocmd BufRead,BufNewFile *.templ set filetype=templ ]]

-- Make denols work
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

require('fileconf').setup()

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr, true)
  end,
})
