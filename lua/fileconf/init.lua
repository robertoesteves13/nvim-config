local function lsp_attach(client, bufnr)
  local params = {
    noremap = true,
    silent = true
  }

  -- LSP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', params)

  -- DAP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>da', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dc', '<cmd>lua require\'dap\'.continue()<CR>', params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dso', '<cmd>lua require\'dap\'.step_over()<CR>', params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dsi', '<cmd>lua require\'dap\'.step_into()<CR>', params)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dw', '<cmd>lua require\'dap\'.repl.open()<CR>', params)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>di', '<cmd>lua require\'dapui\'.toggle()<CR>', params)
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

---@class LanguageConfig
---@field pattern string[]
--
---@field lsp_name string
---@field lsp_setup_params table
--
---@field dap_name string
---@field dap_adapter_params table
---@field dap_configuration_params table
--
---@field configs function
---@field run_once function?
local LanguageConfig = {}

---@param name string
---@param conf LanguageConfig
local function Setup(name, conf)
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local lspconfig = require('lspconfig')
  local dap = require('dap')

  local setup_params = {
    on_attach = lsp_attach,
    capabilities = capabilities
  }

  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = conf.pattern,
    callback = function()
      if conf.run_once then
        conf.run_once()
      end

      if conf.lsp_name then
        for key, value in pairs(conf.lsp_setup_params) do
          setup_params[key] = value
        end
        lspconfig[conf.lsp_name].setup(setup_params)
      end

      if conf.dap_name then
        dap.adapters[conf.dap_name] = conf.dap_adapter_params
        dap.configurations[name] = conf.dap_configuration_params
      end

      conf.configs()
    end
  })
end


return {
  bindLanguage = Setup
}
