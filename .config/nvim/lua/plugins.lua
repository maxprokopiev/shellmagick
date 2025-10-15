return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'projekt0n/github-nvim-theme'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "markdown", "markdown_inline", "yaml", "diff" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
          })
      end,
  }
  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'axelf4/vim-strip-trailing-whitespace'
  use 'fatih/vim-go'
  use 'vim-test/vim-test'
  use 'preservim/vimux'
  use 'numToStr/FTerm.nvim'
  use 'github/copilot.vim'
  use 'nvim-treesitter/nvim-treesitter-context'
  use({
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup()
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    }
  })
end)
