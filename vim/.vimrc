"==============================================================================
" START OF PLUGIN SECTION
"==============================================================================

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'

Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'urso/haskell_syntax.vim'
Plug 'jvirtanen/vim-octave'
Plug 'adimit/prolog.vim'

"==============================================================================
" OTHER
"==============================================================================

Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'fidian/hexmode'

call plug#end()
filetype plugin indent on

"==============================================================================
" END OF PLUGIN SECTION
"==============================================================================


"==============================================================================
" THEME SETTINGS
"==============================================================================

syntax on
set background=dark
colorscheme gruvbox 
set t_Co=256

"===============================================================================
" AIRLINE SETTINGS
"===============================================================================

set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif

" SOURCE:
" http://vi.stackexchange.com/questions/3359/how-to-fix-status-bar-symbols-in-airline-plugin
" Depending on your terminal you should add them
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

"==============================================================================
" BASIC SETTINGS FOR VIM
"==============================================================================

set shell=/bin/zsh

set nocompatible

set number
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
set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest
set completeopt+=longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set magic
set hlsearch " know where you are searching

set cmdheight=1

set backspace=2

"==============================================================================
" SYNTASTIC SETTINGS
"==============================================================================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"==============================================================================
" ACTIVATING THE RAINBOW PARENTHESES
"==============================================================================

let g:rainbow_active = 1
