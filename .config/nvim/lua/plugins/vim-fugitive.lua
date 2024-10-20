return {
	{
		"tpope/vim-fugitive",
		-- Define mappings for conflict navigation and resolution with Shift + Ctrl modifiers
		vim.api.nvim_set_keymap("n", "<S-C-Right>", ":diffget //3<CR>", { noremap = true }),
		vim.api.nvim_set_keymap("n", "<S-C-Left>", ":diffget //2<CR>", { noremap = true }),
		vim.cmd(
			"command! Gsync execute 'w' | execute 'G add .' | execute \"G commit -m 'sync repo'\" | execute 'G push'"
		),
	},
}
