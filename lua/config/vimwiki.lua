local function setup()
  vim.g["vimwiki_list"] = {
    {
      template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/vimwiki",
      syntax = "markdown", ext = ".md",
      template_default = 'default',
      template_ext = '*.tpl'
    }
  }
end

return setup()
