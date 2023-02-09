# READ THIS BEFORE USING IT
Because of depending on a bleeding-edge version of neovim, things may be easily breakable since I don't freeze the plugins into a working state (might do that later). I don't guarantee to update fast if some plugin breaks, instead you should rely on other neovim configurations with saner defaults such as [LunarVim](https://github.com/LunarVim/LunarVim) or [NvChad](https://github.com/NvChad/NvChad)

## Dependencies
- Neovim Nightly (Always check for latest version)
- Treesitter
- MinGW (Windows only)

## Installation
> Linux
```sh
git clone git@github.com:robertoesteves13/nvim-config.git ~/.config/nvim
```

> Windows Powershell (not guaranteed to work)
```ps1
git clone git@github.com:robertoesteves13/nvim-config.git "$env:LOCALAPPDATA\nvim\"
```

Don't forget to install all the plugins by running the `:PackerSync` command inside neovim.

