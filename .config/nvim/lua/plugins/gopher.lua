return {
	{
		"olexsmir/gopher.nvim",
		ft = "go", -- Load plugin only for Go files
		dependencies = {
			"nvim-lua/plenary.nvim", -- Utility library
			"nvim-treesitter/nvim-treesitter", -- Tree-sitter support for Go
			"mfussenegger/nvim-dap", -- Optional: for debugging with DAP
		},
		build = function()
			-- Install Go dependencies when the plugin is updated
			vim.cmd("GoInstallDeps")
		end,
		opts = {
			commands = {
				go = "go",
				gomodifytags = "gomodifytags",
				gotests = "gotests",
				impl = "impl",
				iferr = "iferr",
				dlv = "dlv",
			},
			gotests = {
				-- Default test template
				template = "default",
				-- Directory for custom test templates (set to nil for no custom templates)
				template_dir = nil,
				-- Use map instead of slice for table tests
				named = false,
			},
			gotag = {
				-- Use snake_case for tag transformations
				transform = "snakecase",
			},
		},
	},
}
