return {
	"williamboman/mason.nvim",
	-- You can customize the installation path.
	-- default is ~/.local/share/nvim/mason
	-- path = "~/.local/share/nvim/mason",
	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
			"terraformls",
			"groovyls",
		},
		automatic_installation = true,
	},
}
