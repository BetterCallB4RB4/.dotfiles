--list here all the specific integration for GO developing
return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				diagnostic = { -- set diagnostic to false to disable vim.diagnostic.config setup,
					underline = false,
					virtual_text = false,
				},
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencie = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
}
