return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
		config = function()
			require("nvim-tree").setup({
				disable_netrw = false,
				hijack_netrw = true,
				respect_buf_cwd = true,
				view = {
					number = true,
					relativenumber = true,
					adaptive_size = true,
					width = 35,
				},
				filters = {
					custom = { ".git" },
				},
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
				actions = {
					open_file = {
						quit_on_open = false,
					},
				},
			})
		end,
		vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>"),
	},
}
