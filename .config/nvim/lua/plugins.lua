local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
      opts = {
        ensure_installed = {
          "bash", "css", "go", "graphql", "html", "javascript", "json",
          "lua", "markdown", "ruby", "scss", "typescript", "vim", "yaml",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = false,
        },
      },
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
