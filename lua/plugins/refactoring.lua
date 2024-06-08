return {
	"ThePrimeagen/refactoring.nvim",
	cmd = "Refactor",
	config = function()
		local refactor = require("refactoring")
		refactor.setup()

		-- telescope refactoring helper
		local function refactor(prompt_bufnr)
			local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
			require("telescope.actions").close(prompt_bufnr)
			require("refactoring").refactor(content.value)
		end

		-- NOTE: M is a global object
		-- for the sake of simplicity in this example
		-- you can extract this function and the helper above
		-- and then require the file and call the extracted function
		-- in the mappings below
		M = {}
		M.refactors = function()
			local opts = require("telescope.themes").get_cursor() -- set personal telescope options
			require("telescope.pickers")
				.new(opts, {
					prompt_title = "refactors",
					finder = require("telescope.finders").new_table({
						results = require("refactoring").get_refactors(),
					}),
					sorter = require("telescope.config").values.generic_sorter(opts),
					attach_mappings = function(_, map)
						map("i", "<CR>", refactor)
						map("n", "<CR>", refactor)
						return true
					end,
				})
				:find()
		end
	end,
	lazy = true,
	keys = {
		{ mode = "v", "<leader>re", "<Cmd>Refactor extract<CR>" },
		{ mode = "v", "<leader>rb", "<Cmd>Refactor extract_block<CR>" },
		{ mode = "v", "<leader>rf", "<Cmd>Refactor extract_to_file<CR>" },
		{ mode = "v", "<leader>rv", "<Cmd>Refactor extract_var<CR>" },
	},
}
