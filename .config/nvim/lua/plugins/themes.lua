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
					"tokyonight-day",
					"kanagawa-wave",
					"kanagawa-lotus",
					"kanagawa-dragon",
					"rose-pine-main",
					"rose-pine-moon",
					"rose-pine-dawn",
				},
				livePreview = true,
			})
		end,
	},

	-- THEMES --
	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- load this before other plugins.
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
	{
		"rose-pine/neovim",
		priority = 1000, -- load this before other plugins.
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
