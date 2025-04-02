-- this is still not compliting the with fuzzy as i want
return {
	-- this plugin allow you to have a better completition and cool aspect for command like : and /
	-- this will substitute wilder
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({})
			require("cmp").setup.cmdline(":", {
				sources = {
					{ name = "cmdline" },
				},
			})
			require("cmp").setup.cmdline("/", {
				sources = {
					{ name = "buffer" },
				},
			})
		end,
	},
}
