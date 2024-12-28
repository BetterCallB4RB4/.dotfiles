return {
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
