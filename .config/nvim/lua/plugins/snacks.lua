return {
	{
	  "folke/snacks.nvim",
	  priority = 1000,
	  lazy = false,
	  ---@type snacks.Config

	  opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
		  enabled = true,
		  timeout = 3000,
		},
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	  },

	  keys = {
		{ "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
		{ "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
		{ "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
		{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
	  },
	}
}

