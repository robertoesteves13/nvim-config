# Config
This is the config I always use for programming. The code is focused to not
be overwritten a lot and avoid complete rewrites of the config, so mantainability
is a big priority.

This config does LSP handling pretty different compared to plugins like `lspconfig`.
It uses the native filetype plugin to run code for that filetype, including
starting the LSP. The idea is to have different configurations for each filetype
when needed, and I couldn't do that using `lspconfig`, so I preferred using
`vim.lsp` directly. It lacks a lot of extra functionality, but I found much
simpler to work with.

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
