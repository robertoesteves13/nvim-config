return {
	cmd = { "vue-language-server", "--stdio" },
	root_markers = { "package.json" },
	init_options = {
		vue = {
			hybridMode = false,
		},
		typescript = {
			tsdk = "./node_modules/typescript/lib",
		},
	},
	before_init = function(_, config)
		local lib_path = vim.fs.find("node_modules/typescript/lib", { path = ".", upward = true })[1]
		if lib_path then
			config.init_options.typescript.tsdk = lib_path
		end
	end,
	filetypes = { "vue" },
}
