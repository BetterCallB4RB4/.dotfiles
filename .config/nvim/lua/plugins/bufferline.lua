return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true

      require("bufferline").setup {
        options = {
          mode = "buffers", -- or "buffers"
          style = "underline", -- or "minimal", "underline", etc.
        },
      }
    end,
  },
}
