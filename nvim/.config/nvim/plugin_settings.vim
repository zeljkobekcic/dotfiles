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

"===============================================================================
" VIM-HARDTIME
"===============================================================================

let g:hardtime_default_on = 1

"===============================================================================
" YouCompleteMe
"===============================================================================

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'

"===============================================================================
"  
"===============================================================================

let python_highlight_all=1
syntax on


