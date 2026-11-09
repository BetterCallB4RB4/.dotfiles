return {
-- {
--   "christoomey/vim-tmux-navigator",
--   lazy = false,
--   keys = {
--     { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  mode = { "n", "v" } },
--     { "<C-j>", "<cmd>TmuxNavigateDown<cr>",  mode = { "n", "v" } },
--     { "<C-k>", "<cmd>TmuxNavigateUp<cr>",    mode = { "n", "v" } },
--     { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "v" } },
--   },
--   config = function()
--     vim.keymap.set("t", "<C-h>", function() vim.cmd("TmuxNavigateLeft")  end, { noremap = true, silent = true })
--     vim.keymap.set("t", "<C-j>", function() vim.cmd("TmuxNavigateDown")  end, { noremap = true, silent = true })
--     vim.keymap.set("t", "<C-k>", function() vim.cmd("TmuxNavigateUp")    end, { noremap = true, silent = true })
--     vim.keymap.set("t", "<C-l>", function() vim.cmd("TmuxNavigateRight") end, { noremap = true, silent = true })
--   end,
-- },
{
  'aimdevlee/herdr-nvim-nav',
  dependencies = { 'christoomey/vim-tmux-navigator' }, -- omit if with_tmux = false
  config = function()
    require('herdr-nvim-nav').setup()
  end,
}
}
