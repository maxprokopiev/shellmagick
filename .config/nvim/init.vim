set nocompatible

" ======= Plugins =======
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'github/copilot.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" ======= General =======

set number
set clipboard=unnamed
set termguicolors
set background=light

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

map <leader>t :Files<CR>
