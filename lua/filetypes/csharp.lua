return {
  pattern = {"*.cs"},
  lsp_name = "omnisharp",
  lsp_setup_params = {
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = false,
    organize_imports_on_format = false,
    enable_import_completion = false,
    sdk_include_prereleases = true,
    analyze_open_documents_only = false,
  },
  configs = function ()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
}
