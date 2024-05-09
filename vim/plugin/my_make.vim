

if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

" Maybe I should use `set makeprg=...` build in method

function! MyMake ()
	" Get the output
	if filereadable("Makefile")
		echo "Executing make command..."
		let result = system("make")
		echo result
	else
		echo "Makefile is not found."
	endif

	" Open a new split and set it up.
	"vsplit __Potion_Bytecode__
	"normal! ggdG
	"setlocal filetype=potionbytecode
	"setlocal buftype=nofile

	" Insert the bytecode.
	"call append(0, split(errors, '\v\n'))
endfunction


nnoremap <buffer> <localleader>b :so %<CR>:call MyMake()<CR>

autocmd BufNewFile,BufRead *.js nnoremap <buffer> <localleader>b :call MyMake()<CR>
autocmd BufNewFile,BufRead *.c nnoremap <buffer> <localleader>b :call MyMake()<CR>
autocmd BufNewFile,BufRead *.cpp nnoremap <buffer> <localleader>b :call MyMake()<CR>
autocmd BufNewFile,BufRead *.hpp nnoremap <buffer> <localleader>b :call MyMake()<CR>