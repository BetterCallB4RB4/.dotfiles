return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					component_separators = "|",
					section_separators = "",
					theme = "auto",
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"buffers",
							symbols = {
								modified = " ●", -- Text to show when the buffer is modified
								alternate_file = "", -- Text to show to identify the alternate file
								directory = "", -- Text to show when the buffer is a directory
							},
						},
					},
				},
			})
		end,
	},
}
