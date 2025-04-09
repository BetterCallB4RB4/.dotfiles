return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				-- disable the default tree navigator of neovim
				disable_netrw = true,
				hijack_netrw = true,

				-- open on the correct directory and keep the correct sync
				respect_buf_cwd = true,
				sync_root_with_cwd = true,

				view = {
					number = true,
					relativenumber = true,
					adaptive_size = true,
					width = 35,
				},

				filters = {
					custom = { ".git" },
				},

				-- change che selected file when change the editing file
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
