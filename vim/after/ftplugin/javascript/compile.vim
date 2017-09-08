
function! CompileModule()
	if filereadable("ng.json")
		"let result = system("jeefo-module-compiler -M ng")
		"echo result
	endif
endfunction

"if !exists("g:potion_command")
    "let g:potion_command = "potion"
"endif

"function! JeefoLint ()
	" Get the output
	"let result = system("node build")

	"echo result

	" Open a new split and set it up.
	"vsplit __Potion_Bytecode__
	"normal! ggdG
	"setlocal filetype=potionbytecode
	"setlocal buftype=nofile

	" Insert the bytecode.
	"call append(0, split(errors, '\v\n'))
"endfunction


"nnoremap <buffer> <localleader>b :so %<CR>:call JeefoLint()<CR>

"autocmd BufNewFile,BufRead *.js nnoremap <buffer> <localleader>b :call JeefoLint()<CR>

autocmd BufWritePost *.js :call CompileModule()
