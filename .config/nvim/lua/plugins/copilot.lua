return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			auth_provider_url = "https://crifgroup.ghe.com/",
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				keymap = {
					accept = "<Tab>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			panel = {
				enabled = false,
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				["."] = false,
			},
		},
	},
}
