return {
	-- use colorscheme command
	{
		"folke/tokyonight.nvim",
		priority = 1001, -- load this before other plugins.
		init = function()
			-- 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")
			vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- load this before other plugins.
		init = function()
			require("kanagawa").setup()
		end,
	},
	{
		"rose-pine/neovim",
		priority = 1000, -- load this before other plugins.
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- load this before other plugins.
		config = true,
		config = function()
			vim.o.background = "dark"
		end,
	},
}
