return {
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencie = {
			"mfussenegger/nvim-dap",
		},
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
}
