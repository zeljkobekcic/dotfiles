"==============================================================================
" PLUGINS 
"==============================================================================

set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-surround'
"Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'

"if has('nvim')
"    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
"else
"    Plug 'Shougo/deoplete.nvim'
"    Plug 'roxma/nvim-yarp'
"    Plug 'roxma/vim-hug-neovim-rpc'
"endif
"
call plug#end()
filetype plugin indent on

"==============================================================================
" THEME SETTINGS 
"==============================================================================

syntax enable
set background=dark
colorscheme solarized
let g:lightline={'colorscheme' : 'solarized'}

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
set cursorline
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

map <C-n> :NERDTreeToggle<CR>

"==============================================================================
" PLUGIN SETTINGS 
"==============================================================================

let g:ale_sign_error = '->'
let g:ale_sign_warning = '__'

let g:rainbow_active = 1

let g:deoplete#enable_at_startup = 1

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
