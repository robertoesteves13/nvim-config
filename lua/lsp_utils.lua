-- TODO: implement https://github.com/neovim/neovim/pull/31031 when neovim reaches 0.11

---@class LspOpts
---@field name string The name of LSP
---@field cmd string[]? Command-line arguments to start LSP (default to `name`)
---@field settings table? The LSP settings
---@field capabilities table? The client capabilities
---@field before_init function?
---@field root_files string[] A list of files/directories to identify the root directory. Supports wildcards
local LspOpts = {}

---@param list string[] A list of files/directories. Supports wildcards
---@return string?
local function setRoot(list)
	local dirs = vim.fs.find(list, { upward = false })
	return vim.fs.dirname(dirs[1])
end

---@param opts LspOpts A list of LSP options
---@see LspOpts
local function SetupLsp(opts)
	local o = {}
	o.name = opts.name
	o.before_init = opts.before_init
	o.root_dir = setRoot(opts.root_files)

	if o.root_dir == nil then
		vim.notify("Root directory not found, LSP isn't initialized.", vim.log.levels.INFO, nil)
		return
	end

	o.cmd = opts.cmd or { opts.name }
	o.settings = opts.settings or opts.settings

	local capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		require("blink.cmp").get_lsp_capabilities()
	)
	if opts["capabilities"] ~= nil then
		capabilities = vim.tbl_deep_extend("force", capabilities, opts.capabilities)
	end
	o.capabilities = capabilities

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

	local win = vim.api.nvim_open_win(buffer, true, {
		relative = "win",
		width = width,
		height = height,
		border = "single",
		row = top,
		col = left,
		style = "minimal",
	})

	vim.bo[buffer].filetype = "lua"
	vim.bo[buffer].modifiable = false

	vim.api.nvim_buf_set_keymap(buffer, "n", "q", "<cmd>bw<CR>", {})
end

local function open()
	local clients = vim.lsp.get_clients()
	local names = {}
	local indexTable = {}

	for i, client in ipairs(clients) do
		table.insert(names, client.name)
		indexTable[client.name] = i
	end

	vim.ui.select(names, { prompt = "Select an LSP" }, function(name)
		if name == nil then
			return
		end

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
