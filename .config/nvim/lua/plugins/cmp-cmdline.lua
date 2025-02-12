return {
	--this plugin allow you to have a better completition and cool aspect for command like : and /
	-- this will substitute wilder
	{
		"hrsh7th/nvim-cmp", -- nvim-cmp plugin
		dependencies = {
			"hrsh7th/cmp-cmdline", -- cmp-cmdline extension for command-line completion
		},
		config = function()
			local cmp = require("cmp")

			-- you can add custom setup
			cmp.setup({})

			-- Setup cmp-cmdline
			require("cmp").setup.cmdline(":", {
				sources = {
					{ name = "cmdline" },
				},
			})

			-- You can also configure other cmdline sources for '/' or ':'
			require("cmp").setup.cmdline("/", {
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},
}
