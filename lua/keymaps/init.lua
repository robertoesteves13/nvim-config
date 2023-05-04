local binds = {}

binds.params = {
  noremap = true,
  silent = true
}

binds.lsp_attach = function(client, bufnr)
  -- LSP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', binds.params)

  -- DAP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>da', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dc', '<cmd>lua require\'dap\'.continue()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dso', '<cmd>lua require\'dap\'.step_over()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dsi', '<cmd>lua require\'dap\'.step_into()<CR>', binds.params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dw', '<cmd>lua require\'dap\'.repl.open()<CR>', binds.params)

  -- Hack to fix omnisharp's broken semantic highlighting
  if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider = {
      full = vim.empty_dict(),
      legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
          "comment",
          "excluded_code",
          "identifier",
          "keyword",
          "keyword_control",
          "number",
          "operator",
          "operator_overloaded",
          "preprocessor_keyword",
          "string",
          "whitespace",
          "text",
          "static_symbol",
          "preprocessor_text",
          "punctuation",
          "string_verbatim",
          "string_escape_character",
          "class_name",
          "delegate_name",
          "enum_name",
          "interface_name",
          "module_name",
          "struct_name",
          "type_parameter_name",
          "field_name",
          "enum_member_name",
          "constant_name",
          "local_name",
          "parameter_name",
          "method_name",
          "extension_method_name",
          "property_name",
          "event_name",
          "namespace_name",
          "label_name",
          "xml_doc_comment_attribute_name",
          "xml_doc_comment_attribute_quotes",
          "xml_doc_comment_attribute_value",
          "xml_doc_comment_cdata_section",
          "xml_doc_comment_comment",
          "xml_doc_comment_delimiter",
          "xml_doc_comment_entity_reference",
          "xml_doc_comment_name",
          "xml_doc_comment_processing_instruction",
          "xml_doc_comment_text",
          "xml_literal_attribute_name",
          "xml_literal_attribute_quotes",
          "xml_literal_attribute_value",
          "xml_literal_cdata_section",
          "xml_literal_comment",
          "xml_literal_delimiter",
          "xml_literal_embedded_expression",
          "xml_literal_entity_reference",
          "xml_literal_name",
          "xml_literal_processing_instruction",
          "xml_literal_text",
          "regex_comment",
          "regex_character_class",
          "regex_anchor",
          "regex_quantifier",
          "regex_grouping",
          "regex_alternation",
          "regex_text",
          "regex_self_escaped_character",
          "regex_other_escape",
        },
      },
      range = true,
    }
  end
end

binds.map = function(keys, cmd)
  vim.api.nvim_set_keymap('', keys, cmd, binds.params)
end

binds.nmap = function(keys, cmd)
  vim.api.nvim_set_keymap('n', keys, cmd, binds.params)
end

binds.vmap = function(keys, cmd)
  vim.api.nvim_set_keymap('v', keys, cmd, binds.params)
end

binds.setup = function()
  -- Normal Mode
  binds.nmap('<leader>q', '<cmd>q<CR>')
  binds.nmap('<leader>w', '<cmd>w<CR>')

  -- Editor Settings
  binds.nmap('<leader>vh', '<cmd>Telescope help_tags<CR>')
  binds.nmap('<leader>vo', '<cmd>Telescope vim_options<CR>')
  binds.nmap('<leader>vc', '<cmd>Telescope colorscheme<CR>')

  -- Browsing stuff
  binds.nmap('<leader>e', '<cmd>Neotree<CR>')
  binds.nmap('<leader>ff', '<cmd>Telescope find_files<CR>')
  binds.nmap('<leader>fw', '<cmd>Telescope live_grep<CR>')

  -- Refactoring
  binds.vmap('<leader>re', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR> ]])
  binds.vmap('<leader>rf', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR> ]])
  binds.vmap('<leader>rv', [[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR> ]])

  -- Harpoon
  binds.nmap('<leader>ha', [[<cmd>lua require("harpoon.mark").add_file()<CR>]])
  binds.nmap('<leader>hl', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]])
  binds.nmap('`', [[<cmd>lua require("harpoon.ui").nav_next()<CR>]])

  -- Overseer (task runner)
  binds.nmap('<leader>ti', [[<cmd>OverseerToggle<CR>]])
  binds.nmap('<leader>tr', [[<cmd>OverseerRun<CR>]])

  -- Git integration
  binds.nmap('<leader>gi', [[<cmd>Git<CR>]])
  binds.nmap('<leader>gc', [[<cmd>Git commit<CR>]])
  binds.nmap('<leader>gd', [[<cmd>Git diff HEAD<CR>]])
  binds.nmap('<leader>gp', [[<cmd>Git push<CR>]])
  binds.nmap('<leader>gs', [[<cmd>Git pull<CR>]])
end

return binds
