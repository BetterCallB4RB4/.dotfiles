return {
	"williamboman/mason.nvim",
	-- You can customize the installation path.
	-- e.g. /path/to/my/mason/packages
	-- default is ~/.local/share/nvim/mason
	-- path = "~/.local/share/nvim/mason",
	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
		},

		automatic_installation = true,
		-- ui = {
		-- 	-- You can change the border type.
		-- 	border = "rounded",
		-- 	-- You can change the icons used in the UI.
		-- 	icons = {
		-- 		package_installed = "✓",
		-- 		package_pending = "➜",
		-- 		package_uninstalled = "✗",
		-- 	},
		-- 	-- You can change the keymaps used in the UI.
		-- 	keymaps = {
		-- 		install_package = "i",
		-- 		update_package = "u",
		-- 		check_package_version = "c",
		-- 		update_all_packages = "U",
		-- 		uninstall_package = "X",
		-- 	},
		-- },
	},
}
