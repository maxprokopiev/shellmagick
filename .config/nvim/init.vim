set nocompatible

" ======= Plugins =======
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" ======= General =======

set number
set clipboard=unnamed
set termguicolors

set nowrap
set linebreak

" =========== Mouse ==============
set mouse=a
set mousefocus
set mousemodel=popup

" =========== cursor color =========
hi Cursor guifg=DeepPink guibg=DeepPink
hi Cursor2 guifg=DeepPink guibg=DeepPink
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50

" highlight the current line
set cul
hi CursorLine term=none cterm=none guibg=GhostWhite

" =========== no backups ===========
set nobackup
set noswapfile
set nowb

" =========== mappings =============

" remap leader key from \ to ,
let mapleader=","
let g:mapleader=","
let maplocalleader=","
let g:maplocalleader=","

" faster commands
nmap <leader>w :w!<CR>
nnoremap <leader>q :q<CR>
nnoremap ; :

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" window splitting
nmap <leader>f :rightbelow vnew<CR>
nmap <leader>v :rightbelow new<CR>

map <leader>r :Files<CR>
