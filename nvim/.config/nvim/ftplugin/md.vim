augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

function pandoc(target)
    execute('! pandoc ' . expand('%:p') . ' -o ' expand('%:r') . target)
endfunction

nnoremap <leader>p :Pandoc pdf
