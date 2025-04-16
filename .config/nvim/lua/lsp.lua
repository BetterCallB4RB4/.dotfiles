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

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: Go to References" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "LSP: Go to Implementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })
vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "LSP: Document Symbols" })
vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "LSP: Workspace Symbols" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration" })
