return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    main = "nvim-treesitter.configs",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local install_dir = vim.fn.stdpath("data") .. "/treesitter"

      vim.opt.runtimepath:append(install_dir)

      require("nvim-treesitter.configs").setup({
        parser_install_dir = install_dir,
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "markdown",
          "go",
          "terraform",
          "groovy",
        },
        sync_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
