vim.o.mouse = 'a'
vim.g.mapleader = " "
vim.o.clipboard = 'unnamedplus'

vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

vim.keymap.set('', '<Leader>l', ':rightbelow vnew %<CR>')
vim.keymap.set('', '<Leader>j', ':rightbelow new %<CR>')
vim.keymap.set('', '<Leader>r', ':so %<CR>')
vim.keymap.set('', '<Leader>s', ':w<CR>')

require('plugins')

require('github-theme').setup({
  hide_inactive_statusline = false,
  theme_style = 'light'
})

vim.o.number = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>P', builtin.commands, {})
vim.keymap.set('n', '<leader>o', builtin.buffers, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})

require("nvim-tree").setup()

vim.o.nobackup = true
vim.o.noswapfile = true
vim.o.nowb = true