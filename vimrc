set nomodeline
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
" search case insensitive unless capital letters used
set ignorecase
set smartcase
" Use system clipboard
set clipboard=unnamed
" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
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
let mapleader="\<SPACE>"
" switch splits left and right
nmap <Leader><Left> <c-w>w
nmap <Leader><Right> <c-w>W
" space j to go have page down -> space k to go have page up
nmap <Leader>j <C-d>
nmap <Leader>k <C-u> 
" tab between windows shift tab to go back
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>
" make ; function as : super lazy :)
nnoremap ; :

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'Shougo/unite/vim'
  Plug 'agude/vim-eldar'
  Plug 'tomasr/molokai'
  Plug 'dracula/vim'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
  Plug 'mhinz/vim-grepper'
  Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'w0rp/ale'
  Plug 'justinmk/vim-sneak'
call plug#end()
" this enables the pangloss vim js package syntax highlighting
let g:javascript_plugin_jsdoc = 1
" ale standard style for JS
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" when searching with fuzzy finder ignore these folders below
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"
let g:deoplete#enable_at_startup = 1


nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>
" f p to search entire (p)roject f b to search current (b)uffers
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>

let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" an example of how to customize background and foreground values of a theme.
" particularly useful to me since my terminal's choice for grey is ugly af.
" au ColorScheme molokai highlight Normal ctermfg={0-256} ctermbg={0-256}
" to learn more run :help hightlight

au ColorScheme * highlight Normal ctermbg=NONE
let g:dracula_colorterm = 0
colorscheme dracula

augroup dracula_customization
  au!
      " autocmds...
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
    
augroup END
" Centralize backups, swapfiles and undo history
set undofile
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

if exists("&undodir")
  set undodir=~/.vim/undo
endif

" this might finally help me with auto set nopaste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
