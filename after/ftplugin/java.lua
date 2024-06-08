vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

local config = {
	cmd = { "jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	settings = {
		java = {
			["project.sourcePaths"] = { "src/main/java " },
			["configuration.updateBuildConfiguration"] = "automatic",
			import = {
				["gradle.enabled"] = true,
				["maven.enabled"] = true,
			},
		},
	},
}
require("jdtls").start_or_attach(config)
