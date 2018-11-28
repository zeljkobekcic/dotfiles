"==============================================================================
" PLUGINS 
"==============================================================================

set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')


Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/paredit.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'bling/vim-bufferline'
" Plug 'tmhedberg/SimpylFold'
" Plug 'vim-scripts/BufOnly.vim'
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-misc'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'
Plug 'morhetz/gruvbox'

let g:deoplete#enable_at_startup = 1

call plug#end()
filetype plugin indent on

"==============================================================================
" THEME SETTINGS 
"==============================================================================

syntax enable
set background=dark
set termguicolors
colorscheme gruvbox
let g:lightline={'colorscheme' : 'gruvbox'}

"==============================================================================
" BASIC SETTINGS FOR VIM
"==============================================================================

let g:python3_host_prog = '/home/zeljko/.virtualenvs/neovim3/bin/python3'

set shell=/bin/zsh

set number
set relativenumber
set ruler
set cc=80
set wrap
set cursorline
set inccommand=nosplit

set autoread
set showmode
set smartcase
set smarttab

set autoindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set encoding=UTF-8

set showmatch

set mouse=a
set history=1000
set clipboard+=unnamedplus

set completeopt=menuone,menu,longest
set completeopt+=longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set magic
set hlsearch 

set laststatus=2
set noshowmode

set hidden
set confirm
"==============================================================================
" CUSTOM KEYBINDINGS
"==============================================================================

nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>
nnoremap <leader><space> :CtrlPBuffer<CR>
map <C-f> :NERDTreeToggle<CR>

" source: http://vimcasts.org/episodes/neovim-terminal-mappings/
if has('nvim')
  " Terminal mode:
  tnoremap <M-[> <c-\><c-n>
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

"==============================================================================
" PLUGIN SETTINGS 
"==============================================================================


let g:ale_sign_error = '->'
let g:ale_sign_warning = '__'

let g:rainbow_active = 1

let g:SimpylFold_fold_import = 0
let b:SimpylFold_fold_import = 0

let g:pymode_python = 'python3'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
