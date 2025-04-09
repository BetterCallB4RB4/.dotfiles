vim.lsp.config["luals"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
		},
	},
}

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				nilness = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
}

vim.lsp.config["terraformls"] = {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "hcl", "tf" },
}

vim.lsp.config["groovyls"] = {
	cmd = { "groovy-language-server" },
	filetypes = { "groovy" },
	root_dir = "/home/jd4augbarbad/gitOps/ITIO-shared-libraries/jenkins-library-cd/src",
}

vim.lsp.enable("luals")
vim.lsp.enable("gopls")
vim.lsp.enable("groovyls")
vim.lsp.enable("terraformls")
