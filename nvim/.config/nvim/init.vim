"==============================================================================
" PLUGINS 
"==============================================================================

set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-surround'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'adimit/prolog.vim'

Plug 'nvie/vim-flake8'
Plug 'Valloric/YouCompleteMe'

Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
filetype plugin indent on

"==============================================================================
" THEME SETTINGS 
"==============================================================================

syntax on
set background=dark
colorscheme gruvbox 
set t_Co=256

"==============================================================================
" BASIC SETTINGS FOR VIM
"==============================================================================

set shell=/bin/zsh

set nocompatible

set number
set relativenumber
set ruler
set cc=80
set wrap

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

set showmatch " bracket stuff

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

set cmdheight=1

"==============================================================================
" CUSTOM KEYBINDINGS
"==============================================================================

" switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" resizing splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


"==============================================================================
" PLUGIN SETTINGS 
"==============================================================================

source ~/.vimrc_plugin_settings
