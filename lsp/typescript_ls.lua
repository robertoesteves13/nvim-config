return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "package.json" },
  init_options = {
    typescript = {
      tsdk = "./node_modules/typescript/lib"
    },
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
