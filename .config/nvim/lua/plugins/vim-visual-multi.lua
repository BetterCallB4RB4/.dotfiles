return {
	{
		"mg979/vim-visual-multi",
		branch = "master",
		init = function()
			vim.g.VM_maps = {
				["Find Under"] = "<C-s>",
				["Find Subword Under"] = "<C-s>",
			}
		end,
		-- Key mappings:
		--  - Ctrl-s        - Select word under cursor / add next match
		--  - Ctrl-Down/Up  - Add cursor below/above
		--  - n / N         - Go to next/prev match after Ctrl-s selection
		--  - q             - Skip current match and go to next
		--  - Q             - Remove current cursor/selection
		--  - Tab           - Switch between cursor and extend mode
	},
}
