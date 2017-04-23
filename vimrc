"==============================================================================
" START OF PLUGIN SECTION
"==============================================================================

set nocompatible
filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"==============================================================================
" PLUGINS
"==============================================================================

Plugin 'VundleVim/Vundle.vim'

"==============================================================================
" PLUGINS WHICH I LIKE TO USE
"==============================================================================

Plugin 'w0rp/ale'                           " Linting is awesome
Plugin 'godlygeek/tabular'                  " Making stuff look nice
Plugin 'Shougo/neocomplete.vim' 
Plugin 'Shougo/vimproc.vim' 
Plugin 'scrooloose/nerdtree'                " looks nice and is functional
Plugin 'vim-airline/vim-airline'            " A nice lightweigt statusbar
Plugin 'vim-airline/vim-airline-themes'

Plugin 'luochen1990/rainbow'                " This is a nice plugin, and not
                                            " only useful for Lisps. It gives 
                                            " a nice view on XML e.g. too.  "==============================================================================
" PLUGINS FOR HASKELL
"==============================================================================

Plugin 'urso/haskell_syntax.vim'
Plugin 'eagletmt/ghcmod-vim'                
Plugin 'eagletmt/neco-ghc'

"==============================================================================
" PLUGINS FOR CLOJURE
"==============================================================================

Plugin 'vim-scripts/paredit.vim'            " Lisps without these plugins? 
                                            " You don't want to do that
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fireplace'

"==============================================================================
" PLUGINS FOR PYTHON 
"==============================================================================

Plugin 'vim-scripts/indentpython.vim'

"==============================================================================
" THEMES
"==============================================================================

Plugin 'altercation/vim-colors-solarized'

"==============================================================================
" OTHER SYNTAX FILES
"==============================================================================

Plugin 'PotatoesMaster/i3-vim-syntax'       " I am using i3 and regulary edit
                                            " my config file. This makes
                                            " things a little bit better :)

"==============================================================================
"
"==============================================================================

call vundle#end()            " required
filetype plugin indent on    " required

"==============================================================================
" END OF PLUGIN SECTION
"==============================================================================

"==============================================================================
" THEME SETTINGS
"==============================================================================

syntax on
set background=dark
colorscheme solarized
set t_Co=256

"===============================================================================
" AIRLINE SETTINGS
"===============================================================================

set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

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
" NAVIGATING THROUGH LAYOUTS
"==============================================================================

" Making it a little bit easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"==============================================================================
" GHC MOD SETTINGS
"==============================================================================

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

"==============================================================================
" NECO GHC SETTINGS
"==============================================================================

let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"==============================================================================
" TABULAR SETTINGS
"==============================================================================

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>

"==============================================================================
" ACTIVATING THE RAINBOW PARENTHESES
"==============================================================================

let g:rainbow_active = 1
