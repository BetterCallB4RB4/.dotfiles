-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Load Neovim options
require("options")

-- Load keymaps
require("keymaps")

-- Load auto commands
require("autocmds")

-- install lazynvim as a plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `lua/plugins/` folder
require("lazy").setup({ import = "plugins" }, {
	change_detection = {
		notify = false,
	},
})

-- try to optimize startup by disabling unused plugins
vim.loader.enable()
local g = vim.g
g.loaded_rrhelper = true
g.loaded_netrwPlugin = true
g.loaded_netrwFileHandlers = true
g.loaded_netrwSettings = true
g.loaded_2html_plugin = true
g.loaded_vimballPlugin = true
g.loaded_getscriptPlugin = true
g.loaded_logipat = true
g.loaded_tutor_mode_plugin = true
g.loaded_matchit = true
-- keep this active
-- g.loaded_gzip = true
-- g.loaded_tarPlugin = true
-- g.loaded_zipPlugin = true
