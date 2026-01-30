vim.o.mouse = 'a'
vim.g.mapleader = " "
vim.o.clipboard = 'unnamedplus'

vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

vim.keymap.set('', '<Leader>l', ":let linenum=getpos('.')[1] | :rightbelow vnew % | :call cursor(linenum, 0)<CR>")
vim.keymap.set('', '<Leader>j', ':rightbelow new %<CR>')
vim.keymap.set('', '<Leader>r', ':so %<CR>')
vim.keymap.set('', '<Leader>s', ':w<CR>')

require('plugins')

vim.o.number = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>P', builtin.commands, {})
vim.keymap.set('n', '<leader>o', builtin.buffers, {})
vim.keymap.set('n', '<leader>f', builtin.live_grep, {})

require("nvim-tree").setup()

require('github-theme').setup({
  groups = { all = { StatusLineNC = { fg = '#83868a', bg = '#ced3d9' } } },
  options = { hide_nc_statusline = false, compile_path = vim.fn.expand('$HOME/.config/nvim/github-theme-compiled') },
})
vim.cmd('colorscheme github_light')

vim.o.swapfile = false

vim.wo.wrap = false
vim.wo.linebreak = true
vim.wo.list = false

vim.o.cul = true

vim.keymap.set('n', ';', ':')

vim.g.clipboard = {
  name = "rdm",
  copy = {
    ["+"] = { "rdm", "copy" },
    ["*"] = { "rdm", "copy" },
  },
  paste = {
    ["+"] = { "rdm", "paste" },
    ["*"] = { "rdm", "paste" },
  },
}

vim.g['test#strategy'] = "vimux"

vim.keymap.set('n', '<leader>k', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>k', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.cmd [[
function! DebugNearest()
  let g:test#go#delve#executable = 'GOFLAGS="-tags=integration" dlv test'
  let g:test#go#runner = 'delve'
  TestNearest
  unlet g:test#go#runner
endfunction
]]
vim.api.nvim_create_user_command("DebugNearest", ":call DebugNearest()", { nargs = 0 })

vim.keymap.set('n', '<leader>b', ':GBrowse<CR>')
vim.keymap.set('v', '<leader>b', ':GBrowse<CR>')

require("nvim-treesitter").setup()
require("codecompanion").setup()

local ts_status, treesitter = pcall(require, "nvim-treesitter.configs")
if ts_status then
  treesitter.setup({
    ensure_installed = { "lua", "markdown", "markdown_inline", "yaml", "diff" },
    highlight = { enable = true },
  })
end

require("telescope").setup{
  pickers = {
    find_files = {
      hidden = true
    },
    grep_string = {
      additional_args = {"--hidden"}
    },
    live_grep = {
      additional_args = {"--hidden"}
    },
  },
}
