---@class LspOpts
---@field name string The name of LSP
---@field cmd string[]? Command-line arguments to start LSP (default to `name`)
---@field settings table? The LSP settings
---@field root_files string[] A list of files/directories to identify the root directory. Supports wildcards
local LspOpts = {}

---@param list string[] A list of files/directories. Supports wildcards
---@return unknown
local function setRoot(list)
  return vim.fs.dirname(vim.fs.find(list, { upward = true })[1])
end

---@param opts LspOpts A list of LSP options
---@see LspOpts
function SetupLsp(opts)
  if opts["cmd"] == nil then
    opts.cmd = { opts.name }
  end

  if opts["settings"] == nil then
    opts.settings = {}
  end

  vim.lsp.start({
    name = opts.name,
    cmd = opts.cmd,
    settings = opts.settings,
    root_dir = setRoot(opts.root_files),
  })
end

return {
  SetupLsp = SetupLsp
}
