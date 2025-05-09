return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"bash",
					"markdown",
					"go",
					"terraform",
					"groovy",
				},
				sync_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
