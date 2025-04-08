return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("render-markdown").setup({
				completions = { blink = { enabled = true } },
			})
		end,
	},
}
