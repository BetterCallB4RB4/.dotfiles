return {
{
  "christoomey/vim-tmux-navigator",
  lazy = false,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  mode = { "n", "t", "v" } },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>",  mode = { "n", "t", "v" } },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>",    mode = { "n", "t", "v" } },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "t", "v" } },
  },
},
}
