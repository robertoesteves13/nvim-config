return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "package.json" },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = './node_modules/@vue/language-server',
        languages = { 'vue' },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
