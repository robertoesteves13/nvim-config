# Config
<a href="https://dotfyle.com/robertoesteves13/nvim-config"><img src="https://dotfyle.com/robertoesteves13/nvim-config/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/robertoesteves13/nvim-config"><img src="https://dotfyle.com/robertoesteves13/nvim-config/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/robertoesteves13/nvim-config"><img src="https://dotfyle.com/robertoesteves13/nvim-config/badges/plugin-manager?style=for-the-badge" /></a>

This is the config I always use for programming. The code is focused to not
be overwritten a lot and avoid complete rewrites of the config, so mantainability
is a big priority.

LSP configuration is done by the newly introduced `vim.lsp.config` in Neovim 0.11.
Mason is used on environments where language servers aren't easily installed, like
Windows.

If you want to learn how it works, look at `after/ftplugin` and `lua/lsp_utils.lua`.

## Dependencies
- git
- any C toolchain
- cmake
- make
- tree-sitter

## Installation
> Linux
```sh
git clone git@github.com:robertoesteves13/nvim-config.git ~/.config/nvim
```

> Windows Powershell
```ps1
git clone git@github.com:robertoesteves13/nvim-config.git "$env:LOCALAPPDATA\nvim\"
```
