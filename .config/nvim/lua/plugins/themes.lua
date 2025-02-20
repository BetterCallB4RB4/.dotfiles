return {
	-- THEME SELECTORS --
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					"tokyonight-night",
					"tokyonight-moon",
					"kanagawa",
				},
				livePreview = true,
			})
		end,
	},

	-- THEMES --
	{
		"rebelot/kanagawa.nvim",
		init = function()
			require("kanagawa").setup()
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- load this before other plugins.
		init = function()
			-- 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
