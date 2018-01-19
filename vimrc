
" Set standard file encoding
set encoding=utf8
" No special per file vim override configs
set nomodeline
" Stop word wrapping
set nowrap
  " Except... on Markdown. That's good stuff.
autocmd FileType markdown setlocal wrap
" Adjust system undo levels
set undolevels=100
" Use system clipboard
set clipboard=unnamed
" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" This is a very special command below that makes the system clipboard work
" well with vim - converts tabs to spaces and stuff - dont mess with it!
set clipboard=unnamedplus
" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells
" Number gutter
set number
" Use search highlighting
set hlsearch
" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5

nnoremap ; :
let mapleader="\<SPACE>"
nmap <Leader>a $a
" switch splits left and right
nmap <Leader><Left> <c-w>w
nmap <Leader><Right> <c-w>W
" space j to go have page down -> space k to go have page up
nmap <Leader>j <C-d>
nmap <Leader>k <C-u> 
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>
" switch between most recent buffers
nnoremap ,, <C-^>

set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

call plug#begin('~/.local/share/nvim/plugged')
Plug 'gabesoft/vim-ags'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/unite.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dracula/vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-scripts/auto-pairs-gentle'
call plug#end()

color dracula

let g:indentLine_enabled = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:indentLine_char = "⟩"

nmap <Leader>/ :Ags<SPACE>

nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

let g:airline#extensions#tabline#enabled=1
set laststatus=2

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Airline unicode fallbacks 
" " air-line

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2
"syntax for jsx
let g:jsx_ext_required = 0

" show relative line numbers in the active buffer (makes it easy to do things like 5j)
au FocusGained * :set relativenumber

" show regular line numbers in inactive buffers
au FocusLost * :set number

" highlight cursor line on entering buffer
au WinEnter * :set cursorline

" remove cursor line highlight when leaving buffer
au WinLeave * :set nocursorline

" highlight cursor column on entering buffer
au WinEnter * :set cursorcolumn

" remove cursor column highlight when leaving buffer
au WinLeave * :set nocursorcolumn

" show max width line (for comments etc.) on entering buffer
au WinEnter * :set colorcolumn=85

" hide max width line (for comments etc.) on entering buffer
au WinLeave * :set colorcolumn=0

" Centralize backups, swapfiles and undo history
set undofile
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

