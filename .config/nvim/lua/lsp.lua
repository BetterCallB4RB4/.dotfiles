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
vim.lsp.enable("luals")
vim.lsp.enable("gopls")

-- enable native autocmplete
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method("textDocument/completion") then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })

-- virtual text
-- vim.diagnostic.config({
-- 	virtual_text = { current_line = true },
-- 	virtual_lines = {
-- 		current_line = true,
-- 	},
-- })
