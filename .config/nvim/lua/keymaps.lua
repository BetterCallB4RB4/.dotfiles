vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- This is going to get me cancelled -- from the prime time
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "{", "}", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "}", "{", { noremap = true, silent = true })

-- just disable this function
vim.keymap.set("n", "Q", "<nop>")

-- Highlight all occurrences of word under cursor without moving
vim.keymap.set("n", "#", function()
	vim.fn.setreg("/", "\\<" .. vim.fn.expand("<cword>") .. "\\>")
	vim.opt.hlsearch = true
end, { noremap = true, silent = true, desc = "Highlight word without moving" })

-- move highlight test while in visual mode with shift JK
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Indent selected text to the left and right
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- never lost last buffer after a copy over
-- Since Neovim 0.10, visual P pastes without overwriting the register natively
vim.keymap.set("x", "p", "P")

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })
