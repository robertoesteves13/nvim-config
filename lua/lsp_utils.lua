---@class LspOpts
---@field name string The name of LSP
---@field cmd string[]? Command-line arguments to start LSP (default to `name`)
---@field settings table? The LSP settings
---@field capabilities table? The client capabilities
---@field before_init function?
---@field root_files string[] A list of files/directories to identify the root directory. Supports wildcards
local LspOpts = {}

---@param list string[] A list of files/directories. Supports wildcards
---@return unknown
local function setRoot(list)
	return vim.fs.dirname(vim.fs.find(list, { upward = true })[1])
end

---@param opts LspOpts A list of LSP options
---@see LspOpts
local function SetupLsp(opts)
	local o = {}
	o.name = opts.name
	o.before_init = opts.before_init
	o.root_dir = setRoot(opts.root_files)

	if opts["cmd"] == nil then
		o.cmd = { opts.name }
	else
		o.cmd = opts.cmd
	end

	if opts["settings"] ~= nil then
		o.settings = opts.settings
	end

	if opts["capabilities"] ~= nil then
		o.capabilities = opts.capabilities
	end

	local client = vim.lsp.start(o)

	if client ~= nil then
		vim.lsp.buf_attach_client(0, client)
	end
end

---@param buffer integer
local function create_window(buffer)
	local width = math.floor(vim.o.columns * 0.66)
	local height = math.floor(vim.o.lines * 0.66)
	local top = math.floor(((vim.o.lines - height) / 2))
	local left = math.floor((vim.o.columns - width) / 2)

	vim.api.nvim_open_win(buffer, true, {
		relative = "win",
		width = width,
		height = height,
		border = "single",
		win = 1001,
		row = top,
		col = left,
		style = "minimal",
	})
end

local function open()
	local clients = vim.lsp.get_active_clients()
	local names = {}
	local indexTable = {}

	for i, client in ipairs(clients) do
		table.insert(names, client.name)
		indexTable[client.name] = i
	end

	vim.ui.select(names, { prompt = "Select an LSP" }, function(name)
		local i = indexTable[name]

		local buffer = vim.api.nvim_create_buf(false, true)
		local lines = vim.split(vim.inspect(clients[i]), "\n", {})
		vim.api.nvim_buf_set_lines(buffer, 0, 0, false, lines)

		create_window(buffer)
	end)
end

local function see_logs()
	local filename = vim.lsp.get_log_path()
	vim.cmd("edit " .. filename)
end

vim.api.nvim_create_user_command("LspInfo", open, {})
vim.api.nvim_create_user_command("LspLogs", see_logs, {})

return {
	SetupLsp = SetupLsp,
}
