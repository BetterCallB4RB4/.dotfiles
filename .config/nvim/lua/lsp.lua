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
				unusedparams = true, -- Report unused parameters
				nilness = true, -- Enable nilness analysis
			},
			staticcheck = true, -- Use static analysis for better diagnostics
			gofumpt = true, -- Use gofumpt formatting style
		},
	},
}

vim.lsp.config["terraformls"] = {
	cmd = { "terraform-ls", "serve" }, -- Command to start terraform-ls
	filetypes = { "terraform", "hcl", "tf" }, -- Filetypes for Terraform
}

vim.lsp.config["groovyls"] = {
	cmd = { "groovy-language-server" }, -- Command to start the Groovy LSP server
	filetypes = { "groovy" }, -- Filetypes to associate with groovy-language-server
	root_dir = "/home/jd4augbarbad/gitOps/ITIO-shared-libraries/jenkins-library-cd/src",
}

vim.lsp.enable("luals")
vim.lsp.enable("gopls")
vim.lsp.enable("groovyls")
vim.lsp.enable("terraformls")

-- virtual text
-- vim.diagnostic.config({
-- 	virtual_text = { current_line = true },
-- 	virtual_lines = {
-- 		current_line = true,
-- 	},
-- })
