return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true

      require("bufferline").setup {
        options = {
          mode = "buffers",
          themable = true,
          style = "minimal",
        },
        highlights = {
          fill = {
              fg = '#1A1B26',
              bg = '#1A1B26',
          },
        },
      }
    end,
  },
}
