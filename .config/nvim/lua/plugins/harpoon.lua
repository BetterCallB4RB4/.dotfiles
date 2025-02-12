return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2", -- Or "v2" if that's the branch name
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }, -- Add Telescope as a dependency
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({}) -- Basic setup (you can add custom options here if needed)

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Add file to Harpoon list" })

			vim.keymap.set("n", "<leader>h", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Open Harpoon list" })

			vim.keymap.set("n", "1", function()
				harpoon:list():select(1)
			end, { desc = "Go to Harpoon mark 1" })
			vim.keymap.set("n", "2", function()
				harpoon:list():select(2)
			end, { desc = "Go to Harpoon mark 2" })
			vim.keymap.set("n", "3", function()
				harpoon:list():select(3)
			end, { desc = "Go to Harpoon mark 3" })
			vim.keymap.set("n", "4", function()
				harpoon:list():select(4)
			end, { desc = "Go to Harpoon mark 4" })

			vim.keymap.set("n", "Tab", function()
				harpoon:list():prev()
			end, { desc = "Go to previous Harpoon mark" })
		end,
	},
}
