return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
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
end)
