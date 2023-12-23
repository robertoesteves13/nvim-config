require('project').setup()

vim.cmd([[au BufNewFile,BufRead *.xaml setlocal filetype=xml]])
vim.cmd([[au BufNewFile,BufRead *.axaml setlocal filetype=xml]])
vim.cmd [[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]]
vim.cmd [[ autocmd BufRead,BufNewFile *.templ set filetype=templ ]]

-- Make denols work
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

local fileconf = require('fileconf')

for name, filetype in pairs(require("filetypes")) do
  fileconf.bindLanguage(name, filetype)
  ::continue::
end

