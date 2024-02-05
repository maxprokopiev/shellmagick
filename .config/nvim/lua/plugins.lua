return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'projekt0n/github-nvim-theme'
  use {
    'nvim-telescope/telescope.nvim', branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
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
end)
