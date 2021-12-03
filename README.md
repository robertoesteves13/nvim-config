# nvim-config
Repo containing my current neovim configuration
## Dependencies
- Neovim Nightly
- NodeJS
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- A compiler for C
## Installation

> Linux
```sh
git clone git@github.com:robertoesteves13/nvim-config.git ~/.config/nvim
```

> Windows Powershell  
```ps1
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim\"
```

### Nvim
Install packages
```
:PackerSync
```
Optionally install LSP server for the languages of your choice
```
:LspInstall LANGUAGE-NAME-HERE
```

## Mico's fork additions
- vim-kitty
- vim-kitty-navigator
