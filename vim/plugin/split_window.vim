
"function! MySplitWindow ()
"    execute 'vsplit'
"    execute 'wincmd h'
"    execute 'vertical resize 84'
"endfunction
"
"nnoremap <buffer> <localleader>s :so %<CR>:call MySplitWindow()<CR>

"autocmd BufNewFile,BufRead * nnoremap <buffer> <localleader>z :call MySplitWindow()<CR>
"autocmd BufNewFile,BufRead * nnoremap <buffer> <localleader>z :call MySplitWindow()<CR>
"autocmd BufNewFile,BufRead * nnoremap <buffer> <localleader>z :call MySplitWindow()<CR>