"==============================================================================
" PLUGIN SETUP 
"==============================================================================

let g:plugin_base = $HOME . '/.local/share/nvim/'
let g:plugin_path = g:plugin_base . 'plugged/'
let g:vimplug_target = g:plugin_base . 'site/autoload/plug.vim'
let g:vimplug_source = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if !isdirectory(g:plugin_path)
    execute('! mkdir -p ' . g:plugin_path . ' 2> /dev/null')
    execute('! curl -fLo ' . g:vimplug_target . ' --create-dirs ' . g:vimplug_source)

    let g:setuped = 1
else 
    let g:setuped = 0
endif 

"==============================================================================
" PLUGINS 
"==============================================================================

set nocompatible
filetype off

call plug#begin(g:plugin_path)

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'vim-pandoc/vim-pandoc' 
Plug 'kien/ctrlp.vim'
" Plug 'luochen1990/rainbow'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/a.vim'

let g:deoplete#enable_at_startup = 1

call plug#end()
filetype plugin indent on

if g:setuped
    PlugInstall
endif

"==============================================================================
" THEME SETTINGS 
"==============================================================================

syntax enable
set background=light
colorscheme solarized

let g:lightline={'colorscheme' : 'solarized'}

"==============================================================================
" BASIC SETTINGS FOR VIM
"==============================================================================

let g:python3_host_prog = '~/.virtualenvs/neovim3/bin/python3'

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

let mapleader = "\<SPACE>"
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>
nnoremap <leader><space> :CtrlPBuffer<CR>

map <F8> :NERDTreeToggle<CR>


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
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

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
