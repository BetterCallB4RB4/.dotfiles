return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
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
    config = function(_, opts)
	require("nvim-treesitter.configs").setup(opts)
	vim.cmd([[
          augroup filetypedetect
            autocmd BufRead,BufNewFile *.Jenkinsfile set filetype=groovy
          augroup END
        ]])
	vim.cmd([[
          augroup filetypedetect
            autocmd BufRead,BufNewFile *.tfvars set filetype=terraform 
          augroup END
        ]])
    end,

}
